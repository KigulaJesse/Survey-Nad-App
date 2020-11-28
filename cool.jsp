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
    Statement statement2 = null;
    Statement statement3 = null;
    
    //used s4
    Statement statement4 = null;
    Statement statement5 = null;
    Statement statement6 = null;
    
    ResultSet resultSet = null;
    ResultSet resultSet2 = null;
    ResultSet resultSet3 = null;
    
    //used r4
    ResultSet resultSet4 = null;
    ResultSet resultSet5 = null;
    ResultSet resultSet6 = null;

    
    connection = DriverManager.getConnection(connectionUrl+database, userid , password);
    statement=connection.createStatement();
    String sql ="select * from surveys where id = ";
    sql = sql + "13";
    resultSet = statement.executeQuery(sql);
    while(resultSet.next()){
        statement4 = connection.createStatement();
        String sql4 ="select * from take_surveys where survey_id = ";
        sql4 = sql4 + request.getParameter("survey_id");
        sql4 = sql4 + " and id = ";
        sql4 = sql4  + request.getParameter("taken_survey_id");
        resultSet4 = statement4.executeQuery(sql4);
        while(resultSet4.next()){
%>
    
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="Wilio Survey, Quotation, Review and Register form Wizard by Ansonika.">
            <meta name="author" content="Ansonika">
            <title> <%=resultSet.getString("survey_name") %> </title>

            
            
            <!-- Favicons-->
            <link rel="shortcut icon" href="img/makerere.png" type="image/x-icon">
            <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
            <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png">
            <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="img/apple-touch-icon-114x114-precomposed.png">
            <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png">
            <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png">

            <!-- GOOGLE WEB FONT -->
            <link href="https://fonts.googleapis.com/css?family=Work+Sans:400,500,600" rel="stylesheet">


            <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
            <!-- BASE CSS -->
            <link href="css/bootstrap.min.css" rel="stylesheet">
            <link href="css/menu.css" rel="stylesheet">
            <link href="css/style.css" rel="stylesheet">    <link href="css/style.css" rel="stylesheet">

            <link href="css/vendors.css" rel="stylesheet">

            <!-- YOUR CUSTOM CSS -->
            <link href="css/custom.css" rel="stylesheet">    
            <link href="css/style.css" rel="stylesheet">


            <link href="css/vendors.css" rel="stylesheet">

            <!-- YOUR CUSTOM CSS -->
            <link href="css/custom.css" rel="stylesheet">
            

            
            <!-- MODERNIZR MENU -->
            <script src="js/modernizr.js"></script>

        </head>

        <body>
            <!--================TOP NAV MENU====================-->
                <div id="preloader">
                    <div data-loader="circle-side"></div>
                </div>
                <div id="loader_form">
                    <div data-loader="circle-side-2"></div>
                </div>
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
            <!--================END OF TOP NAV==================-->
            
            <!--==============BODY  CONTENT====================-->
                <div class="container-fluid full-height">
                    <div class="row row-height">
                        <!--=================LEFT CONTENT============-->
                        
                            <div class="col-lg-6 content-left">
                                <div class="content-left-wrapper">
                                    <a href="index.html" id="logo"><img src="img/logo.png" alt="" width="49" height="35"></a>
                                    <div id="social">
                                        <ul>
                                            <li><a href="#0"><i class="icon-facebook"></i></a></li>
                                            <li><a href="#0"><i class="icon-twitter"></i></a></li>
                                            <li><a href="#0"><i class="icon-google"></i></a></li>
                                            <li><a href="#0"><i class="icon-linkedin"></i></a></li>
                                        </ul>
                                    </div>
                                    <div>
                                        <figure><img src="img/info_graphic_1.svg" alt="" class="img-fluid"></figure>
                                        <h2><%=resultSet.getString("survey_name") %> Survey</h2>
                                        <p><%=resultSet.getString("survey_topic") %></p>
                                        <a href="./" class="btn_1 rounded">Home</a>
                                    </div>
                                    <div class="copy">© 2018 Wilio</div>
                                </div>
                            
                            </div>
                        <!--==========END OF LEFT CONTENT============-->
                        <!--==============RIGHT CONTENT==============-->
                            <% 
                                statement2 = connection.createStatement();   
                                String sql2 ="select * from survey_fields where survey_id = ";
                                sql2 = sql2 + "13";
                                resultSet2 = statement2.executeQuery(sql2);
                                int count = 1;
                                resultSet2.last();
                                int total_survey_fields = resultSet2.getRow();                
                            %>
                    
                            <div class="col-lg-6 content-right" id="start">
                                <div id="wizard_container">
                                    <div id="top-wizard">
                                            <div id="progressbar"> </div>
                                        </div>
                                        <form>
                                            <input id="website" name="website" type="text" value="">
                                            <div id="middle-wizard">
                                                <!--=====LOOP THROUGH SURVEY FIELS=========-->
                                                    <% 
                                                        resultSet2.first();
                                                        do{ 
                                                            statement3 = connection.createStatement();   
                                                            String sql3 ="select * from survey_field_attributes where survey_field_id = ";
                                                            sql3 = sql3 + resultSet2.getString("id");
                                                            resultSet3 = statement3.executeQuery(sql3);                   
                                                    %>
                                                            <!--==========RADIO BUTTONS========-->     
                                                                <% 
                                                                    if(resultSet2.getString("field_type").equals("Radio Button")){      
                                                                %>
                                                                    <div class="step">
                                                                        <h3 class="main_question">
                                                                            <strong>
                                                                                <%= count%>/<%=total_survey_fields + 1%>
                                                                                <a href="#" style="position:relative; margin-left: 300px;" class="btn btn-danger">Back</a>
                                                                            </strong>
                                                                            <%= resultSet2.getString("field_description")%>
                                                                        </h3>
                                                                        <% 
                                                                            while(resultSet3.next()){  
                                                                                statement5 = connection.createStatement();   
                                                                                String sql5 ="select * from take_survey_fields where survey_field_id = ";
                                                                                sql5 = sql5 + resultSet2.getString("id") + " and take_survey_id =" + request.getParameter("taken_survey_id");
                                                                                resultSet5 = statement5.executeQuery(sql5);
                                                                                while(resultSet5.next()){
                                                                                    statement6 = connection.createStatement();   
                                                                                    String sql6 ="select * from take_survey_field_values where survey_field_id = ";
                                                                                    sql6 = sql6 + resultSet5.getString("id");
                                                                                    resultSet6 = statement6.executeQuery(sql6);
                                                                                    while(resultSet6.next()){
                                                                        %>
                                                                                    
                                                                                        <div class="form-group">
                                                                                            <label class="container_radio version_2"><%= resultSet3.getString("field_attribute_value")%>
                                                                                                <% if(resultSet3.getString("id").equals(resultSet6.getString("taken_survey_field_id"))){ %>
                                                                                                    <input type="radio" name="<%= resultSet2.getString("id")%>" value="<%= resultSet3.getString("id")%>" class="required" checked disabled>
                                                                                                <% }else { %>
                                                                                                    <input type="radio" name="<%= resultSet2.getString("id")%>" value="<%= resultSet3.getString("id")%>" class="required" disabled>
                                                                                                <%}%>
                                                                                                <span class="checkmark"></span>
                                                                                            </label>
                                                                                        </div>
                                                                        <% 

                                                                                    }
                                                                                    statement6.close();

                                                                                }
                                                                                statement5.close();

                                                                            }
                                                                            statement3.close();
                                                                        %>
                                                                    </div>
                                                                <%
                                                                    }
                                                                %>
                                                            <!--======END OF RADIO BUTTONS=====-->

                                                            <!--==========CHECK BOXES==========-->
                                                                <% 
                                                                    if(resultSet2.getString("field_type").equals("CheckBox")){
                                                                %>
                                                                    <div class="step">
                                                                        <h3 class="main_question"><strong><%= count%>/<%=total_survey_fields + 1%></strong><%= resultSet2.getString("field_description")%></h3>
                                                                        <% 
                                                                            while(resultSet3.next()){   
                                                                                statement5 = connection.createStatement();   
                                                                                String sql5 ="select * from take_survey_fields where survey_field_id = ";
                                                                                sql5 = sql5 + resultSet2.getString("id") + " and take_survey_id =" + request.getParameter("taken_survey_id");
                                                                                resultSet5 = statement5.executeQuery(sql5);

                                                                                
                                                                        %>
                                                                                        <div class="form-group">
                                                                                            <label class="container_check version_2"><%= resultSet3.getString("field_attribute_value")%>
                                                                                            
                                                                                                    <input 
                                                                                                        type="checkbox" 
                                                                                                        name="<%= resultSet2.getString("id")%>[]" 
                                                                                                        value="<%= resultSet3.getString("id")%>" class="required" 
                                                                                                        <%
                                                                                                            while(resultSet5.next()){
                                                                                                                statement6 = connection.createStatement();   
                                                                                                                String sql6 ="select * from take_survey_field_values where survey_field_id = ";
                                                                                                                sql6 = sql6 + resultSet5.getString("id");
                                                                                                                resultSet6 = statement6.executeQuery(sql6);
                                                                                                                while(resultSet6.next()){
                                                                                                                    if(resultSet3.getString("id").equals(resultSet6.getString("taken_survey_field_id"))){ 
                                                                                                        %>
                                                                                                            checked 
                                                                                                        <%
                                                                                                                    }
                                                                                                                }statement6.close();
                                                                                                            }statement5.close(); 
                                                                                                        %>
                                                                                                        disabled
                                                                                                    >
                                                                                                
                                                                                                <span class="checkmark"></span>
                                                                                            </label>
                                                                                        </div>
                                                                        <%                                
                                                                            }
                                                                            statement3.close();
                                                                        %>
                                                                        
                                                                    </div>
                                                                <%
                                                                    }
                                                                %>
                                                            <!--======END OF CHECK BOXES=======-->

                                                            <!--========RATINGS=============-->
                                                                <% 
                                                                    if(resultSet2.getString("field_type").equals("Star Rating")){
                                                                %>
                                                                    <div class="step">
                                                                        <h3 class="main_question"><strong><%= count%>/<%=total_survey_fields + 1%></strong><%= resultSet2.getString("field_description")%></h3>
                                        
                                                                        <% 
                                                                            int ratecount = 1;
                                                                            String sql5 = null;
                                                                            while(resultSet3.next()){
                                                                                     
                                                                                   
                                                                        %>  
                                                                                        <div class="form-group rating_wp clearfix">

                                                                                            <label class="rating_type"><%= resultSet3.getString("field_attribute_value")%></label>
                                                                                            <span class="rating">

                                                                                                <input type="radio" class="required rating-input" id="rating-input-<%=ratecount%>-5" 
                                                                                                    <% 
                                                                                                        statement5 = connection.createStatement();   
                                                                                                        sql5 ="select * from take_survey_fields where survey_field_id = ";
                                                                                                        sql5 = sql5 + resultSet2.getString("id") + " and take_survey_id =" + request.getParameter("taken_survey_id");
                                                                                                        resultSet5 = statement5.executeQuery(sql5);
                                                                                                        while(resultSet5.next()){
                                                                                                        statement6 = connection.createStatement();   
                                                                                                        String sql6 ="select * from take_survey_field_values where survey_field_id = ";
                                                                                                        sql6 = sql6 + resultSet5.getString("id");
                                                                                                        resultSet6 = statement6.executeQuery(sql6);
                                                                                
                                                                                                            while(resultSet6.next()){
                                                                                                                if(resultSet3.getString("id").equals(resultSet6.getString("taken_survey_field_id")) && resultSet6.getString("value").equals("5 Stars")){
                                                                                                    %>
                                                                                                                    checked
                                                                                                    <%
                                                                                                                }  
                                                                                                            }statement6.close();
                                                                                                        }
                                                                                                    %>
                                                                                                >
                                                                                                <label for="rating-input-<%=ratecount%>-5" class="rating-star"></label>

                                                                                                <input type="radio" class="required rating-input" id="rating-input-<%=ratecount%>-4" 
                                                                                                    <% statement5 = connection.createStatement();   
                                                                                                        sql5 ="select * from take_survey_fields where survey_field_id = ";
                                                                                                        sql5 = sql5 + resultSet2.getString("id") + " and take_survey_id =" + request.getParameter("taken_survey_id");
                                                                                                        resultSet5 = statement5.executeQuery(sql5);
                                                                                                        while(resultSet5.next()){

                                                                                                            statement6 = connection.createStatement();   
                                                                                                            String sql6 ="select * from take_survey_field_values where survey_field_id = ";
                                                                                                            sql6 = sql6 + resultSet5.getString("id");
                                                                                                            resultSet6 = statement6.executeQuery(sql6);
                                                                                
                                                                                                            while(resultSet6.next()){
                                                                                                                if(resultSet3.getString("id").equals(resultSet6.getString("taken_survey_field_id")) && resultSet6.getString("value").equals("4 Stars")){
                                                                                                    %>
                                                                                                        checked
                                                                                                    <%
                                                                                                                }  
                                                                                                            }statement6.close();
                                                                                                        }
                                                                                                    %>
                                                                                                >
                                                                                                <label for="rating-input-<%=ratecount%>-4" class="rating-star"></label>

                                                                                                <input type="radio" class="required rating-input" id="rating-input-<%=ratecount%>-3"  
                                                                                                    <% 
                                                                                                        statement5 = connection.createStatement();   
                                                                                                        sql5 ="select * from take_survey_fields where survey_field_id = ";
                                                                                                        sql5 = sql5 + resultSet2.getString("id") + " and take_survey_id =" + request.getParameter("taken_survey_id");
                                                                                                        resultSet5 = statement5.executeQuery(sql5);
                                                                                                        while(resultSet5.next()){
                                                                                                            statement6 = connection.createStatement();   
                                                                                                            String sql6 ="select * from take_survey_field_values where survey_field_id = ";
                                                                                                            sql6 = sql6 + resultSet5.getString("id");
                                                                                                            resultSet6 = statement6.executeQuery(sql6);
                                                                                    
                                                                                                            while(resultSet6.next()){
                                                                                                                if(resultSet3.getString("id").equals(resultSet6.getString("taken_survey_field_id")) && resultSet6.getString("value").equals("3 Stars")){
                                                                                                    %>
                                                                                                        checked
                                                                                                    <%
                                                                                                                }  
                                                                                                            }statement6.close();
                                                                                                        }
                                                                                                    %>
                                                                                                >
                                                                                                <label for="rating-input-<%=ratecount%>-3" class="rating-star"></label>

                                                                                                <input type="radio" class="required rating-input" id="rating-input-<%=ratecount%>-2"  
                                                                                                    <% 
                                                                                                        statement5 = connection.createStatement();   
                                                                                                        sql5 ="select * from take_survey_fields where survey_field_id = ";
                                                                                                        sql5 = sql5 + resultSet2.getString("id") + " and take_survey_id =" + request.getParameter("taken_survey_id");
                                                                                                        resultSet5 = statement5.executeQuery(sql5);
                                                                                                        while(resultSet5.next()){
                                                                                                            statement6 = connection.createStatement();   
                                                                                                            String sql6 ="select * from take_survey_field_values where survey_field_id = ";
                                                                                                            sql6 = sql6 + resultSet5.getString("id");
                                                                                                            resultSet6 = statement6.executeQuery(sql6);
                                                                                    
                                                                                                            while(resultSet6.next()){
                                                                                                                if(resultSet3.getString("id").equals(resultSet6.getString("taken_survey_field_id")) && resultSet6.getString("value").equals("2 Stars")){
                                                                                                    %>
                                                                                                        checked
                                                                                                    <%
                                                                                                                }  
                                                                                                            }statement6.close();
                                                                                                        }
                                                                                                    %>
                                                                                                >
                                                                                                <label for="rating-input-<%=ratecount%>-2" class="rating-star"></label>

                                                                                                <input type="radio" class="required rating-input" id="rating-input-<%=ratecount%>-1"  
                                                                                                    <% 
                                                                                                    statement5 = connection.createStatement();   
                                                                                                    sql5 ="select * from take_survey_fields where survey_field_id = ";
                                                                                                    sql5 = sql5 + resultSet2.getString("id") + " and take_survey_id =" + request.getParameter("taken_survey_id");
                                                                                                    resultSet5 = statement5.executeQuery(sql5);
                                                                                                        while(resultSet5.next()){
                                                                                                            statement6 = connection.createStatement();   
                                                                                                            String sql6 ="select * from take_survey_field_values where survey_field_id = ";
                                                                                                            sql6 = sql6 + resultSet5.getString("id");
                                                                                                            resultSet6 = statement6.executeQuery(sql6);
                                                                                
                                                                                                            while(resultSet6.next()){
                                                                                                                if(resultSet3.getString("id").equals(resultSet6.getString("taken_survey_field_id")) && resultSet6.getString("value").equals("1 Stars")){
                                                                                                    %>
                                                                                                        checked
                                                                                                    <%
                                                                                                               }  
                                                                                                            }statement6.close();
                                                                                                        }
                                                                                                    %>
                                                                                                >
                                                                                                <label for="rating-input-<%=ratecount%>-1" class="rating-star"></label>

                                                                                            </span>
                                                                                        </div>
                                                                        <% 
                                                                                        ratecount++;
                                                                                    
                                                                                
                                                                            }
                                                                            statement3.close();
                                                                        %>
                                                                        
                                                                    </div>
                                                                <%
                                                                    }
                                                                    count++;
                                                                %>
                                                            <!--======END OF RATINGS========--> 
                                                    <% 
                                                        
                                                        }while(resultSet2.next());
                                                        statement2.close();
                                                    %>
                                                <!--======END OF SURVEY FIELDS===========-->

                                                
                                                <!--========SUBMIT STEP=======-->
                                                    <div class="submit step">
                                                        <h3 class="main_question"><strong></strong>Are You In Favour Of This Decision</h3>
                                                        <div class="form-group">
                                                            <label class="container_radio version_2">Yes
                                                                <% 
                                                                    if(resultSet4.getString("vote").equals("Yes")){
                                                                %>
                                                                        <input type="radio" name="vote" value="Yes" class="required" checked disabled>
                                                                <%
                                                                    }else{
                                                                %>
                                                                        <input type="radio" name="vote" value="Yes" class="required" disabled>
                                                                <%
                                                                    }
                                                                %>
                                                                
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="container_radio version_2">No
                                                                <% 
                                                                    if(resultSet4.getString("vote").equals("No")){
                                                                %>
                                                                        <input type="radio" name="vote" value="No" class="required" checked disabled>
                                                                <%
                                                                    }else{
                                                                %>
                                                                        <input type="radio" name="vote" value="No" class="required" disabled>
                                                                <%
                                                                    }
                                                                %>
                                                                        
                                                                
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>
                                                        <h3 class="main_question">Comments</h3>
                                                        <div class="form-group ">
                                                            <textarea name="comment" class="form-control review_message required" placeholder="Your Thoughts On This Decision By The University" disabled>
                                                                <%= resultSet4.getString("comment")%>
                                                            </textarea>
                                                        </div>
                                                    </div>
                                                <!--=====END OF SUBMIT STEP===-->
                                            </div>

                                            <!-- /middle-wizard -->
                                            <div id="bottom-wizard">
                                                <button type="button" name="backward" class="backward">Prev</button>
                                                <button type="button" name="forward" class="forward">Next</button>
                                                
                                            </div>
                                            <!-- /bottom-wizard -->
                                        </form>
                                    </div>
                                    <!-- /Wizard container -->
                            </div>
                            
                            
                        <!--===========END OF RIGHT CONTENT=========-->
                    </div>
                </div>
            <!--=========END OF BODY CONTENT===================-->

            <!--==========NOT RELEVANT=======================-->
                <div class="cd-overlay-nav">
                    <span></span>
                </div>
                <div class="cd-overlay-content">
                    <span></span>
                </div>
                <a href="#0" class="cd-nav-trigger">Menu<span class="cd-icon"></span></a>
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
            <!--===============REALLY NOT===================-->

            <!--============ SCRIPTS =============-->
                <script src="js/jquery-3.2.1.min.js"></script>
                <script src="js/common_scripts.min.js"></script>
                <script src="js/velocity.min.js"></script>
                <script src="js/functions.js"></script>

                <!-- Wizard script -->
                <script src="js/survey_func.js"></script>
            <!--==============END OF SCRIPTS======-->
        </body>
    </html>
<%
        }
        statement4.close();  
    }
    statement.close(); 
    connection.close(); 

%>