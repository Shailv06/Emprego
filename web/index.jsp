<%-- 
    Document   : index.jsp
    Created on : Mar 28, 2017, 9:37:34 AM
    Author     : SHAIL-PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Emprego</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.action == 'company'}" >
                <c:redirect url="home2"/> 
            </c:when>
            <c:otherwise>
                <c:redirect url="home"/> 
            </c:otherwise>
        </c:choose>
    </body>
</html>
