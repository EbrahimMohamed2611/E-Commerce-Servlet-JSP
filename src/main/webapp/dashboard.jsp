<!DOCTYPE html>
<html lang="en">


<!-- index.html  21 Nov 2019 03:44:50 GMT -->
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <title>Otika - Admin Dashboard Template</title>
    <!-- General CSS Files -->
    <link rel="stylesheet" href="pages/assets/css/app.min.css">
    <link rel="stylesheet" href="pages/assets/bundles/datatables/datatables.min.css">
    <link rel="stylesheet" href="pages/assets/bundles/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css">
    <!-- Template CSS -->
    <!-- Template CSS -->
    <link rel="stylesheet" href="pages/assets/css/style.css">
    <link rel="stylesheet" href="pages/assets/css/components.css">
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
        var req;

        function connect() {

            console.log("inside connect");
            if (window.EventSource !== undefined) {
                console.log("before");
                eventSource = new EventSource("showusers"); // Get
                console.log("after " + eventSource);
                eventSource.readyState = handleEventSourceStats
                eventSource.addEventListener("userlist", function (event) {
                    $("#userTable").empty()
                    console.log("inside the userstatus event!")
                    console.log(event.data)
                    var users = JSON.parse(event.data)
                    var table = document.getElementById("userTable");
                    var header = table.createTHead();
                    var rowHeader = header.insertRow(0);


                    var cell = rowHeader.insertCell(0);
                    var cell2 = rowHeader.insertCell(1);
                    var cell3 = rowHeader.insertCell(2);
                    var cell4 = rowHeader.insertCell(3);
                    var cell7 = rowHeader.insertCell(4);
                    var cell8 = rowHeader.insertCell(5);
                    var cell9 = rowHeader.insertCell(6);
                    var cell10 = rowHeader.insertCell(7);
                    var cell11 = rowHeader.insertCell(8);
                    var cell14 = rowHeader.insertCell(9);



                    cell.innerHTML = "<b>FirstName</b>";
                    cell2.innerHTML = "<b>LastName</b>";
                    cell3.innerHTML = "<b>Phone</b>";
                    cell4.innerHTML = "<b>Email</b>";
                    cell7.innerHTML = "<b>Balance</b>";
                    cell8.innerHTML = "<b>Country</b>";
                    cell9.innerHTML = "<b>City</b>";
                    cell10.innerHTML = "<b>Street</b>";
                    cell11.innerHTML = "<b>State</b>";
                    cell14.innerHTML = "<b>Orders</b>";

                    $.each(users, function (key, value) {
                        console.log("key = " + key);
                        console.log("value[i] = " + value.toString());



                        var rowCount = table.rows.length;
                        var row = table.insertRow(rowCount);
                        console.log("row count =" + rowCount);

                        var cell1 = row.insertCell(0);
                        var cell2 = row.insertCell(1);
                        var cell3 = row.insertCell(2);
                        var cell4 = row.insertCell(3);
                        var cell7 = row.insertCell(4);
                        var cell9 = row.insertCell(5);
                        var cell10 = row.insertCell(6);
                        var cell11 = row.insertCell(7);
                        var cell12 = row.insertCell(8);
                        var cell15 = row.insertCell(9);

                        cell1.innerHTML = value.firstName;
                        cell2.innerHTML = value.lastName;
                        cell3.innerHTML = value.phone
                        cell4.innerHTML = value.email;
                        cell7.innerHTML = value.balance;
                        cell9.innerHTML = value.address.country;
                        cell10.innerHTML = value.address.city;
                        cell11.innerHTML = value.address.street;
                        cell12.innerHTML = value.address.state;
                        var btn = document.createElement('input');
                        btn.type = "button";
                        btn.className = "btn btn-primary";
                        btn.value = "view"
                        cell15.appendChild(btn);
                        //todo ajax call to servlet and send it id
                        btn.onclick = function viewOrders() {
                            eventSource.close();
                            //req.setRequestHeader("content-type", "application/x-www-form-urlencoded");
                            var data = JSON.stringify({
                                "userId": value.userId,
                                "firstName": value.firstName,
                                "lastName": value.lastName,
                                "phone": value.phone,
                                "email": value.email,
                                "role": value.role,
                                "balance": value.balance


                            });
                            console.log(data);
                            window.location.href="getorders?data="+value.userId;
                        }
                    })
                }, false)
            } else {
                console.log("failed to get a event source")
            }
        }

        function handleStateChange() {
            console.log(req.status+req.responseText)
            if (req.readyState == 4 && req.status == 200) {
                // window.location.href="orders.jsp?orders=";
                xmlvalue = req.responseText;
                //  document.getElementById("status").innerHTML  = xmlvalue;
            }
        }


        function handleEventSourceStats() {
            if (eventSource.readyState === 2) {
                console.log("succeeded")
            }
        }
    </script>

