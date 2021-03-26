<%--
  Created by IntelliJ IDEA.
  User: EbrahimMohamed
  Date: 3/24/2021
  Time: 1:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Forget Password</title>
    <%@include file="common/header.jsp" %>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="logo col-sm-12 " style="
    text-align: center;
    margin-top: 48px;
    margin-bottom: -78px;
">
            <a href="index.jsp">
                <img src="images/menu/logo/1.jpg" alt="">
            </a>
        </div>

        <div class="col-sm-12 col-md-12 col-xs-12 col-lg-6 mb-30" style="
                    /* width: 50%; */
                    margin: 100px auto auto;
">

            <form action="forgetPassword" method="post">


                <div class="login-form">
                    <%
                        if (request.getParameter("emailNotFound") != null) {
                            out.println("<div class=\"alert alert-danger\" role=\"alert\">\n" +
                                    "This Email not found \n" +
                                    "</div>");
                        }
                    %>


                    <h4 class="login-title" style="  text-align: center;  font-size: 32px;  ">Forget Password</h4>
                    <div class="row">
                        <div class="col-md-12 col-12 mb-20">
                            <label for="email">Email Address*</label>
                            <input class="mb-0" type="email" required name="email" id="email"
                                   placeholder="Email Address">
                        </div>


                        <div class="col-md-12" style="text-align: center;   margin-left: 34%;                    ">
                            <button class="register-button mt-0" type="submit">Send Password Reset</button>
                        </div>
                        <hr>

                    </div>
                </div>
            </form>
        </div>

    </div>
</div>
<%@include file="common/footer.jsp" %>
</body>
</html>
