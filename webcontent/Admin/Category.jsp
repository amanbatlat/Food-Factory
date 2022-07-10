<%@page import="Model.Category"%>
<%@page import="Controller.CategoryControl"%>
<%
Category obj=null;
String idid=request.getParameter("CAT_ID");
if(idid!=null)
obj =new CategoryControl().select(Integer.parseInt(idid));
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
					</li></div>
			</div>			<!--sidebar end-->
			<!--main container start-->
			<div class="main-container">
				
				<form action="../CategoryDao" method="post">
				
				
					<h3>Add Category</h3>
					
					
					<div class="form-group">
						<input type="text" name="CAT_ID" class="form-control" value="<%if(obj!=null){out.print(obj.getCAT_ID());}else{out.println(0);}%>" hidden>
						<input type="text" placeholder="Category Name" class="form-control" name="CATEGORY" required>
					
						
					</div>
	
					<button>Add
						<i class="zmdi zmdi-arrow-right"></i>
					</button>
					
				</form>
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
