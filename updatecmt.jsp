<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<html><title>PPI : user status changing</title>
<body>
	<center>&nbsp;</center>
	<br><br><br>
	<%
		String rfrom = request.getParameter("rfrom");
		String key = request.getParameter("keyword");
  		String id = request.getParameter("imageid");
		String comment = request.getParameter("cmt");
		String uname = (String )application.getAttribute("uname");
		out.println(rfrom+" : "+id+" : "+comment  );
   		try {
		
			SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

			Date now = new Date();
						
			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
	   		
	   		String str = "Accepted";
				
       		Statement st1 = connection.createStatement();
       		String query1 ="insert into comments(username,imageid,dt,comment) values('"+uname+"','"+id+"','"+dt+"','"+comment+"')";
	   		st1.executeUpdate (query1);
	   		connection.close();
       	}
      	catch(Exception e)
     	{
			out.println(e.getMessage());
   		}
   		if(rfrom.equals("umain")){
			response.sendRedirect("usermain.jsp");  
		}else if(rfrom.equals("sbContent")){
			response.sendRedirect("searchpostBC.jsp?keyword="+key);
		}else if(rfrom.equals("sbkeyword")){
			response.sendRedirect("searchpost.jsp?keyword="+key);
		}else{}
	%>
</body>
</html>