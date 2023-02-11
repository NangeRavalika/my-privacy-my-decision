

<%@ include file="connect.jsp"%>

<%
try
{


ResultSet rs=connection.createStatement().executeQuery("select * from images");

%><html>
<head>
<title>image Results</title>
<script type="text/javascript" src="sources/jscharts.js"></script>
<style type="text/css">
<!--
.style1 {color: #6699FF}
-->
</style>
</head>
<body>
<div id="graph">Loading graph...</div>

<div align="center">
    <script type="text/javascript">
var myData=new Array();
var colors=[];
var m=50;
<%
	int i=0;
	
	String s1=null;
	
	while(rs.next())
	{
	 s1=rs.getString(2);
	int s3=Integer.parseInt(rs.getString(9));
	
	
	
	%>
	
	myData["<%=i%>"]=["<%= s1%>",<%=s3%>];
      m=m+90;  
	<%
	i++;}
	%>
	
	var myChart = new JSChart('graph', 'bar');
	myChart.setDataArray(myData);
	myChart.setBarColor('#6699FF');
	myChart.setBarOpacity(0.8);
	myChart.setSize(m, 400);
	myChart.setBarBorderColor('#D9EDF7');
	myChart.setBarValues(true);
	myChart.setTitle('Images Ranks');
	myChart.setTitleColor('#8C8383');
	myChart.setAxisColor('#777E89');
	myChart.setAxisValuesColor('#777E81');
	myChart.draw();
	
  </script>
   <span class="style1"></span>   </div>
</body>
</html>
<%
}
catch(Exception e)
{
e.printStackTrace();
}
%>

