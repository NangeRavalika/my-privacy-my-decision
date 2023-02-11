<%@ page import="java.sql.*,java.util.Random" %>
<%@ include file="connect.jsp" %>
<html><title>PPI : user status changing</title>
<body>
	<center>&nbsp;</center>
	<br><br><br>
	<%
  		int mid = Integer.parseInt(request.getParameter("rid"));
   		try {
	   		
	   		String str = "Accepted";
				
       		Statement st1 = connection.createStatement();
       		String query1 ="update request set status='"+str+"' where id="+mid+" ";
	   		st1.executeUpdate (query1);
	   		connection.close();
       	}
      	catch(Exception e)
     	{
			out.println(e.getMessage());
   		}
   		response.sendRedirect("viewrequest.jsp");  
	%>
</body>
</html>