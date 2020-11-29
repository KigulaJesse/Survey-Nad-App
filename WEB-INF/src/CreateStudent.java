import java.sql.*;
import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*;  

public class CreateStudent extends HttpServlet{
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
            String password = null;
            ResultSet resultSet = null;

            Class.forName(dbDriver);
            Connection con = DriverManager.getConnection(dbURL + dbName, dbUserName, dbPassword);

                
            //Encrypt default password
            Statement statement = null;
            statement=con.createStatement();
            String sql = "SELECT PASSWORD('";
            sql = sql + request.getParameter("password") + "')";
            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                password = resultSet.getString("PASSWORD('p@ss1234')");
            }

            //Create an sql query to insert data into database
            PreparedStatement student = con.prepareStatement("insert into students (studentNumber, password, email, college, hall, age, gender) values(?, ?, ?, ?, ?, ?, ?)");

            student.setString(1, request.getParameter("student_number"));
            student.setString(2, password);
            student.setString(3, request.getParameter("email"));
            student.setString(4, request.getParameter("college"));
            student.setString(5, request.getParameter("hall"));
            student.setString(6, request.getParameter("age"));
            student.setString(7, request.getParameter("gender"));
            student.executeUpdate();
            student.close();
            con.close();
            // send a thank you message to client
            
            response.sendRedirect("/Survey/all_survey.jsp");
        }
        catch (Exception e){
             e.printStackTrace();
         }
     }
 }