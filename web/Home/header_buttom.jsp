<%-- 
    Document   : header_buttom
    Created on : Mar 19, 2017, 9:43:33 AM
    Author     : SHAIL-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div class="container" >
            <div class="row">
                <div class="col-sm-8">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="mainmenu pull-left">
                        <ul class="nav navbar-nav collapse navbar-collapse">
                            <li><a href="index.jsp"><i class="fa fa-home">&nbsp;</i>Home</a></li>
                            <c:choose>
                                <c:when test="${sessionScope.action == 'company'}" >
                                    <li><a href="home2?action=postJob"><i class="fa fa-plus">&nbsp;</i>Post Job</a></li>
                                    <li>
                                        <a href="home2?action=jobPosted">
                                            <i class="fa fa-crosshairs">&nbsp;</i>Job Posted&nbsp;<span class="badge"><c:out value="${requestScope.postCount}"/></span>
                                        </a>
                                    </li>
                                </c:when>   
                            </c:choose>
                            <c:choose>
                                <c:when test="${sessionScope.action == 'seeker'}" >
                                    <li><a href="home?action=jobApplied"><i class="fa fa-crosshairs">&nbsp;</i>Job Applied</a></li>
                                    <li>
                                        <a href="home?action=jobShortlisted">
                                            <i class="fa fa-star">&nbsp;</i>Job Shortlisted&nbsp;<span class="badge"><c:out value="${requestScope.shortCount}"/></span>
                                        </a>
                                    </li>
                                </c:when>   
                            </c:choose>
                            <li><a href="videoConference.html"><i class="fa fa-video-camera">&nbsp;</i>Video Conferencing</a></li>        
                        </ul>
                    </div>
                </div>
                <div class="col-sm-4">
                    <c:choose>
                        <c:when test="${sessionScope.action == 'company'}">
                            <form name="loginform" method="post" action="home2?action=search" >
                        </c:when>
                        <c:otherwise>
                            <form name="loginform" method="post" action="home?action=search" >
                        </c:otherwise>
                    </c:choose>
                        <div class="search_box pull-right">
                            <input type="text" name="search" placeholder="Search"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
