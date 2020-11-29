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
            String password = null;

            Class.forName(dbDriver);
            Connection con = DriverManager.getConnection(dbURL + dbName, dbUserName, dbPassword);
            
            String query1 = "select * from admins";
            String query2 = "select * from students";

            //Get admins from the database;
                PreparedStatement admins = con.prepareStatement("select * from admins where name = ?");
            //same for the second parameter
                admins.setString(1, request.getParameter("studentNumber"));
                ResultSet resultSet = admins.executeQuery();

            //Get admins from the database;
                PreparedStatement students = con.prepareStatement("select * from students where studentNumber = ?");
            //same for the second parameter
                students.setString(1, request.getParameter("studentNumber"));
                ResultSet resultSet2 = students.executeQuery();


            PrintWriter out = response.getWriter();
            if(resultSet.next()) {
                response.sendRedirect("/Survey/all_survey.jsp");
            }
            else if(resultSet2.next()){
                //Encrypt default password
                Statement statement3 = null;
                statement3 =con.createStatement();
                String sql3 = "SELECT PASSWORD('";
                sql3 = sql3 + request.getParameter("password") + "')";
                ResultSet resultSet3 = statement3.executeQuery(sql3);
                while(resultSet3.next()){
                    password = resultSet3.getString(1);   
                }

                if(resultSet2.getString("password").equals(password)){
                    //if request is not from HttpServletRequest, you should do a typecast before
                        HttpSession session = request.getSession(true);
                    //save message in session
                        session.setAttribute("student_id", resultSet2.getString("id"));
                    response.sendRedirect("/Survey/surveys.jsp");
                }
                else{   
                    response.sendRedirect("/Survey/index.jsp");
                }
            
            }
            else{
                response.sendRedirect("/Survey/index.jsp");
            }
            

                /*PrintWriter out = response.getWriter(); 

            while(resultSet.next()) {
                out.println("<tr>");
                out.println("<td>"+resultSet.getString(2) + "</td>");
                out.println("</tr>");
               // response.sendRedirect("/Survey/all_survey.jsp");
            }
            //response.sendRedirect("/Survey/all_survey.jsp");*/
        }
        catch (Exception e){
            e.printStackTrace();
        } 
    }
}