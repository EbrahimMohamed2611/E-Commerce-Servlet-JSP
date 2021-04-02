<%--
  Created by IntelliJ IDEA.
  User: Salma El-kady
  Date: 3/31/2021
  Time: 1:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="eg.gov.iti.jets.model.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="eg.gov.iti.jets.model.Purchase" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.*" %>
<%@ page import="eg.gov.iti.jets.controller.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="assets/css/app.min.css">
    <link rel="stylesheet" href="assets/bundles/datatables/datatables.min.css">
    <link rel="stylesheet" href="assets/bundles/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css">
    <!-- Template CSS -->
    <!-- Template CSS -->
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/components.css">

    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css"/>
    <link rel="stylesheet" href="../themes/customdesign2.min.css"/>
    <script src="../Js/functionalities.js"></script>
    <!-- Custom style CSS -->
    <link rel="stylesheet" href="assets/css/custom.css">
    <link rel='shortcut icon' type='image/x-icon' href='assets/img/favicon.ico'>
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

    <script>
        function deleteProd(productId) {
            console.log(productId)
            window.location.href = "remove?data=" + productId;

        }

        function edit(id ,name , desc , price , quantity , cat)
        {
           // <a href="/servlets/messageServlet?param1=value&amp;param2=value2">Send Messages</a>
            window.location.href = "editproduct?name="+name+"&desc="+desc+"&price="+price+"&quantity="+quantity+"&cat="+cat+"&id="+id;
          console.log(name+" "+desc + " " + price +" " +quantity +" "+ cat)

        }

        function editDb(id, name, des, price, quan, cat)
        {
            console.log("inside the fndbbb")
            console.log(name)
            console.log(des)
            console.log(quan)
            console.log(cat)

            document.getElementById("productName").value = name;
            document.getElementById("productDesc").value = des;
            document.getElementById("productQuantity").value = price;
            document.getElementById("productPrice").value =quan;
            document.getElementById("productCategory").value = cat;

        }

    </script>
</head>
<%--<>--%>
<%--<div class="row">--%>
<%--    <div class="col-12">--%>
<%--        <div class="card">--%>
<%--            <div class="card-header">--%>
<%--                <h4>All Products</h4>--%>
<%--            </div>--%>
<%--           --%>
<%--            --%>
<%--            <div class="card-body">--%>
<%--                <div class="table-responsive">--%>
<%--                    <table class="table" id="userTable">--%>
<%--                        <thead>--%>
<%--                        <tr>--%>

<%--                            <th>Image</th>--%>
<%--                            <th>Name</th>--%>
<%--                            <th>Description</th>--%>
<%--                            <th>Price</th>--%>
<%--                            <th>Quantity</th>--%>
<%--                            <th>Category</th>--%>
<%--                            <th>Edit</th>--%>
<%--                            <th>Delete</th>--%>

<%--                        </tr>--%>
<%--                        </thead>--%>
<%--                        <tbody>--%>
<%--                        <c:forEach items="${requestScope.products}" var="p">--%>
<%--                            <tr>--%>
<%--                                <td>--%>
<%--                                    <img src="" style="width:100%;white-space:pre">--%>
<%--                                </td>--%>
<%--                                <td class="align-middle">--%>
<%--                                        ${p.getProductName()}--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                        ${p.getDescription()}--%>
<%--                                </td>--%>
<%--                                <td>${p.getPrice()}</td>--%>
<%--                                <td>--%>
<%--                                        ${p.getQuantity()}--%>
<%--                                </td>--%>

<%--                                <td> ${p.category.getCategoryName()}</td>--%>

<%--                                <div data-role="popup" id="popupLogin" data-theme="a"--%>
<%--                                     class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b">--%>
<%--                                    <form>--%>
<%--                                        <div style="padding:10px 20px;">--%>
<%--                                            <h3>Edit the below info</h3>--%>
<%--                                            <img src="images/menu/logo/laptop.png"/>--%>
<%--                                            <label for="productName">Name:</label>--%>
<%--                                            <input type="text" name="name" id="productName" value="${p.getProductName()} " placeholder="name"--%>
<%--                                                   data-theme="a">--%>
<%--                                            <label for="productDesc" class="ui-hidden-accessible">Phone:</label>--%>
<%--                                            <input type="text" name="phone" id="productDesc" value="${p.getDescription()} "--%>
<%--                                                   placeholder="phone" data-theme="a" required>--%>
<%--                                            <label for="productPrice" class="ui-hidden-accessible">Email:</label>--%>
<%--                                            <input type="number" name="email" id="productPrice" value="${p.getPrice()}"--%>
<%--                                                   placeholder="email" data-theme="a" required>--%>
<%--                                            <input type="number" name="email" id="productQuantity" value="${p.getQuantity()}"--%>
<%--                                                   placeholder="email" data-theme="a" required>--%>
<%--                                            <input type="text" name="email" id="productCategory" value="${p.category.getCategoryName()}"--%>
<%--                                                   placeholder="email" data-theme="a" required>--%>

