<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" href="images/home/toplogo.jpg"/>
    <title>Job Details | Emprego</title>
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

    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-12 padding-right">
                    <div class="product-details"><!--product-details-->
                        <div class="col-sm-9">
                            <div class="product-information">
                                <c:set var="post" value="${post}" scope="request"/>
                                <h2><c:out value="${post.getDesignation()}"/></h2>
                                <p id="key-skills"><c:out value="${post.getCompanyName()}"/></p><hr>
                                <p><b>Skills Required: </b> 
                                    <c:forEach items="${post.getKeySkills()}" var="keyskill">
                                        <c:out value="${keyskill}"/><c:out value=" | "/> 
                                    </c:forEach>
                                </p>
                                <p><b>Experience:  </b><c:out value="${post.getExperience()}"/></p>
                                <p><b>Salary:  </b><c:out value="${post.getSalary()}"/></p>
                                <p><b>Specialization:  </b><c:out value="${post.getSpecialization()}"/></p>
                                <p><b>Qualification: </b><c:out value="${post.getQualification()}"/></p>
                                <p><b>Job Description:  </b><c:out value="${post.getDetails()}"/></p>
                                <hr>
                                <span class="glyphicon glyphicon-tag"></span><b style="margin: 10px"><c:out value="${post.getExperience()}"/></b>
                                <span class="glyphicon glyphicon-map-marker"></span><b style="margin-left: 5px"><c:out value="${post.getLocation()}"/></b>
                                <hr>
                                <b>Job ID: </b><a href=""><c:out value="${post.getId()}"/></a> <br>
                                <b>Posted On: </b><a href=""><c:out value="${post.getTime()}"/></a> 
                                <c:choose>
                                    <c:when test="${post.getApplied() =='0' && sessionScope.user != null}">
                                        <a href="home?action=jobApply&jobId=<c:out value="${post.getId()}"/>" style="float:right"><button type="submit" class="btn btn-success">Apply </button></a>
                                    </c:when>
                                    <c:when test="${post.getApplied() =='1'}">
                                        <a style="float:right"><button type="submit" class="btn btn-toolbar" >Applied </button></a>
                                    </c:when>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${sessionScope.user != null}">
                                        <c:choose>
                                            <c:when test="${post.getShortlisted() == '1'}">
                                                <a href="home?action=unshortlist&action2=detail&jobId=<c:out value="${post.getId()}"/>" style="float:right;margin-right: 20px" data-toggle="tooltip" data-placement="bottom" title="Unshortlist Job">    
                                                    <img class="shortlist1" src="images/home/star.png"/>
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="home?action=shortlist&action2=detail&jobId=<c:out value="${post.getId()}"/>" style="float:right;margin-right: 20px" data-toggle="tooltip" data-placement="bottom" title="Shortlist Job">    
                                                    <img class="shortlist2" src="images/home/star2.png"/>
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                </c:choose>
                            </div><!--/product-information-->
                        </div>
                    </div><!--/product-details-->
                </div>
            </div>
        </div>
    </section>

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