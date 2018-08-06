<%@page import="java.sql.*" %>
<%@page import="action.Db" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Filtering out Infrequent Behavior from  Business Process Event Logs</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='//fonts.googleapis.com/css?family=Cabin+Condensed' rel='stylesheet' type='text/css'>

 
<script>
window.onload = function () {

var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2",
	title:{
		text: "profit as per item"
	},
	axisY:{
		title: " item profit",
		lineColor: "#C24642",
		tickColor: "#C24642",
		labelFontColor: "#C24642",
		includeZero: false
	},
	axisX:{
		title: " item id",
		lineColor: "#C24642",
		tickColor: "#C24642",
		labelFontColor: "#C24642",
		includeZero: false
	},
	data: [{        
		type: "line", 
		color: "#5cb81f",
		dataPoints: [
		             
		             <%int i,profit;
		             String sql1="select distinct(productid) from transact ";
		             Connection con1=Db.getConnection();
		             Statement st1=con1.createStatement();
		             ResultSet rs1=st1.executeQuery(sql1);
		             while(rs1.next())
		             {i=rs1.getInt(1);
		             String sql="select sum(profit) from transact where productid='"+i+"'";
		             Connection con=Db.getConnection();
		             Statement st=con.createStatement();
		             ResultSet rs=st.executeQuery(sql);
		             if(rs.next())
		             {profit=rs.getInt(1);
		            	 %>
		            	 { y: <%=profit%> ,x:<%=i%>},
		            	 <%
		             System.out.println(rs.getString(1));
		             }
		             }
		             
		             %>
		         	
			
		]
	}]
});
chart.render();

}
</script>
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



<div>
			   <div class="col_1_of_list span_1_of_list login-left">
			  	 <h3></h3>
				 
			   </div>
			   <div class="col_1_of_list span_1_of_list login-right">
			  	<h3 style="color:#900C3F;font-family: cursive;">GRAPH</h3>

               </div>
                 
		
  <div class="clear"></div>
</div>
<div class="cnt-main btm">
	<div class="section group">
				

<div style=" padding-left:400px;height: 300px; width: 30%;">
                <div class="grid_1_of_3 images_1_of_3" style="height: 300px; width: 100%;">
				<div id="chartContainer" style="height: 300px; width: 100%;"></div>
				<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

				</div>
				<div style="padding-left:10px;">
				  <a href="Viewgraph2.jsp">click here to view profit as per transaction</a>
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
		
	</div>
</div>
</div>
</div>
</body>
</html>