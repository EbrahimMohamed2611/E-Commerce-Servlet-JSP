<header>
    <!-- Begin Header Top Area -->
    <div class="header-top">
        <div class="container">
            <div class="row">
                <%--                            ${sessionScope.userDto.userId}--%>
                <!-- Begin Header Top Left Area -->
                <div class="col-lg-3 col-md-4">
                    <div class="header-top-left">
                        <ul class="phone-wrap">
                            <li>
                                <% if (request.getSession().getAttribute("userDto") != null) {
                                    out.println("  <div id=\"profileImage\" style=\"display: inline-grid;\"></div>");
                                }%>

                                Welcome <span
                                    id="fullName">${sessionScope.userDto.firstName} ${sessionScope.userDto.lastName}</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- Header Top Left Area End Here -->
                <!-- Begin Header Top Right Area -->
                <div class="col-lg-9 col-md-8">
                    <div class="header-top-right" style="
    margin-top: 10px;
">
                        <ul class="ht-menu">
                            <!-- Begin Setting Area -->
                            <li>
                                <div class="ht-setting-trigger"><span>Setting</span></div>
                                <div class="setting ht-setting">
                                    <ul class="ht-setting-list">
                                        <li><a href="login.jsp
">My Account</a></li>
                                        <li><a href="checkout.jsp
">Checkout</a></li>
                                        <li><a href="login.jsp
">Sign In</a></li>
                                    </ul>
                                </div>
                            </li>
                            <!-- Setting Area End Here -->
                            <!-- Begin Currency Area -->
                            <li>
                                <span class="currency-selector-wrapper">Currency :</span>
                                <div class="ht-currency-trigger"><span>USD $</span></div>
                                <div class="currency ht-currency">
                                    <ul class="ht-setting-list">
                                        <li><a href="#">EUR €</a></li>
                                        <li class="active"><a href="#">USD $</a></li>
                                    </ul>
                                </div>
                            </li>
                            <!-- Currency Area End Here -->
                            <!-- Begin Language Area -->
                            <li>
                                <div>
                                    <%
                                        if (request.getSession().getAttribute("userDto") == null) {
                                            out.println(" <a href=\"login.jsp\" class=\"btn btn-primary\" style=\"\n" +
                                                    "                            height: 30px;\n" +
                                                    "                            line-height: 15px;\n" +
                                                    "                            background: #fed700;\n" +
                                                    "                            border-color: #fed700;\n" +
                                                    "                            color: black;\n" +
                                                    "                        \">Login\n" +
                                                    "                                        </a>");
                                        } else {
                                            out.println("<form action=\"logout\" method=\"post\">\n" +
                                                    "  <button style=\"\n" +
                                                    "                            height: 30px;\n" +
                                                    "                            line-height: 10px;\n" +
                                                    "                            background: #fed700;\n" +
                                                    "                            border-color: #fed700;\n" +
                                                    "                            color: black;\n" +
                                                    "                        \" type=\"submit\" class=\"btn btn-warning btn-sm mb-2\" >logOut</button>\n" +
                                                    "</form>");
                                        }
                                    %>


                                </div>


                            </li>
                            <!-- Language Area End Here -->
                        </ul>
                    </div>
                </div>
                <!-- Header Top Right Area End Here -->

            </div>
        </div>
    </div>
</header>