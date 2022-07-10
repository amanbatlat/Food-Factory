<%@page import="Controller.CustomerControl"%>
<%@page import="Model.Customer"%>
<%@page import="Controller.CartControl"%>
<%@page import="Model.Cart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
int rid=Integer.parseInt(request.getParameter("rid"));
Cart obj=null;
String cartid=request.getParameter("cid");
int cid=Integer.parseInt(cartid);
if(cartid!=null)
obj=new CartControl().select(Integer.parseInt(cartid));
String tot=request.getParameter("total");
int total=Integer.parseInt(tot);
Customer obj1=null;
String idid1=request.getParameter("id");
if(idid1!=null)
obj1=new CustomerControl().select(Integer.parseInt(idid1));
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Payment</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/Bootstrap-4---Payment-Form.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">
</head>
<body>
    <nav class="navbar navbar-light navbar-expand-lg fixed-top pulse animated" id="mainNav" style="background-color: #ff5823;">
        <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top" style="color: rgba(0,0,0,0.7);">food factory by aman &amp; Mayur</a><button data-toggle="collapse" data-target="#navbarResponsive" class="navbar-toggler navbar-toggler-right" type="button"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-align-justify"></i></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="#">About</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#contact">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav><!-- Button HTML (to Trigger Modal) -->

<!-- Modal HTML -->

    <section class="flash animated">
      <div class="row">
    <div class="container">
      <div class="col align-justify-center pr-2 pl-0 contact-form">
  <h1 align="center" class="display-5">Customer Details</h1>
                <div class="form-group">
                <label>Customer Name</label>
                  <input class="form-control" type="text" placeholder="<%out.print(obj1.getNAME()); %>" readonly>
                </div>
              </div>
              <div class="form-group">
              <label>Address</label>
                  <input class="form-control" type="text" placeholder="<%out.print(obj1.getADDRESS());%>"  readonly>
                </div>
          </div>
        </div>
        <h1 class="text-center text-secondary bg-dark border rounded border-secondary shadow-lg" data-toggle="tooltip" data-bs-tooltip="" data-bs-hover-animate="pulse">PAYMENT PORTAL</h1><div class="container py-5">
  <div class="row">
    <div class="col-lg-7 mx-auto">
      <div class="bg-white rounded-lg shadow-sm p-5">
        <!-- Credit card form tabs -->
        <ul role="tablist" class="nav bg-light nav-pills rounded-pill nav-fill mb-3">
          <li class="nav-item">
            <a data-toggle="pill" href="#nav-tab-card" class="nav-link active rounded-pill">
                                <i class="fa fa-credit-card"></i>
                                Credit Card
                            </a>
          </li>
          <li class="nav-item">
            <a data-toggle="pill" href="#nav-tab-cash" class="nav-link rounded-pill">
                                <i class="fas fa-shipping-fast"></i>
                                Cash on delivery
                            </a>
          </li>
           </ul>
        <!-- End -->

 <div class="tab-content">
        <!-- Credit card form content -->
      
		
		
          <!-- credit card info-->
          
          <div id="nav-tab-card" class="tab-pane fade show active">
            
            <p class="alert alert-success"><%out.print(obj1.getNAME());%> Have to Pay  <i class="fa fa-rupee"><%out.print(total);%></i> </p>
             
          
            <!-- <form role="form" action=""> -->
             <form action="CreditDao" method="post">
              <div class="form-group">
                <label for="username">Full name (on the card)</label>
 	          <input type="text" name="type" value="CREDIT" hidden>
 	          <input type="text" name="email" value="<%=obj1.getEMAIL()%>" hidden>
 	          <input type="text" name="total" value="<%=total%>" hidden>
 	          <input type="text" name="cid" value="<%=obj1.getCustomer_id()%>" hidden>
 	          <input type="text" name="rid" value="<%=rid%>" hidden>
 	               <input type="hidden" name="phone" value="<%=obj1.getCONTACT() %>"/>
                   <input type="hidden" name="name" value="<%=obj1.getNAME()%>"/>
               
                <input type="text" name="HOLDER" placeholder="<%out.print(obj1.getNAME()); %>" class="form-control" required>
              </div>
              <div class="form-group">
                <label for="cardNumber">Card number</label>
                <div class="input-group">
                  <input type="text" name="CARDNUMBER" placeholder="Your card number" class="form-control" required>
                  <div class="input-group-append"> 
                    <span class="input-group-text text-muted">
                                                <i class="fa fa-cc-visa mx-1"></i>
                                                <i class="fa fa-cc-amex mx-1"></i>
                                                <i class="fa fa-cc-mastercard mx-1"></i>
                                            </span>
                  </div>
                </div>
              </div>
                  <div class="row">
                <div class="col-sm-8">
                  <div class="form-group">
                    <label><span class="hidden-xs">Expiration</span></label>
                    <div class="input-group">
                      <input type="number" placeholder="MM" name="MONTH" class="form-control" required>
                      <input type="number" placeholder="YY" name="YEAR" class="form-control" required>
                    </div>
                  </div>
                </div>
            </div>
                <div class="col-sm-4">
                  <div class="form-group mb-4">
                    <label data-toggle="tooltip" title="Three-digits code on the back of your card">CVV
                                                <i class="fa fa-question-circle"></i>
                                            </label>
                    <input type="text" name="CVV"  class="form-control" required>
                  </div>
                  </div>
	<button type="submit" class="btn btn-lg btn-primary">Confirm Your Order</button>
</form>
      </div>
         <div id="nav-tab-cash" class="tab-pane fade">
                        <p>Cash on delivery is easiest way to pay</p>  
            <p>
              <a href="PaymentDao?cid=<%=obj.getC_id().getCustomer_id()%>&type=CASH&total=<%=total%>&rid=<%=rid%>"><button type="button"  class="btn btn-primary rounded-pill"><i class="fa fa-paypal mr-2"></i>Place your order</button></a>
           </p>
         
            
            <p class="text-muted">Fastest delivery at your door step
            </p>
          </div>
</section>

    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
    <script src="assets/js/creative.js"></script>
    <script src="assets/js/Bootstrap-4---Payment-Form.js"></script>
</body>

</html>