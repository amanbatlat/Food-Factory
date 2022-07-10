<%@page import="java.util.Iterator"%>
<%@page import="Model.Restaurant"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%SessionFactory sf= new Configuration().configure().buildSessionFactory();
Session ss=sf.openSession();
Criteria cr = ss.createCriteria(Restaurant.class);
Iterator<Restaurant> itr= cr.list().iterator();
ss.close();
sf.close();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Food Factory</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Search.css">
<link src="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<style>
.badge {
  padding-left: 9px;
  padding-right: 9px;
  -webkit-border-radius: 9px;
  -moz-border-radius: 9px;
  border-radius: 9px;
}
#lblCartCount {
    font-size: 12px;
    background: #ff0000;
    color: #fff;
    padding: 0 5px;
    vertical-align: top;
}
</style>
<body id="page-top" >
    <!--<div role="dialog" tabindex="-1" class="modal fade" id="modal1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Login</h4><button type="button" class="" data-dismiss="modal" aria-label="Close" href=""><span aria-hidden="true">×</span></button></div>
            <div class="modal-body"><label style="margin: 30px;">USERNAME </label><input type="text" style="width: 209px;margin: 40px;" /><label style="margin: 30px;">PASSWORD</label><input type="password" style="margin: 40px;width: 209px;" /></div>
            <div class="modal-footer"><button class="btn btn-light" type="button" href="Register.jsp"><a href="Register.jsp">Register ?</a></button><button class="btn btn-primary" type="button">Login </button></div>
        </div>
    </div>
