<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">

<!-- shop-4-column31:48-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Shop Four Column || limupa - Digital Products Store eCommerce Bootstrap 4 Template</title>
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
    <c:if test="${not empty requestScope.pages}">
        <script>
            var maxPages = ${requestScope.pages};
        </script>
    </c:if>
</head>

<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->
<!-- Begin Body Wrapper -->
<div class="body-wrapper">
    <!-- Begin Header Area -->
    <%@include file="common/navbar.jsp" %>

    <!-- Header Area End Here -->
    <!-- Begin Li's Breadcrumb Area -->
    <div class="breadcrumb-area">
        <div class="container">
            <div class="breadcrumb-content">
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li class="active">Shop</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Li's Breadcrumb Area End Here -->
    <!-- Begin Li's Content Wraper Area -->
    <div class="content-wraper pt-60 pb-60">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <!-- Begin Li's Banner Area -->
                    <div class="single-banner shop-page-banner">
                        <a href="#">
                            <img src="images/bg-banner/2.jpg" alt="Li's Static Banner">
                        </a>
                    </div>
                    <!-- Li's Banner Area End Here -->
                    <!-- shop-top-bar start -->
                    <div class="shop-top-bar mt-30">
                        <div class="shop-bar-inner">
                            <div class="product-view-mode">
                                <!-- shop-item-filter-list start -->
                                <ul class="nav shop-item-filter-list" role="tablist">
                                    <li class="active" role="presentation"><a aria-selected="true"
                                                                              class="active show" data-toggle="tab"
                                                                              role="tab"
                                                                              aria-controls="grid-view"
                                                                              href="#grid-view"><i
                                            class="fa fa-th"></i></a>
                                    </li>
                                    <li role="presentation"><a data-toggle="tab" role="tab"
                                                               aria-controls="list-view" href="#list-view"><i
                                            class="fa fa-th-list"></i></a></li>
                                </ul>
                                <!-- shop-item-filter-list end -->
                            </div>
                            <div class="toolbar-amount">
                                <span></span>
                            </div>
                        </div>
                        <div>
                            <div id="slider-range"></div>
                            <div style="min-width: 20vw; text-align: center; padding: .5vw;">
                                Price range: <span id="amount" style="font-weight:bold;margin-right: 1vw;"></span>
                                <span class="reply-btn pt-15 pt-xs-5"><a id="filterPrice" class="filter"
                                                                         href="#">filter</a></span>
                            </div>
                        </div>
                        <!-- product-select-box start -->
                        <div class="product-select-box">
                            <div class="product-short">
                                <p>Sort By:</p>
                                <select id="sortSelector" class="nice-select">
                                    <option value="trending">Relevance</option>
                                    <option value="n-asc">Name (A - Z)</option>
                                    <option value="n-desc">Name (Z - A)</option>
                                    <option value="p-asc">Price (Low &gt; High)</option>
                                    <option value="p-desc">Price (High &gt; Low)</option>
                                </select>
                            </div>
                        </div>
                        <!-- product-select-box end -->
                    </div>
                    <!-- shop-top-bar end -->
                    <!-- shop-products-wrapper start -->
                    <div class="shop-products-wrapper">
                        <div class="tab-content">
                            <div id="grid-view" class="tab-pane fade active show" role="tabpanel">
                                <div class="product-area shop-product-area">
                                    <div id="productContainer" class="row">
                                        <jsp:include page="productList.jsp"/>
                                    </div>
                                </div>
                            </div>
                            <div id="list-view" class="tab-pane product-list-view fade" role="tabpanel">
                                <div class="row">
                                    <div class="col">
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.jsp">
                                                        <img src="images/product/large-size/12.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.jsp">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.jsp
">Hummingbird printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung
                                                            Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire
                                                            Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream
                                                            And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.jsp
"><i class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.jsp
">
                                                        <img src="images/product/large-size/11.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.jsp
">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.jsp
">Hummingbird printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung
                                                            Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire
                                                            Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream
                                                            And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.jsp
"><i class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.jsp
">
                                                        <img src="images/product/large-size/10.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.jsp
">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.jsp
">Hummingbird printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung
                                                            Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire
                                                            Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream
                                                            And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.jsp
