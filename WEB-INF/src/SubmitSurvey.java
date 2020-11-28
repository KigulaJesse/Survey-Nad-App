import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

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

            //Create an sql query to insert data into database
            PreparedStatement take_survey = con.prepareStatement("insert into take_surveys (student_id, survey_id, comment, vote) values(?, ?, ?, ?)");

            //student id
            take_survey.setInt(1, 1);

            //survey_id
            take_survey.setInt(2, Integer.valueOf(request.getParameter("survey_id")));

            //comment
            take_survey.setString(3, "Yes");
            
            //vote
            take_survey.setString(4, "vote");


            // send a thank you message to client
            PrintWriter out = response.getWriter(); 
            out.println("<html><body>");
                        
            Enumeration keys = request.getParameterNames();
            while (keys.hasMoreElements() )
            {
                String key = (String)keys.nextElement();
                
                if(key.equals("survey_id") || key.equals("website") || key.equals("process")){
                    continue;
                }
                if(request.getParameterValues(key).length > 1){
                    // If the same key has multiple values (check boxes)
                    String[] valueArray = request.getParameterValues(key);
            
                    for(int i = 0; i < valueArray.length; i++){
                        out.println("<p>" + valueArray[i] +"<p>");
                    }
                }
                else{
                    
                    //To retrieve a single value
                    String value = request.getParameter(key);
                    
                    if(key.indexOf('_') != 0){
                        int i = key.indexOf('_');
                        out.println("<p>" + i  +"</p>");
                    }
                    else{
                        out.println("<p>" + key +"</p>");
                    }
                }
                
            }

            out.println("</html></body>");
            
            //Execute the insert command using executeUpdate()
            //to make changes in the database
            //take_survey.executeUpdate();

            //Close all connections
            take_survey.close();
            con.close();
           

        }
        catch(Exception e){
                e.printStackTrace();
        }
    }   
}