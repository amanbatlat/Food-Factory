<%@page import="Model.Feedback"%>
<%@page import="java.util.Iterator"%>
<%@page import="Controller.FeedbackControl"%>
<%
if(session.getAttribute("RESTAURANT")==null)
{
	response.sendRedirect("index.jsp");
}
Iterator<Feedback> itr=new FeedbackControl().selectall();
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
        <li><a href="HotelAdmin.jsp">Manage Foods</a></li>
        <li><a href="Fooditem.jsp">Add Food</a></li>
       
         <li><a href="Feedback.jsp" class="active">FeedBack</a></li>
		
    </ul>
    </nav>
    <section>
      <div class="table">
    	<table class="table">
  <thead>
    <tr>
   		 <th>Customer</th>
			 <th>Email</th>
			 <th>Description</th>
			 <th>Gender</th>
			 <th>Phone</th>
	</tr>
  </thead>
  <tbody>
  <%while(itr.hasNext()){
  		Feedback obj=itr.next();
  		%>
    <tr>
      <th scope="row"><%=obj.getNAME() %></th>
      <td><%=obj.getEMAIL() %></td>
      <td><%=obj.getCOMMENTS() %></td>
      <td><%=obj.getGENDER() %></td>
      <td><%=obj.getPHONE() %></td>
  
    </tr>
    <%} %>
  </tbody>
</table>
<div>
    	</section>
  </body>
</html>
 