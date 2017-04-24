<%-- 
    Document   : company-content
    Created on : Mar 22, 2017, 10:50:28 PM
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
        <!--<div class="container">-->
        <div class="col-sm-9 padding-right">
            <div class="features_items"><!--features_items-->
                <c:choose>
                    <c:when test="${not empty search}">
                        <h2 class="title text-center">Search Result for "<c:out value="${search}"/>"</h2> 
                    </c:when>
                    <c:otherwise>
                        <h2 class="title text-center">Recommended Profile</h2>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${empty profile}">
                       <h2 class="text-center">No Post Found</h2> 
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${profile}" var="prof">
                            <div class="col-sm-12" style="margin-bottom: 25px">
                                <div class="product-information "><!--/product-information-->
                                    <a href="home2?action=profile_details&profileid=<c:out value="${prof.getSeekerId()}"/>" >
                                        <h3><c:out value="${prof.getSeekerName()}"/></h3>
                                    </a>
                                    <p><c:out value="${prof.getSeekerEmail()}"/></p>
                                    <p>Profile ID:<c:out value="${prof.getSeekerId()}"/></p><hr>
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
                                    <a href="home2?action=profile_details&profileid=<c:out value="${prof.getSeekerId()}"/>" style="float:right">
                                        <button type="submit" class="btn btn-success" >View Details</button>
                                    </a>
                                </div><!--/product-information-->
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div><!--features_items-->
        </div>
        <!--</div>-->
    </body>
</html>
