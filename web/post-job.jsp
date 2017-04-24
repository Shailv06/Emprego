<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" href="images/home/toplogo.jpg"/>
    <title>Post Job | Emprego</title>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
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

    <section>
        <div class="container">
            <h2 class="title text-center">Post Job</h2><br><br><br>
            <div class="row">
                <div class="product-information" style="margin-bottom: 40px"><!--/product-information-->
                    <div class="login-form" style="margin-top: 20px">
                        <div style="margin-buttom: 30px;">
                            <h3 style="color:#FDB45E">Job Details :</h3>
                        </div>
                        <form class="form-horizontal" method="post" action="home2?action=post">
                              <div class="form-group">
                                <label class="control-label col-sm-5">Job Designation:</label>
                                <div class="col-sm-7">
                                  <input type="text" class="form-control" required="true" name="designation"  placeholder="Job Designation">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label col-sm-5" for="pwd">Key Skills:</label>
                                <div class="col-sm-7">
                                  <input type="text" name="skill" required="true" class="form-control" placeholder="1.">
                                  <input type="text" name="skill" required="true" class="form-control"  placeholder="2.">
                                  <input type="text" name="skill" required="true" class="form-control"  placeholder="3.">
                                  <input type="text" name="skill" class="form-control"  placeholder="4.">
                                  <input type="text" name="skill" class="form-control"  placeholder="5.">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label col-sm-5" style="float: left" for="pwd">Job Description:</label>
                                <div class="col-sm-7">
                                    <textarea class="form-control" name="description" rows="5" required="true" placeholder="Job Description"></textarea>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label col-sm-5" style="float: left" for="pwd">Experience Required:</label>
                                <div class="col-sm-7">
                                    <select class="form-control" name="experience" required="true" >
                                        <option value="0 Year">0 Year</option>
                                        <option value="1 Year">1 Year</option>
                                        <option value="1 - 2 Year">1 - 2 Year</option>
                                        <option value="2 - 5 Year">2 - 5 Year</option>
                                    </select>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label col-sm-5"  style="float: left" for="pwd">Specialization Required:</label>
                                <div class="col-sm-7">
                                  <input type="text" name="spec" class="form-control" required="true"  placeholder="Specialization Required">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label col-sm-5" style="float: left" for="pwd">Qualification:</label>
                                <div class="col-sm-7">
                                  <input type="text" name="qualif" class="form-control" required="true" placeholder="Qualification">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label col-sm-5" style="float: left" for="pwd">Salary:</label>
                                <div class="col-sm-7">
                                    <select name="salary" class="form-control" required="true"  >
                                        <option value="Rs 2.00 Lacs p.a.">Rs 2.00 Lacs p.a.</option>
                                        <option value="Rs 2.00 - 4.00 Lacs p.a.">Rs 2.00 - 4.00 Lacs p.a.</option>
                                        <option value="Rs 4.00 - 6.00 Lacs p.a.">Rs 4.00 - 6.00 Lacs p.a.</option>
                                        <option value="Rs 6.00 - 9.00 Lacs p.a.">Rs 6.00 - 9.00 Lacs p.a.</option>
                                        <option value="Rs 9.00 - 15.00 Lacs p.a." >Rs 9.00 - 15.00 Lacs p.a.</option>
                                        <option value="As per Industry Standards">As per Industry Standards</option>
                                    </select>
                                </div>
                              </div>
                              <div style="margin-buttom: 30px;">
                                <h3 style="color:#FDB45E">Other Details :</h3>
                              </div>
                              <div class="form-group">
                                <label class="control-label col-sm-5" style="float: left">Number of Vacancy:</label>
                                <div class="col-sm-7">
                                  <input name="vacancy" type="text" class="form-control" required="true"  placeholder="Vacancy">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label col-sm-5" style="float: left" for="pwd">Working Location:</label>
                                <div class="col-sm-7">
                                  <input name="work" type="text" required="true" class="form-control" placeholder="1.">
                                  <input name="work" type="text"  class="form-control"  placeholder="2.">
                                  <input name="work" type="text" class="form-control"  placeholder="3.">
                                  <input name="work" type="text" class="form-control"  placeholder="4.">
                                  <input name="work" type="text" class="form-control"  placeholder="5.">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label col-sm-5" style="float: left" for="pwd">Contacting Mobile No.</label>
                                <div class="col-sm-7">
                                    <input name="mobile" type="text" class="form-control" required="true"  placeholder="Mobile No.">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label col-sm-5" style="float: left" for="pwd">Contacting Email Address:</label>
                                <div class="col-sm-7">
                                    <input name="email" type="email" class="form-control" required="true"  placeholder="Email ID">
                                </div>
                              </div>
                              <div class="form-group" style="float: right">
                                <div class="col-sm-10">
                                    <button type="submit" class="btn btn-default">Save</button>
                                </div>
                              </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <footer id="footer"><!--Footer-->
        <jsp:include page="Home/footer.jsp"/>
    </footer><!--/Footer-->
	
    
</body>
