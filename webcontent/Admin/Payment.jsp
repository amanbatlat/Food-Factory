<%@page import="Controller.CreditControl"%>
<%@page import="Model.Credit"%>
<%@page import="Controller.PaymentControl"%>
<%@page import="Model.Payment"%>
<%@page import="Controller.RestaurantControl"%>
<%@page import="Controller.CustomerControl"%>
<%@page import="Model.Customer"%>
<%@page import="java.util.Iterator"%>
<%@page import="Model.Restaurant"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Payment objj=null;
String idid=request.getParameter("id");
if(idid!=null)
objj=new PaymentControl().select(Integer.parseInt(idid));

Credit obj1=null;
String idid1=request.getParameter("id");
if(idid1!=null)
obj1=new CreditControl().select(Integer.parseInt(idid1)); 
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
	<head>
		<meta charset="utf-8">
		<title>Index
	</title>
		<link rel="stylesheet" href="style.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<!-- MATERIAL DESIGN ICONIC FONT -->
		<link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

		<!-- STYLE CSS -->
		<link rel="stylesheet" href="css/style.css">
		<style type="text/css">
		table {
			 border-collapse: collapse;  
			 border: 1px solid black;
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 2px;
}

tr:nth-child(even) {background-color: #f2f2f2;}

		</style>
	</head>
	<body>

		<!--wrapper start-->
		<div class="wrapper">
			<!--header menu start-->
			<div class="header">
				<div class="header-menu">
					<div class="title">Food Factory<span> Admin</span></div>
					<div class="sidebar-btn">

						<i class="fas fa-bars">                </i>
					</div>
					<ul>
						<li><a href="index.jsp"><i class="fas fa-power-off"></i></a></li>
					</ul>
				</div>
			</div>
			<!--header menu end-->
			<!--sidebar start-->
			<div class="sidebar">
				<div class="sidebar-menu">
					<center class="profile">
						<img src="1.jpg" alt="">
						<p>Admin</p>
					</center>
					<li class="item">
						<a href="Dashboard.jsp" class="menu-btn">
							<i class="fas fa-desktop"></i><span>Dashboard</span>
						</a>
					</li>
					
					<li class="item">
						<a href="Foodsman.jsp" class="menu-btn">
							<i class="fas fa-motorcycle"></i><span>Manage Foods</i></span>
						</a>
						
					</li>
					<li class="item">
						<a href="Restaurant.jsp" class="menu-btn">
							<i class="fas fa-hamburger"></i><span>Add Resataurants</span>
						</a>
					</li>
					
					<li class="item">
						<a href="Category.jsp" class="menu-btn">
							<i class="fas fa-info-circle"></i><span>Add Category</span>
						</a>
					</li> 
				<!-- 	<li class="item">
						<a href="#" class="menu-btn">
							<i class="fas fa-info-circle"></i><span>Add Category</span>
						</a>
					</li> -->
					<li class="item" id="settings">
						<a href="Orders.jsp" class="menu-btn">
							<i class="fas fa-cog"></i><span>Orders </i></span>
						</a>
					
					</li>
					<li class="item">
						<a href="Payment.jsp" class="menu-btn">
							<i class="fas fa-info-circle"></i><span>Payment</span>
						</a>
					</li>
					<li class="item">
						<a href="../Logout" class="menu-btn">
							<i class="fas fa-info-circle"></i><span>Logout</span>
						</a>
					</li>
				
				</div>
			</div>
						<div class="main-container">
			<!--main container end-->
			
			  
			  	<h1 align="center"> Payment </h1>
      <div class="table">
    	<table class="table">
  <thead>
    <tr>
    	<th>Customer ID</th>
       <th>Customer Name</th>
			 <th>Payment Id</th>
			 <th>Payment Type</th>
			 <th>Total</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  Iterator<Payment> itr=new PaymentControl().selectall();
  while(itr.hasNext()){
	Payment c1=itr.next();  %>
  
    <tr>
      <th scope="row"><%=c1.getCustid().getCustomer_id()%></th>
      <td><%=c1.getCustid().getNAME() %></td>
      <td><%=c1.getPayment_id() %></td>
      <td><%=c1.getType() %></td>
          <td><%=c1.getTotal() %></td>
          
    </tr>
   <%} %>
  </tbody>
</table>
</div>
    	
    		  	<h1 align="center">CREDIT CARD</h1>
      <div class="table">
    	<table class="table">
  <thead>
    <tr>
    	<th>Credit ID</th>
       <th>Customer Name</th>
			 
			 <th>Card Number</th>
			 <th>Holder Name</th>
			 <th>Expire Month</th>
			 <th>Expire YEAR</th>
			 <th>CVV</th>
    </tr>
  </thead>
  <tbody>
  <%
  Iterator<Credit> itr1=new CreditControl().selectall();
  while(itr1.hasNext()){
	Credit obj=itr1.next(); 
 %> <tr>
      <th scope="row"><%=obj.getCreditId()%></th>
      <td><%=obj.getCustid().getNAME() %></td>
      <td><%=obj.getCARDNUMBER() %></td>
      <td><%=obj.getHOLDERNAME() %></td>
        <td><%=obj.getMONTH() %></td>
       <td><%=obj.getYEAR() %></td>
         <td><%=obj.getCVV() %></td>
            
   </tr>
  <%} %>
    </tbody>
</table>
<div>
    	
    	
  
		</div>
		<!--wrapper end-->

		<script type="text/javascript">
		$(document).ready(function(){
			$(".sidebar-btn").click(function(){
				$(".wrapper").toggleClass("collapse");
			});
		});
		</script>

	</body>
</html>
