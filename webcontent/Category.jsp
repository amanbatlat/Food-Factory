
<%@page import="Model.Cart"%>
<%@page import="Controller.CartControl"%>
<%@page import="Model.Customer"%>
<%@page import="Controller.CustomerControl"%>
<%@page import="Controller.CategoryControl"%>
<%@page import="Model.Category"%>
<%@page import="Controller.FoodControl"%>
<%@page import="Model.Food"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Food obj=null;

String idid1=request.getParameter("id");
if(idid1!=null)
obj=new FoodControl().select(Integer.parseInt(idid1));	

Category obj2=null;
String CATEGORY=request.getParameter("category");

%>
<%
if(session.getAttribute("CUSTOMER")==null)
	response.sendRedirect("Login.jsp");
int q=0;
  Iterator<Customer> itr6=new CustomerControl().selectall();
  while(itr6.hasNext()){
	  Customer c1=itr6.next();
	  String s1=c1.getNAME();
	  String s2=session.getAttribute("CUSTOMER").toString();
	  if(s2.equals(s1))
	  {
  		q=c1.getCustomer_id();
	  }		  
  }
%>
<%/*
int q=0;
//int n=Integer.parseInt(request.getParameter("val"));


out.print(n++);

*/
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Product</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Search.css">
    <link rel="stylesheet" href="assets/css/Sidebar-Menu-1.css">
    <link rel="stylesheet" href="assets/css/Sidebar-Menu.css">
    <link rel="stylesheet" href="assets/css/SIdebar-Responsive-2-1.css">
    <link rel="stylesheet" href="assets/css/SIdebar-Responsive-2.css">
   <link rel="stylesheet" href="Product.css">
   <style>
  /* Product Quantity */
.quantity {
  padding-top: 20px;
  margin-right: 60px;
}
.quantity input {
  -webkit-appearance: none;
  border: none;
  text-align: center;
  width: 32px;
  font-size: 16px;
  color: #43484D;
  font-weight: 300;
}

button[class*=btn] {
  width: 30px;
  height: 30px;
  background-color: #E1E8EE;
  border-radius: 6px;
  border: none;
  cursor: pointer;
}
.minus-btn img {
  margin-bottom: 3px;
}
.plus-btn img {
  margin-top: 2px;
}
button:focus,
input:focus {
  outline:0;
}
  </style>
  
  
</head>

