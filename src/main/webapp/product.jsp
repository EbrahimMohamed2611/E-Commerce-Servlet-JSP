<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="eg.gov.iti.jets.model.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="eg.gov.iti.jets.model.Purchase" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.*" %>
<%@ page import="eg.gov.iti.jets.controller.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">


<!-- widget-chart.html  21 Nov 2019 03:49:32 GMT -->
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <title>Otika - Admin Dashboard Template</title>
    <!-- General CSS Files -->
    <link rel="stylesheet" href="pages/assets/css/app.min.css">
    <link rel="stylesheet" href="pages/assets/bundles/jqvmap/dist/jqvmap.min.css">
    <link rel="stylesheet" href="pages/assets/bundles/flag-icon-css/css/flag-icon.min.css">
    <!-- Template CSS -->
    <link rel="stylesheet" href="pages/assets/css/style.css">
    <link rel="stylesheet" href="pages/assets/css/components.css">
    <!-- Custom style CSS -->
    <link rel="stylesheet" href="pages/assets/css/custom.css">
    <link rel='shortcut icon' type='image/x-icon' href='pages/assets/img/favicon.ico'/>
    <link rel='stylesheet' href='css/style.css'/>
    <style>
        table {
            border-collapse: collapse;
            table-layout: fixed;
            width: 350px;
        }
        table td {
            word-wrap: break-word;
        }
    </style>
    <script>
        function deleteProd(productId) {
            console.log(productId)
            window.location.href = "remove?data=" + productId;
        }
        function nav() {
            window.location.href = "dashboard.jsp";
        }
        function navcat() {
            window.location.href = "categories.jsp";
        }
        function navpro() {
            window.location.href = "product.jsp";
        }
        function edit(id, name, desc, price, quantity, cat, imgPath, imgName) {
            console.log(name + " " + desc + " " + price + " " + quantity + " " + cat, " " + imgPath + " " + imgName)
            // <a href="/servlets/messageServlet?param1=value&amp;param2=value2">Send Messages</a>
            window.location.href = "editproduct?name=" + name + "&desc=" + desc + "&price=" + price + "&quantity=" + quantity + "&id=" + id + "&cat=" + cat + "&imgPath=" + imgPath + "&imgName=" + imgName;
            //   console.log(name+" "+desc + " " + price +" " +quantity +" "+ cat , " "+imgPath+" "+imgName)
        }
        function navpro() {
            window.location.href = " addNewProduct";
        }
        function editDb(id, name, des, price, quan, cat) {
            console.log("inside the fndbbb")
            console.log(name)
            console.log(des)
            console.log(quan)
            console.log(cat)
            document.getElementById("productName").value = name;
            document.getElementById("productDesc").value = des;
            document.getElementById("productQuantity").value = price;
            document.getElementById("productPrice").value = quan;
            document.getElementById("productCategory").value = cat;
        }
    </script>
</head>

