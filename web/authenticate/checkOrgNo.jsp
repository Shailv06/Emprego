<%-- 
    Document   : checkOrgNo
    Created on : Mar 26, 2017, 10:57:10 AM
    Author     : SHAIL-PC
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.shail.util.DbUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Connection con= new DbUtil().getConnection();%>
<%
    int orgNo= Integer.parseInt(request.getParameter("orgNo"));
    String sql = "select companyID from company where orgNo = ?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1,orgNo);
    ResultSet rs = ps.executeQuery();
    out.println(!rs.next());
%>