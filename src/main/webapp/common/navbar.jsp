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

<div class="header-middle pl-sm-0 pr-sm-0 pl-xs-0 pr-xs-0">
    <div class="container">
        <div class="row">
            <!-- Begin Header Logo Area -->
            <div class="col-lg-3">
                <div class="logo pb-sm-30 pb-xs-30">
                    <a href="index.jsp
">
                        <img src="images/menu/logo/1.jpg" alt="">
                    </a>
                </div>
            </div>
            <!-- Header Logo Area End Here -->
            <!-- Begin Header Middle Right Area -->
            <div class="col-lg-9 pl-0 ml-sm-15 ml-xs-15">
                <!-- Begin Header Middle Searchbox Area -->
                <form action="#" class="hm-searchbox">
                    <select id="categoriesContainer" class="nice-select select-search-category">
                        <option value="0">All</option>
                    </select>
                    <input type="text" placeholder="Enter your search key ...">
                    <button class="li-btn" type="submit"><i class="fa fa-search"></i></button>
                </form>
                <!-- Header Middle Searchbox Area End Here -->
                <!-- Begin Header Middle Right Area -->
                <div class="header-middle-right">
                    <ul class="hm-menu">
                        <!-- Begin Header Middle Wishlist Area -->
                        <li class="hm-wishlist">
                            <a href="wishlist.jsp
">
                                <span class="cart-item-count wishlist-item-count">0</span>
                                <i class="fa fa-heart-o"></i>
                            </a>
                        </li>
                        <!-- Header Middle Wishlist Area End Here -->
                        <!-- Begin Header Mini Cart Area -->
                        <li class="hm-minicart">
                            <div class="hm-minicart-trigger">
                                <span class="item-icon"></span>
                                <span class="item-text">£80.00
                                                    <span class="cart-item-count">2</span>
                                                </span>
                            </div>
                            <span></span>
                            <div class="minicart">
                                <ul class="minicart-product-list">
                                    <li>
                                        <a href="single-product.jsp
" class="minicart-product-image">
                                            <img src="images/product/small-size/5.jpg" alt="cart products">
                                        </a>
                                        <div class="minicart-product-details">
                                            <h6><a href="single-product.jsp
">Aenean eu tristique</a></h6>
                                            <span>£40 x 1</span>
                                        </div>
                                        <button class="close" title="Remove">
                                            <i class="fa fa-close"></i>
                                        </button>
                                    </li>
                                    <li>
                                        <a href="single-product.jsp
" class="minicart-product-image">
                                            <img src="images/product/small-size/6.jpg" alt="cart products">
                                        </a>
                                        <div class="minicart-product-details">
                                            <h6><a href="single-product.jsp
">Aenean eu tristique</a></h6>
                                            <span>£40 x 1</span>
                                        </div>
                                        <button class="close" title="Remove">
                                            <i class="fa fa-close"></i>
                                        </button>
                                    </li>
                                </ul>
                                <p class="minicart-total">SUBTOTAL: <span>£80.00</span></p>
                                <div class="minicart-button">
                                    <a href="shopping-cart.jsp
" class="li-button li-button-fullwidth li-button-dark">
                                        <span>View Full Cart</span>
                                    </a>
                                    <a href="checkout.jsp
" class="li-button li-button-fullwidth">
                                        <span>Checkout</span>
                                    </a>
                                </div>
                            </div>
                        </li>
                        <!-- Header Mini Cart Area End Here -->
                    </ul>
                </div>
                <!-- Header Middle Right Area End Here -->
            </div>
            <!-- Header Middle Right Area End Here -->
        </div>
    </div>
</div>
<!-- Header Middle Area End Here -->
<!-- Begin Header Bottom Area -->
<div class="header-bottom header-sticky d-none d-lg-block d-xl-block">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <!-- Begin Header Bottom Menu Area -->
                <div class="hb-menu">
                    <nav>
                        <ul>
                            <li class="dropdown-holder"><a href="index.jsp
">Home</a>
                                <ul class="hb-dropdown">
                                    <li class="active"><a href="index.jsp
">Home One</a></li>
                                    <li><a href="index-2.jsp
">Home Two</a></li>
                                    <li><a href="index-3.jsp
">Home Three</a></li>
                                    <li><a href="index-4.jsp
">Home Four</a></li>
                                </ul>
                            </li>
                            <li class="megamenu-holder"><a href="shop-left-sidebar.jsp
">Shop</a>
                                <ul class="megamenu hb-megamenu">
                                    <li><a href="shop-left-sidebar.jsp
">Shop Page Layout</a>
                                        <ul>
                                            <li><a href="shop-3-column.jsp
">Shop 3 Column</a></li>
                                            <li><a href="shop-4-column.jsp
">Shop 4 Column</a></li>
                                            <li><a href="shop-left-sidebar.jsp
">Shop Left Sidebar</a></li>
                                            <li><a href="shop-right-sidebar.jsp
">Shop Right Sidebar</a></li>
                                            <li><a href="shop-list.jsp
">Shop List</a></li>
                                            <li><a href="shop-list-left-sidebar.jsp
">Shop List Left Sidebar</a></li>
                                            <li><a href="shop-list-right-sidebar.jsp
">Shop List Right Sidebar</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="single-product-gallery-left.jsp
">Single Product Style</a>
                                        <ul>
                                            <li><a href="single-product-carousel.jsp
">Single Product Carousel</a></li>
                                            <li><a href="single-product-gallery-left.jsp
">Single Product Gallery Left</a></li>
                                            <li><a href="single-product-gallery-right.jsp
