<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Registration Form</title>
    <%--    <%@include file="common/header.jsp" %>--%>
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
    <!-- Bootstrap V4.1.3 Framework CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Helper CSS -->
    <link rel="stylesheet" href="css/helper.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Modernizr js -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
    <link rel="stylesheet" href="css/style.css"/>


</head>
<body>
<div class="container">

    <div class="raw">
        <div class="col-sm-12 col-md-12 col-lg-6 col-xs-12">
            <form method="post" action="registration">
                <%--                <div class="checkbox-form">--%>
                <h3>Registration Form</h3>
                <div class="row">

                    <div class="col-md-6">
                        <div class="checkout-form-list">
                            <label for="firstName">First Name <span class="required">*</span></label>
                            <input placeholder="" name="firstName" id="firstName" type="text" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="checkout-form-list">
                            <label for="lastName">Last Name <span class="required">*</span></label>
                            <input placeholder="" name="lastName" id="lastName" type="text" required>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="checkout-form-list">
                            <label for="email">Email address <span class="required">*</span> </label>
                            <input onblur="checkEmail()" placeholder="" required name="email" id="email"
                                   type="email">
                        </div>
                        <div class="alert alert-danger p-1" id="emailExist" hidden>
                            Email is Exist you can Login or try using another email
                        </div>
                        <div class="alert alert-success p-1" id="emailNotExist" hidden>
                            Nice go ahead
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <div>Select your gender <span class="required">*</span> </div>

                            <label class="custom-control custom-radio custom-control-inline" >

                                <input
                                        class="custom-control-input form-control-sm"
                                        checked=""
                                        type="radio"
                                        name="gender"
                                        value="option1"
                                />
                                <span class="custom-control-label"> Male </span>
                            </label>
                            <label
                                    class="custom-control custom-radio custom-control-inline"
                            >
                                <input
                                        class="custom-control-input form-control-sm"
                                        type="radio"
                                        name="gender"
                                        value="option2"
                                />
                                <span class="custom-control-label"> Female </span>
                            </label>
                        </div>
                    </div>

                    <div class="col-md-6 mb-20">
                        <label for="password">Password<span class="required">*</span></label>
                        <input class="mb-0" id="password" name="password" onblur="passwordIsStrong()" type="password"
                               placeholder="Password" required>
                        <div class="alert alert-danger p-1" id="passwordIsStrong" hidden>
                            Password is Week Please
                        </div>
                    </div>

                    <div class="col-md-6 mb-20">
                        <label for="confirmPassword">Confirm Password<span class="required">*</span></label>
                        <input class="mb-0" name="confirmPassword" id="confirmPassword" onkeyup="passwordConfirmation()"
                               type="password" placeholder="Confirm Password" required>
                        <div class="alert alert-info p-1" id="passwordIsNotConfirmed" hidden>
                            Password is matched
                        </div>
                        <div class="alert alert-danger p-1" id="passwordIsConfirmed" hidden>
                            Password Not matched
                        </div>
                    </div>


                    <div class="col-md-6 mb-20">
                        <label for="phoneNumber">Phone Number<span class="required">*</span></label>
                        <input class="mb-0" id="phoneNumber" name="phoneNumber" type="text"
                               placeholder="phoneNumber" required>
                    </div>

                    <div class="col-md-6 mb-20">
                        <label for="birthDate">Birth date<span class="required">*</span></label>
                        <input class="mb-0" id="birthDate" name="birthDate" type="date" required placeholder="Balance">

                    </div>

                    <div class="col-md-6 mb-20">
                        <label for="balance">Balance<span class="required">*</span></label>
                        <input class="mb-0" name="balance" id="balance" type="number" required placeholder="Balance">

                    </div>


                    <div class="col-md-6 mb-20">
                        <div class="country-select clearfix">
                            <label for="country">Country <span class="required">*</span></label>
                            <select class="nice-select wide" id="country" name="country" required>
                                <option>Select your country</option>
                                <c:forEach items="${applicationScope.countries}" var="country">
                                    <option value="${country.value}">
                                            ${country.value}
                                    </option>
                                </c:forEach>
                                <%--                                    <option data-display="Bangladesh">Bangladesh</option>--%>
                            </select>
                        </div>
                    </div>


                    <div class="col-md-6">
                        <div class="checkout-form-list">
                            <label for="state">State<span class="required">*</span></label>
                            <input placeholder="" id="state" name="state" type="text" required>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="checkout-form-list">
                            <label for="city">City <span class="required">*</span></label>
                            <input placeholder="" id="city" name="city" type="text" required>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="checkout-form-list">
                            <label for="street">Street<span class="required">*</span></label>
                            <input placeholder="" id="street" name="street" type="text" required>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="checkout-form-list">
                            <label for="zipcode">zipcode <span class="required">*</span></label>
                            <input pattern="^\d{5}(?:[-\s]\d{4})?$" placeholder="" id="zipcode" name="zipcode"
                                   type="text" required>
                        </div>
                    </div>


                </div>
                <div class="col-12">
                    <button type="submit" class="register-button mt-0">Register</button>
                </div>
            </form>
        </div>
    </div>
    <%--    <div class="raw">--%>
    <%--        <aside class="col-md-6 col-sm-12" style="margin: 0 auto">--%>
    <%--            <div class="card">--%>
    <%--                <article class="card-body">--%>
    <%--                    <header class="mb-4">--%>
    <%--                        <h4 class="card-title">Sign up</h4>--%>
    <%--                    </header>--%>
    <%--                    <form method="post" action="registration">--%>
    <%--                        <div class="form-row">--%>
    <%--                            <div class="col form-group">--%>
    <%--                                <label for="firstName" class="form-label">First Name</label>--%>
    <%--                                <input--%>
    <%--                                        type="text"--%>
    <%--                                        class="form-control form-control-sm"--%>
    <%--                                        name="firstName"--%>
    <%--                                        id="firstName"--%>
    <%--                                        aria-describedby="emailHelp"--%>
    <%--                                />--%>
    <%--                            </div>--%>

    <%--                            <div class="col form-group">--%>
    <%--                                <label for="lastName" class="form-label">Last Name</label>--%>
    <%--                                <input--%>
    <%--                                        type="text"--%>
    <%--                                        class="form-control form-control-sm"--%>
    <%--                                        name="lastName"--%>
    <%--                                        id="lastName"--%>
    <%--                                        aria-describedby="emailHelp"--%>
    <%--                                />--%>
    <%--                            </div>--%>
    <%--                        </div>--%>

    <%--                        <div class="form-group">--%>
    <%--                            <label for="email" class="form-label">Email address</label>--%>
    <%--                            <input--%>
    <%--                                    type="email"--%>
    <%--                                    onblur="checkEmail()"--%>
    <%--                                    class="form-control form-control-sm"--%>
    <%--                                    name="email"--%>
    <%--                                    id="email"--%>
    <%--                                    aria-describedby="emailHelp"--%>
    <%--                                    required--%>
    <%--                            />--%>
    <%--                            <div id="emailHelp" class="form-text">--%>
    <%--                                We'll never share your email with anyone else.--%>
    <%--                            </div>--%>
    <%--                            <div class="alert alert-danger p-1" id="emailExist" hidden>--%>
    <%--                                Email is Exist you can Login or try using another email--%>
    <%--                            </div>--%>
    <%--                            <div class="alert alert-success p-1" id="emailNotExist" hidden>--%>
    <%--                                Email is Exist you can Login or try using another email--%>
    <%--                            </div>--%>
    <%--                        </div>--%>

    <%--                        <div class="form-group">--%>
    <%--                            <div class="form-group">--%>
    <%--                                <label--%>
    <%--                                        class="custom-control custom-radio custom-control-inline"--%>
    <%--                                >--%>
    <%--                                    <input--%>
    <%--                                            class="custom-control-input form-control-sm"--%>
    <%--                                            checked=""--%>
    <%--                                            type="radio"--%>
    <%--                                            name="gender"--%>
    <%--                                            value="option1"--%>
    <%--                                    />--%>
    <%--                                    <span class="custom-control-label"> Male </span>--%>
    <%--                                </label>--%>
    <%--                                <label--%>
    <%--                                        class="custom-control custom-radio custom-control-inline"--%>
    <%--                                >--%>
    <%--                                    <input--%>
    <%--                                            class="custom-control-input form-control-sm"--%>
    <%--                                            type="radio"--%>
    <%--                                            name="gender"--%>
    <%--                                            value="option2"--%>
    <%--                                    />--%>
    <%--                                    <span class="custom-control-label"> Female </span>--%>
    <%--                                </label>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>

    <%--                        <div class="form-row">--%>
    <%--                            <div class="col form-group">--%>
    <%--                                <label for="password" class="form-label">Password</label>--%>
    <%--                                <input--%>
    <%--                                        type="password"--%>
    <%--                                        onblur="passwordIsStrong()"--%>
    <%--                                        name="password"--%>
    <%--                                        class="form-control form-control-sm"--%>
    <%--                                        id="password"--%>
    <%--                                        required--%>
    <%--                                />--%>
    <%--                                <div--%>
    <%--                                        class="alert alert-danger p-1"--%>
    <%--                                        id="passwordIsStrong"--%>
    <%--                                        hidden--%>
    <%--                                >--%>
    <%--                                    Password is Week Please--%>
    <%--                                </div>--%>
    <%--                            </div>--%>

    <%--                            <div class="col form-group">--%>
    <%--                                <label for="confirmPassword" class="form-label"--%>
    <%--                                >Password</label--%>
    <%--                                >--%>
    <%--                                <input--%>
    <%--                                        type="password"--%>
    <%--                                        onkeyup="passwordConfirmation()"--%>
    <%--                                        name="confirmPassword"--%>
    <%--                                        class="form-control form-control-sm"--%>
    <%--                                        id="confirmPassword"--%>
    <%--                                        required--%>
    <%--                                />--%>
    <%--                                <div--%>
    <%--                                        class="alert alert-info p-1"--%>
    <%--                                        id="passwordIsNotConfirmed"--%>
    <%--                                        hidden--%>
    <%--                                >--%>
    <%--                                    Password is matched--%>
    <%--                                </div>--%>
    <%--                                <div--%>
    <%--                                        class="alert alert-danger p-1"--%>
    <%--                                        id="passwordIsConfirmed"--%>
    <%--                                        hidden--%>
    <%--                                >--%>
    <%--                                    Password Not matched--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>

    <%--                        <div class="form-row">--%>
    <%--                            <div class="col form-group">--%>
    <%--                                <label for="phoneNumber">Phone number</label>--%>
    <%--                                <input--%>
    <%--                                        name="phoneNumber"--%>
    <%--                                        type="text"--%>
    <%--                                        class="form-control form-control-sm"--%>
    <%--                                        id="phoneNumber"--%>
    <%--                                        required--%>
    <%--                                />--%>
    <%--                            </div>--%>
    <%--                            <div class="col form-group">--%>
    <%--                                <label for="birthDate">Birth date</label>--%>
    <%--                                <input--%>
    <%--                                        name="birthDate"--%>
    <%--                                        type="date"--%>
    <%--                                        class="form-control form-control-sm"--%>
    <%--                                        id="birthDate"--%>
    <%--                                        required--%>
    <%--                                />--%>
    <%--                            </div>--%>
    <%--                        </div>--%>

    <%--                        <div class="form-row">--%>
    <%--                            <div class="col form-group">--%>
    <%--                                <label for="balance">Balance</label>--%>
    <%--                                <input--%>
    <%--                                        name="balance"--%>
    <%--                                        type="number"--%>
    <%--                                        class="form-control form-control-sm"--%>
    <%--                                        id="balance"--%>
    <%--                                        required--%>
    <%--                                />--%>
    <%--                            </div>--%>

    <%--                            <div class="col form-group">--%>
    <%--                                <label for="country">Country</label>--%>
    <%--                                <select--%>
    <%--                                        name="country"--%>
    <%--                                        class="form-control form-control-sm"--%>
    <%--                                        id="country"--%>
    <%--                                >--%>
    <%--                                    <option>Select your country</option>--%>
    <%--                                    <c:forEach--%>
    <%--                                            items="${applicationScope.countries}"--%>
    <%--                                            var="country"--%>
    <%--                                    >--%>
    <%--                                        <option value="${country.value}">--%>
    <%--                                                ${country.value}--%>
    <%--                                        </option>--%>
    <%--                                    </c:forEach>--%>
    <%--                                </select>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>

    <%--                        <div class="form-row">--%>
    <%--                            <div class="col form-group">--%>
    <%--                                <label for="state">State</label>--%>
    <%--                                <input--%>
    <%--                                        name="state"--%>
    <%--                                        type="text"--%>
    <%--                                        class="form-control form-control-sm"--%>
    <%--                                        id="state"--%>
    <%--                                        required--%>
    <%--                                />--%>
    <%--                            </div>--%>

    <%--                            <div class="col form-group">--%>
    <%--                                <label for="city">City</label>--%>
    <%--                                <input--%>
    <%--                                        name="city"--%>
    <%--                                        type="text"--%>
    <%--                                        class="form-control form-control-sm"--%>
    <%--                                        id="city"--%>
    <%--                                        required--%>
    <%--                                />--%>
    <%--                            </div>--%>
    <%--                        </div>--%>

    <%--                        <div class="form-row">--%>
    <%--                            <div class="col form-group">--%>
    <%--                                <label for="street">Street</label>--%>
    <%--                                <input--%>
    <%--                                        name="street"--%>
    <%--                                        type="text"--%>
    <%--                                        class="form-control form-control-sm"--%>
    <%--                                        id="street"--%>
    <%--                                        required--%>
    <%--                                />--%>
    <%--                            </div>--%>

    <%--                            <div class="col form-group">--%>
    <%--                                <label for="zipCode">Zip Code</label>--%>
    <%--                                <input--%>
    <%--                                        name="zipcode"--%>
    <%--                                        type="text"--%>
    <%--                                        class="form-control form-control-sm"--%>
    <%--                                        id="zipCode"--%>
    <%--                                        pattern="^\d{5}(?:[-\s]\d{4})?$"--%>
    <%--                                        title="invalid code"--%>
    <%--                                        required--%>
    <%--                                />--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                        <div class="form-group mt-3">--%>
    <%--                            <button type="submit" class="btn btn-primary btn-block">--%>
    <%--                                Register--%>
    <%--                            </button>--%>
    <%--                        </div>--%>
    <%--                    </form>--%>
    <%--                    <hr/>--%>
    <%--                    <p class="text-center">Have an account? <a href="">Log In</a></p>--%>
    <%--                </article>--%>
    <%--            </div>--%>
    <%--        </aside>--%>
    <%--    </div>--%>
</div>


<%--<%@include file="common/footer.jsp" %>--%>
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

<script src="js/user.js"></script>
</body>
</html>
