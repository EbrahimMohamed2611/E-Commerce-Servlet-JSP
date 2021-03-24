<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <%@include file="common/header.jsp" %>
    <title>Email Verification</title>
</head>
<body>

<div class="container">
    <div class="row">

        <div class="col-sm-12 col-md-12 col-xs-12 col-lg-6 mb-30" style=" margin: 100px auto auto;">
            <!-- Login Form s-->
            <form action="verifyCode" method="post">
                <div class="login-form">
                    <%
                        if (request.getParameter("reset") != null) {
                            out.println("<div class=\"alert alert-info\" role=\"alert\">\n" +
                                    "Please check your Email\n" +
                                    "</div>");
                        }
                    %>
                    <%
                        if (request.getParameter("notVerify") != null) {
                            out.println("<div class=\"alert alert-danger\" role=\"alert\">\n" +
                                    "Not Valid Code\n" +
                                    "</div>");
                        }
                    %>
                    <h4 class="login-title" style=" text-align: center; font-size: 32px;">Email Verification</h4>
                    <div class="row">
                        <div class="col-md-12 col-12 mb-20">
                            <label for="verificationCode">Verification Code*</label>
                            <input class="mb-0" type="text" required name="verificationCode" id="verificationCode"
                                   placeholder="Verification Code">
                        </div>
                        <div class="col-md-12" style="text-align: center; margin-left: 34%;">
                            <button class="register-button mt-0" type="submit">Verify</button>
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
