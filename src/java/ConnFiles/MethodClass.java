/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConnFiles;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.*;
import java.text.*;

/**
 *
 * @author Sarita Thakur
 */
public class MethodClass {
    public int regRequest(String fname,String gender,String cname,String contact,String email,String password){
         try{
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            System.out.println("-----------"+contact);
            PreparedStatement pstm=con.prepareStatement("insert into Examinee(FullName,Gender,Email,Password,CollegeName,ContactNumber) values(?,?,?,?,?,?);");
            pstm.setString(1, fname);
            pstm.setString(2, gender);
            pstm.setString(3, email);
            pstm.setString(4, password);
            pstm.setString(5, cname);
            pstm.setString(6, contact);
            pstm.execute();
            return 1;
        }catch(SQLException e){
            e.printStackTrace();
            return 0;
        }catch(Exception f){
            f.printStackTrace();
            return 0;
        }   
     }
    public int loginRequestExaminer(String name,String pass){
        String email1,pass1;
        int id;
        try{
            JDBCProg conn=new JDBCProg();
            Connection con=conn.mySQLConn();
            PreparedStatement pstm=con.prepareStatement("select fullname,password,examinerid from examiner where fullname=? and password=?");
            pstm.setString(1, name);
            pstm.setString(2, pass);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
		email1  = rs.getString(1);
		pass1 = rs.getString(2);	
                id=rs.getInt(3);
		if(name.equals(email1) && pass.equals(pass1)){
                    return id;
		}
            }
        }catch(SQLException e){
            e.printStackTrace();
            return 0;
        }catch(Exception f){
            f.printStackTrace();
            return 0;
        }
         return 0;
    }
    public int loginRequestExaminee(String email,String pass){
        String email1,pass1;
        int id;
        try{
            JDBCProg conn=new JDBCProg();
            Connection con=conn.mySQLConn();
            PreparedStatement pstm=con.prepareStatement("select email,password,examineeid from examinee where email=? and password=?");
            pstm.setString(1, email);
            pstm.setString(2, pass);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
		email1  = rs.getString(1);
		pass1 = rs.getString(2);
                id=rs.getInt(3);
		if(email.equals(email1) && pass.equals(pass1)){
                    System.out.println(id);
                    return id;
		}
            }
        }catch(SQLException e){
            e.printStackTrace();
            return 0;
        }catch(Exception f){
            f.printStackTrace();
            return 0;
        }
         return 0;
    }
    public int setExamRequest(String examTitle,String date,String duration,int marks,String examLevel,String qua,String topic,BigDecimal negative){
         try{
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            System.out.println("-----------"+date);
            PreparedStatement pstm=con.prepareStatement("insert into exam(examTitle,date,duration,Marks,examLevel,topics,topicQuantity,negativeMark) values(?,?,?,?,?,?,?,?);");
            pstm.setString(1, examTitle);
            pstm.setString(2, date);
            pstm.setString(3, duration);
            pstm.setInt(4, marks);
            pstm.setString(5, examLevel);
            pstm.setString(6, topic);
            pstm.setString(7, qua);
            pstm.setBigDecimal(8, negative);
            pstm.execute();
            return 1;
        }catch(SQLException e){
            e.printStackTrace();
            return 0;
        }catch(Exception f){
            f.printStackTrace();
            return 0;
        }
         
     }
    public String[] selectExamRequest(){
        try{
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            Statement s=con.createStatement();
            ResultSet rset=s.executeQuery("select examtitle from exam");
            List<String> list= new ArrayList<String>();
            while(rset.next()){
                list.add(rset.getString("examtitle"));
             }
            String[] arr = list.toArray(new String[list.size()]);

           return arr;
         }catch(SQLException e){
            e.printStackTrace();
            return null;
        }catch(Exception f){
            f.printStackTrace();
            return null;
        }
    }
