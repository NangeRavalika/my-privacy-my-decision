<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
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
			
          <h2><span>Search Post Based On Content </span></h2>
          <div class="clr">
            
            
			<div id="#" width="650" style="margin-right:5px">
    	
   	<div id="#" width="560" style="margin-left:2px; margin-right:2px;">  
		<form action="searchpostBC.jsp" method="post">
			<table border="3" width="560" style="margin-left:2px; margin-right:2px;">
				 
				<tr>
					<td align="right">Enter Content's Keyword  </td>
					<td width="100"><input type="text" name="keyword" /></td>
					<td height="35" colspan="2" id="learn_more" align="left"  style="color:#FFFFFF;"><input type="submit" value="Submit" style="width:100px; height:35px; background-color:#000000; color:#FFFFFF;"/></td>
               	</tr>
			</table>
		</form>
		<p>&nbsp;</p>
		<%
		try{   
			String postname=null; 
			postname= request.getParameter("keyword").toLowerCase();   
		
		if(postname!=null){
		
		
		%>
    	<table border="3" width="600" style="margin-left:2px; margin-right:2px;"> 
		<%
		   
			 
			String s1=null,s2=null,s3=null,s4=null,s5=null;
			String uname = (String)application.getAttribute("uname");			
			SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

			Date now = new Date();
						
			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
			if(!postname.equalsIgnoreCase(""))
			{
				Statement st3 = connection.createStatement();
				String query3 ="insert into search(username,keyword,dt) values('"+uname+"','"+postname+"','"+dt+"')";
				st3.executeUpdate (query3); 	   
			}
			
			Statement stmt=connection.createStatement();
			String strQuery = "select * from images";
			ResultSet rs = stmt.executeQuery(strQuery);
			while(rs.next()){
						
			int i=rs.getInt(1);
			s1=rs.getString(2);
			s2=rs.getString(3);
			s3=rs.getString(4).toLowerCase();
			s4=rs.getString(5);
			s5=rs.getString(6);
			int c = rs.getInt(9);
			String image=rs.getString(10);
			String  imguser = rs.getString(11);
			
			
			
			if(s3.indexOf(postname)>=0){
			
			c=c+1;
			Statement st9 = connection.createStatement();
			String query9 ="update images set count="+c+" where id="+i+"";
			st9.executeUpdate(query9);
			%>	
				<tr>
					<td>
						<div style="margin:10px 13px 10px 13px;" >
                			<a class="lightbox" id="img1" href="#" title="">
								<input  name="image" type="image" src="images.jsp?imgid=<%=i%>" style="width:270px; height:120px;" class="image_wrapper"  />
	               			</a>
							
						</div>
						<p style="font-family:'Times New Roman', Times, serif;"><span style="color:#006666">Image Added By :</span> <%=imguser%> </p>
                	</td>
					<td  width="600">
                		<p style="font-family:'Times New Roman', Times, serif;"><span style="color:#006666"> Tag :</span><%=s1%></p>
						<p style="font-family:'Times New Roman', Times, serif;"><span style="color:#006666"> Color :</span><%=s2%></p>
						<p style="font-family:'Times New Roman', Times, serif;"><span style="color:#006666">Description:</span> <%=s3%> </p>
					</td>
				</tr><tr><td colspan="2">
				<%
					Statement stmt2=connection.createStatement();
						String strQuery2 = "select * from comments where imageid='"+i+"' order by dt DESC";
						ResultSet rs2 = stmt2.executeQuery(strQuery2);
						//int row=0;
						while(rs2.next()){
							String usr = rs2.getString(2);
							String cdt = rs2.getString(4);
							String cmt = rs2.getString(5);
						
				%>
				<p style="font-family:'Times New Roman', Times, serif;"><span style="color:#006666"> <%= usr%> : </span><%=cmt%><span style="float:right"><%=cdt%></span></p>
				<%
				}
				
				%>
				<form action="updatecmt.jsp?rfrom=sbContent&keyword=<%=postname%>"" method="post">
			
				 <table>
				<tr>
					<td align="right">Enter Your Comment </td>
					<td align="right"><input type="hidden" name="imageid" value="<%=i%>"></td>
					<td width="100"><textarea id="address" name="cmt" rows="3" cols="50"></textarea></td>
					<td height="35" colspan="2" id="learn_more" align="left"  style="color:#FFFFFF;"><input type="submit" value="OK" style="width:100px; height:35px; background-color:#000000; color:#FFFFFF;"/></td>
               	</tr>
			</table>
		</form>
				</td>
				</tr>
               	
               	<%
					}
					}
					}
    				
  					}catch(Exception e)
					{
						e.getMessage();
					}
					%>
				
			</table>
				
	  		
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
