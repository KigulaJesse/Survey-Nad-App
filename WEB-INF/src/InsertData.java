import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*;  


//servlet Name
@WebServlet("/InsertData")

public class InsertData extends HttpServlet{
    private static final long serialVersionUID = 1L;
    
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
            PreparedStatement st = con.prepareStatement("insert into demo values(?, ?)");

            //For the first parameter
            //get data using the request object
            //sets the data to st pointer
            st.setInt(1, Integer.valueOf(request.getParameter("id")));

            //same for the second parameter
            st.setString(2, request.getParameter("string"));

            //Execute the insert command using executeUpdate()
            //to make changes in the database
            st.executeUpdate();

            //Close all connections
            st.close();
            con.close();

            //Get a Writer Pointer
            
            // send a thank you message to client
            PrintWriter out = response.getWriter(); 
            out.println("<html><body><b>Successfully Inserted"
                        + "</b></body></html>"); 

        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}

