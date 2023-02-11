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
<script type="text/javascript" src="js/coin-slider.min.js"></script></head>
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
          <div class="clr"><p style="color:#CC0033;"><%
		  String msg=null;
		  msg = (String)request.getAttribute("message");
		  
		  if(msg!=null){
		  	%>
			
			<%= msg %>
			<%
		  }
		  
		  %></p>
            
			<div><form action="insertImage.jsp" method="post" enctype="multipart/form-data">
            <table width="600" border="3"  cellpadding="0" cellspacing="0"  style="border-collapse: collapse; display:inline; margin:10px 10px 10px 10px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:14px;">
				
					<tr>
 						<td  width="150" valign="middle" height="45" style="color: #2c83b0;"><div align="left" style="margin-left:20px; height:25px; width:180px;"><b>Post Title </b></div></td>
						<td  width="300" valign="middle" height="45" style="color:#000000;"><div align="left" style="margin-left:20px; height:25px; width:180px;"><input type="text" name="title" style="width:270px;"></div></td>
					</tr>
					<tr>
 						<td  width="120" valign="middle" height="45" style="color: #2c83b0;"><div align="left" style="margin-left:20px; height:25px; width:180px;"><b>Post User Type  </b></div></td>
						<td  width="72" valign="middle" height="45" style="color:#000000;"><div align="left" style="margin-left:20px; height:25px; width:180px;"><input type="text" name="postto" style="width:270px;"></div></td>
					</tr>
					<tr>
  						<td  width="100" valign="middle" height="80" style="color: #2c83b0;"><div align="left" style="margin-left:20px; height:25px; width:180px;"><strong >Post Description </strong></div></td>
						<td  width="82" valign="top" height="80"><div align="left" style="margin-left:20px; height:25px; width:180px;"><textarea id="description" name="desc" rows="5" cols="36"></textarea></div></td>
					</tr>
					<tr>
  						<td  width="100" align="left" valign="middle" height="45" style="color: #2c83b0;"> <div align="left" style="margin-left:20px; width:180px; height:25px;"><strong>Location</strong></div></td>
						<td  width="82" align="left" valign="middle" height="45"><div align="left" style="margin-left:20px; height:25px; width:180px;"><input type="text" name="location" style="width:270px;"></div></td>
					</tr>
					<tr>
  						<td  width="100" align="left" valign="middle" height="45" style="color: #2c83b0;"><div align="left " style="margin-left:20px; height:25px; width:180px;"><strong>My Privacy On </strong></div></td>
						<td  width="82" align="left" valign="baseline" height="60"><div align="left" style="margin-left:20px; height:25px; width:320px;">
							
								<input type="radio" name="privacy" value="PUBLIC">PUBLIC<br />
								<input type="radio" name="privacy" value="PRIVATE">PRIVATE <br /> 
								<input type="radio" name="privacy" value="ONLY ME">ONLY ME  <br />
								
						</div>
						</td>
					</tr>
					<tr>
 						<td   width="100" align="left" valign="middle" height="45" style="color: #2c83b0;"><div align="left" style="margin-left:20px; height:25px; width:180px;"><strong >Select Image </strong></div></td>
						<td  width="100" align="left" valign="middle" height="45" style="color: #2c83b0;"><div align="left"><div align="left" style="margin-left:20px; height:25px; width:180px;"><input type="file" name="pic"></div></td>
					</tr>
					<div > <tr><td height="45" colspan="2" id="learn_more" align="center"  style="color:#FFFFFF;"><input type="submit" value="Submit" style="width:100px; height:35px; background-color:#000000; color:#FFFFFF;"/><input type="reset" name="Reset" style="width:100px; height:35px; background-color:#000000; color:#FFFFFF;"/></td></tr></div>
					
					
				</table>
				</form>
			</div>
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