<body id="page-top">
    <nav class="navbar navbar-light navbar-expand-lg fixed-top" id="mainNav">
        <div class="container"><a class="navbar-brand js-scroll-trigger" href="#page-top" style="color: rgba(11,6,6,0.7);">FOOD FAcTORY</a><button data-toggle="collapse" data-target="#navbarResponsive" class="navbar-toggler navbar-toggler-right" type="button" aria-controls="navbarResponsive"
                aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-align-justify"></i></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="Login.jsp" style="color: rgba(239,130,130,0.7);"><%if(session.getAttribute("CUSTOMER")!=null){%>${CUSTOMER}<%}else{out.println("LOGIN");} %></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="<%if(session.getAttribute("CUSTOMER")!=null){out.println("Logout");}else{%>Register.jsp<%}%>" style="color: rgba(244,109,109,0.7);"><%if(session.getAttribute("CUSTOMER")!=null){out.println("Logout");}else{out.println("Signup");}%></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#conatct" style="color: rgba(227,99,99,0.7);">ABOUT</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="Feedback.jsp" style="color: rgba(217,90,90,0.7);">Contact</a></li>
        
                		<li class="nav-item" role="presentation"><a class=""  href="Cart.jsp?id=<%=q%>"><i class="fa fa-shopping-cart fa-2x mb-3 sr-contact" data-aos="" data-aos-duration="300" data-aos-delay="300" data-aos-once="true" >
                <%
                int c=0;
                Iterator<Cart> it1=new CartControl().selectall();
                while(it1.hasNext())
                {
                	Cart c1=it1.next();
                	if(c1.getC_id().getCustomer_id()==q)
                      c++;          
                }
                out.print(c);%></i></a></li> 
                </ul>
                <nav class="navbar navbar-light navbar-expand-md navigation-clean-search" style="background-color: rgba(208,116,116,0);">
                    <div class="container"><a class="navbar-brand" href="#" style="color: rgba(175,171,221,0.7);">SEARCH fOOD</a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                        <div
                            class="collapse navbar-collapse" id="navcol-1">
                            <ul class="nav navbar-nav">
                                <li class="nav-item" role="presentation"></li>
                            </ul>
                            <form class="form-inline mr-auto" target="_self">
                                <div class="form-group"><label for="search-field"><i class="fa fa-search"></i></label><input class="border rounded form-control search-field" type="search" id="search-field" name="search" style="background-color: rgba(239,222,222,0.7);"></div>
                            </form><a class="btn btn-light action-button" role="button" href="#" style="background-color: rgb(169,45,18);">seARCH</a></div>
           
            </div>
            
            </nav>
            
        </div>
        </div>
    </nav>
    <section id="services">
        <div id="wrapper">
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand"> <a href="Product.jsp?id=<%=idid1%>">Categories Of Food</a></li>

					     
			<%
			
			Iterator<Category> itr=new CategoryControl().selectall();
			while(itr.hasNext()){
			Category f1=itr.next();
			String aj=f1.getCATEGORY();
			%>	
			<%if(aj==CATEGORY){%>
                    <li class="list-gropu-item active"><a href="#"><%=f1.getCATEGORY() %></a></li>
                    <%}else{
                    	%>
                <li> <a href="Category.jsp?category=<%=f1.getCATEGORY()%>&id=<%=idid1%>"><%=f1.getCATEGORY() %></a></li>
                <%} %>
                    
<%} %>
                </ul>
            </div>
            <div class="page-content-wrapper">
                <div class="container-fluid"><a class="btn btn-link" role="button" id="menu-toggle" href="#menu-toggle"><i class="fa fa-bars"></i></a>
                    <div class="row">
                        <div class="col-md-12">
                            <div>
                                <h1><% out.print(CATEGORY+"  ");%>Items</h1>
                            </div>
                            <p><i class="fa fa-location-arrow"></i>&nbsp;Track Live Location ||&nbsp;<i class="fa fa-clock-o"></i>&nbsp;In 31 Minutes</p>
                        </div>
                    </div>
                </div>
            </div>
        </div><div class="container">
    <div class="table-responsive">
      
        <table class="table">
            <thead>
  			  <%
  			  int p=0;
  			  Iterator<Customer> itr2=new CustomerControl().selectall();
  			  while(itr2.hasNext()){
  				  Customer c1=itr2.next();
  				  String s1=c1.getNAME();
  				  String s2=session.getAttribute("CUSTOMER").toString();
  				  if(s2.equals(s1))
  				  {
  			  		p=c1.getCustomer_id();
  				  }		  
  			  }
    int i,j=1;
    
    int k=3;
    i=0;
    Iterator<Food> itr1=new FoodControl().selectall();
    while(itr1.hasNext()){
    	
    	Food f1=itr1.next();
    	int id=f1.getRestaurant_id().getId();
    	String cat=f1.getCategory_id().getCATEGORY();
		if(id==Integer.parseInt(idid1) && cat.equals(CATEGORY))
		{
    	   
      %>        
        
                    <td><div class="wrapper">
                     
      <div class="card front-face">
        <img src="upload/<%=f1.getIMAGE()%>">
      </div>
<div class="card back-face">
        <img src="upload/<%=f1.getIMAGE()%>">
        <div class="info">
          <div class="title">
<%=f1.getFOODNAME() %></div>
<p>Quantity:- 
<form action="CartDao" method="get">

<input type="text" name="id" value="<%=f1.getId()%>" hidden>
<input type="text" name="cid" value="<%=p %>" hidden>
<input type="text" name="rid" value="<%=id %>" hidden>
        
            	  <select input type="text" id="qty1" name="qty1">
            	  <%int o;	for(o=1;o<11;o++){ %>
            	  <option value="<%out.print(o);%>"><%out.print(o);%></option>
					<%} %>

</select>				
</p>
<p>
<%=f1.getCategory_id().getCATEGORY() %><br><i class="fa fa-rupee"> <%=f1.getPRICE()%></i></p>
 <p><button type="submit">Add to Wishlist</button></p>
</form>

</div>
</div>
</div>
</td>
 <%if(i==k){k=i*2;%> <tr> <% }}else{i++;}  %>
               <%} %> 
              
                </tr>
   
            </thead>
            <tbody>
            <tr>
           </tbody>
        </table>
    </div>
   <script type="text/javascript">
      $('.minus-btn').on('click', function(e) {
    		e.preventDefault();
    		var $this = $(this);
    		var $input= $this.closest('div').find('input');
    		
    		var value = parseInt($input.val());
			
    		if (value > 1) {
    			value = value - 1;
    		
    		} else {
    			value = 0;
    		}

        $input.val(value);

    	});
      
    	$('.plus-btn').on('click', function(e) {
    		e.preventDefault();
    		var $this = $(this);
    		var $input = $this.closest('div').find('input');
    		var value = parseInt($input.val());
    		if (value < 1000) {
      		value = value +1;
      		} else {
    			value =100;
    		}

    		
$input.val(value);    		
    	});
    	
      $('.like-btn').on('click', functi
    		  on() {
        $(this).toggleClass('is-active');
      });
      
    </script>
   
   </div></section>
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto text-center">
                    <h2 class="section-heading">Let's Get In Touch!</h2>
                    <hr class="my-4">
                    <p class="mb-5">Ready to start your next project with us? That's great! Give us a call or send us an email and we will get back to you as soon as possible!</p>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 ml-auto text-center"><i class="fa fa-phone fa-3x mb-3 sr-contact" data-aos="zoom-in" data-aos-duration="300" data-aos-once="true"></i>
                    <p>123-456-6789</p>
                </div>
                <div class="col-lg-4 mr-auto text-center"><i class="fa fa-envelope-o fa-3x mb-3 sr-contact" data-aos="zoom-in" data-aos-duration="300" data-aos-delay="300" data-aos-once="true"></i>
                    <p><a href="mailto:your-email@your-domain.com">email@example.com</a></p>
                </div>
            </div>
        </div>
    </section>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
    <script src="assets/js/creative.js"></script>
    <script src="assets/js/Sidebar-Menu.js"></script>
</body>

</html>