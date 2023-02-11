<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="com.oreilly.servlet.*,java.lang.*,java.text.SimpleDateFormat,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec"%>
<%@ page import="org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.util.Random,java.io.PrintStream, java.io.FileOutputStream, java.io.FileInputStream, java.security.DigestInputStream, java.math.BigInteger, java.security.MessageDigest, java.io.BufferedInputStream" %>



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
			
          <h2><span>User Infromation </span></h2>
          <div class="clr"><p>&nbsp;</p>
            <p>&nbsp;</p>
            <table width="600" border="3"  cellpadding="0" cellspacing="0"  style="border-collapse: collapse; display:inline; margin:10px 10px 10px 10px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:14px;">
					
					<%
						String uname = (String)application.getAttribute("uname");
						//int uid = Integer.parseInt(mid);
						String s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13;
						int i=0;
						try 
						{
						   	String query="select * from user where username='"+uname+"'"; 
						   	Statement st=connection.createStatement();
						   	ResultSet rs=st.executeQuery(query);
					   		if ( rs.next() )
					   		{
								i=rs.getInt(1);
								s1=rs.getString(2);
								s2=rs.getString(4);
								s3=rs.getString(5);
								s4=rs.getString(6);
								s5=rs.getString(7);
								s6=rs.getString(8);
								//s7=rs.getString(9);
								//s8=rs.getString(8);
								if(s6.equals("waiting")){
							
								//out.println("Unauthorized User");
								String keyWord = "5765586965748666502846";

									keyWord = keyWord.substring(0, 16);
									byte[] keyValue = keyWord.getBytes();
									Key key = new SecretKeySpec(keyValue, "AES");
									Cipher c2 = Cipher.getInstance("AES");
									c2.init(Cipher.ENCRYPT_MODE, key);
									String ec = new String(Base64.encode(keyWord.getBytes()));
									
									s1 = new String(Base64.encode(s1.getBytes()));
									s2 = new String(Base64.encode(s2.getBytes()));
									s3 = new String(Base64.encode(s3.getBytes()));
									s4 = new String(Base64.encode(s4.getBytes()));
									s5 = new String(Base64.encode(s5.getBytes()));
									
								
							}
								
								
								
								
					%><tr><td rowspan="8" >
						<div style="margin:10px 13px 10px 13px;" >
                		<a class="#" id="img1" href="#" >
							<input  name="image" type="image" src="profileimage.jsp?imgid=<%=i%>" style="width:200px; height:230px;"  />
	               			
				   		</a>
						
                	</div>
					</td>
					<tr/>
					<tr>
 						<td  width="150" valign="middle" height="40" style="color: #2c83b0;"><div align="left" style="margin-left:20px;"><b >Username</b></div></td>
						<td  width="300" valign="middle" height="40" style="color:#000000;"><div align="left" style="margin-left:20px;"><%out.println(s1);%></div></td>
					</tr>
					<tr>
 						<td  width="120" valign="middle" height="40" style="color: #2c83b0;"><div align="left" style="margin-left:20px;"><b>E-Mail</b></div></td>
						<td  width="72" valign="middle" height="40" style="color:#000000;"><div align="left" style="margin-left:20px;"><%out.println(s2);%></div></td>
					</tr>
					<tr>
  						<td  width="100" valign="middle" height="40" style="color: #2c83b0;"><div align="left" style="margin-left:20px;"><strong >Mobile</strong></div></td>
						<td  width="82" valign="middle" height="40"><div align="left" style="margin-left:20px;"><%out.println(s3);%></div></td>
					</tr>
					<tr>
  						<td  width="100" align="left" valign="middle" height="40" style="color: #2c83b0;"><div align="left" style="margin-left:20px;"><strong>Date Of Birth</strong></div></td>
						<td  width="82" align="left" valign="middle" height="40"><div align="left" style="margin-left:20px;"><%out.println(s4);%></div></td>
					</tr>
					<tr>
  						<td  width="100" align="left" valign="middle" height="40" style="color: #2c83b0;"><div align="left " style="margin-left:20px;"><strong>Address</strong></div></td>
						<td  width="82" align="left" valign="middle" height="40"><div align="left" style="margin-left:20px;"><%out.println(s5);%></div></td>
					</tr>
					<tr>
 						<td   width="100" align="left" valign="middle" height="40" style="color: #2c83b0;"><div align="left" style="margin-left:20px;"><strong >Status</strong></div></td>
						<td  width="100" align="left" valign="middle" height="40" style="color: #2c83b0;"><div align="left"><div align="left" style="margin-left:20px;"><%out.println(s6);%></div></td>
					</tr>
				
					<%
						}
						connection.close();
					}
					catch(Exception e)
					{
						out.println(e.getMessage());
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
          </div>
        </div>
      </div>
      <div class="sidebar">
        <div class="clr"></div>
        <div class="gadget">
          <h2 class="star"><span>Welcome to <%= application.getAttribute("uname")%></span></h2>
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
