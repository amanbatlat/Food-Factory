<%@page import="Controller.CategoryControl"%>
<%@page import="Model.Category"%>
<%@page import="java.util.Iterator"%>
<%@page import="Controller.RestaurantControl"%>
<%@page import="Model.Restaurant"%>
<%@page import="Controller.FoodControl"%>
<%@page import="Model.Food"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Food obj=null;
String idid1=request.getParameter("id");
if(idid1!=null)
obj=new FoodControl().select((Integer.parseInt(idid1)));
%>
<%
if(session.getAttribute("RESTAURANT")==null)
{
	response.sendRedirect("index.jsp");
}

%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Restaurant Side</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="admin.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script>
    function validate()
    {
    	var name=document.getElementById("name");
    	var price=document.getElementById("price");
    	if(name.value=="")
    	{
    		alert("Plz Enter Food Name");
    		return false;
    	}
    	else if (price.value=="")
    	{
    		alert("Plz enter Price");
    		return false;
    	}
    	else
    	{
    		true;
    	}
    }
    </script>
    <STYLE>
   button {
  border: none;
  outline: 0;
  padding: 12px;
  color: white;
  background-color: black;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}
    </STYLE>
  </head>
  <body>
    <nav>
      <input type="checkbox" id="check">
      <label for="check" class="checkbtn">
        <i class="fas fa-bars"></i>
      </label>
   <ul>
      <label class="logo"><a href="../Logout">${RESTAURANT}</a></label>
       
		<li><a href="Order.jsp">Order Status</a></li>
        <li><a href="HotelAdmin.jsp">Manage Foods</a></li>
        <li><a href="Fooditem.jsp" class="active">Add Food</a></li>
  
         <li><a href="Feedback.jsp">FeedBack</a></li>
		
    </ul>
    </nav>
    <section>
    		<div class="main-container">
				
				<form  action="../FoodDao" method="post" enctype="multipart/form-data" onsubmit="return validat();">
					<h1>Add FOOD ITEM</h1>
	
									
					
					<div class="form-group">
					
					<input type="text" placeholder="Food Name" class="form-control"  name="id" value="<%if(obj!=null){out.print(obj.getId());}else{out.print(0);}%>">
						<input type="text" placeholder="Food Name" class="form-control" id="name" name="FOODNAME" value="<%if(obj!=null){out.print(obj.getFOODNAME());}else{out.print("");}%>" >						
					</div>
					<div class="form-group">
						<input type="number" placeholder="Food PRICE" class="form-control" id="price" name="PRICE">						
					</div>
					
					<div class="form-group">
						
						
						<select input type="text" placeholder="Restaurant" class="form-control"  name="NAME" value="<%if(obj!=null){out.print(obj.getRestaurant_id().getNAME());}else{out.print("");}%>" >						
					<%
						Iterator<Restaurant> itr=new RestaurantControl().selectall();
						while(itr.hasNext()){
						Restaurant f1=itr.next();
						String s1,s2;
						s1=f1.getNAME();
						s2=session.getAttribute("RESTAURANT").toString();
					%>
							<option>
							<%if(s2.equals(s1)){out.print(f1.getNAME());}%>
							</option>
						
						<%}%>
						</select>
						
						
					</div>
					<div class="form-group">
						<input type="file" placeholder="Food Name" class="form-control" name="IMAGE"> 						
					</div>
							
					
					<div class="form-group">
						<select input type="text" placeholder="Category Name" class="form-control"  name="CATEGORY" value="<%if(obj!=null){out.print(obj.getCategory_id().getCATEGORY());}else{out.print("");}%>" >
						<% Iterator<Category> itr1=new CategoryControl().selectall();
						while(itr1.hasNext()){
							Category c=itr1.next();
						%><option><%=c.getCATEGORY() %></option>
						<%} %>
						</select>
					</div>
							<button>
							Add
						<i class="zmdi zmdi-arrow-right"></i>
				</button>
					
				</form>
	
	</div>
	
</section>
</body>
</html>