public int setQue(String examTitle,String question,String opt,String correctAns,String exp,String topicType,String topicName,String diffLevel,String img){
        try{
           JDBCProg con1= new JDBCProg();
           Connection con=con1.mySQLConn();
           PreparedStatement pstm=con.prepareStatement("insert into question(QuestionName,Options,CorrectAnswer,TopicName,Level,Explanation,SubjectType,examTitle,image) values(?,?,?,?,?,?,?,?,?);");
           pstm.setString(1, question);
           pstm.setString(2, opt);
           pstm.setString(3, correctAns);
           pstm.setString(4, topicName);
           pstm.setString(5, diffLevel);
           pstm.setString(6, exp);
           pstm.setString(7, topicType);
           pstm.setString(8, examTitle);
           pstm.setString(9, img);
           pstm.execute();
           System.out.println("#####aaaaaaaaaaaaaaaaaaa######");
           String sql = "select QuestionId from question where QuestionName = '"+ question + "' and Options = '" + opt +"';";
           Statement st = null;
           int id=0;
           st = con.createStatement();
           ResultSet rs = st.executeQuery(sql);
           while(rs.next()){
             id = rs.getInt(1);
           }
           System.out.println("*****************************************"+id);
           return id;
       }catch(SQLException e){
           e.printStackTrace();
           return 0;
       }catch(Exception f){
           f.printStackTrace();
           return 0;
       }
        
    }
        public ArrayList selectTopic(){
        try{
            ArrayList<String> quantitative_List=new ArrayList<String>();
            ArrayList<String> logical_reasoning_List=new ArrayList<String>();
            ArrayList<String> verbal_List=new ArrayList<String>();
            ArrayList<ArrayList> list=new ArrayList<ArrayList>();
            
            PreparedStatement pstm =null;
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            pstm = con.prepareStatement("SELECT topic from quantative_topic");
            ResultSet rs1 = pstm.executeQuery();
            while(rs1.next()){
		quantitative_List.add(rs1.getString("topic"));
            }
            pstm = con.prepareStatement("SELECT topic from logical_reasoning_topic");
            ResultSet rs2 = pstm.executeQuery();
            while(rs2.next()){
		logical_reasoning_List.add(rs2.getString("topic"));
            }
            pstm = con.prepareStatement("SELECT topic from verbal_topic");
            ResultSet rs3 = pstm.executeQuery();
            while(rs3.next()){
		verbal_List.add(rs3.getString("topic"));
            }
            list.add(quantitative_List);
            list.add(logical_reasoning_List);
            list.add(verbal_List);
            //System.out.println(list);
           return list;
       }catch(SQLException e){
           e.printStackTrace();
           return null;
       }catch(Exception f){
           f.printStackTrace();
           return null;
       }
        
    }
    public ArrayList startExam(String examTitle) throws SQLException{
        try{
            ArrayList<ArrayList> list=new ArrayList<ArrayList>();
            ArrayList<String> questionNameList=new ArrayList<String>();
            ArrayList<String> optionList=new ArrayList<String>();
            ArrayList<String> correctAnswerList=new ArrayList<String>();
            ArrayList<String> explanationList=new ArrayList<String>();
            ArrayList<String> imageList=new ArrayList<String>();
            ArrayList<Integer> marksList=new ArrayList<Integer>();
            ArrayList<Integer> durationList=new ArrayList<Integer>();
            ArrayList<Integer> quantityList=new ArrayList<Integer>();
            ArrayList<String> topicList=new ArrayList<String>();
            ArrayList<Float> negative=new ArrayList<Float>();
            ArrayList<Integer> numbers = new ArrayList<Integer>();
            PreparedStatement pstm =null;
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            pstm = con.prepareStatement("select marks,topics,examlevel,topicquantity,duration,negativeMark from exam where examtitle='"+examTitle+"'");
            ResultSet rs = pstm.executeQuery();
            rs.next();
            int marks=rs.getInt("marks");
            String topic=rs.getString("topics");
            String qua=rs.getString("topicquantity");
            int examLevel=rs.getInt("examlevel");
            int duration=rs.getInt("duration");
            negative.add(rs.getFloat("negativeMark"));
            marksList.add(marks);
            durationList.add(duration);
            
            String[] topicArray = topic.split(",");
            String[] quantityArray = qua.split(",");
            System.out.println(examTitle);
            pstm = con.prepareStatement("select count(questionId) from question where examtitle='"+examTitle+"'");
            ResultSet rs2=pstm.executeQuery();
            rs2.next();
            int count;
            if(rs2.getInt("count(questionId)")>0){
                 for(int i=0;i<quantityArray.length;i++){
                     count=0;
                    ArrayList<Integer> number = new ArrayList<Integer>();
                    pstm = con.prepareStatement("select questionId from question where topicname='"+topicArray[i]+"' and examtitle='"+examTitle+"' and level="+examLevel);
                    ResultSet rs4=pstm.executeQuery();
                    while(rs4.next()){
                        number.add(rs4.getInt("questionId"));
                    }
                    Collections.shuffle(number);
                    System.out.println(number);
                    if(!number.isEmpty()){
                        if(Integer.parseInt(quantityArray[i]) < number.size()){
                            for(int j=0;j<Integer.parseInt(quantityArray[i]);j++)
                                numbers.add(number.get(j));
                        }else{
                            for(int j=0;j<number.size();j++)
                                numbers.add(number.get(j));
                        }
                        String ints=String.valueOf(numbers.get(0));
                        for(int k=1; k < numbers.size(); k++){
                            ints = ints+","+String.valueOf(numbers.get(k));
                        }
                        numbers.clear();
                    pstm = con.prepareStatement("select questionname,options,correctanswer,explanation,image from question where questionid in ("+ints+")");
                    ResultSet rs3=pstm.executeQuery();
                   
                    count=0;
                    while(rs3.next()){
                        questionNameList.add(rs3.getString("questionname"));
                        optionList.add(rs3.getString("options"));
                        correctAnswerList.add(rs3.getString("correctanswer"));
                        explanationList.add(rs3.getString("explanation"));
                        imageList.add(rs3.getString("image"));
                        count++;
                    }
                    quantityList.add(count);
                    topicList.add(topicArray[i]);
                   }else{
                        quantityList.add(0);
                        topicList.add(topicArray[i]);
                    }
                }
            }else{
                for(int i=0;i<quantityArray.length;i++){
                    count=0;
                    ArrayList<Integer> number = new ArrayList<Integer>();
                    pstm = con.prepareStatement("select questionId from question where topicname='"+topicArray[i]+"' and level="+examLevel);
                    ResultSet rs4=pstm.executeQuery();
                    while(rs4.next()){
                        number.add(rs4.getInt("questionId"));
                    }
                    Collections.shuffle(number);
                    System.out.println("****"+number);
                    if(!number.isEmpty()){
                        if(Integer.parseInt(quantityArray[i]) < number.size()){
                            for(int j=0;j<Integer.parseInt(quantityArray[i]);j++)
                                numbers.add(number.get(j));
                        }else{
                            for(int j=0;j<number.size();j++)
                                numbers.add(number.get(j));
                        }
                        
                        String ints=String.valueOf(numbers.get(0));
                        for(int k=1; k < numbers.size(); k++){
                            ints = ints+","+String.valueOf(numbers.get(k));
                        }
                        numbers.clear();
                    pstm = con.prepareStatement("select questionname,options,correctanswer,explanation,image from question where questionid in ("+ints+")");
                    ResultSet rs3=pstm.executeQuery();
                   
                    count=0;
                    while(rs3.next()){
                        questionNameList.add(rs3.getString("questionname"));
                        optionList.add(rs3.getString("options"));
                        correctAnswerList.add(rs3.getString("correctanswer"));
                        explanationList.add(rs3.getString("explanation"));
                        imageList.add(rs3.getString("image"));
                        count++;
                    }
                    quantityList.add(count);
                    topicList.add(topicArray[i]);
                   }else{
                        quantityList.add(0);
                        topicList.add(topicArray[i]);
                    }     
                }
            }

            list.add(questionNameList);
            list.add(optionList);
            list.add(correctAnswerList);
            list.add(explanationList);
            list.add(imageList);
            list.add(marksList);
            list.add(durationList);
            list.add(quantityList);
            list.add(topicList);
            list.add(negative);
            
           return list;
       }catch(SQLException e){
           e.printStackTrace();
           return null;
       }catch(Exception f){
           f.printStackTrace();
           return null;
       }
    }
    public String getName(int var){
        String name;
        try{
            JDBCProg conn=new JDBCProg();
            Connection con=conn.mySQLConn();
            PreparedStatement pstm=con.prepareStatement("select fullname from examinee where examineeid=?");
            pstm.setInt(1, var);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
		name  = rs.getString(1);
                return name;
            }
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }catch(Exception f){
            f.printStackTrace();
            return null;
        }
         return null;
    }
    public List getExaminerDetails(){
        ArrayList<Integer> examinerIdList= new ArrayList<Integer>();
        ArrayList<String> examinerNameList= new ArrayList<String>();
        ArrayList<String> examinerEmailList= new ArrayList<String>();
        ArrayList<String> examinerPasswordList= new ArrayList<String>();
        List<ArrayList> mainList= new ArrayList<ArrayList>();

        try{
            PreparedStatement pstm =null;
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            pstm = con.prepareStatement("select examinerID,fullname,email,password from examiner");
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                examinerIdList.add(rs.getInt(1));
                examinerNameList.add(rs.getString(2));
                examinerEmailList.add(rs.getString(3));
                examinerPasswordList.add(rs.getString(4));
            }
            
            mainList.add(examinerIdList);
            mainList.add(examinerNameList);
            mainList.add(examinerEmailList);
            mainList.add(examinerPasswordList);
            
            return mainList;
            
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }catch(Exception f){
            f.printStackTrace();
            return null;
        }
    }
    
    public int ExaminerRegistration(String fname,String email,String password){
        try{
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
           
            PreparedStatement pstm=con.prepareStatement("insert into Examiner(FullName,Email,Password) values(?,?,?);");
            pstm.setString(1, fname);
            pstm.setString(2, email);
            pstm.setString(3, password);
            pstm.execute();
            return 1;
        }catch(SQLException e){
            e.printStackTrace();
            return 0;
        }catch(Exception f){
            f.printStackTrace();
            return 0;
        }
    }
    public int examinerDeletion(int id){
        try{
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
           
            PreparedStatement pstm=con.prepareStatement("delete from examiner where examinerid="+id);
            pstm.execute();
            return 1;
        }catch(SQLException e){
            e.printStackTrace();
            return 0;
        }catch(Exception f){
            f.printStackTrace();
            return 0;
        }
    }
    public int loginRequestAdmin(String email,String pass){
        
        try{
            
		if(email.equals("oes@gmail.com") && pass.equals("oes123")){
                   
                    return 1;
		}
            
        }catch(Exception f){
            f.printStackTrace();
            return 0;
        }
         return 0;
    }
    public int examineredit(int id ,String name,String email,String password){
        try{
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            System.out.println("---"+name+" "+email+" "+password);
            PreparedStatement pstm=con.prepareStatement("update examiner set fullname='"+name+"' , email='"+email+"' , password='"+password+"' where examinerid="+id+";");
            pstm.execute();
            return id;
        }catch(SQLException e){
            e.printStackTrace();
            return 0;
        }catch(Exception f){
            f.printStackTrace();
            return 0;
        }
    }
    public List examinerInfoFetch(int id){
                ArrayList<Integer> examinerIdList= new ArrayList<Integer>();

        ArrayList<String> examinerNameList= new ArrayList<String>();
        ArrayList<String> examinerEmailList= new ArrayList<String>();
        ArrayList<String> examinerPasswordList= new ArrayList<String>();
        List<ArrayList> mainList= new ArrayList<ArrayList>();
    
        try{
            PreparedStatement pstm =null;
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            pstm = con.prepareStatement("select examinerid,fullname,email,password from examiner where examinerid="+id);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                                examinerIdList.add(rs.getInt(1));

                examinerNameList.add(rs.getString(2));
                examinerEmailList.add(rs.getString(3));
                examinerPasswordList.add(rs.getString(4));
            }
            //System.out.println(examinerNameList);
             mainList.add(examinerIdList);
            mainList.add(examinerNameList);
            mainList.add(examinerEmailList);
            mainList.add(examinerPasswordList);
            
            return mainList;
            
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }catch(Exception f){
            f.printStackTrace();
            return null;
        }
            
    }
    public int storeResult(ArrayList<ArrayList> list,String email,String examTitle){
        float marksObtain=(float)list.get(12).get(0);
        int totalMarks=(int)list.get(12).get(1);
        String topic=(String)list.get(8).get(0);
        String quantity=String.valueOf(list.get(7).get(0));
        String topicMarks=String.valueOf(list.get(11).get(0));
        
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        Calendar cal = Calendar.getInstance();
        //System.out.println(dateFormat.format(cal.getTime()));
        
        try{
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            PreparedStatement pstm1=con.prepareStatement("select examineeId from examinee where email='"+email+"'");
            ResultSet rs = pstm1.executeQuery();
            rs.next();
            int examineeId=rs.getInt(1);
            
            
            for(int i=1; i < list.get(8).size(); i++){
                topic = topic+","+String.valueOf(list.get(8).get(i));
                quantity = quantity+","+String.valueOf(list.get(7).get(i));
                topicMarks = topicMarks+","+String.valueOf(list.get(11).get(i));
            }
           PreparedStatement pstm=con.prepareStatement("insert into result(Date,marksObtain,totalMarks,examTitle,topic,quantityTopic,topic_marks,examineeId) values(?,?,?,?,?,?,?,?);");
           pstm.setString(1, dateFormat.format(cal.getTime()));
           pstm.setFloat(2, marksObtain);
           pstm.setInt(3, totalMarks);
           pstm.setString(4, examTitle);
           pstm.setString(5, topic);
           pstm.setString(6, quantity);
           pstm.setString(7, topicMarks);
           pstm.setInt(8, examineeId);
           pstm.execute();
           return 1;
       }catch(SQLException e){
           e.printStackTrace();
           return 0;
       }catch(Exception f){
           f.printStackTrace();
           return 0;
       }
    }
    
    public ArrayList topicList(String topic) throws SQLException{
        
        ArrayList<String> list= new ArrayList<String>();

        try{
            PreparedStatement pstm =null;
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
         
            if(topic.equals("Quantitative")){
                pstm = con.prepareStatement("select topic from quantative_topic;");
                ResultSet rs = pstm.executeQuery();
                while(rs.next()){
                    list.add(rs.getString(1));
                }
                con.close();
                return list;
            }else if(topic.equals("Reasoning")){
                pstm = con.prepareStatement("select topic from logical_reasoning_topic;");
                ResultSet rs = pstm.executeQuery();
                while(rs.next()){
                    list.add(rs.getString(1));
                }
                con.close();
                return list;
            }else{
                pstm = con.prepareStatement("select topic from verbal_topic;");
                ResultSet rs = pstm.executeQuery();
                while(rs.next()){
                    list.add(rs.getString(1));
                }
                con.close();
                return list;
            }
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }catch(Exception f){
            f.printStackTrace();
            return null;
        }
    }
    
    public ArrayList viewQue(String topic) throws SQLException{
        
        ArrayList<ArrayList> list= new ArrayList<ArrayList>();
        ArrayList<Integer> idList = new ArrayList<Integer>();
        ArrayList<String> queList = new ArrayList<String>();
        ArrayList<String> imgList = new ArrayList<String>();

        
        try{
            PreparedStatement pstm =null;
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
         
            pstm = con.prepareStatement("select QuestionId,QuestionName,Image from question where TopicName = ?;");
            pstm.setString(1, topic);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                idList.add(rs.getInt("QuestionId"));
                queList.add(rs.getString("QuestionName"));
                imgList.add(rs.getString("Image"));
            }  
            list.add(idList);
            list.add(queList);
            list.add(imgList);
            
            con.close();
            return list;
            
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }catch(Exception f){
            f.printStackTrace();
            return null;
        }
    }
    
    public static void deleteQue(int id) throws SQLException {
    
        try{
            PreparedStatement pstm =null;
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            //System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
            pstm = con.prepareStatement("delete from question where QuestionId = "+id+";");
            
            pstm.execute();
            //System.out.println("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
            con.close();
            return ;
        }catch(SQLException e){
            e.printStackTrace();
        }catch(Exception f){
            f.printStackTrace();
        }
    }
    
    public ArrayList editQue(int id) throws SQLException{
        ArrayList<String> question = new ArrayList<String>();
        ArrayList<String> option = new ArrayList<String>();
        ArrayList<String> correct = new ArrayList<String>();
        ArrayList<String> topicName = new ArrayList<String>();
        ArrayList<Integer> level = new ArrayList<Integer>();
        ArrayList<String> explanation = new ArrayList<String>();
        ArrayList<String> image = new ArrayList<String>();
        ArrayList<String> title = new ArrayList<String>();
        ArrayList<ArrayList> list = new ArrayList<ArrayList>();
        try{
            PreparedStatement pstm =null;
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            
            pstm = con.prepareStatement("select QuestionName,Options,CorrectAnswer,TopicName,Level,Explanation,Image,ExamTitle from question where QuestionId = "+id+";");
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
               question.add(rs.getString("QuestionName"));
               option.add(rs.getString("Options"));
               correct.add(rs.getString("CorrectAnswer"));
               topicName.add(rs.getString("TopicName"));
               level.add(rs.getInt("Level"));
               explanation.add(rs.getString("Explanation"));
               image.add(rs.getString("Image"));
               title.add(rs.getString("ExamTitle"));
            }
            
            list.add(question);
            list.add(option);
            list.add(correct);
            list.add(topicName);
            list.add(level);
            list.add(explanation);
            list.add(image);
            list.add(title);
            rs.close();
        }catch(Exception f){
            f.printStackTrace();
        }
        
        return list;
    }
    
    public int editQueProcess(int id,String examTitle,String question,String opt,String correctAns,String exp,String topicType,String topicName,String diffLevel,String img){
       try{
           JDBCProg con1= new JDBCProg();
           Connection con=con1.mySQLConn();
           System.out.println("aaaaaaaaaaaaaaaa");
           PreparedStatement pstm=con.prepareStatement("update question set QuestionName = ?,Options = ?,CorrectAnswer=?,TopicName=?,Level=?,Explanation=?,SubjectType=?,Image=?,examTitle=? where QuestionId = "+id+";");
           pstm.setString(1, question);
           pstm.setString(2, opt);
           pstm.setString(3, correctAns);
           pstm.setString(4, topicName);
           pstm.setString(5, diffLevel);
           pstm.setString(6, exp);
           pstm.setString(7, topicType);
           pstm.setString(8, img);
           pstm.setString(9, examTitle);
           pstm.execute();
           System.out.println("bbbbbbbbbbbbb");
           return 1;
       }catch(SQLException e){
           e.printStackTrace();
           return 0;
       }catch(Exception f){
           f.printStackTrace();
           return 0;
       } 
    }
    public ArrayList getSingleExamResult(String examTitle,String name,String email){
        ArrayList<ArrayList> list=new ArrayList<ArrayList>();
        ArrayList<String> date=new ArrayList<String>();
        ArrayList<String> topic=new ArrayList<String>();
        ArrayList<String> quantitytopic=new ArrayList<String>();
        ArrayList<String> topic_marks=new ArrayList<String>();
        
        int id; 
        try{
            JDBCProg conn=new JDBCProg();
            Connection con=conn.mySQLConn();
            PreparedStatement pstm=con.prepareStatement("select Examineeid from examinee where fullname=? and email=?");
            pstm.setString(1, name);
            pstm.setString(2, email);
            ResultSet rs = pstm.executeQuery();
            rs.next();
            id  = rs.getInt(1);
            PreparedStatement pstm1=con.prepareStatement("select date,topic,quantitytopic,topic_marks from result where examineeid=? and examtitle=?");
            pstm1.setInt(1, id);
            pstm1.setString(2, examTitle);
            ResultSet rs1 = pstm1.executeQuery();
            int r=1;
            while(rs1.next()){
               date.add(rs1.getString("date"));
               if(r==1)
                    topic.add(rs1.getString("topic"));
               quantitytopic.add(rs1.getString("quantitytopic"));
               topic_marks.add(rs1.getString("topic_marks"));
               r=0;
            }
            list.add(date);
            list.add(topic);
            list.add(quantitytopic);
            list.add(topic_marks);
            return list;
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }catch(Exception f){
            f.printStackTrace();
            return null;
        }
    }
    public String[] selectGivenExamRequest(String name,String email){
        List<String> list= new ArrayList<String>();
        int id;
        try{
             JDBCProg conn=new JDBCProg();
            Connection con=conn.mySQLConn();
            PreparedStatement pstm=con.prepareStatement("select Examineeid from examinee where fullname=? and email=?");
            pstm.setString(1, name);
            pstm.setString(2, email);
            ResultSet rs = pstm.executeQuery();
            rs.next();
            id  = rs.getInt("Examineeid");
            //System.out.println("----   "+id);
            PreparedStatement pstm1=con.prepareStatement("select examtitle from result where examineeId=? group by examtitle");
            pstm1.setInt(1,id);
            ResultSet rset = pstm1.executeQuery();
            while(rset.next()){
                list.add(rset.getString(1));
             }
            String[] arr = list.toArray(new String[list.size()]);

           return arr;
         }catch(SQLException e){
            e.printStackTrace();
            return null;
        }catch(Exception f){
            f.printStackTrace();
            return null;
        }
    }
 public String getNameExaminer(int var){
        String name;
        try{
            JDBCProg conn=new JDBCProg();
            Connection con=conn.mySQLConn();
            PreparedStatement pstm=con.prepareStatement("select fullname from examiner where examineeid=?");
            pstm.setInt(1, var);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
		name  = rs.getString(1);
                return name;
            }
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }catch(Exception f){
            f.printStackTrace();
            return null;
        }
         return null;
    }
