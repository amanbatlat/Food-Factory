<%@page import="Model.Feedback"%>
<%@page import="Controller.FeedbackControl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Feedback obj=null;
String idid1=request.getParameter("Cid");
if(idid1!=null)
obj=new FeedbackControl().select((Integer.parseInt(idid1)));
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Contact us</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/AXY-Contact-Us-1.css">
    <link rel="stylesheet" href="assets/css/AXY-Contact-Us.css">
    <link rel="stylesheet" href="assets/css/Contact-Form-v2-Modal--Full-with-Google-Map.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">
</head>

<body>
    <nav class="navbar navbar-light navbar-expand-lg fixed-top" id="mainNav">
        <div class="container"><a class="navbar-brand js-scroll-trigger" href="Index.jsp">Food Factory BY AMAN &amp; MAYUR</a><button data-toggle="collapse" data-target="#navbarResponsive" class="navbar-toggler navbar-toggler-right" type="button" aria-controls="navbarResponsive"
                aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-align-justify"></i></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"></li>
                    <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#contact">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <header class="masthead text-center text-white d-flex" style="background-image:url('assets/img/header1.png');">
        <div class="container my-auto">
            <div class="row">
                <div class="col-lg-10 mx-auto">
                    <h1 class="text-uppercase"><strong class="text-uppercase text-left border-success shadow">FOOD FACTORY</strong></h1>
                    <p class="text-faded mb-5" style="color: rgb(255,239,239);">YOUR FOOD ORDER JUST BY CLICK</p>
                    <hr>
                </div>
            </div>
        </div>
    </header>
    <section id="contact" class="bg-primary" style="background-color: rgb(119,72,61);">
        <div>
            <div class="container-fluid">
                <h1>Contact Information</h1>
                <hr>
                <form id="contactForm" action="FeedbackDao" method="post"><input class="form-control" type="hidden" name="Introduction" value="This email was sent from www.awebsite.com"><input class="form-control" type="hidden" name="subject" value="Awebsite.com Contact Form"><input class="form-control" type="hidden"
                        name="to" value="email@awebsite.com">
                    <div class="form-row">
                        <div class="col-md-6">
                            <div id="successfail"></div>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="col-12 col-md-6" id="message">
                            <h2 class="h4"><i class="fa fa-envelope"></i> Contact Us<small><small class="required-input">&nbsp;(*required)</small></small>
                            </h2><input type="Text" name="Cid" value="<%if(obj!=null){obj.getCid();}else{out.println(0);}%>">
                            <div class="form-group"><label for="from-name">Name</label><span class="required-input">*</span>
                                <div class="input-group">
                                    <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-user-o"></i></span></div><input class="form-control" type="text" id="from-name" name="NAME" required placeholder="Full Name"></div>
                            </div>
                            <div class="form-group"><label for="from-email">Email</label><span class="required-input">*</span>
                                <div class="input-group">
                                    <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-envelope-o"></i></span></div><input class="form-control" type="text" id="from-email" name="EMAIL" required="" placeholder="Email Address"></div>
                            </div>
                            <div class="form-row">
                                <div class="col-12 col-sm-6 col-md-12 col-lg-6">
                                    <div class="form-group"><label for="from-phone">Phone</label><span class="required-input">*</span>
                                        <div class="input-group">
                                            <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-phone"></i></span></div><input class="form-control" type="text" id="from-phone" name="PHONE" required="" placeholder="Primary Phone"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6 col-md-12 col-lg-6">
                                    <div class="form-group"><label for="from-calltime">Gender</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-clock-o"></i></span></div><select class="form-control" id="from-calltime" name="GENDER"><optgroup label="Gender"><option value="Male" selected="">Male</option><option value="Female">Female</option></optgroup></select></div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group"><label for="from-comments">Comments</label><textarea class="form-control" id="from-comments" name="COMMENTS" placeholder="Enter Comments" rows="5"></textarea></div>
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col"><button class="btn btn-primary btn-block" type="reset" style="background-color: rgb(0,0,0);"><i class="fa fa-undo"></i> Reset</button></div>
                                    <div class="col"><button class="btn btn-primary btn-block" type="submit" style="background-color: rgb(14,3,1);">Submit <i class="fa fa-chevron-circle-right"></i></button></div>
                                </div>
                            </div>
                            <hr class="d-flex d-md-none">
                        </div>
                        <div class="col-12 col-md-6">
                            <h2 class="h4"><i class="fa fa-location-arrow"></i> Locate Us</h2>
                            <div class="form-row">
                                <div class="col-12">
                                    <div class="static-map"><a rel="noopener" href="https://www.google.com/maps/place/Daytona+International+Speedway/@29.1815062,-81.0744275,15z/data=!4m13!1m7!3m6!1s0x88e6d935da1cced3:0xa6b3e1bc0f2fc83a!2s1801+W+International+Speedway+Blvd,+Daytona+Beach,+FL+32114!3b1!8m2!3d29.187028!4d-81.0703076!3m4!1s0x88e6d949a4cb8593:0x1387c6c0b5c8cc97!8m2!3d29.1851681!4d-81.0705292"
                                            target="_blank"> </a></div>
                                </div>
                                <div class="col-sm-6 col-md-12 col-lg-6">
                                    <h2 class="h4"><i class="fa fa-user"></i> Our Info</h2>
                                    <div><span><strong>Name</strong></span></div>
                                    <div><span>Foodfactoryma@gmail.com</span></div>
                                    <div><span>www.FoodFactory.com</span></div>
                                    <hr class="d-sm-none d-md-block d-lg-none">
                                </div>
                                <div class="col-sm-6 col-md-12 col-lg-6">
                                    <h2 class="h4"><i class="fa fa-location-arrow"></i> Our Address</h2>
                                    <div><span><strong>Office Name</strong></span></div>
                                    <div><span>Food Factory</span></div>
                                    <div><span>Jetpur Rajkot</span></div>
                                    <div><abbr data-toggle="tooltip" data-placement="top" title="Office Phone: 960-152-3123">O:</abbr> 9601523123</div>
                                    <hr class="d-sm-none">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal fade" role="dialog" tabindex="-1" id="modal1">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Contact Information</h4><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">?</span></button></div>
                        <div class="modal-body">
                            <form id="contactForm" action="javascript:void(0);" method="get"><input class="form-control" type="hidden" name="Introduction" value="This email was sent from www.awebsite.com"><input class="form-control" type="hidden" name="subject" value="Awebsite.com Contact Form"><input class="form-control"
                                    type="hidden" name="to" value="email@awebsite.com">
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <div id="successfail"></div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-12 col-md-6" id="message">
                                        <h2 class="h4"><i class="fa fa-envelope"></i> Contact Us<small><small class="required-input">&nbsp;(*required)</small></small>
                                        </h2>
                                        <div class="form-group"><label for="from-name">Name</label><span class="required-input">*</span>
                                            <div class="input-group">
                                                <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-user-o"></i></span></div><input class="form-control" type="text" id="from-name" name="NAME" required="" placeholder="Full Name"></div>
                                        </div>
                                        <div class="form-group"><label for="from-email">Email</label><span class="required-input">*</span>
                                            <div class="input-group">
                                                <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-envelope-o"></i></span></div><input class="form-control" type="text" id="from-email" name="EMAIL" required="" placeholder="Email Address"></div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-12 col-sm-6 col-md-12 col-lg-6">
                                                <div class="form-group"><label for="from-phone">Phone</label><span class="required-input">*</span>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-phone"></i></span></div><input class="form-control" type="text" id="from-phone" name="PHONE" required="" placeholder="Primary Phone"></div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-6 col-md-12 col-lg-6">
                                                <div class="form-group"><label for="from-calltime">Best Time to Call</label>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-clock-o"></i></span></div><select class="form-control" id="from-calltime" name="call time"><optgroup label="Best Time to Call"><option value="Morning" selected="">Morning</option><option value="Afternoon">Afternoon</option><option value="Evening">Evening</option></optgroup></select></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group"><label for="from-comments">Comments</label><textarea class="form-control" id="from-comments" name="comments" placeholder="Enter Comments" rows="5"></textarea></div>
                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col"><button class="btn btn-primary btn-block" type="reset"><i class="fa fa-undo"></i> Reset</button></div>
                                                <div class="col"><button class="btn btn-primary btn-block" type="submit">Submit <i class="fa fa-chevron-circle-right"></i></button></div>
                                            </div>
                                        </div>
                                        <hr class="d-flex d-md-none">
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <h2 class="h4"><i class="fa fa-location-arrow"></i> Locate Us</h2>
                                        <div class="form-row">
                                            <div class="col-12">
                                                <div class="static-map"><a rel="noopener" href="https://www.google.com/maps/place/Daytona+International+Speedway/@29.1815062,-81.0744275,15z/data=!4m13!1m7!3m6!1s0x88e6d935da1cced3:0xa6b3e1bc0f2fc83a!2s1801+W+International+Speedway+Blvd,+Daytona+Beach,+FL+32114!3b1!8m2!3d29.187028!4d-81.0703076!3m4!1s0x88e6d949a4cb8593:0x1387c6c0b5c8cc97!8m2!3d29.1851681!4d-81.0705292"
                                                        target="_blank"> <img class="img-fluid" src="http://maps.googleapis.com/maps/api/staticmap?autoscale=2&amp;size=600x210&amp;maptype=roadmap&amp;format=png&amp;visual_refresh=true&amp;markers=size:mid%7Ccolor:0xff0000%7Clabel:%7C582+1801+W+International+Speedway+Blvd+Daytona+Beach+FL+32114&amp;zoom=12" alt="Google Map of Daytona International Speedway"></a></div>
                                            </div>
                                            <div class="col-sm-6 col-md-12 col-lg-6">
                                                <h2 class="h4"><i class="fa fa-user"></i> Our Info</h2>
                                                <div><span><strong>Name</strong></span></div>
                                                <div><span>email@awebsite.com</span></div>
                                                <div><span>www.awebsite.com</span></div>
                                                <hr class="d-sm-none d-md-block d-lg-none">
                                            </div>
                                            <div class="col-sm-6 col-md-12 col-lg-6">
                                                <h2 class="h4"><i class="fa fa-location-arrow"></i> Our Address</h2>
                                                <div><span><strong>Office Name</strong></span></div>
                                                <div><span>55 Icannot Dr</span></div>
                                                <div><span>Daytone Beach, FL 85150</span></div>
                                                <div><abbr data-toggle="tooltip" data-placement="top" title="Office Phone: 555-867-5309">O:</abbr> 555-867-5309</div>
                                                <hr class="d-sm-none">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
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
    <script src="assets/js/Contact-Form-v2-Modal--Full-with-Google-Map.js"></script>
</body>

</html>