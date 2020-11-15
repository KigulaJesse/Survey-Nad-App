<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Wilio Survey, Quotation, Review and Register form Wizard by Ansonika.">
    <meta name="author" content="Ansonika">
    <title>Surveys | Makerere University</title>

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
						<h2>Create A Survey</h2>
						<p>Welcome to Makerere University Online Survey Creation Tool.</p>
						<a href="./" class="btn_1 rounded">Return Home</a>
						<a href="#start" class="btn_1 rounded mobile_btn">Start Now!</a>
					</div>
					<div class="copy"> © 2020 Nad</div>
				</div>
				
            </div>
            <!--============END OF LEFT CONTENT=============-->

            <!--================RIGHT CONTENT==============-->
			<div class="col-lg-6 content-right" id="start">
				<div id="wizard_container">
					<div id="top-wizard">
							<div id="progressbar"></div>
						</div>
						<form method="POST" action="./CreateSurvey">
							<input id="website" name="website" type="text" value="">
							<div id="middle-wizard">
								<div class="submit step">
									<h3 class="main_question"><strong>1/1</strong>Please fill out details to create survey</h3>
									<div class="form-group">
										<input type="text" name="survey_name" class="form-control required" placeholder="Survey Name">
									</div>
									<div class="form-group">
										<div class="styled-select clearfix">
											<select class="wide required" name="populus">
                                                <option value="">Populus</option>
                                                <option value="All">All</option>	
												<option value="Livingstone">Livingstone</option>
												<option value="Nsibirwa">Nsibirwa</option>
												<option value="COCIS">COCIS</option>
												<option value="COBAMS">COBAMS</option>                             
											</select>
										</div>
                                    </div>
									<div class="form-group ">
										<textarea name="survey_topic" class="form-control review_message required" placeholder="Survey Topic and a brief summary" onkeyup="getVals(this, 'review_message');"></textarea>
									</div>
									
								</div>
							</div>
							<!-- /middle-wizard -->
							<div id="bottom-wizard">
								<button type="button" name="backward" class="backward">Prev</button>
								<button type="button" name="forward" class="forward">Next</button>
								<button type="submit" name="process" class="submit">Submit</button>
							</div>
							<!-- /bottom-wizard -->
						</form>
					</div>
					<!-- /Wizard container -->
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