</div>-->
    <nav class="navbar navbar-light navbar-expand-lg fixed-top" id="mainNav">
        <div class="container"><a class="navbar-brand js-scroll-trigger" href="#page-top">FOOD fACTorY BY AMAN &amp; mAYUR</a><button data-toggle="collapse" data-target="#navbarResponsive" class="navbar-toggler navbar-toggler-right" type="button" aria-controls="navbarResponsive"
                aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-align-justify"></i></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link"   href="Login.jsp"><%if(session.getAttribute("CUSTOMER")!=null){%>${CUSTOMER}<%}else{out.println("LOGIN");} %></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link"  href="<%if(session.getAttribute("CUSTOMER")!=null){out.println("Logout");}else{%>Register.jsp<%}%>"><%if(session.getAttribute("CUSTOMER")!=null){out.println("Logout");}else{out.println("Signup");}%></a></li>
                   <li class="nav-item" role="presentation"><a class="nav-link" href="#about">About</a></li>
                   <li class="nav-item" role="presentation"><a class="nav-link"  href="Feedback.jsp">Contact</a></li>
                	<li class="nav-item" role="presentation"><a class="nav-link" href="#about"><i class="fa fa-shopping-cart fa-2x mb-3 sr-contact" data-aos="zoom-in" data-aos-duration="300" data-aos-delay="300" data-aos-once="true"></i></a></li>
                </ul>
            </div>
        </div>
    </nav>
    <header class="flash animated masthead text-center text-white d-flex" style="background-image:url('assets/img/header.jpg');">
        <div class="container my-auto">
            <div class="row">
                <div class="col-lg-10 mx-auto">
                    <h1 class="text-uppercase wobble animated"><strong>FOOD FACTory</strong></h1>
                    <p class="wobble animated text-faded mb-5" style="font-size: 20.4PX;color: rgba(255,255,255,0.7);">YOUR FOOD ORDERD BY JUST CLICK</p>
                    <nav class="navbar navbar-light navbar-expand-md border-primary border rounded d-inline-block shake animated navigation-clean-search" style="background-color: rgba(0,0,0,0.82);filter: brightness(61%) contrast(73%);opacity: 1;">
                        <div class="container"><a class="navbar-brand" href="#" style="color: rgb(255,255,255);">&nbsp;SEARCH DISHES</a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                            <div
                                class="collapse navbar-collapse" id="navcol-1">
                                <ul class="nav navbar-nav">
                                    <li class="nav-item" role="presentation"></li>
                                    <li class="nav-item" role="presentation"></li>
                                    <li class="nav-item" role="presentation"></li>
                                </ul>
                                <form class="form-inline mr-auto" target="_self">
                                    <div class="form-group"><label for="search-field"><i class="fa fa-search"></i></label><input class="form-control search-field" type="search" id="search-field" name="search"></div>
                                </form><a class="btn btn-light action-button" role="button" href="#" style="color: rgb(0,0,0);background-color: rgb(0,0,0);">SEARCH</a></div>
                </div>
                </nav>
                <hr>
            </div>
        </div>
        </div>
    </header>
    <section id="about" class="bg-primary"></section>
    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Our Services</h2>
                    <hr class="my-4">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-3 text-center">
                    <div class="mx-auto service-box mt-5"><i class="fa fa-glass fa-4x text-primary mb-3 sr-icons" data-aos="zoom-in" data-aos-duration="200" data-aos-once="true"></i>
                        <h3 class="mb-3">Best Food Items</h3>
                        <p class="text-muted mb-0">Best Food items deliverd to your city just By one click.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 text-center">
                    <div class="mx-auto service-box mt-5"><i class="fa fa-paper-plane fa-4x text-primary mb-3 sr-icons" data-aos="zoom-in" data-aos-duration="200" data-aos-delay="200" data-aos-once="true"></i>
                        <h3 class="mb-3">Fast Delivery</h3>
                        <p class="text-muted mb-0">Fast Delivery From Your Favourite Hotels Just by one click.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 text-center">
                    <div class="mx-auto service-box mt-5"><i class="fa fa-newspaper-o fa-4x text-primary mb-3 sr-icons" data-aos="zoom-in" data-aos-duration="200" data-aos-delay="400" data-aos-once="true"></i>
                        <h3 class="mb-3">Review Your Order</h3>
                        <p class="text-muted mb-0">Delivery of Food and using UPI/Net Banking / COD ( cash on delivery).</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 text-center">
                    <div class="mx-auto service-box mt-5"><i class="fa fa-heart fa-4x text-primary mb-3 sr-icons" data-aos="fade" data-aos-duration="200" data-aos-delay="600" data-aos-once="true"></i>
                        <h3 class="mb-3">Made with Love</h3>
                        <p class="text-muted mb-0">Our All Items are Made With Made with Purest Things.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="portfolio" class="p-0">
         <div class="row">
            <div class="col">
                <h6 class="display-4 text-monospace text-center" style="font-family: 'Advent Pro', sans-serif;">Restaurants in My City</h6>
            </div>
        </div><div class="container">
    <div class="table-responsive">
        <table class="table">
            <thead>
           <% int i,j=1;
        
           int k=3;
           i=0;
  			         
           while(itr.hasNext()){
        	   Restaurant r1=itr.next();
        	  i++;
           %>
         
                    <td><div class="flip-card">
  <div class="flip-card-inner">
    <div class="flip-card-front">
      <img src="images/Restaurants/<%=j++ %>.jpg" alt="Avatar" style="width:300px;height:200px;">
    </div>
    <div class="flip-card-back">
      <h1><%=r1.getNAME() %></h1>
      
<P><%=r1.getCONTACT()%></p>
<p>Available time 11:00 A.M. To 12:00 P.M.
     <p><a href="Product.jsp?id=<%=r1.getId()%>"><button onclick="modifystate()">Our Foods</button></a></p>
    <script>
    
     </script>
    </div>
  </div>
</div>
</td>
 <%if(i==k){k=i*2;%> <tr> <% }  %>
               <%} %> 
               
    </tr>
            </tbody>
        </table>
    </div>
</div>
    </section>
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
                    <p><a href="mailto:foodfactoryma@gmail.com">FOODFACTORYMA@GMAIL.COM</a></p>
                </div>
                <div class="col-lg-4 mr-auto text-center"><i class="fa fa-cutlery fa-3x mb-3 sr-contact" data-aos="zoom-in" data-aos-duration="300" data-aos-delay="300" data-aos-once="true"></i>
                    <p><a href="Restaurant/index.jsp">Host Restaurant on Food Factory</a></p>
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
</body>
</html>