<%--                                            <button class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-edit"--%>
<%--                                                    type="submit"--%>
<%--                                                    onclick="edit(${p.getProductId()})">--%>
<%--                                                Edit--%>
<%--                                            </button>--%>
<%--                                        </div>--%>

<%--                                    </form>--%>

<%--                                </div>--%>
<%--                                    &lt;%&ndash;                                                                <td><a href="#popupDialog"data-rel="popup"data-position-to="window" data-transition="pop"  class="btn btn-primary ui-btn ui-corner-all ui-shadow ui-btn-inline ui-icon-delete ui-btn-icon-left ui-btn-b" onclick="deleteProd(${p.getProductId()})">Delete</a></td>&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                                                                <a href="#popupDialog" data-rel="popup" data-position-to="window" data-transition="pop"&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                                                                   class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-icon-delete ui-btn-icon-left ui-btn-b">Delete</a>&ndash;%&gt;--%>
<%--                                <td><a href="#popupDialog" data-rel="popup" data-position-to="window"--%>
<%--                                       data-transition="pop"--%>
<%--                                       class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-icon-delete ui-btn-icon-left ui-btn-b">Delete</a>--%>
<%--                                </td>--%>
<%--                                <div data-role="popup" id="popupDialog" data-overlay-theme="b" data-theme="b"--%>
<%--                                     data-dismissible="false"--%>
<%--                                     style="max-width:400px;">--%>
<%--                                    <div data-role="header" data-theme="a">--%>
<%--                                        <h1>Delete Contact</h1>--%>
<%--                                    </div>--%>
<%--                                    <div role="main" class="ui-content">--%>
<%--                                        <h3 class="ui-title">Are you sure you want to delete this contact?</h3>--%>
<%--                                        <p>This action cannot be undone.</p>--%>
<%--                                        <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b"--%>
<%--                                           data-rel="back">Cancel</a>--%>
<%--                                        <a class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b"--%>
<%--                                           data-transition="flow" onclick="deleteProd(${p.getProductId()})">Delete</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>


<%--                            </tr>--%>
<%--                        </c:forEach>--%>
<%-- --%>
<%--                        </tbody>--%>
<%--                    </table>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<body>
<div class="loader"></div>
<div id="app">
    <div class="main-wrapper main-wrapper-1">
        <div class="navbar-bg"></div>
        <nav class="navbar navbar-expand-lg main-navbar sticky">
            <div class="form-inline mr-auto">
                <ul class="navbar-nav mr-3">
                    <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg
									collapse-btn"> <i data-feather="align-justify"></i></a></li>
                    <li><a href="#" class="nav-link nav-link-lg fullscreen-btn">
                        <i data-feather="maximize"></i>
                    </a></li>

                </ul>
            </div>

        </nav>
        <div class="main-sidebar sidebar-style-2">
            <aside id="sidebar-wrapper">
                <div class="sidebar-brand">
                    <a href="dasheboard.jsp"> <img alt="image" src="assets/img/logo.png" class="header-logo"/> <span
                            class="logo-name">Otika</span>
                    </a>
                </div>
                <ul class="sidebar-menu">
                    <li class="menu-header">Main</li>
                    <li class="dropdown active">
                        <a href="dashboard.jsp" class="nav-link"><i data-feather="monitor"></i><span>Dashboard</span></a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="menu-toggle nav-link has-dropdown"><i
                                data-feather="briefcase"></i><span>Products</span></a>
                        <ul class="dropdown-menu">
                            <li><a class="nav-link" href="categories.jsp">Categories</a></li>
                            <li><a class="nav-link" href="product.jsp">Products</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="/E_Commerce_Servlet_JSP_war_exploded/admin-show-users.jsp" class="nav-link"><i
                                data-feather="briefcase"></i><span>Users</span></a>

                    </li>
                    <li class="dropdown">
                        <a href="/E_Commerce_Servlet_JSP_war_exploded/adminhome" class="nav-link"><i
                                data-feather="briefcase"></i><span>View Products</span></a>

                    </li>





                </ul>
            </aside>
        </div>
        <!-- Main Content -->
        <div class="main-content">
            <section class="section">
<%--                <div class="row ">--%>

<%--                    <div class="col-xl-4 col-md-12 col-lg-3">--%>