public List examInfoFetch(String name){
                ArrayList<Integer> examIdList= new ArrayList<Integer>();
        ArrayList<String> examTitleList= new ArrayList<String>();
        ArrayList<String> examiMarksList= new ArrayList<String>();
        ArrayList<String> examiDateList= new ArrayList<String>();
        ArrayList<String> examiDurationList= new ArrayList<String>();
        ArrayList<String> examLevelList= new ArrayList<String>();

        List<ArrayList> mainList= new ArrayList<ArrayList>();
    
        try{
            PreparedStatement pstm =null;
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            pstm = con.prepareStatement("select examid,examtitle,marks,duration,date,examlevel from exam where examtitle='"+name+"'");
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                examIdList.add(rs.getInt(1));
                examTitleList.add(rs.getString(2));
                examiMarksList.add(rs.getString(3));
                examiDurationList.add(rs.getString(4));
                examiDateList.add(rs.getString(5));
                examLevelList.add(rs.getString(6));

            }
            mainList.add(examIdList);
            mainList.add(examTitleList);
            mainList.add(examiMarksList);
            mainList.add(examiDurationList);
            mainList.add(examiDateList);
            mainList.add(examLevelList);
            
            return mainList;
            
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }catch(Exception f){
            f.printStackTrace();
            return null;
        }
            
    }
