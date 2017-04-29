<%-- 
    Document   : content
    Created on : Mar 19, 2017, 9:44:03 AM
    Author     : SHAIL-PC
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-sm-9 padding-right">
            <div class="features_items"><!--features_items-->
                <c:choose>
                    <c:when test="${not empty search}">
                        <h2 class="title text-center">Search Result for "<c:out value="${search}"/>"</h2> 
                    </c:when>
                    <c:otherwise>
                        <h2 class="title text-center">Recommended Jobs</h2>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${empty posts}">
                       <h2 class="text-center">No Post Found</h2> 
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${posts}" var="post">
                            <div class="col-sm-12" style="margin-bottom: 25px">
                                <div class="product-information "><!--/product-information-->
                                    <a href="home?action=jobDetail&jobId=<c:out value="${post.getId()}"/>" >
                                        <h2><c:out value="${post.getDesignation()}"/> (<c:out value="${post.getExperience()}"/>)</h2>
                                    </a>
                                    <p id="key-skills"><c:out value="${post.getCompanyName()}"/></p><hr>
                                    <p><b>Details:</b><c:out value="${fn:substring(post.getDetails(),0,180)}"/>... 
                                        <a href="home?action=jobDetail&jobId=<c:out value="${post.getId()}"/>">More Details</a></p>
                                    <p><b>Skills Required:</b>
                                        <c:forEach items="${post.getKeySkills()}" var="keyskill">
                                            <c:out value="${keyskill}"/><c:out value=" | "/> 
                                        </c:forEach>
                                    </p>
                                    <hr>
                                    <span class="glyphicon glyphicon-tag"></span><b style="margin: 10px"><c:out value="${post.getExperience()}"/></b>
                                    <span class="glyphicon glyphicon-map-marker"></span><b style="margin-left: 5px"><c:out value="${post.getLocation()}"/></b>
                                    <hr>
                                    <c:choose>
                                        <c:when test="${sessionScope.user != null}">
                                            <c:choose>
                                                <c:when test="${post.getShortlisted() == '1'}">
                                                    <a href="home?action=unshortlist&jobId=<c:out value="${post.getId()}"/>" data-toggle="tooltip" data-placement="bottom" title="Unshortlist Job">    
                                                        <img class="shortlist1" src="images/home/star.png"/>
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="home?action=shortlist&jobId=<c:out value="${post.getId()}"/>" data-toggle="tooltip" data-placement="bottom" title="Shortlist Job">    
                                                        <img class="shortlist2" src="images/home/star2.png"/>
                                                    </a>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                    </c:choose>
                                    <a href="home?action=jobDetail&jobId=<c:out value="${post.getId()}"/> " style="float:right">
                                        <button type="submit" class="btn btn-success" >View Details</button>
                                    </a>
                                </div><!--/product-information-->
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div><!--features_items-->
        </div>
        <script>
            $(document).ready(function(){
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
            
    </body>
</html>
