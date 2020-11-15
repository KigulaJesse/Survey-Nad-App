import java.sql.*;
import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*;  

public class Login extends HttpServlet{
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
            
            String query1 = "select * from admins";
            String query2 = "select * from students";

            //Get admins from the database;
            PreparedStatement admins = con.prepareStatement("select * from admins where name = ?");
            //same for the second parameter
            admins.setString(1, request.getParameter("studentNumber"));
            ResultSet resultSet = admins.executeQuery();

            PrintWriter out = response.getWriter(); 
            while(resultSet.next()) {
                out.println("<tr>");
                out.println("<td>"+resultSet.getString(2) + "</td>");
                out.println("</tr>");
                response.sendRedirect("/Survey/create_survey.jsp");
            }

            response.sendRedirect("/Survey/login.jsp");

            

        }
        catch (Exception e){
            e.printStackTrace();
        } 
    }
}