public int examDeletion(String title){
        try{
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
           System.out.println("----"+title);
            PreparedStatement pstm=con.prepareStatement("delete from exam where examtitle='"+title+"'");
            pstm.execute();
            return 1;
        }catch(SQLException e){
            e.printStackTrace();
            return 0;
        }catch(Exception f){
            f.printStackTrace();
            return 0;
        }
    }

public List getExamineeDetails(String name,String email){
        ArrayList<Integer> examineeIdList= new ArrayList<Integer>();
        ArrayList<String> examineeNameList= new ArrayList<String>();
        ArrayList<String> examineeContactList= new ArrayList<String>();
        ArrayList<String> examineeEmailList= new ArrayList<String>();
        ArrayList<String> examineePasswordList= new ArrayList<String>();
        List<ArrayList> mainList= new ArrayList<ArrayList>();

        try{
            PreparedStatement pstm =null;
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            pstm = con.prepareStatement("select examineeID,fullname,email,password,contactnumber from examinee where fullname='"+name+"' and email='"+email+"';");
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                examineeIdList.add(rs.getInt(1));
                examineeNameList.add(rs.getString(2));
                examineeContactList.add(rs.getString(3));
                examineePasswordList.add(rs.getString(4));
                examineeEmailList.add(rs.getString(5));

            }
            
            mainList.add(examineeIdList);
            mainList.add(examineeNameList);
            mainList.add(examineeContactList);
            mainList.add(examineePasswordList);
            mainList.add(examineeEmailList);

            return mainList;
            
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }catch(Exception f){
            f.printStackTrace();
            return null;
        }
    }
