<%@ page import="java.sql.*" %>
<%@ page import="action.Db" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Filtering out Infrequent Behavior from  Business Process Event Logs</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='//fonts.googleapis.com/css?family=Cabin+Condensed' rel='stylesheet' type='text/css'>
</head>
<body>
<div class="wrap">
<div class="header">
	<div class="logo">
		<img src="images/logo.png" alt="">
	</div>
	<div class="header-right">
		  <div class="contact-info">
			
		  </div>
		  <div class="menu">
		 	  <div class="content">
					<div class="">
						<a href=""><p><br></p></a>
					</div>
					<div class="cnt-btn">
						<a href="ViewAddedItem.jsp">Back</a>
					</div>
             </div>
		 </div>
	 </div>
	<div class="clear"></div>
</div>
<div class="hdr-btm">
<div class="hdr-btm-bg"></div>
<div class="hdr-btm-left">
	
	<div class="clear"></div>
</div>
</div>
<div class="main">



<div>
			   <div class="col_1_of_list span_1_of_list login-left">
			  	 <h3></h3>
				 
			   </div>
			   <div class="col_1_of_list span_1_of_list login-right">
			  	<h3 style="color:purple;font-family: cursive;">ADDED ITEMS</h3>

</div>

		
  <div class="clear"></div>
</div>
<div class="cnt-main btm">
	<div class="section group">
	
	<%
	String im=request.getParameter("i");
	int ii=Integer.parseInt(im);
	int id;
	String price,image,cate,prod;
	String sql="select id,image,category,price,productname from itemadd where id="+ii+"";
	Connection c=Db.getConnection();
	PreparedStatement ps=c.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		id=rs.getInt(1);
		image=rs.getString(2);
		cate=rs.getString(3);
		price=rs.getString(4);
		prod=rs.getString(5);
	
	
	
	%>
	
				<div class="grid_1_of_3 images_1_of_3">
					 <a href="Viewaddeddetail.jsp"><img src="<%= image%>" alt=""/></a>
					  
					 <div class="cart-b">
					 
						<span class="price left"><sup></sup><sub></sub></span>
					    <div class="btn top-right right" ></div>
					    <div class="clear"></div>
				    </div>
				</div>
				<div class="grid_1_of_3 images_1_of_3">
					 
					  
					 <div class="cart-b">
					<h1 style="color:red;font-size: 25px;font-family: cursive;"> DETAILS</h1>
					 <h3><%= prod%></h3>
					      <h3><%= cate%></h3>
					      <h3>Rs.<%= price%></h3>
						<span class="price left"><sup></sup><sub></sub></span>
					    <div class="btn top-right right" ></div>
					    <div class="clear"></div>
				    </div>
				</div>
			
			<%
			
	}
			%>	
	</div>
</div>	
				
</div>
</div>
<div class="footer-bg">
<div class="wrap">
<div class="footer">
	<div class="f_nav">
		
	</div>
	<div class="footer1">
		
	</div>
</div>
</div>
</div>
</body>
</html>