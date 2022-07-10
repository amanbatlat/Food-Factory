<%@page import="Controller.OrderdControl"%>
<%@page import="Model.Orderd"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.Array"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%int cid=Integer.parseInt(request.getParameter("cid")); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Order Placed</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/Bootstrap-4---Payment-Form.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>




.progressbar {
  counter-reset: step;
}

.progressbar li {
  position: relative;
  list-style: none;
  float: left;
  width: 33.33%;
  text-align: center;
}

/* Circles */
.progressbar li:before {
  content: counter(step);
  counter-increment: step;
  width: 40px;
  height: 40px;
  border: 1px solid #2979FF;
  display: block;
  text-align: center;
  margin: 0 auto 10px auto;
  border-radius: 50%;
  background-color: #FF9100;
   
  /* Center # in circle */
  line-height: 39px;
}

.progressbar li:after {
  content: "";
  position: absolute;
  width: 100%;
  height: 1px;
  background: orange ;
  top: 20px; /*half of height Parent (li) */
  left: -50%;
  z-index: -1;
}

.progressbar li:first-child:after {
  content: none;
}

.progressbar li.active:before {
  background: #00E676;
  content: ;  
}

.progressbar li.active + li:after {
  background: #00E676;
}
</style>
<script>
	$(document).ready(function(){
		$("#myModal").modal('show');
	});
</script>
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
    </nav>
    <section class="flash animated">
    <div class="container">
    <h2 class="display-3 sucess" align="center">Order Placed</h2>
    <br>
    <br>
    <br>
    
  <ul class="progressbar">
    <li class="active"><i class="fa fa-check">Order Placed</i></li>
  
    <li class="active"><i class="fa fa-check">In processing</i></li>
    <%Iterator<Orderd> itr1=new OrderdControl().selectall();
    int i=0;
    while(itr1.hasNext()){
    	
    	Orderd obj=itr1.next();
    if(obj.getCustid().getCustomer_id()==cid)
    {
    	String s1="Deliverd";
    	String s2=obj.getStatus();
		if(s1.equals(s2) && i<1) 
		{
			 %>
       <li class="active"><i class="fa fa-check">Delivered</i></li>
       <%}i++;}} %>
  </ul>
</div>
    </section><%%>