<body onload="getAllCategory()">
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
                    <li>
                        <form class="form-inline mr-auto">
                            <div class="search-element">
                                <input class="form-control" type="search" placeholder="Search" aria-label="Search"
                                       data-width="200">
                                <button class="btn" type="submit">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </form>
                    </li>
                </ul>
            </div>
            <ul class="navbar-nav navbar-right">
                <li class="dropdown dropdown-list-toggle"><a href="#" data-toggle="dropdown"
                                                             class="nav-link nav-link-lg message-toggle"><i
                        data-feather="mail"></i>
                    <span class="badge headerBadge1">
                6 </span> </a>
                    <div class="dropdown-menu dropdown-list dropdown-menu-right pullDown">
                        <div class="dropdown-header">
                            Messages
                            <div class="float-right">
                                <a href="#">Mark All As Read</a>
                            </div>
                        </div>
                        <div class="dropdown-list-content dropdown-list-message">
                            <a href="#" class="dropdown-item"> <span class="dropdown-item-avatar
											text-white"> <img alt="image" src="pages/assets/img/users/user-1.png"
                                                              class="rounded-circle">
                  </span> <span class="dropdown-item-desc"> <span class="message-user">John
                      Deo</span>
                    <span class="time messege-text">Please check your mail !!</span>
                    <span class="time">2 Min Ago</span>
                  </span>
                            </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-avatar text-white">
                    <img alt="image" src="pages/assets/img/users/user-2.png" class="rounded-circle">
                  </span> <span class="dropdown-item-desc"> <span class="message-user">Sarah
                      Smith</span> <span class="time messege-text">Request for leave
                      application</span>
                    <span class="time">5 Min Ago</span>
                  </span>
                        </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-avatar text-white">
                    <img alt="image" src="pages/assets/img/users/user-5.png" class="rounded-circle">
                  </span> <span class="dropdown-item-desc"> <span class="message-user">Jacob
                      Ryan</span> <span class="time messege-text">Your payment invoice is
                      generated.</span> <span class="time">12 Min Ago</span>
                  </span>
                        </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-avatar text-white">
                    <img alt="image" src="pages/assets/img/users/user-4.png" class="rounded-circle">
                  </span> <span class="dropdown-item-desc"> <span class="message-user">Lina
                      Smith</span> <span class="time messege-text">hii John, I have upload
                      doc
                      related to task.</span> <span class="time">30
                      Min Ago</span>
                  </span>
                        </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-avatar text-white">
                    <img alt="image" src="pages/assets/img/users/user-3.png" class="rounded-circle">
                  </span> <span class="dropdown-item-desc"> <span class="message-user">Jalpa
                      Joshi</span> <span class="time messege-text">Please do as specify.
                      Let me
                      know if you have any query.</span> <span class="time">1
                      Days Ago</span>
                  </span>
                        </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-avatar text-white">
                    <img alt="image" src="pages/assets/img/users/user-2.png" class="rounded-circle">
                  </span> <span class="dropdown-item-desc"> <span class="message-user">Sarah
                      Smith</span> <span class="time messege-text">Client Requirements</span>
                    <span class="time">2 Days Ago</span>
                  </span>
                        </a>
                        </div>
                        <div class="dropdown-footer text-center">
                            <a href="#">View All <i class="fas fa-chevron-right"></i></a>
                        </div>
                    </div>
                </li>
                <li class="dropdown dropdown-list-toggle"><a href="#" data-toggle="dropdown"
                                                             class="nav-link notification-toggle nav-link-lg"><i
                        data-feather="bell" class="bell"></i>
                </a>
                    <div class="dropdown-menu dropdown-list dropdown-menu-right pullDown">
                        <div class="dropdown-header">
                            Notifications
                            <div class="float-right">
                                <a href="#">Mark All As Read</a>
                            </div>
                        </div>
                        <div class="dropdown-list-content dropdown-list-icons">
                            <a href="#" class="dropdown-item dropdown-item-unread"> <span
                                    class="dropdown-item-icon bg-primary text-white"> <i class="fas
												fa-code"></i>
                  </span> <span class="dropdown-item-desc"> Template update is
                    available now! <span class="time">2 Min
                      Ago</span>
                  </span>
                            </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-icon bg-info text-white"> <i
                                class="far
												fa-user"></i>
                  </span> <span class="dropdown-item-desc"> <b>You</b> and <b>Dedik
                      Sugiharto</b> are now friends <span class="time">10 Hours
                      Ago</span>
                  </span>
                        </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-icon bg-success text-white"> <i
                                class="fas
												fa-check"></i>
                  </span> <span class="dropdown-item-desc"> <b>Kusnaedi</b> has
                    moved task <b>Fix bug header</b> to <b>Done</b> <span class="time">12
                      Hours
                      Ago</span>
                  </span>
                        </a> <a href="#" class="dropdown-item"> <span
                                class="dropdown-item-icon bg-danger text-white"> <i
                                class="fas fa-exclamation-triangle"></i>
                  </span> <span class="dropdown-item-desc"> Low disk space. Let's
                    clean it! <span class="time">17 Hours Ago</span>
                  </span>
                        </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-icon bg-info text-white"> <i
                                class="fas
												fa-bell"></i>
                  </span> <span class="dropdown-item-desc"> Welcome to Otika
                    template! <span class="time">Yesterday</span>
                  </span>
                        </a>
                        </div>
                        <div class="dropdown-footer text-center">
                            <a href="#">View All <i class="fas fa-chevron-right"></i></a>
                        </div>
                    </div>
                </li>
                <li class="dropdown"><a href="#" data-toggle="dropdown"
                                        class="nav-link dropdown-toggle nav-link-lg nav-link-user"> <img alt="image"
                                                                                                         src="pages/assets/img/user.png"
                                                                                                         class="user-img-radious-style">
                    <span class="d-sm-none d-lg-inline-block"></span></a>
                    <div class="dropdown-menu dropdown-menu-right pullDown">
                        <div class="dropdown-title">Hello Sarah Smith</div>
                        <a href="profile.html" class="dropdown-item has-icon"> <i class="far
										fa-user"></i> Profile
                        </a> <a href="timeline.html" class="dropdown-item has-icon"> <i class="fas fa-bolt"></i>
                        Activities
                    </a> <a href="#" class="dropdown-item has-icon"> <i class="fas fa-cog"></i>
                        Settings
                    </a>
                        <div class="dropdown-divider"></div>
                        <a href="auth-login.html" class="dropdown-item has-icon text-danger"> <i
                                class="fas fa-sign-out-alt"></i>
                            Logout
                        </a>
                    </div>
                </li>
            </ul>
        </nav>
        <div class="main-sidebar sidebar-style-2">
            <aside id="sidebar-wrapper">
                <div class="sidebar-brand">
                    <a href="index.html"> <img alt="image" src="pages/assets/img/logo.png" class="header-logo"/> <span
                            class="logo-name">Otika</span>
                    </a>
                </div>
                <ul class="sidebar-menu">
                    <li class="menu-header">Main</li>
                    <li class="dropdown">
                        <a href="dashboard.jsp" class="nav-link"><i
                                data-feather="monitor"></i><span>Dashboard</span></a>
                    </li>
                    <li class="dropdown active">
                        <a href="categories.jsp" class="nav-link"><i data-feather="monitor"></i><span>Categories</span></a>
                    </li>

                    <li class="dropdown active">
                        <a href="adminhome" class="nav-link"><i data-feather="monitor"></i><span>Products</span></a>
                    </li>



                </ul>
            </aside>
        </div>
        <!-- Main Content -->
        <div class="main-content">
            <section class="section">
                <div class="section-body">
                    <div class="row">
                        <%--              Add Category --%>
                        <%
                            if (request.getParameter("added") != null) {
                                out.println("<div class=\"alert alert-success\" role=\"alert\" style=\" margin: auto; \">\n" +
                                        "Product is inserted\n" +
                                        "</div>");
                            }
                        %>
                        <div class="col-12 col-md-12 col-lg-12">
                            <div class="card">


                            </div>

                        </div>
                        <div class="col-12 col-md-12 col-lg-12 text-right text-right" style=" margin-bottom: 11px;">
                            <button class="btn btn-primary mr-1" type="submit" data-toggle="modal"
                                    data-target="#exampleModal">Add New Product
                            </button>
                        </div>
                        <%--              Table --%>
                        <div class="col-12 col-md-12 col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4>Products</h4>

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
                                            <c:forEach items="${requestScope.allProducts}" var="p">
                                                <tr>
                                                    <td>
                                                        <img src="${p.getProductImage().getImagePath()}${'\\'}${p.getProductImage().getImageName()}"
                                                             style="width:100%;white-space:pre">
                                                    </td>
                                                    <td class="align-middle">
                                                            ${p.getProductName()}
                                                    </td>
                                                    <td style="word-wrap: break-word">
                                                            ${p.getDescription()}
                                                    </td>
                                                    <td>${p.getPrice()}</td>
                                                    <td>
                                                            ${p.getQuantity()}
                                                    </td>

                                                    <td> ${p.category.getCategoryName()}</td>

                                                    <td>
                                                        <button type="button" class="btn btn-primary"
                                                                style="color: white;"
                                                                onclick="edit('${p.getProductId()}','${p.getProductName()}' ,'${p.getDescription()} ' ,'${p.getPrice()}' , '${p.getQuantity()}','${p.category.getCategoryName()}','${p.productImage.getImagePath()}' ,'${p.productImage.getImageName()}')">
                                                            Edit
                                                        </button>
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-primary" style="color: white;"
                                                                onclick="deleteProd('${p.getProductId()}')">Delete
                                                        </button>
                                                    </td>

                                                </tr>
                                            </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="card-footer text-right">
                                    <nav class="d-inline-block">
                                        <ul class="pagination mb-0">
                                            <li class="page-item disabled">
                                                <a class="page-link" href="#" tabindex="-1"><i
                                                        class="fas fa-chevron-left"></i></a>
                                            </li>
                                            <li class="page-item active"><a class="page-link" href="#">1 <span
                                                    class="sr-only">(current)</span></a></li>
                                            <li class="page-item">
                                                <a class="page-link" href="#">2</a>
                                            </li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                            <li class="page-item">
                                                <a class="page-link" href="#"><i class="fas fa-chevron-right"></i></a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">New Product</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="addNewProduct" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="category-id">Select Product Category </label>
                                    <select class="form-control" name="categoryName" id="category-id">
                                        <option value="categoryId">Category Name</option>

                                    </select>
                                </div>

                                <div class="form-group">
                                    <div class="product-img">
                                        <img src="images/product/small-size/2.jpg"
                                             style="width: 50%;border-radius: 6px; object-fit: contain;"
                                             class="col-lg-12"
                                             alt="" id="product-pic"/>
                                        <div class="file btn btn-lg btn-primary">
                                            Product Picture
                                            <input type="file" name="picturePicture" id="product-img"/>
                                        </div>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label for="recipient-name" class="col-form-label">Product Name</label>
                                    <input type="text" class="form-control" name="productName" id="recipient-name">
                                </div>

                                <div class="form-group">
                                    <label for="message-text" class="col-form-label">Description</label>
                                    <textarea class="form-control" name="productDescription"
                                              id="message-text"></textarea>
                                </div>

                                <div class="form-group">
                                    <label for="price" class="col-form-label">Price </label>
                                    <input type="number" class="form-control" name="price" id="price">
                                </div>

                                <div class="form-group">
                                    <label for="quantity" class="col-form-label">Quantity </label>
                                    <input type="number" class="form-control" name="quantity" id="quantity">
                                </div>


                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <div class="settingSidebar">
                <a href="javascript:void(0)" class="settingPanelToggle"> <i class="fa fa-spin fa-cog"></i>
                </a>
                <div class="settingSidebar-body ps-container ps-theme-default">
                    <div class=" fade show active">
                        <div class="setting-panel-header">Setting Panel
                        </div>
                        <div class="p-15 border-bottom">
                            <h6 class="font-medium m-b-10">Select Layout</h6>
                            <div class="selectgroup layout-color w-50">
                                <label class="selectgroup-item">
                                    <input type="radio" name="value" value="1"
                                           class="selectgroup-input-radio select-layout" checked>
                                    <span class="selectgroup-button">Light</span>
                                </label>
                                <label class="selectgroup-item">
                                    <input type="radio" name="value" value="2"
                                           class="selectgroup-input-radio select-layout">
                                    <span class="selectgroup-button">Dark</span>
                                </label>
                            </div>
                        </div>
                        <div class="p-15 border-bottom">
                            <h6 class="font-medium m-b-10">Sidebar Color</h6>
                            <div class="selectgroup selectgroup-pills sidebar-color">
                                <label class="selectgroup-item">
                                    <input type="radio" name="icon-input" value="1"
                                           class="selectgroup-input select-sidebar">
                                    <span class="selectgroup-button selectgroup-button-icon" data-toggle="tooltip"
                                          data-original-title="Light Sidebar"><i class="fas fa-sun"></i></span>
                                </label>
                                <label class="selectgroup-item">
                                    <input type="radio" name="icon-input" value="2"
                                           class="selectgroup-input select-sidebar" checked>
                                    <span class="selectgroup-button selectgroup-button-icon" data-toggle="tooltip"
                                          data-original-title="Dark Sidebar"><i class="fas fa-moon"></i></span>
                                </label>
                            </div>
                        </div>
                        <div class="p-15 border-bottom">
                            <h6 class="font-medium m-b-10">Color Theme</h6>
                            <div class="theme-setting-options">
                                <ul class="choose-theme list-unstyled mb-0">
                                    <li title="white" class="active">
                                        <div class="white"></div>
                                    </li>
                                    <li title="cyan">
                                        <div class="cyan"></div>
                                    </li>
                                    <li title="black">
                                        <div class="black"></div>
                                    </li>
                                    <li title="purple">
                                        <div class="purple"></div>
                                    </li>
                                    <li title="orange">
                                        <div class="orange"></div>
                                    </li>
                                    <li title="green">
                                        <div class="green"></div>
                                    </li>
                                    <li title="red">
                                        <div class="red"></div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="p-15 border-bottom">
                            <div class="theme-setting-options">
                                <label class="m-b-0">
                                    <input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input"
                                           id="mini_sidebar_setting">
                                    <span class="custom-switch-indicator"></span>
                                    <span class="control-label p-l-10">Mini Sidebar</span>
                                </label>
                            </div>
                        </div>
                        <div class="p-15 border-bottom">
                            <div class="theme-setting-options">
                                <label class="m-b-0">
                                    <input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input"
                                           id="sticky_header_setting">
                                    <span class="custom-switch-indicator"></span>
                                    <span class="control-label p-l-10">Sticky Header</span>
                                </label>
                            </div>
                        </div>
                        <div class="mt-4 mb-4 p-3 align-center rt-sidebar-last-ele">
                            <a href="#" class="btn btn-icon icon-left btn-primary btn-restore-theme">
                                <i class="fas fa-undo"></i> Restore Default
                            </a>
                        </div>
                    </div>
                </div>
            </div>
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
<!-- General JS Scripts -->
<script src="pages/assets/js/app.min.js"></script>
<!-- JS Libraies -->
<script src="pages/assets/bundles/chartjs/chart.min.js"></script>
<script src="pages/assets/bundles/jquery.sparkline.min.js"></script>
<script src="pages/assets/bundles/apexcharts/apexcharts.min.js"></script>
<script src="pages/assets/bundles/jqvmap/dist/jquery.vmap.min.js"></script>
<script src="pages/assets/bundles/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script src="pages/assets/bundles/jqvmap/dist/maps/jquery.vmap.indonesia.js"></script>

<!-- Page Specific JS File -->
<script src="pages/assets/js/page/widget-chart.js"></script>
<!-- Template JS File -->
<script src="pages/assets/js/scripts.js"></script>
<!-- Custom JS File -->
<script src="pages/assets/js/custom.js"></script>
<script src="js/product.js"></script>
</body>


<!-- widget-chart.html  21 Nov 2019 03:50:03 GMT -->
</html>