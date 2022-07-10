
<%@page import="Controller.FoodControl"%>
<%@page import="Controller.RestaurantControl"%>
<%@page import="Model.Food"%>
<%@page import="java.util.*" %>
<%@page import="java.util.Iterator"%>
<%@page import="Model.Restaurant"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%Restaurant obj1=null;
String idid1=request.getParameter("id");
if(idid1!=null)
obj1=new RestaurantControl().select(Integer.parseInt(idid1));

Food objj;
String idi=request.getParameter("id");
if(idi!=null)
objj =new FoodControl().select(Integer.parseInt(idi));

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
        <li><a href="HotelAdmin.jsp" class="active">Manage Foods</a></li>
        <li><a href="Fooditem.jsp">Add Food</a></li>
   
         <li><a href="Feedback.jsp">FeedBack</a></li>
		
    </ul>
    </nav>
    <section>
      <div class="table">
    	<table class="table">
  <thead>
    <tr>
  
    		<th>Food ID</th>
			 <th>Food Name</th>
			 <th>Food Price</th>
			 <th>Food Category</th>
			 <th>Delete Item </th>
			 <th>Update item Details</th>
    </tr>
  </thead>
  <tbody>
  <%  
  int i=0;
  Iterator<Food> itr= new FoodControl().selectall();
  while(itr.hasNext()){
	  Food f1=itr.next();
	 
	  String s1=f1.getRestaurant_id().getNAME().toString();
		String s2=session.getAttribute("RESTAURANT").toString();
	
	  //  out.print(session.getAttribute("RESTAURANT"));
	 // out.print(f1.getRestaurant_id().getNAME());
	  if(s1.equals(s2))
	  {%> 
	<tr>
    <td><%=f1.getId() %></td>
      <td><%=f1.getFOODNAME() %></td>
      <td><%=f1.getPRICE()%></td>
        <td><%=f1.getCategory_id().getCATEGORY() %></td>
          <td><button><a href="../FoodDao?id=<%=f1.getId()%>">Delete</a></button></td>
            <td><button><a href="Fooditem.jsp?id=<%=f1.getId()%>">Update</a></button></td>
    </tr>

		  
	  
  	<%}%>
   
   <%} %>
   
   
    
  </tbody>
</table>
<div>
    	</section>
  </body>
</html>
 