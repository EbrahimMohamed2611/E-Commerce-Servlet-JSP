<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <%@include file="common/header.jsp" %>
    <title>Password Reset</title>
</head>
<body>

<div class="container">
    <div class="row">

        <div class="col-sm-12 col-md-12 col-xs-12 col-lg-6 mb-30" style=" margin: 100px auto auto;">
            <!-- Login Form s-->
            <form action="updatePassword" method="post">
                <div class="login-form">
<%--                    <%--%>
<%--                        if (request.getParameter("reset") != null) {--%>
<%--                            out.println("<div class=\"alert alert-info\" role=\"alert\">\n" +--%>
<%--                                    "Please check your Email \n" +--%>
<%--                                    "</div>");--%>
<%--                        }--%>
<%--                    %>--%>
                    <h4 class="login-title" style=" text-align: center; font-size: 32px;">Reset Password</h4>
                    <div class="row">
                        <div class="col-md-12 col-12 mb-20">
                            <label for="password">New Password</label>
                            <input class="mb-0" type="password" onblur="passwordIsStrong()" required name="resetPassword" id="password"
                                   placeholder="New Password">
                            <div class="alert alert-danger p-1" id="passwordIsStrong" hidden>
                                Password is Week Please
                            </div>
                        </div>
                        <div class="col-md-12 col-12 mb-20">
                            <label for="confirmPassword">Confirm Password</label>
                            <input class="mb-0" type="password" required onkeyup="passwordConfirmation()" name="confirmResetPassword" id="confirmPassword"
                                   placeholder="Confirm Password">
                            <div class="alert alert-info p-1" id="passwordIsNotConfirmed" hidden>
                                Password is matched
                            </div>
                            <div class="alert alert-danger p-1" id="passwordIsConfirmed" hidden>
                                Password Not matched
                            </div>
                        </div>
                        <div class="col-md-12" style="text-align: center; margin-left: 34%;">
                            <button class="register-button mt-0" type="submit">Reset</button>
                        </div>
                        <hr>

                    </div>
                </div>
            </form>
        </div>

    </div>
</div>

<%@include file="common/footer.jsp" %>
<script src="js/user.js"></script>
</body>

</html>
