<%-- 
    Document   : checkEmail
    Created on : Mar 28, 2017, 8:45:00 PM
    Author     : SHAIL-PC
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.shail.util.DbUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Connection con= new DbUtil().getConnection();%>
<%
    String sql;
    String email= request.getParameter("email");
    String action= request.getParameter("action");
    if(action.equals("seeker"))
        sql = "select * from jobseeker where seekerEmail= ?";
    else
        sql = "select * from company where companyEmail= ?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, email);
    ResultSet rs = ps.executeQuery();
    out.println(!rs.next());
%>