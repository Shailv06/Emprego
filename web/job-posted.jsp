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
    <title>Job Posted | Emprego</title>
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
            <h2 class="title text-center">Job Posted</h2><br><br><br>
            <div class="row">
                <div class="product-information">
                    <c:forEach items="${posts}" var="post">
                        <div class="alert alert-warning">
                            <h4><c:out value="${post.getDesignation()}"/>
                                <span style="float: right;color: #2b542c"><c:out value="${post.getApplied()}"/> Applied</span>
                                <span style="float: right;color: #2b542c"><c:out value="${post.getShortlisted()}"/> Shortlisted &nbsp; </span></h4>
                            <p><c:out value="${post.getSpecialization()}"/></p>
                            <p>Post ID: <c:out value="${post.getId()}"/></p>
                            <span class="glyphicon glyphicon-tag"></span><b style="margin: 5px"><c:out value="${post.getExperience()}"/></b>
                            <span class="glyphicon glyphicon-map-marker"></span><b style="margin-left: 5px"><c:out value="${post.getLocation()}"/></b>
                            <a href="home2?action=applicant&jobid=<c:out value="${post.getId()}"/>"  style="float:right">
                                <button type="submit" class="btn btn-success" >View Applicant</button>
                            </a>
                            <c:choose>
                                <c:when test="${post.getFlag() == 1}">
                                    <a href="home2?action=stop&jobid=<c:out value="${post.getId()}"/>"  style="float:right">
                                        <button type="button" class="btn btn-danger" >Stop Receiving Applicant</button>&nbsp;
                                    </a>
                                </c:when>
                            </c:choose>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>
    
    <footer id="footer"><!--Footer-->
        <jsp:include page="Home/footer.jsp"/>
    </footer><!--/Footer-->
	

  
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
