<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" href="images/home/toplogo.jpg"/>
    <title>Contact Us | Emprego</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-social.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
    <header id="header"><!--header-->
        <div class="header_top"><!--header_top-->
            <jsp:include page="Home/header_top.jsp"/>
        </div><!--/header_top-->

        <div class="header-middle"><!--header-middle-->
            <jsp:include page="Home/header_middle.jsp"/>
        </div><!--/header-middle-->

        <div class="header-bottom"><!--header-bottom-->
            <jsp:include page="Home/header_buttom.jsp"/>
        </div><!--/header-bottom-->
    </header><!--/header-->


    <div id="contact-page" class="container">
        <div class="bg">
            <div class="row">    		
                <div class="col-sm-12">    			   			
                    <h2 class="title text-center">Contact <strong>Us</strong></h2>    			    				    				
                </div>			 		
            </div>    	
            <div class="row" style="margin-bottom: 10px">  	
                <div class="col-sm-12">
                        <div class="contact-info">
                                <address>
                                    <p style="font-size: 25px; font-weight: 600">Emprego </p>
                                    <p style=" margin-top: 20px; font-size: 20px">Shailendra Kumar Verma</p>
                                    <p style="margin-top: 5px">BTech CS 3rd Year</p>
                                    <p>United College of Engineering Research</p>
                                    <p>Allahabad Uttar Pradesh</p>
                                    <p style="margin-top: 10px">Mobile: +91 88 53 61 62 24</p>
                                    <p>Email: shailv06@gmail.com</p>
                                </address>
                                <div class="social-networks">
                                    <h2 class="title text-center">Social Networking</h2>
                                        <ul>
                                            <li>
                                                <a href="facebook.com"><i class="fa fa-facebook"></i></a>
                                            </li>
                                            <li>
                                                <a href="twitter.com"><i class="fa fa-twitter"></i></a>
                                            </li>
                                            <li>
                                                <a href="gmail.com"><i class="fa fa-google-plus"></i></a>
                                            </li>
                                            <li>
                                                <a href="youtube.com"><i class="fa fa-youtube"></i></a>
                                            </li>
                                        </ul>
                                </div>
                        </div>
                </div>    			
            </div>  
        </div>	
    </div><!--/#contact-page-->
	
    <footer id="footer"><!--Footer-->
        <jsp:include page="Home/footer.jsp"/>
    </footer><!--/Footer-->

  
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script type="text/javascript" src="js/gmaps.js"></script>
	<script src="js/contact.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>