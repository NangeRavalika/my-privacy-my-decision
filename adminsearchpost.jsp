<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>MPMC : Admin Main Page</title>
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
          <li class="active"><a href="#"><span>Admin</span></a></li>
          <li ><a href="#"><span>User</span></a></li>
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
			
          <h2>Enter Keyword to View Post Details </h2>
          <div class="clr">
		  
		  <form action="adminsearchpost.jsp" method="post">
			<table border="3" width="560" style="margin-left:2px; margin-right:2px;">
				 
				<tr>
					<td align="right">Enter your Keyword</td>
					<td width="100"><input type="text" name="keyword" /></td>
					<td height="35" colspan="2" id="learn_more" align="left"  style="color:#FFFFFF;"><input type="submit" value="Submit" style="width:100px; height:35px; background-color:#000000; color:#FFFFFF;"/></td>
               	</tr>
			</table>
		</form>
		<p>&nbsp;</p>
		<%
		try{   
			String input=null; 
			input= request.getParameter("keyword");   
			String uname = "admin";
		if(input!=null){
		
		
		%>
		  
		  <table border="3" width="600" style="margin-left:2px; margin-right:2px;"> 
				<%
					   
						String s1=null,s2=null,s3=null,s4=null;
						
						
						SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
						SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
			
						Date now = new Date();
									
						String strDate = sdfDate.format(now);
						String strTime = sdfTime.format(now);
						String dt = strDate + "   " + strTime;
			
						if(!input.equalsIgnoreCase(""))
						{
							Statement st3 = connection.createStatement();
							String query3 ="insert into search(username,keyword,dt) values('"+uname+"','"+input+"','"+dt+"')";
							st3.executeUpdate (query3); 	   
						}
					
						Statement stmt=connection.createStatement();
						String strQuery = "select * from images where title LIKE '%"+input+"%' order by count DESC";
						ResultSet rs = stmt.executeQuery(strQuery);
						//int row=0;
						while(rs.next()){
						//row++;
						int i=rs.getInt(1);
						s1=rs.getString(2);
						s2=rs.getString(3);
						s3=rs.getString(4);
						s4=rs.getString(5);
						String privacy = rs.getString(6);
						int rank = rs.getInt(9);
						String image=rs.getString(10);
						String imguser=rs.getString(11);
						
				%>
				<tr>
				<td>
					<div class="gallery_box" >
                		<a class="lightbox" id="img1" href="#" title="<%= "Tag :"+s1+"\n Color :"+s2+"\n Annotation :"+s3 %>">
							<input  name="image" type="image" src="images.jsp?imgid=<%=i%>" style="width:270px; height:120px;" class="image_wrapper"  />
	               			
				   		</a>
						<p>
							<%
							if(rank>0 && rank<= 3){%>
								Rank:[<%= rank%>]&nbsp;Rating :<img src="images/1.png" style="width:120px; height:20px;" />
							<%
							}
							else if(rank>3 && rank<= 6){%>
								Rank:[<%= rank%>]&nbsp;Rating :<img src="images/2.png" style="width:120px; height:20px;" />
							<%
							}
							else if(rank>6 && rank<= 12){%>
								Rank:[<%= rank%>]&nbsp;Rating :<img src="images/3.png" style="width:120px; height:20px;" />
							<%
							}
							else if(rank>12 && rank<= 24){%>
								Rank:[<%= rank%>]&nbsp;Rating :<img src="images/4.png" style="width:120px; height:20px;" />
							<%
							}
							else if(rank>24){%>
								Rank:[<%= rank %>]&nbsp;Rating :<img src="images/5.png" style="width:120px; height:20px;" />
						
							<%
							}else{
							%>
								Rank:[<%= rank %>]&nbsp;Rating :<img src="images/0.png" style="width:120px; height:20px;" />
							<%
							}
							%>
						</p>
						<p>&nbsp;Post Added By  :<span style="color:#006633;"><%=imguser%></span></p>
						<p>&nbsp; Privacy  :<span style="color:#006633;"><%=privacy%></span></p>
                		<!--<p><b><span class="orange"> ,</span><span class="green"> ,</span></b>  </p>-->
                </div>
				</td>
				
				<td  width="600">
           		  <p style="font-family:'Times New Roman', Times, serif;"><span style="color:#006666"> Title :</span><%=s1%></p>
						<p style="font-family:'Times New Roman', Times, serif;"><span style="color:#006666"> Location :</span><%=s2%></p>
						<p style="font-family:'Times New Roman', Times, serif;"> <span style="color:#006666">Description: </span><%=s3%> </p>
						
                	
				</td>
				</tr>
               	<%
						}	
						
    				}
    				
  					}catch(Exception e)
					{
						e.getMessage();
					}
					%>
					
							
			
			
       
	  </table>
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
		  <p>&nbsp;</p>
		  <p>&nbsp;</p>
          </div>
        </div>
      </div>
      <div class="sidebar">
        <div class="clr"></div>
        <div class="gadget">
          <h2 class="star">Admin Menu</h2>
          <div class="clr"></div>
         <ul class="sb_menu">
            <li><a href="listusers.jsp">List Of Users</a></li>
            <li><a href="listofposts.jsp">List Of Images with Comments </a></li>
            <li><a href="viewshistory.jsp">View Search History</a></li>
			<li><a href="listofpostswithrank.jsp">View Image Ranks</a></li>
            <li><a href="adminsearchpost.jsp">Search Post</a></li>
            <li><a href="index.html">Logout</a></li>
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
