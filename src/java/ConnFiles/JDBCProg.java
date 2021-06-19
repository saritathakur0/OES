/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConnFiles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Sarita Thakur
 */
public class JDBCProg 
{
    public Connection mySQLConn()
    {
        System.out.println("Testing Connection");
        try
        {
            //Class.forName("com.mysql.jdbc.Driver");
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        }
        catch(ClassNotFoundException e)
        {
            System.out.println("Driver Not Found");
            e.printStackTrace();
            return null;
        }
        Connection con=null;
        try
        {
            //con=DriverManager.getConnection("jdbc:mysql://localhost:3308/OES","sarita","aaa");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=College;user=sarita;password=aaa;";
            con=DriverManager.getConnection(url);
        }
        catch(SQLException e)
        {
            System.out.println("Connection Not Formed");
            e.printStackTrace();
            return null;
        }
        if(con!=null)
        {
            System.out.println("Connection is succesful");
            return con;
        }
        else
        {
            System.out.println("It is failure");
             return null;
        }
    }
    public static void main(String args[])
    {
           new JDBCProg();
    }

    PreparedStatement prepareStatement(String select__from_quantative)
    {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}

