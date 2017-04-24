<%-- 
    Document   : header_middle
    Created on : Mar 19, 2017, 9:43:20 AM
    Author     : SHAIL-PC
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="logo pull-left">
                        <a href="index.jsp"><img src="images/home/logo4.jpg" alt="Logo" /></a>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="mainmenu2 pull-right">
                        <ul class="nav navbar-nav navbar-right">
                            <c:choose>
                                <c:when test="${sessionScope.action != null}">
                                    <c:choose>
                                        <c:when test="${sessionScope.action == 'seeker'}" >
                                            <li>
                                                <a href="home?action=jobNotification">
                                                    <i class="fa fa-bell"></i>Notification&nbsp;<span class="badge"><c:out value="${requestScope.notiCount}"/></span>
                                                </a>
                                            </li>
                                        </c:when>
                                        <c:when test="${sessionScope.action == 'company'}" >
                                            <li>
                                                <a href="home2?action=jobNotification">
                                                    <i class="fa fa-bell"></i>Notification&nbsp;<span class="badge"><c:out value="${requestScope.notiCount}"/></span>
                                                </a>
                                            </li>
                                        </c:when>
                                    </c:choose>
                                </c:when>        
                            </c:choose>        
                            <c:choose>
                                <c:when test="${sessionScope.action == null}">
                                    <li><a data-toggle="modal" href="#myModal"><i class="fa fa-lock"></i>Login</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="dropdown"><a href="#"><i class="fa fa-user"></i>
                                        <c:out value="${sessionScope.user.getName()}"/>
                                        <i class="fa fa-angle-down"></i></a>
                                            
                                        <ul role="menu" class="sub-menu">
                                        <c:choose>
                                            <c:when test="${sessionScope.action == 'seeker'}" >
                                                <li><a href="home?action=profile">Profile  (<c:out value="${sessionScope.profilePercent}"/>%)</a></li>
                                            </c:when>
                                        </c:choose>
                                                <li><a href="home?action=logout">Logout</a></li>
                                        </ul>
                                    </li> 
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                    <div class="mainmenu pull-left">
                        <!-- Modal -->
                        <div class="modal fade-in" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                              <!-- Modal content-->
                              <div class="modal-content" >
                                <div class="modal-header">
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  <h2 class="modal-title" style="color:#0083C9;font-weight: 600"><center>Login</center></h2>
                                </div>
                                <div class="modal-body"  >
                                    <form role="form" method="POST" action="login" >
                                        <div class="align-center standard-margin word-with-line-head">
                                            <div class="word-with-line inline-block">
                                                <span class="large light"></span>
                                            </div>
                                        </div>
                                        <div class="form-group"> 
                                            <label class="radio-inline "><input type="radio" required="true" checked name="action" value="seeker">Are you a JobSeeker</label>
                                            <label class="radio-inline" ><input type="radio" required="true" name="action" value="company">Are you a Company</label>
                                        </div> 
                                        <div class="form-group"> 
                                            <label for="name">Email ID</label> 
                                            <input type="text" class="form-control" required="true" name="email" placeholder="Enter Email ID"> 
                                        </div> 
                                        <div class="form-group"> 
                                            <label for="password">Password</label>
                                            <input type="password" class="form-control" required="true" name="password" placeholder="Enter Password"> 
                                        </div>
                                        <button type="submit" class="btn btn-success">Login</button>
                                        <button type="reset" class="btn">Clear</button>
                                    </form>
                                    <div style="margin: 30px; font-size: 17px">
                                        <center>
                                            Don't have an account? 
                                            <a href="signup.jsp" > 
                                                Sign up
                                            </a>
                                        </center>
                                    </div>
                                </div>

                              </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