public int editExamRequest(String examTitle,String date,String duration,int marks,String examLevel,String qua,String topic,int id){
         try{
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            System.out.println("-----------"+topic);
            PreparedStatement pstm=con.prepareStatement("update exam set examTitle='"+examTitle+"',date='"+date+"',duration='"+duration+"',Marks="+marks+",examLevel='"+examLevel+"',topics='"+topic+"', topicQuantity='"+qua+"' where examid="+id);
            pstm.execute();
            return 1;
        }catch(SQLException e){
            e.printStackTrace();
            return 0;
        }catch(Exception f){
            f.printStackTrace();
            return 0;
        }
         
     }
    public int updateExaminee(int id ,String name,String email,String password,String contact){
        try{
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            PreparedStatement pstm=con.prepareStatement("update examinee set fullname='"+name+"' , email='"+email+"' , password='"+password+"' , contactnumber='"+contact+"' where examineeid="+id+";");
            pstm.execute();
            return id;
        }catch(SQLException e){
            e.printStackTrace();
            return 0;
        }catch(Exception f){
            f.printStackTrace();
            return 0;
        }
    }
    public ArrayList getExamineesDetail(){
        ArrayList<ArrayList> list= new ArrayList<ArrayList>();
        ArrayList<Integer> examineeIdList= new ArrayList<Integer>();
        ArrayList<String> nameList= new ArrayList<String>();
        ArrayList<String> emailList= new ArrayList<String>();
        ArrayList<String> contactList= new ArrayList<String>();
        try{
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            PreparedStatement pstm=con.prepareStatement("select examineeid,fullname,email,contactnumber from examinee;");
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                examineeIdList.add(rs.getInt(1));
                nameList.add(rs.getString(2));
                emailList.add(rs.getString(3));
                contactList.add(rs.getString(4));
            }
            list.add(examineeIdList);
            list.add(nameList);
            list.add(emailList);
            list.add(contactList);
            return list;
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }catch(Exception f){
            f.printStackTrace();
            return null;
        }
    }
    public ArrayList totalExam(){
        ArrayList<Integer> examCountList= new ArrayList<Integer>();
         try{
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            PreparedStatement pstm=con.prepareStatement("select count(examineeId) from result group by examineeid;");
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                examCountList.add(rs.getInt(1));
            }

            return examCountList;
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }catch(Exception f){
            f.printStackTrace();
            return null;
        }
    }
    public ArrayList examineeFullResult(int examineeId){
        ArrayList<ArrayList> list= new ArrayList<ArrayList>();
        ArrayList<Integer> marksObtainList= new ArrayList<Integer>();
        ArrayList<Integer> totalMarksList= new ArrayList<Integer>();
        ArrayList<String> examTitleList= new ArrayList<String>();
         try{
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            PreparedStatement pstm=con.prepareStatement("select examtitle,marksobtain,totalmarks from (select * from result ORDER BY resultid DESC) AS x where examineeid="+examineeId+" GROUP BY examtitle;");
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                examTitleList.add(rs.getString(1));
                marksObtainList.add(rs.getInt(2));
                totalMarksList.add(rs.getInt(3));
            }
            
            list.add(examTitleList);
            list.add(marksObtainList);
            list.add(totalMarksList);
            
            return list;
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }catch(Exception f){
            f.printStackTrace();
            return null;
        }
    }
     public String getExaminerName(int var){
        String name;
        try{
            JDBCProg conn=new JDBCProg();
            Connection con=conn.mySQLConn();
            PreparedStatement pstm=con.prepareStatement("select fullname from examiner where examinerid=?");
            pstm.setInt(1, var);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
		name  = rs.getString(1);
                return name;
            }
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }catch(Exception f){
            f.printStackTrace();
            return null;
        }
         return null;
    }
     
    public int storeImage(int id,String img){
        try{
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            PreparedStatement psmnt = con.prepareStatement("update question set Image=? where QuestionId = ?;");
            psmnt.setString(1, img);
            psmnt.setInt(2,id);
            psmnt.executeUpdate();
            return 1;
        }catch(Exception e){
            e.printStackTrace();
            return 0;
        }
    }
 public String[] selectExaminerRequest(){
        try{
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            Statement s=con.createStatement();
            ResultSet rset=s.executeQuery("select fullname from examiner");
            List<String> list= new ArrayList<String>();
            while(rset.next()){
                list.add(rset.getString("fullname"));
             }
            String[] arr = list.toArray(new String[list.size()]);

           return arr;
         }catch(SQLException e){
            e.printStackTrace();
            return null;
        }catch(Exception f){
            f.printStackTrace();
            return null;
        }
    }
 
     public ArrayList challengeTestDataFetch(){
         ArrayList<ArrayList> list= new ArrayList<ArrayList>();
         ArrayList<String> imageList=new ArrayList<String>();
         ArrayList<String> questionNameList=new ArrayList<String>();
         ArrayList<String> correctAnswerList=new ArrayList<String>();
         ArrayList<Integer> level=new ArrayList<Integer>();
         int size=5; //number of question required
         try{
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
        for(int i=1;i<4;i++){
         ArrayList<Integer> number=new ArrayList<Integer>();
         ArrayList<Integer> numbers=new ArrayList<Integer>();
            PreparedStatement pstm1=con.prepareStatement("select questionid from question where level="+i+";");
            ResultSet rs1 = pstm1.executeQuery();
            while(rs1.next()){
                number.add(rs1.getInt(1));
            }
            Collections.shuffle(number);
            if(number.size() > size){
                for(int j=0;j<size;j++)
                    numbers.add(number.get(j));
            }else{
                for(int j=0;j<number.size();j++)
                    numbers.add(number.get(j));
            }
            
            String ints=String.valueOf(numbers.get(0));
            for(int k=1; k < numbers.size(); k++){
                    ints = ints+","+String.valueOf(numbers.get(k));
            }
            PreparedStatement pstm = con.prepareStatement("select questionname,options,correctanswer,image from question where questionid in ("+ints+")");
            ResultSet rs3=pstm.executeQuery();
                   
                while(rs3.next()){
                    questionNameList.add(rs3.getString("questionname"));
                    String correctAnswer=rs3.getString("correctanswer");
                    imageList.add(rs3.getString("image"));
                    String options=rs3.getString("options");
                    String[] option = options.split("///");
                    if(correctAnswer.equalsIgnoreCase("a")){
                        correctAnswerList.add(option[0]);
                    }else if(correctAnswer.equalsIgnoreCase("b")){
                        correctAnswerList.add(option[1]);
                    }else if(correctAnswer.equalsIgnoreCase("c")){
                        correctAnswerList.add(option[2]);
                    }else if(correctAnswer.equalsIgnoreCase("d")){
                        correctAnswerList.add(option[3]);
                    }
                    level.add(i);
                }
        }    
            list.add(questionNameList);
            list.add(correctAnswerList);
            list.add(imageList);
            list.add(level);
            
            return list;
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }catch(Exception f){
            f.printStackTrace();
            return null;
        }
     }
     public ArrayList SingleExamAnalysisDataFetch(String title,String date,int marks){
        ArrayList<Integer> examineeIdList= new ArrayList<Integer>();
         ArrayList<String> titleList= new ArrayList<String>();
         ArrayList<String> dateList= new ArrayList<String>();

         ArrayList<Integer> totalMarksList= new ArrayList<Integer>();
         ArrayList<Integer> marksObtainedList= new ArrayList<Integer>();
                  ArrayList<String>examineeList= new ArrayList<String>();


            ArrayList<ArrayList> mainList= new ArrayList<ArrayList>();
         try{
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            PreparedStatement pstm=con.prepareStatement("select examineeId,examtitle,date,totalmarks,marksobtain from result where examtitle='"+title+"' and date='"+date+"' and marksobtain>="+marks );
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                examineeIdList.add(rs.getInt(1));
                titleList.add(rs.getString(2));
                dateList.add(rs.getString(3));
                totalMarksList.add(rs.getInt(3));
                marksObtainedList.add(rs.getInt(3));
            }
            for(int i=0;i<examineeIdList.size();i++){
                examineeList.add(getName(examineeIdList.get(i)));
            }
            
            
            mainList.add(examineeList);
            mainList.add(titleList);
            mainList.add(dateList);
            mainList.add(totalMarksList);
            mainList.add(marksObtainedList);

            return mainList;
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }catch(Exception f){
            f.printStackTrace();
            return null;
        }
    }
    public int checkNoOfQuestion(){
        try{
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            for(int i=1;i<4;i++){
                PreparedStatement pstm=con.prepareStatement("select count(level) from question where level="+i+";");
                ResultSet rs=pstm.executeQuery();
                rs.next();
                if(rs.getInt(1)<(21-i)){
                    System.out.println("  "+rs.getInt(1));
                    return 1;
                }  
            }
            return 0;
        }catch(SQLException e){
            e.printStackTrace();
            return 0;
        }catch(Exception f){
            f.printStackTrace();
            return 0;
        }
                
    }
    public ArrayList timeTestDataFetch(ArrayList flagList, int level){
        ArrayList<ArrayList> list= new ArrayList<ArrayList>();
        ArrayList<String> optionsList=new ArrayList<String>();
        ArrayList<Integer> idList=new ArrayList<Integer>();

         ArrayList<String> imageList=new ArrayList<String>();
         ArrayList<String> questionNameList=new ArrayList<String>();
         ArrayList<String> correctAnswerList=new ArrayList<String>();
         ArrayList<Integer> numbers=new ArrayList<Integer>();
         ArrayList<Integer> number=new ArrayList<Integer>();
         String ints=""+flagList.get(0);
         for(int k=1; k < flagList.size(); k++){
                    ints = ints+","+String.valueOf(flagList.get(k));
            }
         try{
            JDBCProg con1= new JDBCProg();
            Connection con=con1.mySQLConn();
            PreparedStatement pstm1=con.prepareStatement("select questionid from question where level="+level+" and questionid not in ("+ints+")");
            ResultSet rs1 = pstm1.executeQuery();
            while(rs1.next()){
                numbers.add(rs1.getInt(1));
            }
            Collections.shuffle(numbers);
            if(numbers.size() > 1){
                    number.add(numbers.get(0));
            }else{
                    number.add(numbers.get(0));
            }
            PreparedStatement pstm=con.prepareStatement("select questionid,questionname,options,correctanswer,image from question where questionid="+number.get(0)+";");
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                idList.add(rs.getInt("questionid"));
                questionNameList.add(rs.getString("questionname"));
                optionsList.add(rs.getString("options"));
                correctAnswerList.add(rs.getString("correctanswer"));
                imageList.add(rs.getString("image"));
            }
            list.add(idList);
            list.add(questionNameList);
            list.add(optionsList);
            list.add(correctAnswerList);
            list.add(imageList);
            return list;
         }catch(SQLException e){
            e.printStackTrace();
            return null;
        }catch(Exception f){
            f.printStackTrace();
            return null;
        }
    }

}
