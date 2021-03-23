<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">

<!-- login-register31:27-->
<head>
    <%@include file="common/header.jsp" %>
    <title>Registration</title>
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
            <form method="post" action="registration">
                <%--                <div class="checkbox-form">--%>
                <h3>Registration Form</h3>
                <div class="row">

                    <c:if test="${!empty param['invalid']}">
                        <h4 class="col-sm-12 alert alert-danger text-center">Please follow The Instructions </h4>
                    </c:if>

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
    <p class="text-center">Have an account? <a href="login.jsp">Log In</a></p>
</div>

<!-- Login Content Area End Here -->
<%@include file="common/footer.jsp" %>
<script src="js/user.js"></script>
</body>

<!-- login-register31:27-->
</html>
