<%@page import="Model.Cart"%>
<%@page import="Controller.CartControl"%>
<%@page import="Controller.OrderdControl"%>
<%@page import="Model.Orderd"%>
<%@page import="java.util.Iterator"%>
<%@page import="Controller.CustomerControl"%>
<%@page import="Model.Customer"%>
<%
if(session.getAttribute("RESTAURANT")==null)
{
	response.sendRedirect("index.jsp");
}
Iterator<Cart> itr=new CartControl().selectall();
Iterator<Orderd> itr1=new OrderdControl().selectall();



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
       
		<li><a href="Order.jsp" class="active">Order Status</a></li>
        <li><a href="HotelAdmin.jsp">Manage Foods</a></li>
        <li><a href="Fooditem.jsp">Add Foods</a></li>
   
         <li><a href="Feedback.jsp">FeedBack</a></li>
		
    </ul>
    </nav>
    <section>
      <div class="table">
    	<table class="table">
  <thead>
    <tr>
       <th>Food item</th>
			 <th>Customer Name</th>
			 <th>Food Price</th>
			 <th>Cancel Order</th>
			 <th>Update Order Status </th>
    </tr>
  </thead>
  <tbody>

    <%
    while(itr1.hasNext()){
		Orderd obj1=itr1.next();	
		Cart aj=itr.next();
		if(session.getAttribute("RESTAURANT").equals(obj1.getRestid().getNAME()))
		{
			
			
    	%>
    <tr>
    
    
      <th scope="row"><%=aj.getFood_id().getFOODNAME() %></th>
      <td><%=obj1.getCustid().getNAME()%></td>
      <td><%=obj1.getTotal()%></td>
      <td><a href="../CancelOrderd?id=<%=obj1.getOrder_id()%>">Cancel Order</td></a>
        <td><a href="../OrderdDao?id=<%out.print(obj1.getOrder_id());%>"><%=obj1.getStatus()%></a></td>
    
    </tr>
    <%}} %>
  </tbody>
</table>
<<div>
    	</section>
  </body>
</html>
 