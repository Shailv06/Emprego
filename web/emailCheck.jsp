<%@page import="com.shail.util.DbUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%
String action=request.getParameter("action");
String email =request.getParameter("email");
if(email!=null&&email.length()!=0){    
    DbUtil util = new DbUtil();
    PreparedStatement ps = null;
    if(action.equalsIgnoreCase("seeker"))
        ps = util.getConnection().prepareStatement("Select * from jobSeeker where seekerEmail = ?");
    else if(action.equalsIgnoreCase("company"))
        ps = util.getConnection().prepareStatement("Select * from company where companyEmail = ?");
    ps.setString(1,email); 
    ResultSet rs = ps.executeQuery(); 
    out.println(!rs.next());
}	
%>