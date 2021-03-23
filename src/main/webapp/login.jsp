<!doctype html>
<html class="no-js" lang="zxx">

<!-- login-register31:27-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Login Register || limupa - Digital Products Store eCommerce Bootstrap 4 Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png">
    <!-- Material Design Iconic Font-V2.2.0 -->
    <link rel="stylesheet" href="css/material-design-iconic-font.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- Font Awesome Stars-->
    <link rel="stylesheet" href="css/fontawesome-stars.css">
    <!-- Meanmenu CSS -->
    <link rel="stylesheet" href="css/meanmenu.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- Slick Carousel CSS -->
    <link rel="stylesheet" href="css/slick.css">
    <!-- Animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- Jquery-ui CSS -->
    <link rel="stylesheet" href="css/jquery-ui.min.css">
    <!-- Venobox CSS -->
    <link rel="stylesheet" href="css/venobox.css">
    <!-- Nice Select CSS -->
    <link rel="stylesheet" href="css/nice-select.css">
    <!-- Magnific Popup CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <!-- Bootstrap V4.1.3 Fremwork CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Helper CSS -->
    <link rel="stylesheet" href="css/helper.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Modernizr js -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->
<!-- Begin Body Wrapper -->

<div class="container">
    <div class="row">
        <div class="logo col-sm-12 " style="
    text-align: center;
    margin-top: 48px;
    margin-bottom: -78px;
">
            <a href="index.jsp
">
                <img src="images/menu/logo/1.jpg" alt="">
            </a>
        </div>

        <div class="col-sm-12 col-md-12 col-xs-12 col-lg-6 mb-30" style="
                    /* width: 50%; */
                    margin: 100px auto auto;
">
            <!-- Login Form s-->
            <form action="login" method="post">


                <div class="login-form">
                    <%
                        if (request.getParameter("invalid") != null) {
                            out.println("<div class=\"alert alert-danger\" role=\"alert\">\n" +
                                    "Incorrect userName or password\n" +
                                    "</div>");
                        }
                        if (request.getParameter("notFound") != null) {
                            out.println("<div class=\"alert alert-danger\" role=\"alert\">\n" +
                                    "This Email not found please Sign up\n" +
                                    "</div>");
                        }
                    %>

                    <%
                        if (request.getParameter("enableCookie") != null) {
                            out.println("<div class=\"alert alert-danger\" role=\"alert\">\n" +
                                    "Please Enable Cookie To use this website\n" +
                                    "</div>");
                        }
                    %>
                    <h4 class="login-title" style="
    text-align: center;
    font-size: 32px;
">Login</h4>
                    <div class="row">
                        <div class="col-md-12 col-12 mb-20">
                            <label for="email">Email Address*</label>
                            <input class="mb-0" type="email" required name="email" id="email"
                                   placeholder="Email Address">
                        </div>
                        <div class="col-12 mb-20">
                            <label for="password">Password</label>
                            <input class="mb-0" id="password" name="password" type="password"
                                   placeholder="Password">
                        </div>
                        <div class="col-md-8">
                            <div class="check-box d-inline-block ml-0 ml-md-2 mt-10">
                                <input type="checkbox" name="remember" id="remember_me">
                                <label for="remember_me">Remember me</label>
                            </div>
                        </div>
                        <div class="col-md-4 mt-10 mb-20 text-left text-md-right">
                            <a href="#"> Forgotten password ?</a>
                        </div>
                        <div class="col-md-12" style="text-align: center;   margin-left: 34%;                    ">
                            <button class="register-button mt-0" type="submit">Login</button>
                        </div>
                        <hr>
                        <span class="text-center col-sm-12" style="margin-top: 33px;">
                            Don't have an account? <a href="register.jsp">Sign up</a>
                        </span>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>

<!-- Login Content Area End Here -->

</div>
<!-- Body Wrapper End Here -->
<!-- jQuery-V1.12.4 -->
<script src="js/vendor/jquery-1.12.4.min.js"></script>
<!-- Popper js -->
<script src="js/vendor/popper.min.js"></script>
<!-- Bootstrap V4.1.3 Fremwork js -->
<script src="js/bootstrap.min.js"></script>
<!-- Ajax Mail js -->
<script src="js/ajax-mail.js"></script>
<!-- Meanmenu js -->
<script src="js/jquery.meanmenu.min.js"></script>
<!-- Wow.min js -->
<script src="js/wow.min.js"></script>
<!-- Slick Carousel js -->
<script src="js/slick.min.js"></script>
<!-- Owl Carousel-2 js -->
<script src="js/owl.carousel.min.js"></script>
<!-- Magnific popup js -->
<script src="js/jquery.magnific-popup.min.js"></script>
<!-- Isotope js -->
<script src="js/isotope.pkgd.min.js"></script>
<!-- Imagesloaded js -->
<script src="js/imagesloaded.pkgd.min.js"></script>
<!-- Mixitup js -->
<script src="js/jquery.mixitup.min.js"></script>
<!-- Countdown -->
<script src="js/jquery.countdown.min.js"></script>
<!-- Counterup -->
<script src="js/jquery.counterup.min.js"></script>
<!-- Waypoints -->
<script src="js/waypoints.min.js"></script>
<!-- Barrating -->
<script src="js/jquery.barrating.min.js"></script>
<!-- Jquery-ui -->
<script src="js/jquery-ui.min.js"></script>
<!-- Venobox -->
<script src="js/venobox.min.js"></script>
<!-- Nice Select js -->
<script src="js/jquery.nice-select.min.js"></script>
<!-- ScrollUp js -->
<script src="js/scrollUp.min.js"></script>
<!-- Main/Activator js -->
<script src="js/main.js"></script>
</body>

<!-- login-register31:27-->
</html>
