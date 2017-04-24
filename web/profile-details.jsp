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
    <title>Profile Details | Emprego</title>
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
                                <c:set var="prof" value="${profile}" scope="request"/>
                                <h2><c:out value="${prof.getSeekerName()}"/></h2>
                                <p id="key-skills"><c:out value="${prof.getSeekerMobile()}"/></p>
                                <p id="key-skills"><c:out value="${prof.getSeekerEmail()}"/></p><hr>
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
                                    <c:when test="${prof.getWork_link() != null}">
                                        <p><b>Work Link: &nbsp;&nbsp;</b>
                                        <c:set var="works" value="${fn:split(prof.getWork_link(),',')}" />
                                        <c:forEach items="${works}" var="work">
                                            <a href="<c:out value="${work}"/>"><c:out value="${work}"/>&nbsp;&nbsp;&nbsp;</a>
                                        </c:forEach>
                                    </c:when>
                                </c:choose>
                                
                                <c:choose>
                                    <c:when test="${prof.getJob_features1() != null}">
                                        <c:set var="job1" value="${fn:split(prof.getJob_features1(), ',')}" />
                                        <p><b>Experience: </b></p>
                                        <div style="padding :35px">
                                        <table class="table table-striped" >
                                            <thead>
                                              <tr>
                                                <th>Designation</th>
                                                <th>Organisation</th>
                                                <th>Duration</th>
                                                <th>Description</th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                              <tr>
                                                <td><c:out value="${job1[0]}"/></td>
                                                <td><c:out value="${job1[1]}"/></td>
                                                <td><c:out value="${job1[2]}"/> - <c:out value="${job1[3]}"/></td>
                                                <td><c:out value="${prof.getJob_details1()}"/></td>
                                              </tr>
                                              <c:choose>
                                                  <c:when test="${prof.getJob_features2() != null}">
                                                   <c:set var="job2" value="${fn:split(prof.getJob_features2(), ',')}" />   
                                                  <tr>
                                                    <td><c:out value="${job2[0]}"/></td>
                                                    <td><c:out value="${job2[1]}"/></td>
                                                    <td><c:out value="${job2[2]}"/> - <c:out value="${job2[3]}"/></td>
                                                    <td><c:out value="${prof.getJob_details2()}"/></td>
                                                  </tr>
                                                  </c:when>
                                              </c:choose>
                                             </tbody>
                                          </table>
                                        </div>
                                    </c:when>
                                </c:choose>    
                                <c:choose>
                                    <c:when test="${prof.getIntern_features1() != null}">
                                        <c:set var="intern1" value="${fn:split(prof.getIntern_features1(), ',')}" />
                                        <p><b>Internship: </b></p>
                                        <div style="padding :35px">
                                        <table class="table table-striped" >
                                            <thead>
                                              <tr>
                                                <th>Designation</th>
                                                <th>Organisation</th>
                                                <th>Duration</th>
                                                <th>Description</th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                              <tr>
                                                <td><c:out value="${intern1[0]}"/></td>
                                                <td><c:out value="${intern1[1]}"/></td>
                                                <td><c:out value="${intern1[2]}"/> - <c:out value="${intern1[3]}"/></td>
                                                <td><c:out value="${prof.getIntern_details1()}"/></td>
                                              </tr>
                                              <c:choose>
                                                  <c:when test="${prof.getIntern_features2() != null}">
                                                   <c:set var="intern2" value="${fn:split(prof.getIntern_features2(), ',')}" />   
                                                  <tr>
                                                    <td><c:out value="${intern2[0]}"/></td>
                                                    <td><c:out value="${intern2[1]}"/></td>
                                                    <td><c:out value="${intern2[2]}"/> - <c:out value="${intern2[3]}"/></td>
                                                    <td><c:out value="${prof.getIntern_details2()}"/></td>
                                                  </tr>
                                                  </c:when>
                                              </c:choose>
                                             </tbody>
                                          </table>
                                        </div>
                                    </c:when>
                                </c:choose>    
                                <c:choose>
                                    <c:when test="${prof.getProj_features1() != null}">
                                        <c:set var="proj1" value="${fn:split(prof.getProj_features1(), ',')}" />
                                        <p><b>Project Completed: </b></p>
                                        <div style="padding :35px">
                                        <table class="table table-striped" >
                                            <thead>
                                              <tr>
                                                <th>Title</th>
                                                <th>Duration</th>
                                                <th>Description</th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                              <tr>
                                                <td><c:out value="${proj1[0]}"/></td>
                                                <td><c:out value="${proj1[1]}"/> - <c:out value="${proj1[2]}"/></td>
                                                <td><c:out value="${prof.getProj_details1()}"/></td>
                                              </tr>
                                              <c:choose>
                                                  <c:when test="${prof.getProj_features2() != null}">
                                                   <c:set var="proj2" value="${fn:split(prof.getProj_features2(), ',')}" />   
                                                  <tr>
                                                    <td><c:out value="${proj2[0]}"/></td>
                                                    <td><c:out value="${proj2[1]}"/> - <c:out value="${proj2[2]}"/></td>
                                                    <td><c:out value="${prof.getProj_details2()}"/></td>
                                                  </tr>
                                                  </c:when>
                                              </c:choose>
                                              <c:choose>
                                                  <c:when test="${prof.getProj_features3() != null}">
                                                   <c:set var="proj3" value="${fn:split(prof.getProj_features3(), ',')}" />   
                                                  <tr>
                                                    <td><c:out value="${proj3[0]}"/></td>
                                                    <td><c:out value="${proj3[1]}"/> - <c:out value="${proj3[2]}"/></td>
                                                    <td><c:out value="${prof.getProj_details3()}"/></td>
                                                  </tr>
                                                  </c:when>
                                              </c:choose>
                                              <c:choose>
                                                  <c:when test="${prof.getProj_features2() != null}">
                                                   <c:set var="proj4" value="${fn:split(prof.getProj_features4(), ',')}" />   
                                                  <tr>
                                                    <td><c:out value="${proj4[0]}"/></td>
                                                    <td><c:out value="${proj4[1]}"/> - <c:out value="${proj4[2]}"/></td>
                                                    <td><c:out value="${prof.getProj_details4()}"/></td>
                                                  </tr>
                                                  </c:when>
                                              </c:choose>
                                             </tbody>
                                          </table>
                                        </div>
                                    </c:when>
                                </c:choose>    
                                        
                                <c:choose>
                                    <c:when test="${prof.getDetails_10() != null}">
                                        <c:set var="details10" value="${fn:split(prof.getDetails_10(), ',')}" />
                                        <p><b>Academic Details: </b></p>
                                        <div style="padding :35px">
                                            <c:choose>
                                                <c:when test="${prof.getDetails_graduation() != null}">
                                                    <table class="table table-striped" >
                                                        <thead>
                                                          <tr>
                                                            <th>Education Title</th>
                                                            <th>Institution</th>
                                                            <th>Degree</th>
                                                            <th>Stream</th>
                                                            <th>Percent or CGPA</th>
                                                          </tr>
                                                        </thead>
                                                        <tbody>
                                                          <c:choose>
                                                              <c:when test="${prof.getOther_education2() != null}">
                                                               <c:set var="edu1" value="${fn:split(prof.getOther_education2(), ',')}" />   
                                                              <tr>
                                                                <td><c:out value="${edu1[0]}"/></td>
                                                                <td><c:out value="${edu1[1]}"/></td>
                                                                <td><c:out value="${edu1[2]}"/></td>
                                                                <td><c:out value="${edu1[3]}"/></td>
                                                                <td><c:out value="${edu1[4]}"/></td>
                                                              </tr>
                                                              </c:when>
                                                          </c:choose>
                                                          <c:choose>
                                                              <c:when test="${prof.getOther_education1() != null}">
                                                               <c:set var="edu2" value="${fn:split(prof.getOther_education1(), ',')}" />   
                                                              <tr>
                                                                <td><c:out value="${edu2[0]}"/></td>
                                                                <td><c:out value="${edu2[1]}"/></td>
                                                                <td><c:out value="${edu2[2]}"/></td>
                                                                <td><c:out value="${edu2[3]}"/></td>
                                                                <td><c:out value="${edu2[4]}"/></td>
                                                              </tr>
                                                              </c:when>
                                                          </c:choose>
                                                          <c:choose>
                                                              <c:when test="${prof.getDetails_graduation() != null}">
                                                               <c:set var="edu3" value="${fn:split(prof.getDetails_graduation(), ',')}" />   
                                                              <tr>
                                                                <td>Graduation</td>
                                                                <td><c:out value="${edu3[0]}"/></td>
                                                                <td><c:out value="${edu3[1]}"/></td>
                                                                <td><c:out value="${edu3[2]}"/></td>
                                                                <td><c:out value="${edu3[3]}"/></td>
                                                              </tr>
                                                              </c:when>
                                                          </c:choose>
                                                        </tbody>
                                                    </table>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                        
                                        <div style="padding :35px">
                                            <c:choose>
                                                <c:when test="${prof.getDetails_10() != null}">
                                                    <table class="table table-striped" >
                                                        <thead>
                                                          <tr>
                                                            <th>Education Title</th>
                                                            <th>Year of Completion</th>
                                                            <th>Board</th>
                                                            <th>Percent or CGPA</th>
                                                            <th>School</th>
                                                          </tr>
                                                        </thead>
                                                        <tbody>
                                                          <c:choose>
                                                              <c:when test="${prof.getDetails_12() != null}">
                                                               <c:set var="edu5" value="${fn:split(prof.getDetails_12(), ',')}" />   
                                                              <tr>
                                                                <td>Intermediate</td>
                                                                <td><c:out value="${edu5[0]}"/></td>
                                                                <td><c:out value="${edu5[1]}"/></td>
                                                                <td><c:out value="${edu5[2]}"/></td>
                                                                <td><c:out value="${edu5[3]}"/></td>
                                                              </tr>
                                                              </c:when>
                                                          </c:choose>
                                                          
                                                          <c:choose>
                                                              <c:when test="${prof.getDetails_10() != null}">
                                                               <c:set var="edu4" value="${fn:split(prof.getDetails_10(), ',')}" />   
                                                              <tr>
                                                                <td>High School</td>
                                                                <td><c:out value="${edu4[0]}"/></td>
                                                                <td><c:out value="${edu4[1]}"/></td>
                                                                <td><c:out value="${edu4[2]}"/></td>
                                                                <td><c:out value="${edu4[3]}"/></td>
                                                              </tr>
                                                              </c:when>
                                                          </c:choose>
                                                        </tbody>
                                                    </table>
                                                </c:when>
                                            </c:choose>
                                        </div>
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