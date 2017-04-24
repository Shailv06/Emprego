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
    <title>Profile | Emprego</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/w3.css">
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
    
    <div class="container">
        <div class="row">
            <h2 class="title text-center">Profile</h2>
                <div class="col-sm-12 padding-right">
                    <div class="product-details"><!--product-details-->
                        <div class="col-sm-10">
                            <div class="product-information"><!--/product-information-->
                                <div class="w3-light-grey">
                                    <div class="w3-container w3-green w3-center" style="width:<c:out value="${sessionScope.profilePercent}"/>%"><c:out value="${sessionScope.profilePercent}"/>%</div>
                                </div>
                                <div class="col-sm-3" style="margin-top: 50px">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a data-toggle="tab" href="#academic">Academic Details</a></li>
                                        <li><a data-toggle="tab" href="#jobExperience">Job Experience</a></li>
                                        <li><a data-toggle="tab" href="#specialty">Speciality</a></li>
                                        <li><a data-toggle="tab" href="#internship">Internship</a></li>
                                        <li><a data-toggle="tab" href="#projects">Projects Completed </a></li>
                                        <li><a data-toggle="tab" href="#worklink">Work Link</a></li>
                                    </ul>
                                </div>
                                <c:set var="prof" value="${profile}" scope="request"/>
                                <div class="col-sm-9" style="margin-top: 50px;">
                                    <div class="tab-content">
                                        <div id="academic" class="tab-pane fade in active">
                                            <div style="margin-top: 50px;">
                                                <h3 style="color:#FDB45E">X (Secondary) Details</h3>
                                            </div>
                                            <c:set var="details10" value="${fn:split(prof.getDetails_10(),',')}" /> 
                                            <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                <form action="profile?action=details10" method="post" name="details10">
                                                    <input type="text" name="year" required="true" placeholder="Year of Completion" value="<c:out value="${details10[0]}"/>" />
                                                    <input type="text" name="board" required="true" placeholder="Board" value="<c:out value="${details10[1]}" />" />
                                                    <input type="text" name="percent" required="true" placeholder="Percentage Scored" value="<c:out value="${details10[2]}" />" />
                                                    <input type="text" name="school" required="true" placeholder="School" value="<c:out value="${details10[3]}" />"  />
                                                    <button type="submit" style="margin-bottom: 50px" class="btn btn-default">Save</button>
                                                </form>
                                            </div>
                                            <div style="margin-top: 50px;">
                                                <h3 style="color:#FDB45E">XII (Senior Secondary) Details</h3>
                                            </div>
                                            <c:set var="details12" value="${fn:split(prof.getDetails_12(),',')}" /> 
                                            <div class="login-form" style="margin-top: 50px">
                                                <form action="profile?action=details12" method="post" name="details12">
                                                    <input type="text" name="year" required="true" placeholder="Year of Completion" value="<c:out value="${details12[0]}" />"/>
                                                    <input type="text" name="board" required="true" placeholder="Board" value="<c:out value="${details12[1]}" />"/>
                                                    <input type="text" name="percent" required="true" placeholder="Percentage Scored" value="<c:out value="${details12[2]}" />"/>
                                                    <input type="text" name="school" required="true" placeholder="School" value="<c:out value="${details12[3]}" />"/>
                                                    <button type="submit" style="margin-bottom: 50px" class="btn btn-default">Save</button>
                                                </form>
                                            </div>
                                            <div style="margin-top: 50px;">
                                                <h3 style="color:#FDB45E">Graduation Details</h3>
                                            </div>
                                            <c:set var="detailsGrad" value="${fn:split(prof.getDetails_graduation(),',')}" /> 
                                            <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                <form action="profile?action=detailsGrad" method="post" name="detailsGrad">
                                                    <input type="text" name="college" required="true" placeholder="College" value="<c:out value="${detailsGrad[0]}" />"/>
                                                    <input type="text" name="degree" required="true" placeholder="Degree" value="<c:out value="${detailsGrad[1]}" />"/>
                                                    <input type="text" name="stream" required="true" placeholder="Stream" value="<c:out value="${detailsGrad[2]}" />"/>
                                                    <input type="text" name="percent" required="true" placeholder="Percentage Scored" value="<c:out value="${detailsGrad[3]}" />" />
                                                    <button type="submit" style="margin-bottom: 50px" class="btn btn-default">Save</button>
                                                </form>
                                            </div>
                                            <c:choose>
                                                <c:when test="${prof.getOther_education1() != null}" >
                                                    <c:set var="otherEdu1" value="${fn:split(prof.getOther_education1(),',')}" /> 
                                                    <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                        <form action="profile?action=otherEdu1" method="post" name="otherEdu1">
                                                            <input type="text" name="edu" required="true" placeholder="Education Title" value="<c:out value="${otherEdu1[0]}" />"/>
                                                            <input type="text" name="college" required="true" placeholder="College" value="<c:out value="${otherEdu1[1]}" />"/>
                                                            <input type="text" name="degree" required="true" placeholder="Degree" value="<c:out value="${otherEdu1[2]}" />"/>
                                                            <input type="text" name="percent" required="true" placeholder="Percentage Scored" value="<c:out value="${otherEdu1[3]}" />"/>
                                                            <input type="text" name="stream" required="true" placeholder="Stream" value="<c:out value="${otherEdu1[4]}" />"/>
                                                            <button type="submit" style="margin-bottom: 50px" class="btn btn-default">Save</button>
                                                        </form>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${prof.getOther_education2() != null}" >
                                                    <c:set var="otherEdu2" value="${fn:split(prof.getOther_education2(),',')}" /> 
                                                    <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                        <form action="profile?action=otherEdu2" method="post" name="otherEdu2">
                                                            <input type="text" name="edu" required="true" placeholder="Education Title" value="<c:out value="${otherEdu2[0]}" />"/>
                                                            <input type="text" name="college" required="true" placeholder="College" value="<c:out value="${otherEdu2[1]}" />"/>
                                                            <input type="text" name="degree" required="true" placeholder="Degree" value="<c:out value="${otherEdu2[2]}" />"/>
                                                            <input type="text" name="percent" required="true" placeholder="Percentage Scored" value="<c:out value="${otherEdu2[3]}" />"/>
                                                            <input type="text" name="steam" required="true" placeholder="Stream" value="<c:out value="${otherEdu2[4]}" />"/>
                                                            <button type="submit" style="margin-bottom: 50px" class="btn btn-default">Save</button>
                                                        </form>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${prof.getOther_education2() == null}" >
                                                    <a data-toggle="modal" href="#addEducation" style="color: #FE980F"><i class="fa fa-plus"></i> Add Education Details</a>
                                                    <div class="modal fade-in" id="addEducation" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <!-- Modal content-->
                                                            <div class="modal-content" >
                                                                <div class="modal-body"  >
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                                        <form action="profile?action=otherEdu" method="post" name="otherEdu">
                                                                            <input type="text" name="edu" required="true" placeholder="Education Title" />
                                                                            <input type="text" name="college" required="true" placeholder="College" />
                                                                            <input type="text" name="degree" required="true" placeholder="Degree" />
                                                                            <input type="text" name="percent" required="true" placeholder="Percentage Scored" />
                                                                            <input type="text" name="stream" required="true" placeholder="Stream" />
                                                                            <button type="submit" style="margin-bottom: 50px" class="btn btn-default">Add</button>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                        <div id="jobExperience" class="tab-pane fade">
                                            <c:choose>
                                                <c:when test="${prof.getJob_features1() != null}">
                                                    <c:set var="job1" value="${fn:split(prof.getJob_features1(),',')}"/>
                                                    <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                        <form action="profile?action=job1" method="post" name="job1">
                                                            <input type="text" name="designation" required="true" value="<c:out value="${job1[0]}" />" placeholder="Job Designation" />
                                                            <input type="text" name="organisation" required="true" value="<c:out value="${job1[1]}" />" placeholder="Organisation" />
                                                            <input type="text" name="sDate" required="true" value="<c:out value="${job1[2]}" />" placeholder="Start Date" />
                                                            <input type="text" name="eDate" required="true" value="<c:out value="${job1[3]}" />" placeholder="End Date" />
                                                            <textarea class="form-control" name="description" rows="5" required="true" placeholder="Job Description">
                                                                <c:out value="${prof.getJob_details1()}" />
                                                            </textarea>
                                                            <button type="submit" class="btn btn-default">Save</button>
                                                        </form>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${prof.getJob_features2() != null}">
                                                    <c:set var="job2" value="${fn:split(prof.getJob_features2(),',')}"/>
                                                    <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                        <form action="profile?action=job2" method="post" name="job2">
                                                            <input type="text" name="designation" required="true" value="<c:out value="${job2[0]}" />" placeholder="Job Designation" />
                                                            <input type="text" name="organisation" required="true" value="<c:out value="${job2[1]}" />" placeholder="Organisation" />
                                                            <input type="text" name="sDate" required="true" value="<c:out value="${job2[2]}" />" placeholder="Start Date" />
                                                            <input type="text" name="eDate" required="true" value="<c:out value="${job2[3]}" />" placeholder="End Date" />
                                                            <textarea class="form-control" name="description" rows="5" required="true" placeholder="Job Description">
                                                                <c:out value="${prof.getJob_details2()}" />
                                                            </textarea>
                                                            <button type="submit" class="btn btn-default">Save</button>
                                                        </form>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${prof.getJob_features2() == null}">
                                                    <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                        <a data-toggle="modal" href="#addJob" style="color: #FE980F"><i class="fa fa-plus"></i> Add Job Experience</a>
                                                        <div class="modal fade-in" id="addJob" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog">
                                                              <!-- Modal content-->
                                                              <div class="modal-content" >
                                                                <div class="modal-body"  >
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                                        <form action="profile?action=job" method="post" name="job">
                                                                            <input type="text" name="designation" required="true" placeholder="Job Designation" />
                                                                            <input type="text" name="organisation" required="true" placeholder="Organisation" />
                                                                            <input type="text" name="sDate" required="true" placeholder="Start Date" />
                                                                            <input type="text" name="eDate" required="true" placeholder="End Date" />
                                                                            <textarea class="form-control" rows="5" required="true" placeholder="Job Description"></textarea>
                                                                            <button type="submit" class="btn btn-default">Add</button>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                              </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                        <c:set var="skills" value="${fn:split(prof.getSkills(),',')}" /> 
                                        <div id="specialty" class="tab-pane fade">
                                            <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                <form action="profile?action=skills" method="post" name="skills">
                                                    <c:set var="count" value="${0}" scope="page" /> 
                                                    <c:forEach items="${skills}" var="skill">
                                                        <input type="text" name="skill" required="true" placeholder="Speciality" value="<c:out value="${skill}" />" />
                                                        <c:set var="count" value="${count + 1}" scope="page"/>
                                                    </c:forEach>
                                                    <button type="submit" style="margin-bottom: 50px" class="btn btn-default">Save</button>
                                                </form>
                                            </div>
                                            <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                <a data-toggle="modal" href="#addSpeciality" style="color: #FE980F"><i class="fa fa-plus"></i> Add Speciality</a>
                                                <div class="modal fade-in" id="addSpeciality" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                      <!-- Modal content-->
                                                      <div class="modal-content" >
                                                        <div class="modal-body"  >
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                                <form action="profile?action=newskill" method="post" name="newskill">
                                                                    <input type="text" name="skill" required="true" placeholder="Skill" />
                                                                    <button type="submit" class="btn btn-default">Add</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                      </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <c:set var="intern1" value="${fn:split(prof.getIntern_features1(),',')}" /> 
                                        <div id="internship" class="tab-pane fade">
                                            <c:choose>
                                                <c:when test="${prof.getIntern_features1() != null}" >
                                                    <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                        <form action="profile?action=intern1" method="post" name="intern1">
                                                            <input type="text" name="profile" required="true" placeholder="Position" value="<c:out value="${intern1[0]}" />" />
                                                            <input type="text" name="organisation" required="true" placeholder="Organisation" value="<c:out value="${intern1[1]}"/>"/>
                                                            <input type="text" name="sDate" required="true" placeholder="Start Date" value="<c:out value="${intern1[2]}" />"/>
                                                            <input type="text" name="eDate" required="true" placeholder="End Date" value="<c:out value="${intern1[3]}" />" />
                                                            <textarea class="form-control" name="description" rows="5" required="true" placeholder="Job Description"><c:out value="${prof.getIntern_details1()}"/></textarea>
                                                            <button type="submit" class="btn btn-default">Add</button>
                                                        </form>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                            <c:set var="intern2" value="${fn:split(prof.getIntern_features2(),',')}" /> 
                                            <c:choose>
                                                <c:when test="${prof.getIntern_features2() != null}" >
                                                    <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                        <form action="profile?action=intern2" method="post" name="intern2">
                                                            <input type="text" name="profile" required="true" placeholder="Position" value="<c:out value="${intern2[0]}"/>"/>
                                                            <input type="text" name="organisation" required="true" placeholder="Organisation" value="<c:out value="${intern2[1]}" />"/>
                                                            <input type="text" name="sDate"  required="true" placeholder="Start Date" value="<c:out value="${intern2[2]}" />"/>
                                                            <input type="text" name="sDate" required="true" placeholder="End Date" value="<c:out value="${intern2[3]}" /> "/>
                                                            <textarea class="form-control" name="description" rows="5" required="true" placeholder="Job Description">
                                                                <c:out value="${prof.getIntern_details2()}"/>
                                                            </textarea>
                                                            <button type="submit" class="btn btn-default">Add</button>
                                                        </form>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                             <c:choose>
                                                <c:when test="${prof.getIntern_features2() == null}" >
                                                    <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                        <a data-toggle="modal" href="#addInternship" style="color: #FE980F"><i class="fa fa-plus"></i> Add Internship</a>
                                                        <div class="modal fade-in" id="addInternship" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog">
                                                              <!-- Modal content-->
                                                              <div class="modal-content" >
                                                                <div class="modal-body"  >
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                                        <form action="profile?action=intern" method="post" name="intern">
                                                                            <input type="text" name="profile"  required="true" placeholder="Position" />
                                                                            <input type="text" name="organisation" required="true" placeholder="Organisation" />
                                                                            <input type="text" name="sDate" required="true" placeholder="Start Date" />
                                                                            <input type="text" name="eDate" required="true" placeholder="End Date" />
                                                                            <textarea class="form-control"  name="description" rows="5" required="true" placeholder="Job Description"></textarea>
                                                                            <button type="submit" class="btn btn-default">Add</button>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                              </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                        <div id="projects" class="tab-pane fade">
                                            <c:set var="proj1" value="${fn:split(prof.getProj_features1(),',')}" /> 
                                            <c:choose>
                                                <c:when test="${prof.getProj_features1() != null}" >
                                                    <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                    <form action="profile?action=proj1" method="post" name="proj1">
                                                        <input type="text" name="title" required="true" value="<c:out value="${proj1[0]}"/>" placeholder="Project Title" />
                                                        <input type="text" name="sDate" required="true" value="<c:out value="${proj1[1]}"/>" placeholder="Start Date" />
                                                        <input type="text" name="eDate" required="true" value="<c:out value="${proj1[2]}"/>" placeholder="End Date" />
                                                        <textarea class="form-control" name="description" required="true" rows="5" required="true" placeholder="Project Description">
                                                            <c:out value="${prof.getProj_details1()}"/>
                                                        </textarea>
                                                        <button type="submit" class="btn btn-default">Add</button>
                                                    </form>
                                                </div>
                                                </c:when>
                                            </c:choose>
                                            <c:set var="proj2" value="${fn:split(prof.getProj_features2(),',')}" /> 
                                            <c:choose>
                                                <c:when test="${prof.getProj_features2() != null}" >
                                                    <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                    <form action="profile?action=proj2" method="post" name="proj2">
                                                        <input type="text" name="title" required="true" value="<c:out value="${proj2[0]}"/>" placeholder="Project Title" />
                                                        <input type="text" name="sDate" required="true" value="<c:out value="${proj2[1]}"/>" placeholder="Start Date" />
                                                        <input type="text" name="eDate" required="true" value="<c:out value="${proj2[2]}"/>" placeholder="End Date" />
                                                        <textarea class="form-control" name="description" required="true" rows="5" required="true" placeholder="Project Description">
                                                            <c:out value="${prof.getProj_details2()}"/>
                                                        </textarea>
                                                        <button type="submit" class="btn btn-default">Add</button>
                                                    </form>
                                                </div>
                                                </c:when>
                                            </c:choose>
                                            <c:set var="proj1" value="${fn:split(prof.getProj_features3(),',')}" /> 
                                            <c:choose>
                                                <c:when test="${prof.getProj_features3() != null}" >
                                                    <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                    <form action="profile?action=proj3" method="post" name="proj3">
                                                        <input type="text" name="title" required="true" value="<c:out value="${proj3[0]}"/>" placeholder="Project Title" />
                                                        <input type="text" name="sDate" required="true" value="<c:out value="${proj3[1]}"/>" placeholder="Start Date" />
                                                        <input type="text" name="eDate" required="true" value="<c:out value="${proj3[2]}"/>" placeholder="End Date" />
                                                        <textarea class="form-control" name="description" required="true" rows="5" required="true" placeholder="Project Description">
                                                            <c:out value="${prof.getProj_details3()}"/>
                                                        </textarea>
                                                        <button type="submit" class="btn btn-default">Add</button>
                                                    </form>
                                                </div>
                                                </c:when>
                                            </c:choose>
                                            <c:set var="proj1" value="${fn:split(prof.getProj_features4(),',')}" /> 
                                            <c:choose>
                                                <c:when test="${prof.getProj_features4() != null}" >
                                                    <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                        <form action="profile?action=proj4" method="post" name="proj4">
                                                            <input type="text" name="title" required="true" value="<c:out value="${proj4[0]}"/>" placeholder="Project Title" />
                                                            <input type="text" name="sDate" required="true" value="<c:out value="${proj4[1]}"/>" placeholder="Start Date" />
                                                            <input type="text" name="eDate" required="true" value="<c:out value="${proj4[2]}"/>" placeholder="End Date" />
                                                            <textarea class="form-control" name="description" required="true" rows="5" required="true" placeholder="Project Description">
                                                                <c:out value="${prof.getProj_details4()}"/>
                                                            </textarea>
                                                            <button type="submit" class="btn btn-default">Add</button>
                                                        </form>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${prof.getProj_features4() == null}">
                                                    <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                        <a data-toggle="modal" href="#addProject" style="color: #FE980F"><i class="fa fa-plus"></i> Add Project Details</a>
                                                        <div class="modal fade-in" id="addProject" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog">
                                                              <!-- Modal content-->
                                                              <div class="modal-content" >
                                                                <div class="modal-body"  >
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                                        <form action="profile?action=proj" method="post" name="proj">
                                                                            <input type="text" name="title" required="true" placeholder="Project Title" />
                                                                            <input type="text" name="sDate" required="true" placeholder="Start Date" />
                                                                            <input type="text" name="eDate" required="true" placeholder="End Date" />
                                                                            <textarea class="form-control" name="description" required="true" rows="5" required="true" placeholder="Project Description"></textarea>
                                                                            <button type="submit" class="btn btn-default">Add</button>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                              </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                        <div id="worklink" class="tab-pane fade">
                                            <c:set var="worklinks" value="${fn:split(prof.getWork_link(),',')}" /> 
                                            <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                <form action="profile?action=worklink" method="post" name="worklink">
                                                    <c:set var="count" value="${0}" scope="page" /> 
                                                    <c:forEach items="${worklinks}" var="worklink">
                                                        <input type="text" name="worklink<c:out value="${count}"/>" required="true" value="<c:out value="${worklink}"/>" placeholder="Work Url" />
                                                        <c:set var="count" value="${count + 1}" scope="page"/>
                                                    </c:forEach>
                                                    <button type="submit" class="btn btn-default">Save</button>
                                                </form>
                                            </div>
                                            <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                <a data-toggle="modal" href="#addWork" style="color: #FE980F"><i class="fa fa-plus"></i> Add Work Links</a>
                                                <div class="modal fade-in" id="addWork" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                      <!-- Modal content-->
                                                      <div class="modal-content" >
                                                        <div class="modal-body"  >
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <div class="login-form" style="margin-top: 50px"><!--login form-->
                                                                <form action="profile?action=newworklink" method="post" name="newworklink">
                                                                <form action="">
                                                                    <input type="text" required="true" placeholder="Work Url" />
                                                                    <button type="submit" class="btn btn-default">Add</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                      </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                  </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>
    
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
