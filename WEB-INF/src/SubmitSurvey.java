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
            int inserted = 2;
            int id2 = 0;

            Class.forName(dbDriver);
            Connection con = DriverManager.getConnection(dbURL + dbName, dbUserName, dbPassword);

            //Create an sql query to insert data into database
            PreparedStatement take_survey = con.prepareStatement("insert into take_surveys (student_id, survey_id, comment, vote) values(?, ?, ?, ?)",  Statement.RETURN_GENERATED_KEYS);

            //student id
            take_survey.setInt(1, Integer.valueOf(request.getParameter("student_id")));

            //survey_id
            take_survey.setInt(2, Integer.valueOf(request.getParameter("survey_id")));

            //comment
            take_survey.setString(3, request.getParameter("comment"));
            
            //vote
            take_survey.setString(4, request.getParameter("vote"));

            //to make changes in the database
            int i = take_survey.executeUpdate();

            PrintWriter out = response.getWriter(); 
            //out.println("<html><body>");
            ResultSet rs = take_survey.getGeneratedKeys();


            if(rs.next()){
                int id = rs.getInt(1);

                List<String> list = new ArrayList<String>();
                Enumeration keys = request.getParameterNames();
                while (keys.hasMoreElements()){
                    PreparedStatement take_survey2 = con.prepareStatement("insert into take_survey_fields (take_survey_id, survey_field_id) values(?, ?)",  Statement.RETURN_GENERATED_KEYS);
                    take_survey2.setInt(1, id);
                    String key = (String)keys.nextElement();

                    
                    if(key.equals("survey_id") || key.equals("comment") || key.equals("vote") ||key.equals("website") || key.equals("process") || key.equals("student_id")){
                        continue;
                    }
                    out.println(key);
                    if(key.indexOf('_') != -1 ){
                        String[] t = key.split("_",2);
                        //out.println(!list.contains(t[0]));
                        if(!list.contains(t[0])){
                            take_survey2.setInt(2, Integer.valueOf(t[0]));  
                            inserted = 1;    
                        }
                        else{
                             inserted = 0;
                        }
                        list.add(t[0]);
                        //out.println("<p>" + t[0] + "</p>");
                              
                    }
                    else if(key.indexOf('[') != -1){
                        String t2 = key.substring(0, key.length() - 2);
                        take_survey2.setInt(2, Integer.valueOf(t2));
                        //out.println("<p>" + t2 + "</p>");
                    }
                    else {
                        take_survey2.setInt(2, Integer.valueOf(key));
                        //out.println("<p>" + key + "</p>");
                    }

                    
                    if(inserted == 0){
                        //out.println("<p>Uninserted key: "+key+"</p>");
                        String[] t3 = key.split("_",2);
                        //out.println(t3[1]);
                        String[] valueArray = request.getParameterValues(key);
                        for(int l = 0; l < valueArray.length; l++){
                            PreparedStatement take_survey3 = con.prepareStatement("insert into take_survey_field_values(survey_field_id, taken_survey_field_id, value) values(?, ?, ?)",  Statement.RETURN_GENERATED_KEYS);
                            take_survey3.setInt(1, id2);
                            take_survey3.setInt(2, Integer.valueOf(t3[1]));
                            take_survey3.setString(3, valueArray[l]);
                            //out.println("<p>"+id2 +": "+ key +": " + valueArray[l] +"<p>");
                            int  k2 = take_survey3.executeUpdate();
                            take_survey3.close();
                        }

                       // out.println("here");
                        
                    }
                    else if(inserted == 1){
                        int  k = take_survey2.executeUpdate();
                        ResultSet rs2 = take_survey2.getGeneratedKeys();
                        if(rs2.next()){
                            id2 = rs2.getInt(1);
                            String[] t3 = key.split("_",2);
                            //out.println(t3[1]);
                            String[] valueArray = request.getParameterValues(key);
                            for(int l = 0; l < valueArray.length; l++){
                                PreparedStatement take_survey3 = con.prepareStatement("insert into take_survey_field_values(survey_field_id, taken_survey_field_id, value) values(?, ?, ?)",  Statement.RETURN_GENERATED_KEYS);
                                take_survey3.setInt(1, id2);
                                take_survey3.setInt(2, Integer.valueOf(t3[1]));
                                take_survey3.setString(3, valueArray[l]);
                                //out.println("<p>"+id2 +": "+ key +": " + valueArray[l] +"<p>");
                                int  k2 = take_survey3.executeUpdate();
                                take_survey3.close();
                            }
                        }
                    }
                    else{
                        int  k = take_survey2.executeUpdate();
                        ResultSet rs2 = take_survey2.getGeneratedKeys();
                        if(rs2.next()){
                            id2 = rs2.getInt(1);
                            
                            String[] valueArray = request.getParameterValues(key);
                            for(int l = 0; l < valueArray.length; l++){
                                PreparedStatement take_survey3 = con.prepareStatement("insert into take_survey_field_values(survey_field_id, taken_survey_field_id ) values(?, ?)",  Statement.RETURN_GENERATED_KEYS);
                                take_survey3.setInt(1, id2);
                                take_survey3.setInt(2, Integer.valueOf(valueArray[l]));
                                //out.println("<p>"+id2 +": "+ key +": " + valueArray[l] +"<p>");
                                int  k2 = take_survey3.executeUpdate();
                                take_survey3.close();
                            }
                        }
                    }
                    
                    take_survey2.close();
                    
                }
            }
                    
            
            //Close all connections
            take_survey.close();
            con.close();

            response.sendRedirect("/Survey/surveys.jsp");
        }
        catch(Exception e){
                e.printStackTrace();
        }
    }   
}