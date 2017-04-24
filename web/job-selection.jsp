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
    <title>Shortlist | Emprego</title>
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
                            <h2 class="title text-center">Shortlist</h2>
                            <div class="product-information">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a data-toggle="tab" href="#applicant">Applicant</a></li>
                                    <li><a data-toggle="tab" href="#shortlisted">Shortlisted</a></li>
                                    <li><a data-toggle="tab" href="#selected">Selected</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div id="applicant" class="tab-pane fade in active  col-lg-12" style="margin-top: 20px">
                                        <c:forEach items="${applicant}" var="prof">
                                            <div class="col-sm-12" style="margin-bottom: 25px">
                                                <div class="product-information "><!--/product-information-->
                                                    <a href="home2?action=profile_details&profileid=<c:out value="${prof.getSeekerId()}"/>" >
                                                        <h3><c:out value="${prof.getSeekerName()}"/></h3>
                                                    </a>
                                                    <p ><c:out value="${prof.getSeekerEmail()}"/></p>
                                                    <p ><c:out value="${prof.getSeekerId()}"/></p><hr>
                                                    <c:choose>
                                                        <c:when test="${prof.getSkills() != null}">
                                                        <c:set var="skills" value="${fn:split(prof.getSkills(), ',')}" />
                                                        <p><b>Skills: </b>
                                                            <c:forEach items="${skills}" var="skill">
                                                                <c:out value="${skill}"/><c:out value=" | "/> 
                                                            </c:forEach>
                                                        </p>
                                                        </c:when>
                                                    </c:choose>

                                                    <c:choose>
                                                        <c:when test="${prof.getJob_features1() != null}">
                                                            <p><b>Experience:</b>
                                                            <c:set var="job1" value="${fn:split(prof.getJob_features1(),',')}" />
                                                            <c:out value="${job1[1]}"/>
                                                            (<c:out value="${job1[0]}"/>)
                                                        </c:when>
                                                        <c:when test="${prof.getJob_features2() != null}">
                                                            <c:set var="job2" value="${fn:split(prof.getJob_features2(),',')}" />
                                                            , <c:out value="${job2[1]}"/>
                                                            (<c:out value="${job2[0]}"/>)
                                                        </c:when>
                                                    </c:choose>

                                                    <c:choose>
                                                        <c:when test="${prof.getIntern_features1() != null}">
                                                            <p><b>InternShip:</b>
                                                            <c:set var="intern1" value="${fn:split(prof.getIntern_features1(),',')}" />
                                                            <c:out value="${intern1[1]}"/>
                                                            (<c:out value="${intern1[0]}"/>)
                                                        </c:when>
                                                        <c:when test="${prof.getIntern_features2() != null}">
                                                            <c:set var="intern2" value="${fn:split(prof.getIntern_features2(),',')}" />
                                                            , <c:out value="${intern2[1]}"/>
                                                            (<c:out value="${intern2[0]}"/>)
                                                        </c:when>
                                                    </c:choose>
                                                    </p>
                                                    <c:choose>
                                                        <c:when test="${prof.getWork_link() != null}">
                                                            <p><b>Work Link: </b>
                                                            <c:set var="works" value="${fn:split(prof.getWork_link(),',')}" />
                                                            <c:forEach items="${works}" var="work">
                                                                <a href="<c:out value="${work}"/>"><c:out value="${work}"/>&nbsp;&nbsp;&nbsp;</a>
                                                            </c:forEach>
                                                        </c:when>
                                                    </c:choose>

                                                    <hr>
                                                    <i class="fa fa-phone"></i><b style="margin: 10px"><c:out value="${prof.getSeekerMobile()}"/></b>
                                                    <!--<span class="glyphicon glyphicon-map-marker"></span><b style="margin-left: 5px">Delhi</b>-->
                                                    <hr>
                                                    <a href="home2?action=profile_details&profileid=<c:out value="${prof.getSeekerId()}"/>" >
                                                        <button type="submit" class="btn btn-success" >View Details</button>
                                                    </a>
                                                    <a href="home2?action=shortlist&seekerid=<c:out value="${prof.getSeekerId()}"/>&jobid=<c:out value="${jobid}" />"  style="float:right">
                                                        <button type="submit" class="btn btn-success" >Shortlist</button>
                                                    </a>
                                                    <a href="home2?action=reject&seekerid=<c:out value="${prof.getSeekerId()}"/>&jobid=<c:out value="${jobid}" />"  style="float:right">
                                                        <button type="submit" class="btn btn-danger" >Reject</button>&nbsp;
                                                    </a>
                                                </div><!--/product-information-->
                                            </div>
                                        </c:forEach>
                                     </div>
                                     <div id="shortlisted" class="tab-pane fade col-lg-12" style="margin-top: 20px">
                                        <c:forEach items="${shortlist}" var="prof">
                                            <div class="col-sm-12" style="margin-bottom: 25px">
                                                <div class="product-information "><!--/product-information-->
                                                    <a href="home2?action=profile_details&profileid=<c:out value="${prof.getSeekerId()}"/>" >
                                                        <h3><c:out value="${prof.getSeekerName()}"/></h3>
                                                    </a>
                                                    <p ><c:out value="${prof.getSeekerEmail()}"/></p>
                                                    <p ><c:out value="${prof.getSeekerId()}"/></p><hr>
                                                    <c:choose>
                                                        <c:when test="${prof.getSkills() != null}">
                                                        <c:set var="skills" value="${fn:split(prof.getSkills(), ',')}" />
                                                        <p><b>Skills: </b>
                                                            <c:forEach items="${skills}" var="skill">
                                                                <c:out value="${skill}"/><c:out value=" | "/> 
                                                            </c:forEach>
                                                        </p>
                                                        </c:when>
                                                    </c:choose>

                                                    <c:choose>
                                                        <c:when test="${prof.getJob_features1() != null}">
                                                            <p><b>Experience:</b>
                                                            <c:set var="job1" value="${fn:split(prof.getJob_features1(),',')}" />
                                                            <c:out value="${job1[1]}"/>
                                                            (<c:out value="${job1[0]}"/>)
                                                        </c:when>
                                                        <c:when test="${prof.getJob_features2() != null}">
                                                            <c:set var="job2" value="${fn:split(prof.getJob_features2(),',')}" />
                                                            , <c:out value="${job2[1]}"/>
                                                            (<c:out value="${job2[0]}"/>)
                                                        </c:when>
                                                    </c:choose>

                                                    <c:choose>
                                                        <c:when test="${prof.getIntern_features1() != null}">
                                                            <p><b>InternShip:</b>
                                                            <c:set var="intern1" value="${fn:split(prof.getIntern_features1(),',')}" />
                                                            <c:out value="${intern1[1]}"/>
                                                            (<c:out value="${intern1[0]}"/>)
                                                        </c:when>
                                                        <c:when test="${prof.getIntern_features2() != null}">
                                                            <c:set var="intern2" value="${fn:split(prof.getIntern_features2(),',')}" />
                                                            , <c:out value="${intern2[1]}"/>
                                                            (<c:out value="${intern2[0]}"/>)
                                                        </c:when>
                                                    </c:choose>
                                                    </p>
                                                    <c:choose>
                                                        <c:when test="${prof.getWork_link() != null}">
                                                            <p><b>Work Link: </b>
                                                            <c:set var="works" value="${fn:split(prof.getWork_link(),',')}" />
                                                            <c:forEach items="${works}" var="work">
                                                                <a href="<c:out value="${work}"/>"><c:out value="${work}"/>&nbsp;&nbsp;&nbsp;</a>
                                                            </c:forEach>
                                                        </c:when>
                                                    </c:choose>

                                                    <hr>
                                                    <i class="fa fa-phone"></i><b style="margin: 10px"><c:out value="${prof.getSeekerMobile()}"/></b>
                                                    <!--<span class="glyphicon glyphicon-map-marker"></span><b style="margin-left: 5px">Delhi</b>-->
                                                    <hr>
                                                    <a href="home2?action=profile_details&profileid=<c:out value="${prof.getSeekerId()}"/>" >
                                                        <button type="submit" class="btn btn-success" >View Details</button>
                                                    </a>
                                                    <a href="home2?action=selection&seekerid=<c:out value="${prof.getSeekerId()}"/>&jobid=<c:out value="${jobid}" />"  style="float:right">
                                                        <button type="submit" class="btn btn-success" >Selected</button>
                                                    </a>
                                                </div><!--/product-information-->
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div id="selected" class="tab-pane fade col-lg-12" style="margin-top: 20px">
                                        <c:forEach items="${selected}" var="prof">
                                            <div class="col-sm-12" style="margin-bottom: 25px">
                                                <div class="product-information "><!--/product-information-->
                                                    <a href="home2?action=profile_details&profileid=<c:out value="${prof.getSeekerId()}"/>" >
                                                        <h3><c:out value="${prof.getSeekerName()}"/></h3>
                                                    </a>
                                                    <p ><c:out value="${prof.getSeekerEmail()}"/></p>
                                                    <p ><c:out value="${prof.getSeekerId()}"/></p><hr>
                                                    <c:choose>
                                                        <c:when test="${prof.getSkills() != null}">
                                                        <c:set var="skills" value="${fn:split(prof.getSkills(), ',')}" />
                                                        <p><b>Skills: </b>
                                                            <c:forEach items="${skills}" var="skill">
                                                                <c:out value="${skill}"/><c:out value=" | "/> 
                                                            </c:forEach>
                                                        </p>
                                                        </c:when>
                                                    </c:choose>

                                                    <c:choose>
                                                        <c:when test="${prof.getJob_features1() != null}">
                                                            <p><b>Experience:</b>
                                                            <c:set var="job1" value="${fn:split(prof.getJob_features1(),',')}" />
                                                            <c:out value="${job1[1]}"/>
                                                            (<c:out value="${job1[0]}"/>)
                                                        </c:when>
                                                        <c:when test="${prof.getJob_features2() != null}">
                                                            <c:set var="job2" value="${fn:split(prof.getJob_features2(),',')}" />
                                                            , <c:out value="${job2[1]}"/>
                                                            (<c:out value="${job2[0]}"/>)
                                                        </c:when>
                                                    </c:choose>

                                                    <c:choose>
                                                        <c:when test="${prof.getIntern_features1() != null}">
                                                            <p><b>InternShip:</b>
                                                            <c:set var="intern1" value="${fn:split(prof.getIntern_features1(),',')}" />
                                                            <c:out value="${intern1[1]}"/>
                                                            (<c:out value="${intern1[0]}"/>)
                                                        </c:when>
                                                        <c:when test="${prof.getIntern_features2() != null}">
                                                            <c:set var="intern2" value="${fn:split(prof.getIntern_features2(),',')}" />
                                                            , <c:out value="${intern2[1]}"/>
                                                            (<c:out value="${intern2[0]}"/>)
                                                        </c:when>
                                                    </c:choose>
                                                    </p>
                                                    <c:choose>
                                                        <c:when test="${prof.getWork_link() != null}">
                                                            <p><b>Work Link: </b>
                                                            <c:set var="works" value="${fn:split(prof.getWork_link(),',')}" />
                                                            <c:forEach items="${works}" var="work">
                                                                <a href="<c:out value="${work}"/>"><c:out value="${work}"/>&nbsp;&nbsp;&nbsp;</a>
                                                            </c:forEach>
                                                        </c:when>
                                                    </c:choose>

                                                    <hr>
                                                    <i class="fa fa-phone"></i><b style="margin: 10px"><c:out value="${prof.getSeekerMobile()}"/></b>
                                                    <!--<span class="glyphicon glyphicon-map-marker"></span><b style="margin-left: 5px">Delhi</b>-->
                                                    <hr>
                                                    <a href="home2?action=profile_details&profileid=<c:out value="${prof.getSeekerId()}"/>" >
                                                        <button type="submit" class="btn btn-success" >View Details</button>
                                                    </a>
                                                    
                                                </div><!--/product-information-->
                                            </div>
                                        </c:forEach>
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