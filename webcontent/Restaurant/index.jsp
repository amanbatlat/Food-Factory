<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Restaurant Side</title>
    <link rel="stylesheet" href="AdminLogin.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script>
 function validate()
{
var name=document.getElementById("name");
var contact=document.getElementById("number");
var email=document.getElementById("email");
var password=document.getElementById("password");
if(name.value=="")
{
	alert("Plz enter the Restaurant name");
	return false;
	
}
else if (password.value.trim()=="")
{
	alert("Plz enter the Password");
	return false;
}	
else if(password.value.trim().length<5)
{
	alert("Password must be in 5 letters");
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
	alert("Contact Must be in 10 digits");
	return false;
}
else
{
	true;
}
}
 </script>
  
  </head>
  <body>
    <div class="wrapper">
      <div class="title-text">
        <div class="title login">Restaurant</div>
<div class="title signup">
Restaurant</div>
</div>
<div class="form-container">
        <div class="slide-controls">
          <input type="radio" name="slide" id="login" checked>
          <input type="radio" name="slide" id="signup">
          <label for="login" class="slide login">Login</label>
          <label for="signup" class="slide signup">Signup</label>
          <div class="slider-tab">
</div>
</div>
<div class="form-inner">
          <form action="db_Login.jsp" class="login">
            <div class="field">
              <input type="text" placeholder="Restaurant Name" name="NAME" required>
            </div>
<div class="field">
              <input type="password" placeholder="Password" name="RPASSWORD"required>
            </div>
<div class="pass-link">
<a href="#">Forgot password?</a></div>
<div class="field btn">
              <div class="btn-layer">
</div>
<input type="submit" value="Login">
            </div>
<div class="signup-link">
Not a member? <a href="">Signup now</a></div>
</form>
<form  class="signup" action="actionRest.jsp" onsubmit="return validate();">
            <div class="field">
              <input type="email" placeholder="Email Address" id="email" name="EMAIL" >
            </div>
	<div class="field">
              <input type="text" placeholder="Restaruant Name" id="name" name="NAME" >
            </div>

<div class="field">
              <input type="text" placeholder="Contact" name="CONTACT" id="number">
            </div>
<div class="field">
              <input type="password" placeholder="password" name="RPASSWORD" id="password">
            </div>
<div class="field btn">
              <div class="btn-layer">
</div>
<input type="submit" value="Signup" action="">
            </div>
</form>
</div>
</div>
</div>
<script>
      const loginText = document.querySelector(".title-text .login");
      const loginForm = document.querySelector("form.login");
      const loginBtn = document.querySelector("label.login");
      const signupBtn = document.querySelector("label.signup");
      const signupLink = document.querySelector("form .signup-link a");
      signupBtn.onclick = (()=>{
        loginForm.style.marginLeft = "-50%";
        loginText.style.marginLeft = "-50%";
      });
      loginBtn.onclick = (()=>{
        loginForm.style.marginLeft = "0%";
        loginText.style.marginLeft = "0%";
      });
      signupLink.onclick = (()=>{
        signupBtn.click();
        return false;
      });
    </script>

  </body>
</html>
    