<%--                        <div class="card l-bg-orange">--%>
<%--                            <div class="card-body">--%>
<%--                                <div class="text-white">--%>
<%--                                    <div class="row">--%>
<%--                                        <div class="col-md-6 col-lg-5">--%>
<%--                                            <h4 class="mb-0 font-26">12000</h4>--%>
<%--                                            <p class="mb-2">Number of Users</p>--%>
<%--                                            <p class="mb-0">--%>
<%--                                                <span class="font-20">+11.25% </span>Increase--%>
<%--                                            </p>--%>
<%--                                        </div>--%>
<%--                                        <div class="col-md-6 col-lg-7">--%>
<%--                                            <div class="sparkline-bar p-t-50"></div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="col-xl-4 col-md-12 col-lg-3">--%>

<%--                        <div class="card l-bg-cyan">--%>
<%--                            <div class="card-body">--%>
<%--                                <div class="text-white">--%>
<%--                                    <div class="row">--%>
<%--                                        <div class="col-md-6 col-lg-5">--%>
<%--                                            <h4 class="mb-0 font-26">758</h4>--%>
<%--                                            <p class="mb-2">Number Of Orders</p>--%>
<%--                                            <p class="mb-0">--%>
<%--                                                <span class="font-20">+25.11%</span> Increase--%>
<%--                                            </p>--%>
<%--                                        </div>--%>
<%--                                        <div class="col-md-6 col-lg-7">--%>
<%--                                            <div class="sparkline-line-chart2 p-t-50"></div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="col-xl-4 col-md-12 col-lg-3">--%>
<%--                        <div class="card l-bg-green">--%>
<%--                            <div class="card-body">--%>
<%--                                <div class="text-white">--%>
<%--                                    <div class="row">--%>
<%--                                        <div class="col-md-6 col-lg-5">--%>
<%--                                            <h4 class="mb-0 font-26">758</h4>--%>
<%--                                            <p class="mb-2">Number Of Requests</p>--%>
<%--                                            <p class="mb-0">--%>
<%--                                                <span class="font-20">+25.11%</span> Increase--%>
<%--                                            </p>--%>
<%--                                        </div>--%>
<%--                                        <div class="col-md-6 col-lg-7">--%>
<%--                                            <div class="sparkline-line-chart2 p-t-50"></div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>


<%--                </div>--%>
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>All Products</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table" id="userTable">
                                        <thead>
                                        <tr>

                                            <th>Image</th>
                                            <th>Name</th>
                                            <th>Description</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Category</th>
                                            <th>Edit</th>
                                            <th>Delete</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${requestScope.products}" var="p">
                                            <tr>
                                                <td>
                                                    <img src="" style="width:100%;white-space:pre">
                                                </td>
                                                <td class="align-middle">
                                                        ${p.getProductName()}
                                                </td>
                                                <td>
                                                        ${p.getDescription()}
                                                </td>
                                                <td>${p.getPrice()}</td>
                                                <td>
                                                        ${p.getQuantity()}
                                                </td>

                                                <td> ${p.category.getCategoryName()}</td>

<%--                                                <div data-role="popup" id="popupLogin" data-theme="a"--%>
<%--                                                     class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b">--%>
<%--                                                    <form>--%>
<%--                                                        <div style="padding:10px 20px;">--%>
<%--                                                            <h3>Edit the below info</h3>--%>
<%--                                                            <img src="images/menu/logo/laptop.png"/>--%>
<%--                                                            <label for="productName">Name:</label>--%>
<%--                                                            <input type="text" name="name" id="productName" value="${p.getProductName()} " placeholder="name"--%>
<%--                                                                   data-theme="a">--%>
<%--                                                            <label for="productDesc" class="ui-hidden-accessible">Phone:</label>--%>
<%--                                                            <input type="text" name="phone" id="productDesc" value="${p.getDescription()} "--%>
<%--                                                                   placeholder="phone" data-theme="a" required>--%>
<%--                                                            <label for="productPrice" class="ui-hidden-accessible">Email:</label>--%>
<%--                                                            <input type="number" name="email" id="productPrice" value="${p.getPrice()}"--%>
<%--                                                                   placeholder="email" data-theme="a" required>--%>
<%--                                                            <input type="number" name="email" id="productQuantity" value="${p.getQuantity()}"--%>
<%--                                                                   placeholder="email" data-theme="a" required>--%>
<%--                                                            <input type="text" name="email" id="productCategory" value="${p.category.getCategoryName()}"--%>
<%--                                                                   placeholder="email" data-theme="a" required>--%>

<%--                                                            <button class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-edit"--%>
<%--                                                                    type="submit"--%>
<%--                                                                    onclick="edit(${p.getProductId()})">--%>
<%--                                                                Edit--%>
<%--                                                            </button>--%>
<%--                                                        </div>--%>

<%--                                                    </form>--%>