"><i class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.jsp
">
                                                        <img src="images/product/large-size/9.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.jsp
">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.jsp
">Hummingbird printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung
                                                            Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire
                                                            Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream
                                                            And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.jsp
"><i class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.jsp
">
                                                        <img src="images/product/large-size/8.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.jsp
">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.jsp
">Hummingbird printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung
                                                            Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire
                                                            Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream
                                                            And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.jsp
"><i class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.jsp
">
                                                        <img src="images/product/large-size/7.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.jsp
">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.jsp
">Hummingbird printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung
                                                            Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire
                                                            Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream
                                                            And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.jsp
"><i class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.jsp
">
                                                        <img src="images/product/large-size/6.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.jsp
">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.jsp
">Hummingbird printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung
                                                            Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire
                                                            Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream
                                                            And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.jsp
"><i class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.jsp
">
                                                        <img src="images/product/large-size/5.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.jsp
">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.jsp
">Hummingbird printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung
                                                            Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire
                                                            Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream
                                                            And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.jsp
"><i class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.jsp
">
                                                        <img src="images/product/large-size/4.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.jsp
">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.jsp
">Hummingbird printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung
                                                            Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire
                                                            Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream
                                                            And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.jsp
"><i class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.jsp
">
                                                        <img src="images/product/large-size/3.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.jsp
">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.jsp
">Hummingbird printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung
                                                            Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire
                                                            Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream
                                                            And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.jsp
"><i class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.jsp
">
                                                        <img src="images/product/large-size/2.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.jsp
">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.jsp
">Hummingbird printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung
                                                            Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire
                                                            Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream
                                                            And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.jsp
"><i class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list last-child">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.jsp
">
                                                        <img src="images/product/large-size/1.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.jsp
">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i
                                                                            class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.jsp
">Hummingbird printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung
                                                            Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire
                                                            Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream
                                                            And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.jsp
