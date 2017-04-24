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
    <title>Job Notification</title>
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
            <h2 class="title text-center">Notification</h2><br><br><br>
            <c:choose>
                <c:when test="${sessionScope.action == 'seeker'}">
                    <div class="row">
                        <div class="product-information"><!--/product-information-->
                            <c:forEach items="${notification}" var="noti">
                                <c:choose>
                                    <c:when test="${noti.getFlag() == 0}">
                                        <div class="alert alert-info">
                                    </c:when>
                                    <c:when test="${noti.getFlag() == 1}">
                                        <div class="alert alert-link" style="background-color: whitesmoke">
                                    </c:when>
                                </c:choose>
                                            <strong><c:out value="${noti.getJobStatus()}"/> &nbsp;!!!&nbsp; </strong> 
                                            <c:out value="${noti.getJobName()}"/> for <c:out value="${noti.getCompanyName()}"/>.
                                            <label style="float: right"><c:out value="${noti.getTime()}"/></label>
                                        </div>
                            </c:forEach>
                                        </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="row">
                        <div class="product-information"><!--/product-information-->
                            <c:forEach items="${notification}" var="noti">
                                <c:choose>
                                    <c:when test="${noti.getFlag() == 0}">
                                        <div class="alert alert-info">
                                    </c:when>
                                    <c:when test="${noti.getFlag() == 1}">
                                        <div class="alert alert-link" style="background-color: whitesmoke">
                                    </c:when>
                                </c:choose>
                                            <strong><c:out value="${noti.getJobStatus()}"/> &nbsp;!!!&nbsp; </strong> 
                                            <c:choose>
                                                <c:when test="${noti.getSeekerId() == 0}">
                                                    <c:out value="${noti.getJobName()}"/>.
                                                    <label style="float: right"><c:out value="${noti.getTime()}"/></label>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="home?action=jobDetail&jobId=<c:out value="${noti.getSeekerId()}"/> ">
                                                        <c:out value="${noti.getSeekerName()}"/>
                                                    </a> for <c:out value="${noti.getJobName()}"/>.
                                                    <label style="float: right"><c:out value="${noti.getTime()}"/></label>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                            </c:forEach>
                                        </div>
                        </div>
                    </div>
                </c:otherwise>            
            </c:choose>
                            
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
