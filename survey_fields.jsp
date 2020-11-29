<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<%
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "demoproj";
    String userid = "root";
    String password = "root";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    Connection connection = null;
    Statement statement = null;
    Statement statement3 = null;
    ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Wilio Survey, Quotation, Review and Register form Wizard by Ansonika.">
        <meta name="author" content="Ansonika">
        <title>Fields | Makerere University</title>

        <!-- Favicons-->
        <link rel="shortcut icon" href="img/makerere.png" type="image/x-icon">
        <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
        <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png">
        <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="img/apple-touch-icon-114x114-precomposed.png">
        <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png">

        <!-- GOOGLE WEB FONT -->
        <link href="https://fonts.googleapis.com/css?family=Work+Sans:400,500,600" rel="stylesheet">

        <!-- BASE CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/menu.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/vendors.css" rel="stylesheet">

        <!-- YOUR CUSTOM CSS -->
        <link href="css/custom.css" rel="stylesheet">
        
        <!-- MODERNIZR MENU -->
        <script src="js/modernizr.js"></script>

        <link rel="stylesheet" type="text/css" href="font-awesome/4.7.0/css/font-awesome.min.css"/>

    </head>
    <body>

        
        <div id="preloader">
            <div data-loader="circle-side"></div>
        </div><!-- /Preload -->
        
        <div id="loader_form">
            <div data-loader="circle-side-2"></div>
        </div><!-- /loader_form -->
        
        <!--==============TOP NAV BAR================-->
            <nav>
                <ul class="cd-primary-nav">
                    <li><a href="index.html" class="animated_link">Home</a></li>
                    <li><a href="quotation-wizard-version.html" class="animated_link">Quote Version</a></li>
                    <li><a href="review-wizard-version.html" class="animated_link">Review Version</a></li>
                    <li><a href="registration-wizard-version.html" class="animated_link">Registration Version</a></li>
                    <li><a href="about.html" class="animated_link">About Us</a></li>
                    <li><a href="contacts.html" class="animated_link">Contact Us</a></li>
                </ul>
            </nav>
        <!--==================END====================-->
        <div class="container-fluid full-height">
            <div class="row row-height">
                <!--===============LEFT CONTENT=================-->
                <%
                        connection = DriverManager.getConnection(connectionUrl+database, userid , password);
                        statement3=connection.createStatement();
                        String sql3 ="select * from surveys where id = ";
                        String url3 = null;
                        if(request.getParameter("name") != null){
                            sql3 = sql3 + request.getParameter("name");
                            url3 = request.getParameter("name");
                        }
                        else if(session.getAttribute("name") != null){
                            sql3 = sql3 + session.getAttribute("name");
                            url3 = session.getAttribute("name").toString();
                        }
                        ResultSet resultSet3 = statement3.executeQuery(sql3);

                        while(resultSet3.next()){
                %>

                    <div class="col-lg-6 content-left">
                        <div class="content-left-wrapper">
                            <a href="index.html" id="logo"><img src="img/makerere.png" alt="" width="49" height="35"></a>
                            <div id="social">
                                <ul>
                                    <li><a href="#0"><i class="icon-facebook"></i></a></li>
                                    <li><a href="#0"><i class="icon-twitter"></i></a></li>
                                    <li><a href="#0"><i class="icon-google"></i></a></li>
                                    <li><a href="#0"><i class="icon-linkedin"></i></a></li>
                                </ul>
                            </div>
                        
                            <div>
                                <figure><img src="img/makerere.png" alt="" class="img-fluid"></figure>
                                <h2><%= resultSet3.getString("survey_name")%></h2>
                                <p><%= resultSet3.getString("survey_topic")%></p>
                                <a href="./" class="btn_1 rounded">Return Home</a>
                                <a href="#start" class="btn_1 rounded mobile_btn">Start Now!</a>
                            </div>
                            <div class="copy"> © 2020 Nad</div>
                        </div>
                        
                    </div>
                <%
                        }
                        connection.close();
                %>

                <!--============END OF LEFT CONTENT=============-->
                <!--================RIGHT CONTENT=================-->
                    <div class="col-lg-6" style="padding:10px;"id="start">
                            <h4 style="padding:4em 1.5em 0.7em 5.3em;">Survey Results</h4>
                            <%
                                
                                    connection = DriverManager.getConnection(connectionUrl+database, userid , password);
                                    Statement statement9=connection.createStatement();
                                    String sql9 ="select * from take_surveys where survey_id = ";
                                    if(request.getParameter("name") != null){
                                        sql9 = sql9 + request.getParameter("name");
                                    }
                                    else if(session.getAttribute("name") != null){
                                        sql9 = sql9 + session.getAttribute("name");
                                
                                    }
                                    ResultSet resultSet9 = statement9.executeQuery(sql9);
                                    float count_yes = 0;
                                    float count_no = 0;
                                    float total = 0;

                                    while(resultSet9.next()){
                                        if(resultSet9.getString("vote").equals("Yes")){
                                            count_yes = count_yes + 1;
                                        }
                                      if(resultSet9.getString("vote").equals("No")){
                                            count_no = count_no + 1;
                                        }

                                        total = total + 1;
                                    }statement9.close();

                                    int yes_percent =(int)((count_yes/total) * 100);  
                                    int no_percent = (int)((count_no/total) * 100);
                                %>
                                
    

                            <div class="container" style="padding:0em 8em 1em 9em;">
                                <div class="progress" style="height:30px;">
                                    <div class="progress-bar" style="background-color:forestgreen; width:<%= yes_percent%>%"> Yes - <%= yes_percent%>%</div>
                                    <div class="progress-bar" style="background-color:red; width:<%= no_percent%>%"> No - <%= no_percent%>%</div>
                                </div>
                            </div>
                            <div class="row" style="padding:0em 1.5em 1.5em 10em;">
                                <div class="col-m ">
                                    <div class="tile">
                                        <div class="tile-body">
                                            <table class="table table-hover table-bordered" id="sampleTable">
                                                <thead>
                                                <tr>
                                                    <th>Id</th>
                                                    <th>Gender</th>
                                                    <th>Hall</th>
                                                    <th>College</th>
                                                    <th>Vote</th>
                                                    <th style="width:100px; min-width:100px;" class="text-center text-danger"><i class="fa fa-bolt">Action</i></th>
                                                </tr>
                                                </thead>
                                                
                                                <tbody>
                                                    <%
                                                        try{ 
                                                            connection = DriverManager.getConnection(connectionUrl+database, userid , password);
                                                            statement=connection.createStatement();
                                                            String sql ="select * from take_surveys where survey_id = ";
                                                            String url = null;
                                                            if(request.getParameter("name") != null){
                                                                sql = sql + request.getParameter("name");
                                                                url = request.getParameter("name");
                                                            }
                                                            else if(session.getAttribute("name") != null){
                                                                sql = sql + session.getAttribute("name");
                                                                url = session.getAttribute("name").toString();
                                                            }
                                                            resultSet = statement.executeQuery(sql);

                                                            while(resultSet.next()){
                                                                Statement statement6=connection.createStatement();
                                                                String sql6 ="select * from students where id = ";
                                                                sql6 = sql6 + resultSet.getString("student_id");
                                                                ResultSet resultSet6 = statement6.executeQuery(sql6);
                                                                while(resultSet6.next()){
                                                        %>
                                                    <tr>
                                                        <td> <%=resultSet.getString("id") %></td>

                                                        <td><%=resultSet6.getString("gender")%></td>
                                                        <td><%=resultSet6.getString("hall")%></td>
                                                        <td><%=resultSet6.getString("college")%></td>
                                                        <td><%=resultSet.getString("vote")%></td>
                                                        <td class="text-center">
                                                            <div class="btn-group" role="group" aria-label="Second group">
                                                                <a href="./taken_survey.jsp?taken_survey_id=<%=resultSet.getString("id")%>&amp;survey_id=<%=url%>" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i></a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <%  
                                                                }statement6.close();
                                                            }
                                                            connection.close();
                                                        } catch (Exception e) {
                                                            e.printStackTrace();
                                                        }
                                                    %>
                                                </tbody>
                                                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class = "row" style="padding:0 0 1.5em 10em;"></br>
                                <h4 >Fields Table</h4>
                                <a href="./all_survey.jsp" style="position:relative; margin-left:20px; margin-right: 10px;" class="btn btn-danger">Back</a>
                                <% 
                                    if(request.getParameter("name") != null){ 
                                %>
                                            <a href="./add_survey_fields.jsp?id=<%=request.getParameter("name")%>" class="btn btn-primary pull-right">New Field</a> 
                                <% } else if(session.getAttribute("name") != null){ %>
                                            <a href="./add_survey_fields.jsp?id=<%=session.getAttribute("name")%>" class="btn btn-primary pull-right">New Field</a> 
                                <% } %>
                            </div>
                                                            
                            <div class="row" style="padding:0 1.5em 1.5em 10em;">
                                
                                <div class="col-m ">
                                    <div class="tile">
                                        <div class="tile-body">
                                            <table class="table table-hover table-bordered" id="sampleTable">
                                                <thead>
                                                <tr>
                                                    <th>Field Name</th>
                                                    <th class = "d-none d-sm-table-cell">Field Type </th>
                                                    <th style="width:100px; min-width:100px;" class="text-center text-danger"><i class="fa fa-bolt">Action</i></th>
                                                </tr>
                                                </thead>
                                                
                                                <tbody>

                                                    <%

                                                        try{ 
                                                            connection = DriverManager.getConnection(connectionUrl+database, userid , password);
                                                            statement=connection.createStatement();
                                                            String sql ="select * from survey_fields where survey_id = ";
                                                            String url = null;
                                                            if(request.getParameter("name") != null){
                                                                sql = sql + request.getParameter("name");
                                                                url = request.getParameter("name");
                                                            }
                                                            else if(session.getAttribute("name") != null){
                                                                sql = sql + session.getAttribute("name");
                                                                url = session.getAttribute("name").toString();
                                                            }
                                                            resultSet = statement.executeQuery(sql);

                                                            while(resultSet.next()){
                                                    %>
                                                    <tr>
                                                        <td> <%=resultSet.getString("field_name") %></td>
                                                        <td class = "d-none d-sm-table-cell"><%=resultSet.getString("field_type") %></td>
                                                        <td class="text-center">
                                                            <div class="btn-group" role="group" aria-label="Second group">
                                                                <a href="./survey_field_values.jsp?survey_field_id=<%=resultSet.getString("id") %>&amp;survey=<%=url%>" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i></a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                        connection.close();
                                                        } catch (Exception e) {
                                                        e.printStackTrace();
                                                        }
                                                    %>
                                                </tbody>
                                                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                    </div>
                <!--============END OF RIGHT CONTENT===============-->
            </div>
        </div>
        

        <!--===CLOSE AND OPEN NAV===-->
            <div class="cd-overlay-nav">
                <span></span>
            </div>
            <div class="cd-overlay-content">
                <span></span>
            </div>
        <!--==========END===========-->
        

        <!--=====MENU TRIGGER===========-->
            <a href="#0" class="cd-nav-trigger">Menu<span class="cd-icon"></span></a>
        <!--===========END==============-->
        
        <!--===TERMS AND CONDITIONS=====-->
            <div class="modal fade" id="terms-txt" tabindex="-1" role="dialog" aria-labelledby="termsLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="termsLabel">Terms and conditions</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Lorem ipsum dolor sit amet, in porro albucius qui, in <strong>nec quod novum accumsan</strong>, mei ludus tamquam dolores id. No sit debitis meliore postulant, per ex prompta alterum sanctus, pro ne quod dicunt sensibus.</p>
                            <p>Lorem ipsum dolor sit amet, in porro albucius qui, in nec quod novum accumsan, mei ludus tamquam dolores id. No sit debitis meliore postulant, per ex prompta alterum sanctus, pro ne quod dicunt sensibus. Lorem ipsum dolor sit amet, <strong>in porro albucius qui</strong>, in nec quod novum accumsan, mei ludus tamquam dolores id. No sit debitis meliore postulant, per ex prompta alterum sanctus, pro ne quod dicunt sensibus.</p>
                            <p>Lorem ipsum dolor sit amet, in porro albucius qui, in nec quod novum accumsan, mei ludus tamquam dolores id. No sit debitis meliore postulant, per ex prompta alterum sanctus, pro ne quod dicunt sensibus.</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn_1" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
        <!--====END=====================-->        
        
        <!--=========SCRIPTS============-->
            <script src="js/jquery-3.2.1.min.js"></script>
            <script src="js/common_scripts.min.js"></script>
            <script src="js/velocity.min.js"></script>
            <script src="js/functions.js"></script>

            <!-- Wizard script -->
            <script src="js/survey_func.js"></script>
        <!--============END==============-->

    </body>
</html>