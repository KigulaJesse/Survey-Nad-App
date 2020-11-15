import java.sql.*;
import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*;  

public class CreateSurvey extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
       try{
            //Initialise all the information regarding
            //Database Connection
            String dbDriver = "com.mysql.jdbc.Driver";
            String dbURL = "jdbc:mysql://localhost:3306/";
            //Database name to access
            String dbName = "demoproj";
            String dbUserName = "root";
            String dbPassword = "root";

            Class.forName(dbDriver);
            Connection con = DriverManager.getConnection(dbURL + dbName, dbUserName, dbPassword);
            
            //Create an sql query to insert data into database
            PreparedStatement survey = con.prepareStatement("insert into surveys (survey_name, survey_topic, upvotes, downvotes, deployed, populus) values(?, ?, ?, ?, ?, ?)");

            //For the first parameter
            //get data using the request object

            //same for the second parameter
            survey.setString(1, request.getParameter("survey_name"));
            
            //same for the second parameter
            survey.setString(2, request.getParameter("survey_topic"));

            //sets the data to st pointer
            survey.setInt(3,0);

            //sets the data to st pointer
            survey.setInt(4,0);

            //sets the data to st pointer
            survey.setInt(5,0);

            //same for the second parameter
            survey.setString(6, request.getParameter("populus"));

            //Execute the insert command using executeUpdate()
            //to make changes in the database
            survey.executeUpdate();

            //Close all connections
            survey.close();
            con.close();

            //Get a Writer Pointer
            
            response.sendRedirect("/Survey/add_survey_fields.jsp");

       }
       catch (Exception e){
            e.printStackTrace();
        }
    }
}