</head>

<body onload="connect()">
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

                    <a href="dashboard.jsp"> <img alt="image" src="pages/assets/img/logo.png" class="header-logo"/> <span
                            class="logo-name"></span>

                    </a>
                </div>
                <ul class="sidebar-menu">
                    <li class="menu-header">Main</li>
                    <li class="dropdown active">
                        <a href="dashboard.jsp" class="nav-link"><i data-feather="monitor"></i><span>Dashboard</span></a>
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
                <div class="row ">

                    <div class="col-xl-3 col-md-12 col-lg-3">

                        <div class="card l-bg-orange">
                            <div class="card-body">
                                <div class="text-white">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-5">
                                            <h4 id="allUsers" class="mb-0 font-26"></h4>
                                            <p class="mb-2">Number of Users</p>
                                            <p class="mb-0">
                                                <span class="font-20">+11.25% </span>Increase
                                            </p>
                                        </div>
                                        <div class="col-md-6 col-lg-7">
                                            <div class="sparkline-bar p-t-50"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-12 col-lg-3">

                        <div class="card l-bg-cyan">
                            <div class="card-body">
                                <div class="text-white">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-5">
                                            <span id="allOrders" class="mb-0 font-26"></span>
                                            <p class="mb-2">All Orders : </p><h4 id="completedOrders"></h4>

                                            <p class="mb-2">Pending Orders
                                            </p>

                                        </div>
                                        <div class="col-md-6 col-lg-7">
                                            <div class="sparkline-line-chart2 p-t-50"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-12 col-lg-3">
                        <div class="card l-bg-green">
                            <div class="card-body">
                                <div class="text-white">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-5">
                                            <h4 id="numberOfProducts" class="mb-0 font-26"></h4>
                                            <p class="mb-2">Number Of Products</p>
                                            <p class="mb-0">
                                                <span class="font-20">+25.11%</span> Increase
                                            </p>
                                        </div>
                                        <div class="col-md-6 col-lg-7">
                                            <div class="sparkline-line-chart2 p-t-50"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-12 col-lg-3">
                        <div class="card l-bg-green">
                            <div class="card-body">
                                <div class="text-white">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-5">

                                            <h4 id="notCompletedOrders" ></h4>
                                            <p class="mb-2">Completed Orders
                                            </p>
                                                <span class="font-20">+25.11%</span> Increase

                                        </div>
                                        <div class="col-md-6 col-lg-7">
                                            <div class="sparkline-line-chart2 p-t-50"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>All Cusotomers</h4>
                            </div>
                            <div class="card-body">

                                <div class="table-responsive-sm">
                                    <table class="table " id="userTable">

                                    </table>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>



            </section>
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
<script src="pages/assets/bundles/apexcharts/apexcharts.min.js"></script>
<!-- JS Libraies -->
<script src="pages/assets/bundles/chartjs/chart.min.js"></script>
<script src="pages/assets/bundles/jquery.sparkline.min.js"></script>
<script src="pages/assets/bundles/apexcharts/apexcharts.min.js"></script>
<script src="pages/assets/bundles/jqvmap/dist/jquery.vmap.min.js"></script>
<script src="pages/assets/bundles/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script src="pages/assets/bundles/jqvmap/dist/maps/jquery.vmap.indonesia.js"></script>
<!-- Page Specific JS File -->

<script src="pages/assets/js/page/widget-chart.js"></script>

<script src="assets/js/widget-chart.js"></script>


<script src="pages/assets/bundles/datatables/datatables.min.js"></script>
<script src="pages/assets/bundles/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js"></script>
<script src="pages/assets/bundles/jquery-ui/jquery-ui.min.js"></script>
<!-- Page Specific JS File -->

<script src="pages/assets/js/page/datatables.js"></script>

<!-- Page Specific JS File -->
<script src="pages/assets/js/page/index.js"></script>

<script src="assets/js/datatables.js"></script>

<!-- Page Specific JS File -->
<script src="assets/js/index.js"></script>
<!-- Template JS File -->
<script src="pages/assets/js/scripts.js"></script>
<!-- Custom JS File -->
<script src="pages/assets/js/custom.js"></script>
<script src="js/ajax-statistics.js"></script>
</body>


<!-- index.html  21 Nov 2019 03:47:04 GMT -->
</html>