"><i class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="paginatoin-area">

                            </div>
                        </div>
                    </div>
                    <!-- shop-products-wrapper end -->
                </div>
            </div>
        </div>
    </div>
    <!-- Content Wraper Area End Here -->
    <!-- Begin Footer Area -->
    <div class="footer">
        <!-- Begin Footer Static Top Area -->
        <div class="footer-static-top">
            <div class="container">
                <!-- Begin Footer Shipping Area -->
                <div class="footer-shipping pt-60 pb-55 pb-xs-25">
                    <div class="row">
                        <!-- Begin Li's Shipping Inner Box Area -->
                        <div class="col-lg-3 col-md-6 col-sm-6 pb-sm-55 pb-xs-55">
                            <div class="li-shipping-inner-box">
                                <div class="shipping-icon">
                                    <img src="images/shipping-icon/1.png" alt="Shipping Icon">
                                </div>
                                <div class="shipping-text">
                                    <h2>Free Delivery</h2>
                                    <p>And free returns. See checkout for delivery dates.</p>
                                </div>
                            </div>
                        </div>
                        <!-- Li's Shipping Inner Box Area End Here -->
                        <!-- Begin Li's Shipping Inner Box Area -->
                        <div class="col-lg-3 col-md-6 col-sm-6 pb-sm-55 pb-xs-55">
                            <div class="li-shipping-inner-box">
                                <div class="shipping-icon">
                                    <img src="images/shipping-icon/2.png" alt="Shipping Icon">
                                </div>
                                <div class="shipping-text">
                                    <h2>Safe Payment</h2>
                                    <p>Pay with the world's most popular and secure payment methods.</p>
                                </div>
                            </div>
                        </div>
                        <!-- Li's Shipping Inner Box Area End Here -->
                        <!-- Begin Li's Shipping Inner Box Area -->
                        <div class="col-lg-3 col-md-6 col-sm-6 pb-xs-30">
                            <div class="li-shipping-inner-box">
                                <div class="shipping-icon">
                                    <img src="images/shipping-icon/3.png" alt="Shipping Icon">
                                </div>
                                <div class="shipping-text">
                                    <h2>Shop with Confidence</h2>
                                    <p>Our Buyer Protection covers your purchasefrom click to delivery.</p>
                                </div>
                            </div>
                        </div>
                        <!-- Li's Shipping Inner Box Area End Here -->
                        <!-- Begin Li's Shipping Inner Box Area -->
                        <div class="col-lg-3 col-md-6 col-sm-6 pb-xs-30">
                            <div class="li-shipping-inner-box">
                                <div class="shipping-icon">
                                    <img src="images/shipping-icon/4.png" alt="Shipping Icon">
                                </div>
                                <div class="shipping-text">
                                    <h2>24/7 Help Center</h2>
                                    <p>Have a question? Call a Specialist or chat online.</p>
                                </div>
                            </div>
                        </div>
                        <!-- Li's Shipping Inner Box Area End Here -->
                    </div>
                </div>
                <!-- Footer Shipping Area End Here -->
            </div>
        </div>
        <!-- Footer Static Top Area End Here -->
        <!-- Begin Footer Static Middle Area -->
        <div class="footer-static-middle">
            <div class="container">
                <div class="footer-logo-wrap pt-50 pb-35">
                    <div class="row">
                        <!-- Begin Footer Logo Area -->
                        <div class="col-lg-4 col-md-6">
                            <div class="footer-logo">
                                <img src="images/menu/logo/1.jpg" alt="Footer Logo">
                                <p class="info">
                                    We are a team of designers and developers that create high quality HTML
                                    Template &
                                    Woocommerce, Shopify Theme.
                                </p>
                            </div>
                            <ul class="des">
                                <li>
                                    <span>Address: </span>
                                    6688Princess Road, London, Greater London BAS 23JK, UK
                                </li>
                                <li>
                                    <span>Phone: </span>
                                    <a href="#">(+123) 123 321 345</a>
                                </li>
                                <li>
                                    <span>Email: </span>
                                    <a href="mailto://info@yourdomain.com">info@yourdomain.com</a>
                                </li>
                            </ul>
                        </div>
                        <!-- Footer Logo Area End Here -->
                        <!-- Begin Footer Block Area -->
                        <div class="col-lg-2 col-md-3 col-sm-6">
                            <div class="footer-block">
                                <h3 class="footer-block-title">Product</h3>
                                <ul>
                                    <li><a href="#">Prices drop</a></li>
                                    <li><a href="#">New products</a></li>
                                    <li><a href="#">Best sales</a></li>
                                    <li><a href="#">Contact us</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- Footer Block Area End Here -->
                        <!-- Begin Footer Block Area -->
                        <div class="col-lg-2 col-md-3 col-sm-6">
                            <div class="footer-block">
                                <h3 class="footer-block-title">Our company</h3>
                                <ul>
                                    <li><a href="#">Delivery</a></li>
                                    <li><a href="#">Legal Notice</a></li>
                                    <li><a href="#">About us</a></li>
                                    <li><a href="#">Contact us</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- Footer Block Area End Here -->
                        <!-- Begin Footer Block Area -->
                        <div class="col-lg-4">
                            <div class="footer-block">
                                <h3 class="footer-block-title">Follow Us</h3>
                                <ul class="social-link">
                                    <li class="twitter">
                                        <a href="https://twitter.com/" data-toggle="tooltip" target="_blank"
                                           title="Twitter">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li class="rss">
                                        <a href="https://rss.com/" data-toggle="tooltip" target="_blank"
                                           title="RSS">
                                            <i class="fa fa-rss"></i>
                                        </a>
                                    </li>
                                    <li class="google-plus">
                                        <a href="https://www.plus.google.com/discover" data-toggle="tooltip"
                                           target="_blank" title="Google +">
                                            <i class="fa fa-google-plus"></i>
                                        </a>
                                    </li>
                                    <li class="facebook">
                                        <a href="https://www.facebook.com/" data-toggle="tooltip"
                                           target="_blank" title="Facebook">
                                            <i class="fa fa-facebook"></i>
                                        </a>
                                    </li>
                                    <li class="youtube">
                                        <a href="https://www.youtube.com/" data-toggle="tooltip" target="_blank"
                                           title="Youtube">
                                            <i class="fa fa-youtube"></i>
                                        </a>
                                    </li>
                                    <li class="instagram">
                                        <a href="https://www.instagram.com/" data-toggle="tooltip"
                                           target="_blank" title="Instagram">
                                            <i class="fa fa-instagram"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <!-- Begin Footer Newsletter Area -->
                            <div class="footer-newsletter">
                                <h4>Sign up to newsletter</h4>
                                <form action="#" method="post" id="mc-embedded-subscribe-form"
                                      name="mc-embedded-subscribe-form" class="footer-subscribe-form validate"
                                      target="_blank" novalidate>
                                    <div id="mc_embed_signup_scroll">
                                        <div id="mc-form" class="mc-form subscribe-form form-group">
                                            <input id="mc-email" type="email" autocomplete="off"
                                                   placeholder="Enter your email"/>
                                            <button class="btn" id="mc-submit">Subscribe</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- Footer Newsletter Area End Here -->
                        </div>
                        <!-- Footer Block Area End Here -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Static Middle Area End Here -->
        <!-- Begin Footer Static Bottom Area -->
        <div class="footer-static-bottom pt-55 pb-55">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Begin Footer Links Area -->
                        <div class="footer-links">
                            <ul>
                                <li><a href="#">Online Shopping</a></li>
                                <li><a href="#">Promotions</a></li>
                                <li><a href="#">My Orders</a></li>
                                <li><a href="#">Help</a></li>
                                <li><a href="#">Customer Service</a></li>
                                <li><a href="#">Support</a></li>
                                <li><a href="#">Most Populars</a></li>
                                <li><a href="#">New Arrivals</a></li>
                                <li><a href="#">Special Products</a></li>
                                <li><a href="#">Manufacturers</a></li>
                                <li><a href="#">Our Stores</a></li>
                                <li><a href="#">Shipping</a></li>
                                <li><a href="#">Payments</a></li>
                                <li><a href="#">Warantee</a></li>
                                <li><a href="#">Refunds</a></li>
                                <li><a href="#">Checkout</a></li>
                                <li><a href="#">Discount</a></li>
                                <li><a href="#">Refunds</a></li>
                                <li><a href="#">Policy Shipping</a></li>
                            </ul>
                        </div>
                        <!-- Footer Links Area End Here -->
                        <!-- Begin Footer Payment Area -->
                        <div class="copyright text-center">
                            <a href="#">
                                <img src="images/payment/1.png" alt="">
                            </a>
                        </div>
                        <!-- Footer Payment Area End Here -->
                        <!-- Begin Copyright Area -->
                        <div class="copyright text-center pt-25">
                                    <span><a target="_blank" href="https://www.templateshub.net">Templates
                                            Hub</a></span>
                        </div>
                        <!-- Copyright Area End Here -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Static Bottom Area End Here -->
    </div>
    <!-- Footer Area End Here -->
    <!-- Begin Quick View | Modal Area -->
    <div class="modal fade modal-wrapper" id="exampleModalCenter">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <div class="modal-inner-area row">
                        <div class="col-lg-5 col-md-6 col-sm-6">
                            <!-- Product Details Left -->
                            <div class="product-details-left">
                                <div class="product-details-images slider-navigation-1">
                                    <div class="lg-image">
                                        <img id="productImage" src="images/product/large-size/1.jpg"
                                             alt="product image">
                                    </div>
                                    <%-- <div class="lg-image">--%>
                                    <%-- <img src="images/product/large-size/2.jpg" alt="product image">--%>
                                    <%-- </div>--%>
                                    <%-- <div class="lg-image">--%>
                                    <%-- <img src="images/product/large-size/3.jpg"
                                        alt="product image">--%>
                                    <%-- </div>--%>
                                    <%-- <div class="lg-image">--%>
                                    <%-- <img src="images/product/large-size/4.jpg"
                                        alt="product image">--%>
                                    <%-- </div>--%>
                                    <%-- <div class="lg-image">--%>
                                    <%-- <img
                                        src="images/product/large-size/5.jpg"
                                        alt="product image">--%>
                                    <%-- </div>--%>
                                    <%-- <div class="lg-image">
                                        --%>
                                    <%-- <img
                                        src="images/product/large-size/6.jpg"
                                        alt="product image">
                                        --%>
                                    <%-- </div>--%>
                                </div>
                                <%-- <div class="product-details-thumbs slider-thumbs-1">--%>
                                <%-- <div class="sm-image"><img src="images/product/small-size/1.jpg" --%>
                                <%-- alt="product image thumb">
                    </div>--%>
                                <%-- <div class="sm-image"><img src="images/product/small-size/2.jpg" --%>
                                <%-- alt="product image thumb">
                        </div>--%>
                                <%-- <div class="sm-image"><img src="images/product/small-size/3.jpg" --%>
                                <%-- alt="product image thumb">
                        </div>--%>
                                <%-- <div class="sm-image"><img src="images/product/small-size/4.jpg" --%>
                                <%-- alt="product image thumb">
                        </div>--%>
                                <%-- <div class="sm-image"><img src="images/product/small-size/5.jpg" --%>
                                <%-- alt="product image thumb">
                        </div>--%>
                                <%-- <div class="sm-image"><img src="images/product/small-size/6.jpg" --%>
                                <%-- alt="product image thumb">
                        </div>--%>
                                <%-- </div>--%>
                            </div>
                            <!--// Product Details Left -->
                        </div>

                        <div class="col-lg-7 col-md-6 col-sm-6">
                            <div class="product-details-view-content pt-60">
                                <div class="product-info">
                                    <h2 id="productName" class="mb-1"></h2>
                                    <div class="rating-box">
                                        <ul class="rating rating-with-review-item">
                                            <li><i class="fa fa-star-o"></i></li>
                                            <li><i class="fa fa-star-o"></i></li>
                                            <li><i class="fa fa-star-o"></i></li>
                                            <li class="no-star"><i class="fa fa-star-o"></i></li>
                                            <li class="no-star"><i class="fa fa-star-o"></i></li>
                                        </ul>
                                    </div>
                                    <div class="price-box pt-20">
                                        <span id="productPrice" class="new-price new-price-2"></span>
                                    </div>
                                    <div class="product-desc">
                                        <p>
                                            <span id="productDescription"></span>
                                        </p>
                                    </div>
                                    <div class="single-add-to-cart">
                                        <form action="#" class="cart-quantity">
                                            <div class="quantity">
                                                <label>Quantity</label>
                                                <div class="cart-plus-minus">
                                                    <input class="cart-plus-minus-box" value="1" type="text">
                                                    <div class="dec qtybutton"><i class="fa fa-angle-down"></i></div>
                                                    <div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
                                                </div>
                                            </div>
                                            <button class="add-to-cart" type="submit">Add to cart</button>
                                        </form>
                                    </div>
                                    <div class="product-additional-info pt-25">
                                        <a class="wishlist-btn" href="wishlist.jsp"><i class="fa fa-heart-o"></i>Add to
                                            wishlist</a>
                                        <div class="product-social-sharing pt-25">
                                            <ul>
                                                <li class="facebook"><a href="#"><i class="fa fa-facebook"></i>Facebook</a>
                                                </li>
                                                <li class="twitter"><a href="#"><i class="fa fa-twitter"></i>Twitter</a>
                                                </li>
                                                <li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i>Google
                                                    +</a></li>
                                                <li class="instagram"><a href="#"><i class="fa fa-instagram"></i>Instagram</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Quick View | Modal Area End Here -->
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
<!-- Ajax Request for modal js -->
<script src="js/ajax-product.js"></script>
<script src="js/ajax-shoppingCart.js"></script>
<script>
    $(function () {
        let maxPrice = 500;
        <c:if test="${not empty requestScope.maxPrice}">
        maxPrice = ${requestScope.maxPrice};
        </c:if>
        $("#slider-range").slider({
            range: true,
            min: 0,
            max: maxPrice,
            values: [0, maxPrice],
            slide: function (event, ui) {
                $("#amount").text("$" + ui.values[0] + " - $" + ui.values[1]);
            }
        });
        $("#amount").text("$" + $("#slider-range").slider("values", 0) +
            " - $" + $("#slider-range").slider("values", 1));
    });
</script>
<script src="js/ajax-filter.js"></script>
<script src="js/product-sort.js"></script>
<script src="js/ajax-pagination.js"></script>
<script src="js/user.js"></script>
</body>

<!-- shop-4-column31:48-->

</html>
