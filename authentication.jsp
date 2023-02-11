<title>MPMC : : Authentication Page</title>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>
<%
   	String username=request.getParameter("userid");      
   	String Password=request.getParameter("pass");
	
    try{
		if(username.equals("admin")){
			application.setAttribute("user",username);
			String sql="SELECT * FROM admin where username='"+username+"' and password='"+Password+"'";
			Statement stmt = connection.createStatement();
			ResultSet rs =stmt.executeQuery(sql);
			String utype="";
			if(rs.next()){
				response.sendRedirect("adminmain.jsp");
			}
			else
			{
				response.sendRedirect("wronglogin.html");
			}
		}
		else{
			application.setAttribute("uname",username);
			
			String sql="SELECT * FROM user where username='"+username+"' and password='"+Password+"'";
			Statement stmt = connection.createStatement();
			ResultSet rs =stmt.executeQuery(sql);
			String utype="";
			if(rs.next()){
			
				response.sendRedirect("usermain.jsp");
			}
			else
			{
				response.sendRedirect("wronglogin.html");
			}
		}
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>