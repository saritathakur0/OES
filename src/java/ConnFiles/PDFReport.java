package ConnFiles;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Properties;
 
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;

/**
 *
 * @author Rishabh
 */
public class PDFReport {
    public int email(ArrayList<ArrayList> list,String email,String examTitle,String name) {
        String smtpHost = "smtp.gmail.com"; //replace this with a valid host
        int smtpPort = 587; //replace this with a valid port
                 
        String sender = "performance.analysis.system@gmail.com"; //replace this with a valid sender email address
        String password="pas@123#";
        String recipient = email; //replace this with a valid recipient email address
        String content = "Your Exam Report"; //this will be the text of the email
        String subject = "Result"; //this will be the subject of the email
         
        Properties properties = new Properties();
        properties.put("mail.smtp.host", smtpHost);
        properties.put("mail.smtp.port", smtpPort);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getDefaultInstance(properties,new javax.mail.Authenticator() {   
            protected PasswordAuthentication getPasswordAuthentication() {   
                return new PasswordAuthentication(sender,password);    }   });
         
        ByteArrayOutputStream outputStream = null;
         
        try {           
            //construct the text body part
            MimeBodyPart textBodyPart = new MimeBodyPart();
            textBodyPart.setText(content);
             
            //now write the PDF content to the output stream
            outputStream = new ByteArrayOutputStream();
            int var=writePdf(outputStream,list,examTitle,name,email);
            byte[] bytes = outputStream.toByteArray();
             
            //construct the pdf body part
            DataSource dataSource = new ByteArrayDataSource(bytes, "application/pdf");
            MimeBodyPart pdfBodyPart = new MimeBodyPart();
            pdfBodyPart.setDataHandler(new DataHandler(dataSource));
            pdfBodyPart.setFileName("Result_of_"+examTitle+".pdf");
                         
            //construct the mime multi part
            MimeMultipart mimeMultipart = new MimeMultipart();
            mimeMultipart.addBodyPart(textBodyPart);
            mimeMultipart.addBodyPart(pdfBodyPart);
             
            //create the sender/recipient addresses
            InternetAddress iaSender = new InternetAddress(sender);
            InternetAddress iaRecipient = new InternetAddress(recipient);
             
            //construct the mime message
            MimeMessage mimeMessage = new MimeMessage(session);
            mimeMessage.setSender(iaSender);
            mimeMessage.setSubject(subject);
            mimeMessage.setRecipient(Message.RecipientType.TO, iaRecipient);
            mimeMessage.setContent(mimeMultipart);
             
            //send off the email
            Transport.send(mimeMessage);
             
            System.out.println("sent from " + sender + 
                    ", to " + recipient + 
                    "; server = " + smtpHost + ", port = " + smtpPort);
            return var;
        } catch(Exception ex) {
            ex.printStackTrace();
            return 0;
        } finally {
            //clean off
            if(null != outputStream) {
                try { outputStream.close(); outputStream = null; }
                catch(Exception ex) { }
            }
        }
    }