<%--                                                </div>ui-btn ui-corner-all ui-shadow ui-btn-inline ui-icon-delete ui-btn-icon-left ui-btn-b"--%>
                                                    <%--                                                                <td><a href="#popupDialog"data-rel="popup"data-position-to="window" data-transition="pop"  class="btn btn-primary ui-btn ui-corner-all ui-shadow ui-btn-inline ui-icon-delete ui-btn-icon-left ui-btn-b" onclick="deleteProd(${p.getProductId()})">Delete</a></td>--%>
                                                    <%--                                                                <a href="#popupDialog" data-rel="popup" data-position-to="window" data-transition="pop"--%>
                                                    <%--
           class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-icon-delete ui-btn-icon-left ui-btn-b">Delete</a>--%>
                                                <td><a href="" type="button" class="btn btn-primary" style="color: white;" onclick="edit('${p.getProductId()}','${p.getProductName()}' ,'${p.getDescription()} ' ,'${p.getPrice()}' , '${p.getQuantity()}','${p.category.getCategoryName()}')">Edit</a> </td>
                                                <td><a href="#popupDialog" data-rel="popup" data-position-to="window"
                                                       data-transition="pop"
                                                       class="btn btn-primary" style="color: white;">Delete</a>
                                                </td>
                                                <div data-role="popup" id="popupDialog" data-overlay-theme="b" data-theme="b"
                                                     data-dismissible="false"
                                                     style="max-width:400px;">
                                                    <div data-role="header" data-theme="a">
                                                        <h1>Delete Contact</h1>
                                                    </div>
                                                    <div role="main" class="ui-content">
                                                        <h3 class="ui-title">Are you sure you want to delete this product?</h3>
                                                        <p>This action cannot be undone.</p>
                                                        <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b"
                                                           data-rel="back">Cancel</a>
                                                        <a class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b"
                                                           data-transition="flow" onclick="deleteProd(${p.getProductId()} , )">Delete</a>
                                                    </div>
                                                </div>


                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </section>

        </div>
        <footer class="main-footer">
            <div class="footer-left">
                <a href="templateshub.net">Templateshub</a></a>
            </div>
            <div class="footer-right">
            </div>
        </footer>
    </div>
</div>
<script src="assets/js/app.min.js"></script>
<!-- JS Libraies -->
<script src="assets/bundles/apexcharts/apexcharts.min.js"></script>
<!-- JS Libraies -->
<script src="assets/bundles/chartjs/chart.min.js"></script>
<script src="assets/bundles/jquery.sparkline.min.js"></script>
<script src="assets/bundles/apexcharts/apexcharts.min.js"></script>
<script src="assets/bundles/jqvmap/dist/jquery.vmap.min.js"></script>
<script src="assets/bundles/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script src="assets/bundles/jqvmap/dist/maps/jquery.vmap.indonesia.js"></script>
<!-- Page Specific JS File -->
<script src="assets/js/widget-chart.js"></script>

<script src="assets/bundles/datatables/datatables.min.js"></script>
<script src="assets/bundles/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js"></script>
<script src="assets/bundles/jquery-ui/jquery-ui.min.js"></script>
<!-- Page Specific JS File -->
<script src="assets/js/datatables.js"></script>

<!-- Page Specific JS File -->
<script src="assets/js/index.js"></script>
<!-- Template JS File -->
<script src="assets/js/scripts.js"></script>
<!-- Custom JS File -->
<script src="assets/js/custom.js"></script>




















<!-- General JS Scripts -->
<script src="assets/js/app.min.js"></script>
<!-- JS Libraies -->
<script src="assets/bundles/apexcharts/apexcharts.min.js"></script>
<!-- JS Libraies -->
<script src="assets/bundles/chartjs/chart.min.js"></script>
<script src="assets/bundles/jquery.sparkline.min.js"></script>
<script src="assets/bundles/apexcharts/apexcharts.min.js"></script>
<script src="assets/bundles/jqvmap/dist/jquery.vmap.min.js"></script>
<script src="assets/bundles/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script src="assets/bundles/jqvmap/dist/maps/jquery.vmap.indonesia.js"></script>
<!-- Page Specific JS File -->
<script src="assets/js/widget-chart.js"></script>

<script src="assets/bundles/datatables/datatables.min.js"></script>
<script src="assets/bundles/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js"></script>
<script src="assets/bundles/jquery-ui/jquery-ui.min.js"></script>
<!-- Page Specific JS File -->
<script src="assets/js/datatables.js"></script>

<!-- Page Specific JS File -->
<script src="assets/js/index.js"></script>
<!-- Template JS File -->
<script src="assets/js/scripts.js"></script>
<!-- Custom JS File -->
<script src="assets/js/custom.js"></script>
</body>
</html>
