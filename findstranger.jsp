<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>MPMC : User Main Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-titillium-250.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style1 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
       <ul>
          <li><a href="#"><span>Home Page</span></a></li>
          <li><a href="#"><span>About Us</span></a></li>
          <li><a href="#"><span>Admin</span></a></li>
          <li class="active"><a href="#"><span>User</span></a></li>
          <li  ><a href="#"><span>Register</span></a></li>
        </ul>
      </div>
      <div class="logo">
        <h1><a href="index.html"><span style="color:#FF3333;">My Privacy My Decision </span><small>Control of Photo
Sharing on Online Social Networks </small></a></h1>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="943" height="311" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="943" height="311" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="943" height="311" alt="" /> </a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
			
          <h2><span>View  Stranger or Friend or Mutual Friend Details  </span></h2>
          <div class="clr">
            
            
			<div id="#" width="650" style="margin-right:5px">
    	
   	<div id="#" width="560" style="margin-left:2px; margin-right:2px;">  
		
		
		
		<p>&nbsp;</p>
		
		<%
		try{   
			String username=null; 
			int uid=0;
			  ArrayList<String> Friendlist = new ArrayList<String>();
			 
			  
			  
			String uname=(String)application.getAttribute("uname"); 
		
			ArrayList<String> userlist = new ArrayList<String>();
			String s1=null,s2=null,s3=null,s4=null,s5=null,s6=null,s7=null,s8=null,s9=null,s10=null,s11=null,s12=null,s13=null;
			int i=0;
			
			
			
			
			String strangerMsg="";
			Statement stmt=connection.createStatement();
			String strQuery = "select * from user where username!='"+uname+"'";
			ResultSet rs = stmt.executeQuery(strQuery);
			boolean friend=false;
			while ( rs.next() )
			{
				String status="Stranger";
				i=rs.getInt(1);
				s1=rs.getString(2);
				s2=rs.getString(4);
				s3=rs.getString(5);
				s4=rs.getString(6);
				s5=rs.getString(7);
				s8=rs.getString(8);
								
								
				 			
				String query1="select * from request where (requestfrom='"+uname+"' && requestto='"+s1+"') || (requestfrom='"+s1+"' && requestto='"+uname+"')"; 
				Statement st1=connection.createStatement();
				ResultSet rs1=st1.executeQuery(query1);
				if(rs1.next())
				{
					String status1 = rs1.getString("status");
					if(status1.equals("Accepted"))
					{
						status="Friend";
						strangerMsg=""+s1+" is my Friend";
					}
					
				}
				
				else
				{
					String strQuery5 = "select * from user";
					Statement stmt5=connection.createStatement();
					ResultSet rs5 = stmt5.executeQuery(strQuery5);
					while ( rs5.next() ){
						String user=rs5.getString(2);
						
						String query6="select * from request where (requestfrom='"+uname+"' && requestto='"+user+"') || (requestfrom='"+user+"' && requestto='"+uname+"')"; 
						Statement st6=connection.createStatement();
						ResultSet rs6=st6.executeQuery(query6);
						if(rs6.next())
						{
						
								String query9="select * from request where (requestfrom='"+s1+"' && requestto='"+user+"') || (requestfrom='"+user+"' && requestto='"+s1+"')"; 
							Statement st9=connection.createStatement();
							ResultSet rs9=st9.executeQuery(query9);
							if(rs9.next())
							{
							
								String status6 = rs6.getString("status");
								if(status6.equals("Accepted"))
								{
									friend=true;
									
								}
								
							}
						}
					}
					if(friend==true){
						strangerMsg=""+s1+" is Mutual Friend";
						friend=false;
					}else{
						strangerMsg=""+s1+" is Stranger";
					}
				}
			
		%>			
		
				<div>
					<table border="3" width="560" style="margin:10px 10px 10px 5px;">
						<tr valign="middle">
                        <td  width="100" valign="middle" height="0" rowspan="8" style="color:#000000;">
							<input  name="image" type="image" src="profileimage.jsp?imgid=<%=i%>" style="width:100px; height:150px;" class="image_wrapper"  /></td>
					  </tr>
                        <td  width="460" valign="middle" height="0">&nbsp;&nbsp;<span style="color:#006666;">User Name&nbsp;&nbsp;:</span>
                            <%out.println(s1);%></td>
							</tr>
                       <tr  width="460" valign="middle" height="0"><td  width="120" valign="middle" height="0">&nbsp;&nbsp;<span style="color:#006666;">E-Mail &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</span>
                            <%out.println(s2);%></td></tr>
                        <tr  width="460" valign="middle" height="0"><td  width="120" valign="middle" height="0">&nbsp;&nbsp;<span style="color:#006666;">Mobile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</span>
                            <%out.println(s3);%></td></tr>
                        <tr  valign="middle" height="0"><td  width="120" valign="middle" height="0">&nbsp;&nbsp;<span style="color:#006666;">DOB &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</span>
                            <%out.println(s4);%></td></tr>
                        <tr  valign="middle" height="0"><td  width="120" valign="middle" height="0">&nbsp;&nbsp;<span style="color:#006666;">Address &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</span>
                            <%out.println(s5);%></td>
						</tr>
                       	<tr  width="150" valign="middle" height="0" style="color:#000000;">
							<td  width="460" valign="middle" height="0"> &nbsp;&nbsp;<span style="color:#006666;">Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</span>
							<%out.println(s8);%></td>
						</tr>
						<tr  width="150" valign="middle" height="0" style="color:#000000;">
							<td  width="460" valign="middle" height="0"> &nbsp;&nbsp;
							  <span class="style1">
							  <%out.println(strangerMsg);%>
						    </span></td>
						</tr>
                      
					</table>
				</div>
					<%
					
					
					}
				}
				catch(Exception e)
				{
					out.println(e.getMessage());
				}
				%>

	  		<div > <strong height="57" colspan="2" id="learn_more" align="center" bgcolor="#000000" style="color:#FFFFFF;">
				<a href="susers.jsp" style="width:100px; height:35px; background-color:#000000; color:#FFFFFF;">BACK </a></strong>
			</div>
	  </div>
	  
             
	  <div class="cleaner"></div>
    </div>
			
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
          </div>
        </div>
      </div>
      <div class="sidebar">
        <div class="clr"></div>
        <div class="gadget">
          <h2 class="star"><span>Welcome to <%=application.getAttribute("uname")%> </span></h2>
          <div class="clr"></div>
         <ul class="sb_menu">
		 		<li><a href="usermain.jsp">HOME</a></li>
            	<li><a href="userprofile.jsp">PROFILE</a></li>
           		<li><a href="post.jsp">ADD POST</a></li>
				<li><a href="searchpost.jsp">SEARCH POST BASED ON KEYWORD </a></li>
				<li><a href="searchpostBC.jsp">SEARCH POST BASED ON CONTENT </a></li>
             	<li><a href="searchfriend.jsp">SEARCH FRIEND </a></li>
			 	<li><a href="searchuserhistory.jsp">SEARCH HISTORY </a></li>
			 	<li><a href="viewrequest.jsp">VIEW ALL REQUEST </a></li>
			 	<li><a href="findstranger.jsp">FIND STRANGER  </a></li>
           		<li><a href="index.html">LOGOUT</a></li>
       	  </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
  <div class="footer">
    <div class="footer_resize">
      <p class="lf">&nbsp;</p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center></div>
</body>
</html>
