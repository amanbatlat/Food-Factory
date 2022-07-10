<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Random"%>
<%@page import="Controller.CustomerControl"%>
<%@page import="Model.Customer"%>
<%@page import="Controller.CartControl"%>
<%@page import="Model.Cart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String Email=request.getParameter("email");
int rid=Integer.parseInt(request.getParameter("rid"));
int total=Integer.parseInt(request.getParameter("total"));
String id=request.getParameter("cid");
int cid=Integer.parseInt(id);
String name=request.getParameter("name");
String phone=request.getParameter("phone");
String HOLDER=request.getParameter("HOLDER");
String CARDNUMBER=request.getParameter("CARDNUMBER");
String MONTH=request.getParameter("MONTH");
String YEAR=request.getParameter("YEAR");
String CVV=request.getParameter("CVV");	

//Multiple mobiles numbers separated by comma
String mobiles = phone;
Random rand = new Random();
int otp=rand.nextInt(900000) + 100000;
try{
String apiKey = "apikey=" + URLEncoder.encode("e4kQxBwLxOE-7LKoUglWrin3zFGtUp7BkiffPcebVS", "UTF-8");
String message = "&message=" + URLEncoder.encode("Hey "+name+" You Food Factory Order Confirmation OTP Is : "+Integer.toString(otp), "UTF-8");
String sender = "&sender=" + URLEncoder.encode("TXTLCL", "UTF-8");
String numbers = "&numbers=" + URLEncoder.encode("91"+phone, "UTF-8");

// Send data
String data = "https://api.textlocal.in/send/?" + apiKey + numbers + message + sender;
URL url = new URL(data);
URLConnection conn = url.openConnection();
conn.setDoOutput(true);

// Get the response
BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
String line;
String sResult="";
while ((line = rd.readLine()) != null) {
// Process line...g
	sResult=sResult+line+" ";
}
session.setAttribute("otp", otp);
out.print(session.getAttribute("otp"));
rd.close();
} catch (Exception e) {
System.out.println("Error SMS "+e);
out.print("error");
}
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("#myModal").modal('show');
	});
</script>
</head>

<body>

  <div id="myModal" class="modal fade" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Confirmation</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
				 <form action="otpprocess.jsp?HOLDER=<%=HOLDER%>&CARDNUMBER=<%=CARDNUMBER%>&MONTH=<%=MONTH%>&YEAR=<%=YEAR%>&CVV=<%=CVV%>&cid=<%=cid%>&total=<%=total%>&rid=<%=rid%>&email=<%=Email%>" method="post"> 
                <label>Enter OTP(ONE TIME PASSWORD):-<%out.print(session.getAttribute("otp")); %></label>
                <input type="text" name="otpvalue" class="form-control">
                <p class="secondry">Enter Your OTP to Confirm Your Order</p>
				
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
              <button type="submit" class="btn btn-primary">Submit</button>
                </div>
                </form>
            </div>
        </div>
    </div>
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

    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
    <script src="assets/js/creative.js"></script>
    <script src="assets/js/Bootstrap-4---Payment-Form.js"></script>
</body>
        
</html>