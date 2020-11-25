import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AddSurveyField extends HttpServlet{
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

            
            PreparedStatement survey_field = con.prepareStatement("insert into survey_fields (survey_id, field_name, field_type, field_description, maximum, minimum) values(?, ?, ?, ?, ?, ?)");

            
            survey_field.setInt(1, Integer.valueOf(request.getParameter("survey_id")));

            survey_field.setString(2, request.getParameter("field_name"));

            survey_field.setString(3, request.getParameter("field_type"));

            survey_field.setString(4, request.getParameter("field_description"));

            survey_field.setInt(5, 0);

            survey_field.setInt(6, 0);

            survey_field.executeUpdate(); 
  
            // Close all the connections 
            survey_field.close(); 
            con.close(); 

            //if request is not from HttpServletRequest, you should do a typecast before
            HttpSession session = request.getSession(true);
            //save message in session
            session.setAttribute("name", request.getParameter("survey_id"));
            response.sendRedirect("./survey_fields.jsp");

            
           

        }
        catch(Exception e){
                e.printStackTrace();
        }
    }   
}