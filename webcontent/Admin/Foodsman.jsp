<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="java.util.Iterator"%>
<%@page import="Controller.FoodControl"%>
<%@page import="Model.Food"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Food obj=null;
String idid1=request.getParameter("FID");
if(idid1!=null)
obj=new FoodControl().select((Integer.parseInt(idid1)));


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
  padding: 8px;
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
						<li><a href="#"><i class="fas fa-search"></i></a></li>
						<li><a href="#"><i class="fas fa-bell"></i></a></li>
						<li><a href="#"><i class="fas fa-power-off"></i></a></li>
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
					</center>	<li class="item">
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
			  <section>
			  	<h1 align="center"> Food Items </h1>
      <div class="table">
    	<table class="table">
  <thead>
    <tr>
    	<th>Food ID</th>
    	<th>Restaurant ID</th>
    	<th>Restaurant Name</th>
       <th>Food Name</th>
			 <th>Category</th>
			 <th>Price</th>
			 <th>Drop</th>
    </tr>
  </thead>
  <tbody>
  <%
  Iterator<Food> itr=new FoodControl().selectall(); %>
   <%while(itr.hasNext()){
	Food f1=itr.next();
	   %>
   
    <tr>
      <th scope="row"><%=f1.getId() %></th>
      <td><%=f1.getRestaurant_id().getId() %></td>
      <td><%=f1.getRestaurant_id().getNAME() %></td>
      <td><%=f1.getFOODNAME() %></td>
      <td><%=f1.getCategory_id().getCATEGORY() %></td>
      <td><%=f1.getPRICE() %></td>
        <td><button><a href="../AdminDao?id=<%=f1.getId()%>">Drop</a></button></td>
    </tr>
   <%} %>
  </tbody>
</table>
</div>
    	</section>	
			</div>
			<!--main container end-->
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