    public int writePdf(OutputStream outputStream,ArrayList<ArrayList> list,String examTitle,String name,String email) throws Exception {
         
        try{
        Document d = new Document();
        PdfWriter.getInstance(d, outputStream);;
        d.open();
        Font f=new Font(FontFamily.TIMES_ROMAN,25.0f,0,BaseColor.BLACK);
        Paragraph p=new Paragraph(examTitle+"\nResult",f);
        p.setAlignment(Paragraph.ALIGN_CENTER);
        d.add(p);
        d.add(new Paragraph("Name: "+name));
        d.add(new Paragraph("Email id: "+email));
        d.add(new Paragraph("Total Duration: "+list.get(6).get(0)+" min"));
        d.add(new Paragraph("Marks per Question: "+list.get(5).get(0)));
        Paragraph paragraph1 = new Paragraph();
        
        paragraph1.add("No. of Questions: "+list.get(0).size()+"\n");
        paragraph1.add("Total Marks: "+list.get(11).get(1)+"\n");
        paragraph1.add("Total Marks Obtain: "+list.get(11).get(0)+"\n");
        d.add(paragraph1);
    for(int i=0; i<list.get(0).size(); i++){
        Font f1=new Font(FontFamily.TIMES_ROMAN,18.0f,0,BaseColor.BLACK);
         Paragraph p1=new Paragraph("\n\n"+(i+1) + " "+list.get(0).get(i)+"\n\n",f1);
        d.add(p1);
        if (list.get(4).get(i)!=null){
            Image image1 = Image.getInstance(String.format("C://Users//Rishabh//Documents//NetBeansProjects//PAS//web//images//questionImages//%s",list.get(4).get(i)));
            //Fixed Positioning
            //image1.setAbsolutePosition(100f, 550f);
            //Scale to new height and new width of image
            image1.scaleAbsolute(400, 200);
            //Add to document
            d.add(image1);
        }
        Paragraph paragraph3 = new Paragraph();
        String Options=(String)list.get(1).get(i);
        String[] option=Options.split("///");
        paragraph3.add("   a.  "+option[0]+"\n");
        paragraph3.add("   b.  "+option[1]+"\n");
        paragraph3.add("   c.  "+option[2]+"\n");
        paragraph3.add("   d.  "+option[3]+"\n");
        paragraph3.add("\nCorrect Answer: "+list.get(2).get(i)+"\n");
        paragraph3.add("Your Answer: "+list.get(9).get(i)+"\n");
        paragraph3.add("Explanation: "+list.get(3).get(i)+"\n");
        d.add(paragraph3);        
    }
    
        d.add(new Paragraph("\n\n\n"));
   Paragraph paragraph = new Paragraph();
   Font bfBold12 = new Font(FontFamily.TIMES_ROMAN, 12, Font.BOLD, new BaseColor(0, 0, 0)); 
   Font bf12 = new Font(FontFamily.TIMES_ROMAN, 12); 
   //specify column widths
   float[] columnWidths = {2.5f, 2f, 2f, 5f};
   //create PDF table with the given widths
   PdfPTable table = new PdfPTable(columnWidths);
   // set table width a percentage of the page width
   table.setWidthPercentage(90f);
 
   //insert column headings
   insertCell(table, "Topic", Element.ALIGN_CENTER, 1, bfBold12);
   insertCell(table, "Obtain Marks / Total Marks", Element.ALIGN_CENTER, 1, bfBold12);
   insertCell(table, "Percentage", Element.ALIGN_CENTER, 1, bfBold12);
   insertCell(table, "Comment", Element.ALIGN_CENTER, 1, bfBold12);
   table.setHeaderRows(1);
   float per=0.0f;
   int val=0;
    assessmentClass assessObj=new assessmentClass();
   for(int i=0; i<list.get(8).size(); i++){
       if((int)list.get(7).get(i)!=0){
     
    insertCell(table,(String)list.get(8).get(i) , Element.ALIGN_LEFT, 1, bf12);
    insertCell(table, (int)list.get(10).get(i)+" / "+(int)list.get(7).get(i), Element.ALIGN_CENTER, 1, bf12);
    
    per=((float) (int)list.get(10).get(i) / (int)list.get(7).get(i));
    val=(int) (per * 100.0f);
    insertCell(table, val+" %", Element.ALIGN_CENTER, 1, bf12);
    insertCell(table, assessObj.assess(val), Element.ALIGN_LEFT, 1, bf12);
    
       }
     
   }
 
   paragraph.add(table);
   d.add(paragraph);
 
        d.close();
        return 1;
        }catch(Exception e){
            e.printStackTrace();
            return 0;
        }
    }
    
   private void insertCell(PdfPTable table, String text, int align, int colspan, Font font){
   
  //create a new cell with the specified Text and Font
  PdfPCell cell = new PdfPCell(new Phrase(text.trim(), font));
  //set the cell alignment
  cell.setHorizontalAlignment(align);
  //set the cell column span in case you want to merge two or more cells
  cell.setColspan(colspan);
  //in case there is no text and you wan to create an empty row
  if(text.trim().equalsIgnoreCase("")){
   cell.setMinimumHeight(10f);
  }
  //add the call to the table
  table.addCell(cell);
   
 }
        public static int main(ArrayList<ArrayList> list,String email,String examTitle,String name){
         PDFReport emailObj=new PDFReport();
         int var=emailObj.email(list,email,examTitle,name);
        return var;
    }
}
