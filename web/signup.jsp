<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" href="images/home/toplogo.jpg"/>
    <title>SignUp | Emprego</title>
    <script type="text/Javascript" src="js/ajax.js"></script>
    <script type="text/Javascript" src="js/validation.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
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

	<section id="form"><!--form-->
		<div class="container">
			<div class="row">
                            <h2 class="title text-center">SignUp</h2>
                            <div class="product-information">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a data-toggle="tab" href="#signupJobSeeker">Signup as JobSeeker</a></li>
                                    <li><a data-toggle="tab" href="#signupCompany">Signup as Company</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div id="signupJobSeeker" class="tab-pane fade in active  col-lg-6 ">
                                        <div class="login-form" style="margin-top: 50px"><!--login form-->
                                            
                                            <!--Jobseeker signup form-->
                                            <form method="post"  action="home?action=signup" name="employeeregister" onsubmit="return checkEmployeeSigUpForm('seeker')" class="form-horizontal">
                                                <div class="form-group">
                                                    <label class="control-label col-sm-5" style="float: left" for="email">Name:</label>
                                                    <div class="col-sm-7">
                                                        <input type="text" class="form-control" required="true" name="name" placeholder="Name">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-sm-5" style="float: left" for="pwd">Email ID:</label>
                                                    <div class="col-sm-7">
                                                        <input type="email" class="form-control" onkeyup="isEmailAvailable('seeker')" required="true" name="email"  placeholder="Email ID">
                                                        <label id="checkSeekerEmail"></label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-sm-5" style="float: left" >Mobile No.:</label>
                                                    <div class="col-sm-7">
                                                        <input type="text" class="form-control" required="true" name="mobile" placeholder="Mobile Number">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-sm-5" style="float: left" for="pwd">Gender:</label>
                                                    <div class="col-sm-7">
                                                        <span>
                                                            <input type="radio" name="gender" value="Male" class="checkbox"> 
                                                            Male
                                                        </span>
                                                        <span style="margin-left: 10px">
                                                            <input type="radio" name="gender" value="Female" class="checkbox"> 
                                                            Female
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-sm-5" style="float: left" for="email">Password:</label>
                                                    <div class="col-sm-7">
                                                        <input type="password" class="form-control" name="password" required="true"  placeholder="Password">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-sm-5" style="float: left" for="email">Confirm Password:</label>
                                                    <div class="col-sm-7">
                                                        <input type="password" class="form-control" name="cpassword" required="true"  placeholder="Confirm Password">
                                                    </div>
                                                </div>
                                                <div class="form-group" style="float: right">
                                                    <div class="col-sm-10">
                                                        <button type="submit" class="btn btn-default">Submit</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div id="signupCompany" class="tab-pane fade col-lg-6">
                                      <div class="login-form"  style="margin-top: 50px"><!--login form-->
                                          <!--<form method="post"  action="home?action=signup" name="employeeregister" onsubmit="return checkEmployeeSigUpForm('seeker')" class="form-horizontal">-->  
                                          <!--Company signup form-->
                                          <form method="post" action="home2?action=signup" name="companyregister" onsubmit="return checkCompanySignUpForm('company');"  class="form-horizontal" >
                                                <div class="form-group">
                                                    <label class="control-label col-sm-5" style="float: left" for="email">Organisation ID:</label>
                                                    <div class="col-sm-7">
                                                        <input type="text" class="form-control" onkeyup="isOrgNoAvailable()" required="true" name="orgNo" placeholder="Organisation ID">
                                                        <label id="checkOrgNo"></label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-sm-5" style="float: left" >Organisation Name:</label>
                                                    <div class="col-sm-7">
                                                        <input type="text" class="form-control"  required="true" name="name" placeholder="Organisation Name">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-sm-5" style="float: left">Organisation Email ID:</label>
                                                    <div class="col-sm-7">
                                                        <input type="email" class="form-control" onkeyup="isEmailAvailable('company')" required="true" name="email" placeholder="Organisation Email ID">
                                                        <label id="checkCompanyEmail"></label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-sm-5" style="float: left" for="email">Password:</label>
                                                    <div class="col-sm-7">
                                                        <input type="password" class="form-control" required="true" name="password" placeholder="Password">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-sm-5" style="float: left" for="email">Confirm Password:</label>
                                                    <div class="col-sm-7">
                                                        <input type="password" class="form-control" required="true" name="cpassword" placeholder="Confirm Password">
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn btn-default" style="float: right">Submit</button>
                                            </form>
                                        </div>
                                    </div>
                                  </div>
                            </div>
                        </div>
                </div>
	</section><!--/form-->
	
    <footer id="footer"><!--Footer-->
        <jsp:include page="Home/footer.jsp"/>
    </footer><!--/Footer-->
    
    <script src="js/jquery.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>