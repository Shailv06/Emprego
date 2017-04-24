<%@page import="com.shail.util.DbUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%
String action=request.getParameter("action");
String org =request.getParameter("orgNo");
if(org!=null&&org.length()!=0){    
    DbUtil util = new DbUtil();
    PreparedStatement ps = null;
    ps = util.getConnection().prepareStatement("Select * from company where orgNo = ?");
    ps.setString(1,org); 
    ResultSet rs = ps.executeQuery(); 
    out.println(!rs.next());
}	
%>