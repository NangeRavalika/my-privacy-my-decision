<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
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
			
          <h2><span>User Main Page </span></h2>
          
		
				
				
				<%
					try{    
						Connection con1 = connection;
						String s1=null,s2=null,s3=null,s4=null;
						String uname=(String)application.getAttribute("uname");
						Statement stmt=connection.createStatement();
						String strQuery = "select * from images order by dt ASC";
						ResultSet rs = stmt.executeQuery(strQuery);
						
						while(rs.next()){
						
							int i=rs.getInt(1);
							s1=rs.getString(2);
							s2=rs.getString(3);
							s3=rs.getString(4);
							s4=rs.getString(5);
							String privacy = rs.getString(6);
							int rank = rs.getInt(9);
							String image=rs.getString(10);
							String imguser=rs.getString(11);
							String date = rs.getString(12);
							%>
					
						<%
						if(privacy.equals("PUBLIC")){
						
								%>
								<table border="3" width="600" style="margin-left:2px; margin-right:2px;">
								<tr>
									<td>
										<div class="gallery_box" >
											<a class="lightbox" id="img1" href="#" title="">
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
									<tr><td colspan="2">
									<%
										Statement stmt1=connection.createStatement();
										String strQuery1 = "select * from comments where imageid='"+i+"' order by dt DESC";
										ResultSet rs1 = stmt1.executeQuery(strQuery1);
										
										while(rs1.next()){
											String usr = rs1.getString(2);
											String cdt = rs1.getString(4);
											String cmt = rs1.getString(5);
						
											%>
											<p style="font-family:'Times New Roman', Times, serif;"><span style="color:#006666"> <%= usr%> : </span><%=cmt%><span style="float:right"><%=cdt%></span></p>
											<%
											}
											
											%>
										<form action="updatecmt.jsp?rfrom=umain" method="post">
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
								</table>
								<%
								}else if((imguser.equals(uname))|| privacy.equals("ONLY ME"))
						{
							if(uname.equals(imguser)){
							%>
							<table border="3" width="600" style="margin-left:2px; margin-right:2px;">
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
								<tr><td colspan="2">
								<%
									Statement stmt4=connection.createStatement();
										String strQuery4 = "select * from comments where imageid='"+i+"' order by dt DESC";
										ResultSet rs4 = stmt4.executeQuery(strQuery4);
										//int row=0;
										while(rs4.next()){
											String usr = rs4.getString(2);
											String cdt = rs4.getString(4);
											String cmt = rs4.getString(5);
										
								%>
								<p style="font-family:'Times New Roman', Times, serif;"><span style="color:#006666"> <%= usr%> : </span><%=cmt%><span style="float:right"><%=cdt%></span></p>
								<%
								}
								rs4.close();
								stmt4.close();
								%>
								<form action="updatecmt.jsp?rfrom=umain" method="post">
							
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
		  </table>
								<%
						}
						}
						else if(privacy.equals("PRIVATE"))
								{
									Statement stmt2=con1.createStatement();
									String strQuery2 = "select * from request where  status='Accepted' && ((requestfrom='"+uname+"' && requestto='"+imguser+"') || (requestfrom='"+imguser+"' && requestto='"+uname+"'))";
									ResultSet rs2 = stmt2.executeQuery(strQuery2);
									if(rs2.next())
									{
										
									%>
									<table border="3" width="600" style="margin-left:2px; margin-right:2px;">
										<tr>
										<td>
										<div class="gallery_box" >
											<a class="lightbox" id="img1" href="#" title="">
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
									<tr><td colspan="2">
									<%
										Statement stmt3=connection.createStatement();
										String strQuery3 = "select * from comments where imageid='"+i+"' order by dt DESC";
										ResultSet rs3 = stmt3.executeQuery(strQuery3);
										
										while(rs3.next()){
											String usr = rs3.getString(2);
											String cdt = rs3.getString(4);
											String cmt = rs3.getString(5);
						
											%>
											<p style="font-family:'Times New Roman', Times, serif;"><span style="color:#006666"> <%= usr%> : </span><%=cmt%><span style="float:right"><%=cdt%></span></p>
											<%
											}
											rs3.close();
											stmt3.close();
											
											%>
										<form action="updatecmt.jsp?rfrom=umain" method="post">
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
								</table>
								<%
						
							}
						}
						
						
						
    				}
    				
    				rs.close();
						stmt.close();
						connection.close();
 					
  					}catch(Exception e)
					{
						e.getMessage();
					}
					%>
		

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
</body>
</html>
