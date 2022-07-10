<%@page import="Controller.CustomerControl"%>
<%@page import="Model.Customer"%>
<%@page import="Model.Cart"%>
<%@page import="Controller.CartControl"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Customer obj=null;

String idid1=request.getParameter("id");

if(idid1!=null)
obj=new CustomerControl().select(Integer.parseInt(idid1));	
%>
<%
if(session.getAttribute("CUSTOMER")==null)
	response.sendRedirect("Login.jsp");

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
    <title>Cart</title>
     <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
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
<script type="text/javascript" src="lib.js"></script>  
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

button[class=plus-btn] {
  width: 30px;
  height: 30px;
  background-color: #E1E8EE;
  border-radius: 6px;
  border: none;
  cursor: pointer;
}
button[class=minus-btn] {
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
        <div class="container"><a class="navbar-brand js-scroll-trigger" href="#page-top" style="color: rgba(11,6,6,0.7);">CART</a><button data-toggle="collapse" data-target="#navbarResponsive" class="navbar-toggler navbar-toggler-right" type="button" aria-controls="navbarResponsive"
                aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-align-justify"></i></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="Login.jsp" style="color: rgba(239,130,130,0.7);"><%if(session.getAttribute("CUSTOMER")!=null){%>${CUSTOMER}<%}else{out.println("LOGIN");} %></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="<%if(session.getAttribute("CUSTOMER")!=null){out.println("Logout");}else{%>Register.jsp<%}%>" style="color: rgba(244,109,109,0.7);"><%if(session.getAttribute("CUSTOMER")!=null){out.println("Logout");}else{out.println("Signup");}%></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#conatct" style="color: rgba(227,99,99,0.7);">ABOUT</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="Feedback.jsp" style="color: rgba(217,90,90,0.7);">Contact</a></li>
               
                		<li class="nav-item" role="presentation"><a class=""  href="#about"><i class="fa fa-shopping-cart fa-2x mb-3 sr-contact" data-aos="" data-aos-duration="300" data-aos-delay="300" data-aos-once="true" >
                		  <%int c=0;
                Iterator<Cart> it1=new CartControl().selectall();
                while(it1.hasNext())
                {
                	Cart c1=it1.next();
                	if(c1.getC_id().getCustomer_id()==obj.getCustomer_id())
                      c++;          
                }out.print(c); %>
                		</i></a></li> 
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
    <br>
    <br>
    <br>
    <br>
    
<div class="px-4 px-lg-0">

  <div class="pb-5">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

          <!-- Shopping cart table -->
          <div class="table-responsive">
         
            <table class="table">
              <thead>
                <tr>
                  <th scope="col" class="border-0 bg-light">
                    <div class="p-2 px-3 text-uppercase">Food item</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">Price</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">Quantity</div>
                  </th>
                  
                 <th scope="col" class="border-0 bg-light">
                    <div class="p-2 px-3 text-uppercase">Restaurant name</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">Remove</div>
                  </th>
                </tr>
              </thead>
              <tbody>
              <%int price=0;
              int rid=0;
              Iterator<Cart> itr=new CartControl().selectall();
              while(itr.hasNext())
              {
            	  Cart c1=itr.next();
            	  int id=c1.getC_id().getCustomer_id();
            	  if(Integer.parseInt(idid1)==id)
            	  {
              %>
                <tr>
                  <th scope="row" class="border-0">
                    <div class="p-2">
                      <img src="" alt="" width="70" class="img-fluid rounded shadow-sm">
                      <div class="ml-3 d-inline-block align-middle">
                        <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block align-middle"><%=c1.getFood_id().getFOODNAME()%></a></h5><span class="text-muted font-weight-normal font-italic d-block"><%=c1.getFood_id().getCategory_id().getCATEGORY() %></span>
                      </div>
                    </div>
                  </th>
                 <% price=c1.getFood_id().getPRICE()*c1.getQUANTITY();  %>
                  <td class="border-0 align-middle"><strong>
                  <input type="text" class="form-control" name="price" value="<%=price%>" readonly>
                  </strong></td>
                                    
                  <td class="border-0 align-middle"><strong>
            	  <div class="quantity">
            	  <input type="text" name="qty"  value="<%=c1.getQUANTITY()%>" readonly>
					    </div>
                  </strong>
                   <td class="border-0 align-middle"><strong>
                  <input type="text" class="form-control" name="Restaurant name" value="<%=c1.getRest_id().getNAME()%>" readonly>
                  </strong></td>
                  </td>
                  <td class="border-0 align-middle"><a href="RemoveCart?id=<%=c1.getCart_Id()%>&cid=<%=obj.getCustomer_id() %>" class="text-dark"><i class="fa fa-trash"></i></a></td>
                </tr>
                
                <%rid=c1.getRest_id().getId();}}%>
                  </tbody>
            </table>
          </div>
          <!-- End -->
        </div>
      </div>

      
        <div class="col-lg-6-justify">
          <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Order summary </div>
          <div class="p-4">
            <p class="font-italic mb-4">Shipping and additional costs are calculated based on values you have entered.</p>
            <ul class="list-unstyled mb-4">
              <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Order Subtotal</strong><strong><%
            		  Iterator<Cart> itr1=new CartControl().selectall();
            		int i=0;
                	int k=0;
                int l=0;
              while(itr1.hasNext())
              { 
            	  Cart c1=itr1.next();
            	  int id=c1.getC_id().getCustomer_id();
            	  if(Integer.parseInt(idid1)==id)
            	  {
  				     l=c1.getCart_Id();
  				     
  				int j=c1.getFood_id().getPRICE()*c1.getQUANTITY();
  				
              k=Integer.sum(k, j);
              }i++;}%><i class="fa fa-rupee"><%out.print(k);%></i></strong></li>
       
              <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Shipping and handling</strong><strong><i class="fa fa-rupee"> 40.00</i></strong></li>
              <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tax</strong><strong><i class="fa fa-rupee"> 0.00</i></strong></li>
              <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total</strong>
                <h5 class="font-weight-bold"><i class="fa fa-rupee"><%int p=k+40; out.print(p);%></i></h5>
              </li>
            </ul><a href="Payment.jsp?total=<%=p%>&id=<%=obj.getCustomer_id()%>&cid=<%=l%>&rid=<%=rid%>" class="btn btn-primary rounded-pill py-2 btn-block">Procceed to checkout</a>
          </div>
        </div>
      </div>
</form>
    </div>
  </div>
</div>

</div>
</section>
 <section id="portfolio" class="p-0"></section>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
    <script src="assets/js/creative.js"></script>
</body>

</html>