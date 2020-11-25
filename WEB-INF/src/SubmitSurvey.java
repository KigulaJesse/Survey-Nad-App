import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class SubmitSurvey extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
        try{
            String dbDriver = "com.mysql.jdbc.Driver";
            String dbURL = "jdbc:mysql://localhost:3306/";
            String dbName = "demoproj";
            String dbUserName = "root";
            String dbPassword = "root";

            Class.forName(dbDriver);
            Connection con = DriverManager.getConnection(dbURL + dbName, dbUserName, dbPassword);

            
            PreparedStatement survey_field = con.prepareStatement("insert into survey_field_attributes (survey_field_id, field_attribute_value) values(?, ?)");

            // send a thank you message to client
            PrintWriter out = response.getWriter(); 
            out.println("<html><body><b>Successfully Inserted"
                        + "</b></body></html>");    
            
           

        }
        catch(Exception e){
                e.printStackTrace();
        }
    }   
}