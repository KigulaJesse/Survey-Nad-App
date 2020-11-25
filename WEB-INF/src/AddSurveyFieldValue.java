import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AddSurveyFieldValue extends HttpServlet{
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

            
            survey_field.setInt(1, Integer.valueOf(request.getParameter("survey_field_id")));

            survey_field.setString(2, request.getParameter("survey_field_value"));

            survey_field.executeUpdate(); 
  
            // Close all the connections 
            survey_field.close(); 
            con.close(); 

            //if request is not from HttpServletRequest, you should do a typecast before
            HttpSession session = request.getSession(true);
            //save message in session
            session.setAttribute("survey_field_id", request.getParameter("survey_field_id"));
            response.sendRedirect("./survey_field_values.jsp");

            
           

        }
        catch(Exception e){
                e.printStackTrace();
        }
    }   
}