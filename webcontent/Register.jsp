<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Register</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/Elegant-Registration-Form.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">
    <link rel="stylesheet" href="assets/css/Pretty-Registration-Form.css">
</head>

<body>
<script type="text/javascript">
function validate()
{
var name=document.getElementById("name");
var contact=document.getElementById("number");
var email=document.getElementById("email");
var password=document.getElementById("password");
if(name.value=="")
{
	alert("plz enter the Username");
	return false;
	
}
else if (password.value.trim()=="")
{
	alert("Plz enter the Password");
	return false;
}	
else if(password.value.trim().length<5)
{
	alert("Password must be less than 5 letters");
	return false;
}
else if(email.value.trim()=="")
{
	alert("Plz enter valid Email Address");
	return false;
}
else if(contact.value.trim()=="")
{
	alert("Plz Enter contact details");
	return false;
}
else if(contact.value.trim().length<10)
{
	alert("Contact Must be 10 less than 10 digits");
	return false;
}
else
{
	true;
}
}

</script>
    <nav class="navbar navbar-light navbar-expand-lg fixed-top" id="mainNav">
        <div class="container"><a class="navbar-brand js-scroll-trigger" href="Index.jsp">FOOD FACTORY BY AMAN &amp; MAYUR</a><button data-toggle="collapse" data-target="#navbarResponsive" class="navbar-toggler navbar-toggler-right" type="button" aria-controls="navbarResponsive"
                aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-align-justify"></i></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"></li>
                    <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#services">REgister</a></li>
                    <li class="nav-item" role="presentation"></li>
                </ul>
            </div>
        </div>
    </nav>
    <header class="masthead text-center text-white d-flex" style="background-image:url('assets/img/header1.png');">
        <div class="container my-auto">
            <div class="row">
                <div class="col-lg-10 mx-auto">
                    <h1 class="text-uppercase"><strong>FOOD FACTORY</strong></h1>
                    <p class="text-faded mb-5"></p>
                    <hr>
                </div>
            </div>
        </div>
    </header>
    <section id="services">
        <div class="container"><div class="banner6 py-5">
  <!-- Row  -->
  <div class="row">
    <div class="container">
      <div class="col-lg-6 align-justify-center pr-4 pl-0 contact-form">
        <div class="">
          <h2 class="mb-3 font-weight-light">Get Register For Food Factory</h2>
          <h6 class="subtitle font-weight-normal">Your Food Delivered Just By Click</h6>
          <form class="mt-3" onsubmit="return validate();" action="registeraction.jsp" name="Registration">
            <div class="row">
              <div class="col-lg-12">
                <div class="form-group">
                  <input class="form-control" id="name" type="text" placeholder="FULL NAME" name="NAME" >
                </div>
              </div>
              <div class="col-lg-12">
                <div class="form-group">
                  <input class="form-control" type="email" id="email" placeholder="EMAIL ADDRESS" name="EMAIL" pattern="^([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22))*\x40([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d))*$" >
                </div>
              </div>
              <div class="col-lg-12">
                <div class="form-group">
                  <input class="form-control" type="number" id="number" minlength="3" maxlength="10" step="any" pattern="[-+]?[0-9]*[.,]?[0-9]+" placeholder="Contact" name="CONTACT" >
                </div>
              </div>
              <br>
              <div class="col-lg-12">
                <div class="form-group">
               <textarea class="form-control" id="Address" name="ADDRESS" placeholder="Address" rows="5" ></textarea>
                </div>
              </div>
              <div class="col-lg-12">
                <div class="form-group">
                  <input class="form-control" type="password" id="password" placeholder="PASSWORD" name="PASSWORD" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$" title="Please include at least 1 uppercase character, 1 lowercase character, and 1 number." >
                </div>
              </div>
              <div class="col-lg-12">
                <button type="submit" class="btn btn-md btn-block btn-danger-gradiant text-white border-0"><span> Create Account</span></button>
                <!--  -->
              </div>
            </div>
          </form>
            <div class="col-lg-12 text-center mt-4">
              Already have an account? <a href="Login.jsp" class="text-danger">Sign In</a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-6 right-image pl-3" style="background-image:url(https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/form/3.jpg);">
    </div>
  </div>
</div></div>
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