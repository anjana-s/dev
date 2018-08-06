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
						<a href="userpage.jsp">Back</a>
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
			  	<h3>WELCOME</h3>

</div>

		
  <div class="clear"></div>
</div>
<div class="cnt-main btm">
	<div class="section group">
	
	<%
	String s=session.getAttribute("myid").toString();
	session.setAttribute("myid", s);
	String im=request.getParameter("i");
	int i=Integer.parseInt(im);
	int id;
	String price,image,cate,prod;
	String sql="select id,image,category,price,productname from itemadd where id="+i+"";
	String sql3="select uservisit.visitnumber from uservisit where  uservisit.itemid='"+i+"'";
	
	Connection c=Db.getConnection();
	Statement st=c.createStatement();
	ResultSet rs=st.executeQuery(sql3);
	
	Statement st3=c.createStatement();
	ResultSet rs3=st3.executeQuery(sql);
	if(rs.next())
	{   String sql4="update uservisit set visitnumber=visitnumber+1 where itemid='"+i+"'";
		Statement st4=c.createStatement();
	    st4.executeUpdate(sql4);
	}
	else
	{		String sql2="insert into uservisit (userid, itemid, visitnumber, visitdate)values('"+s+"','"+i+"',visitnumber+1,sysdate())";
	        Statement st2=c.createStatement();
		    st2.executeUpdate(sql2);
	}
	while(rs3.next())
	   {
		   id=rs3.getInt(1);
		   image=rs3.getString(2);
		   cate=rs3.getString(3);
		   price=rs3.getString(4);
		   prod=rs3.getString(5);
	
	
	%>
	
				<div class="grid_1_of_3 images_1_of_3">
					 <div class="cart-b">
					   <h3><%= prod%></h3>
					      <h3><%= cate%></h3>
					    
						<span class="price left"><sup>Rs.<%= price%></sup><sub></sub></span>
					    <div class="btn top-right right" ><a href="Payment.jsp?i=<%=id%>">Buy</a></div>
					    <div class="clear"></div>
					    <img src="<%= image%>" alt="" width="120px" height=100px/>	
				    </div>
					 
				</div>
				
			
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
		
<%
	  
   }
%>	
	</div>
</div>
</div>
</div>
</body>
</html>