">Single Product Gallery Right</a></li>
                                            <li><a href="single-product-tab-style-top.jsp
">Single Product Tab Style Top</a></li>
                                            <li><a href="single-product-tab-style-left.jsp
">Single Product Tab Style Left</a></li>
                                            <li><a href="single-product-tab-style-right.jsp
">Single Product Tab Style Right</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="single-product.jsp
">Single Products</a>
                                        <ul>
                                            <li><a href="single-product.jsp
">Single Product</a></li>
                                            <li><a href="single-product-sale.jsp
">Single Product Sale</a></li>
                                            <li><a href="single-product-group.jsp
">Single Product Group</a></li>
                                            <li><a href="single-product-normal.jsp
">Single Product Normal</a></li>
                                            <li><a href="single-product-affiliate.jsp
">Single Product Affiliate</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown-holder"><a href="blog-left-sidebar.jsp
">Blog</a>
                                <ul class="hb-dropdown">
                                    <li class="sub-dropdown-holder"><a href="blog-left-sidebar.jsp
">Blog Grid View</a>
                                        <ul class="hb-dropdown hb-sub-dropdown">
                                            <li><a href="blog-2-column.jsp">Blog 2 Column</a></li>
                                            <li><a href="blog-3-column.jsp">Blog 3 Column</a></li>
                                            <li><a href="blog-left-sidebar.jsp
">Grid Left Sidebar</a></li>
                                            <li><a href="blog-right-sidebar.jsp
">Grid Right Sidebar</a></li>
                                        </ul>
                                    </li>
                                    <li class="sub-dropdown-holder"><a href="blog-list-left-sidebar.jsp
">Blog List View</a>
                                        <ul class="hb-dropdown hb-sub-dropdown">
                                            <li><a href="blog-list.jsp
">Blog List</a></li>
                                            <li><a href="blog-list-left-sidebar.jsp
">List Left Sidebar</a></li>
                                            <li><a href="blog-list-right-sidebar.jsp
">List Right Sidebar</a></li>
                                        </ul>
                                    </li>
                                    <li class="sub-dropdown-holder"><a href="blog-details-left-sidebar.jsp">Blog
                                        Details</a>
                                        <ul class="hb-dropdown hb-sub-dropdown">
                                            <li><a href="blog-details-left-sidebar.jsp">Left Sidebar</a></li>
                                            <li><a href="blog-details-right-sidebar.jsp
">Right Sidebar</a></li>
                                        </ul>
                                    </li>
                                    <li class="sub-dropdown-holder"><a href="blog-gallery-format.jsp
">Blog Format</a>
                                        <ul class="hb-dropdown hb-sub-dropdown">
                                            <li><a href="blog-audio-format.jsp">Blog Audio Format</a></li>
                                            <li><a href="blog-video-format.jsp
">Blog Video Format</a></li>
                                            <li><a href="blog-gallery-format.jsp
">Blog Gallery Format</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li class="megamenu-static-holder"><a href="index.jsp
">Pages</a>
                                <ul class="megamenu hb-megamenu">
                                    <li><a href="blog-left-sidebar.jsp
">Blog Layouts</a>
                                        <ul>
                                            <li><a href="blog-2-column.jsp">Blog 2 Column</a></li>
                                            <li><a href="blog-3-column.jsp">Blog 3 Column</a></li>
                                            <li><a href="blog-left-sidebar.jsp
">Grid Left Sidebar</a></li>
                                            <li><a href="blog-right-sidebar.jsp
">Grid Right Sidebar</a></li>
                                            <li><a href="blog-list.jsp
">Blog List</a></li>
                                            <li><a href="blog-list-left-sidebar.jsp
">List Left Sidebar</a></li>
                                            <li><a href="blog-list-right-sidebar.jsp
">List Right Sidebar</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="blog-details-left-sidebar.jsp">Blog Details Pages</a>
                                        <ul>
                                            <li><a href="blog-details-left-sidebar.jsp">Left Sidebar</a></li>
                                            <li><a href="blog-details-right-sidebar.jsp
">Right Sidebar</a></li>
                                            <li><a href="blog-audio-format.jsp">Blog Audio Format</a></li>
                                            <li><a href="blog-video-format.jsp
">Blog Video Format</a></li>
                                            <li><a href="blog-gallery-format.jsp
">Blog Gallery Format</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="index.jsp
">Other Pages</a>
                                        <ul>
                                            <li><a href="login.jsp
">My Account</a></li>
                                            <li><a href="checkout.jsp
">Checkout</a></li>
                                            <li><a href="compare.jsp
">Compare</a></li>
                                            <li><a href="wishlist.jsp
">Wishlist</a></li>
                                            <li><a href="shopping-cart.jsp
">Shopping Cart</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="index.jsp
">Other Pages 2</a>
                                        <ul>
                                            <li><a href="contact.jsp
">Contact</a></li>
                                            <li><a href="about-us.jsp">About Us</a></li>
                                            <li><a href="faq.jsp
">FAQ</a></li>
                                            <li><a href="404.jsp">404 Error</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="about-us.jsp">About Us</a></li>
                            <li><a href="contact.jsp
">Contact</a></li>
                            <li><a href="shop-left-sidebar.jsp
">Smartwatch</a></li>
                            <li><a href="shop-left-sidebar.jsp
">Accessories</a></li>
                        </ul>
                    </nav>
                </div>
                <!-- Header Bottom Menu Area End Here -->
            </div>
        </div>
    </div>
</div>