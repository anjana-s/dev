<%@page import="java.sql.*" %>
<%@page import="action.Db" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Filtering out Infrequent Behavior from  Business Process Event Logs</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />
<link href='//fonts.googleapis.com/css?family=Cabin+Condensed' rel='stylesheet' type='text/css'>
</head>
<body>
<div class="wrap">
		<div class="header">
			<div class="logo">
				<a href="index.html"><img src="images/logo.png" alt=""> </a>
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
						<a href="Adminpage.jsp">Back</a>
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
		
				<div class="register">
					   <div class="col_1_of_list span_1_of_list login-left">
			  	
			           </div>
					   <div >
					  	<h3 style="color:#900C3F;font-family: cursive;">TRANSACTION DETAILS</h3>
			 
						
						
						<table id="customers">
						  <tr>
						    <th>Tr.id</th>
						    <th>items</th>
						  
						    <th>frequent visit </th>
						  </tr>
						  <%
						  int itemidd;
						 
						  String itname,url,cat,vno;int j=1;
						  String sql="select itemadd.Productname,itemadd.category,uservisit.visitnumber from itemadd inner join uservisit on itemadd.id=uservisit.itemid ";
						  Connection con=Db.getConnection();
						  Statement st=con.createStatement();
						  ResultSet rs=st.executeQuery(sql);
						  while(rs.next())
						  {   
							 
							  itname=rs.getString(1);
							  
							  cat=rs.getString(2);
						   vno=rs.getString(3);
						  %>
						  
						  
						  <tr>
						    <td><%=j %></td>
						    <td><%=cat %></td>
						 
						    <td><%=vno %></td>
						  </tr>
						  <%
						  j++;
						  }
						  %>
						</table>
						
						
					   </div>	
					   <div class="clearfix"> </div>
				
			   </div>
		  <div class="clear"></div>
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