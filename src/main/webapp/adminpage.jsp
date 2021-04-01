<!DOCTYPE html>
<html lang="en">


<!-- index.html  21 Nov 2019 03:44:50 GMT -->
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <title>Otika - Admin Dashboard Template</title>
    <!-- General CSS Files -->
    <link rel="stylesheet" href="assets/css/app.min.css">
    <link rel="stylesheet" href="assets/bundles/datatables/datatables.min.css">
    <link rel="stylesheet" href="assets/bundles/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css">
    <!-- Template CSS -->
    <!-- Template CSS -->
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/components.css">
    <!-- Custom style CSS -->
    <link rel="stylesheet" href="assets/css/custom.css">
    <link rel='shortcut icon' type='image/x-icon' href='assets/img/favicon.ico'/>
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
                    var cell5 = rowHeader.insertCell(4);
                    var cell6 = rowHeader.insertCell(5);
                    var cell7 = rowHeader.insertCell(6);
                    var cell8 = rowHeader.insertCell(7);
                    var cell9 = rowHeader.insertCell(8);
                    var cell10 = rowHeader.insertCell(9);
                    var cell11 = rowHeader.insertCell(10);
                    // var cell12 = rowHeader.insertCell(11);
                    // var cell13 = rowHeader.insertCell(12);
                    var cell14 = rowHeader.insertCell(11);



                    cell.innerHTML = "FirstName";
                    cell2.innerText = "LastName";
                    cell3.innerHTML = "Phone";
                    cell4.innerText = "Email";
                    cell5.innerHTML = "Role";
                    cell6.innerText = "Gender";
                    cell7.innerHTML = "Balance";
                    cell8.innerText = "Country";
                    cell9.innerHTML = "City";
                    cell10.innerText = "Street";
                    cell11.innerHTML = "State";
                    // cell12.innerText = "ZipCode";
                    //cell13.innerHTML = "Id";
                    cell14.innerText = "Orders";






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
                        var cell5 = row.insertCell(4);
                        var cell6 = row.insertCell(5);
                        var cell7 = row.insertCell(6);
                        // var cell8 = row.insertCell(7);
                        var cell9 = row.insertCell(7);
                        var cell10 = row.insertCell(8);
                        var cell11 = row.insertCell(9);
                        var cell12 = row.insertCell(10);
                        //var cell13 = row.insertCell(11);
                        // var cell14 = row.insertCell(12);
                        var cell15 = row.insertCell(11);


                        cell1.innerHTML = value.firstName;
                        cell2.innerHTML = value.lastName;
                        cell3.innerHTML = value.phone
                        cell4.innerHTML = value.email;
                        cell5.innerHTML = value.role;
                        cell6.innerHTML = value.gender;
                        cell7.innerHTML = value.balance;
                        //   cell8.innerHTML = value.birthDate;
                        cell9.innerHTML = value.address.country;
                        cell10.innerHTML = value.address.city;
                        cell11.innerHTML = value.address.street;
                        cell12.innerHTML = value.address.state;
                        // cell13.innerHTML = value.address.zipCode;
                        // cell14.innerHTML = value.userId;


                        var btn = document.createElement('input');
                        btn.type = "button";
                        btn.className = "btn";
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
                        //   console.log(this.parentNode.parentNode.rowIndex);
                        //   var index = this.parentNode.parentNode.rowIndex;
                        //   //todo must be the id column
                        //   //var userid = table.rows[index].cells[12].innerText;
                        // ///  console.log("idddddddddddd " + userid)
                        //   if (window.XMLHttpRequest)
                        //       req = new XMLHttpRequest();
                        //   else if (window.ActiveXObject)
                        //       req = new ActiveXObject(Microsoft.XMLHTTP);
                        //   req.onreadystatechange = handleStateChange;
                        //   req.open("POST", "getorders", true);
                        //
                        //
                        //   req.setRequestHeader("content-type", "application/x-www-form-urlencoded");
                        //   var data = JSON.stringify({
                        //       "userId": value.userId,
                        //       "firstName": value.firstName,
                        //       "lastName": value.lastName,
                        //       "phone": value.phone,
                        //       "email": value.email,
                        //       "role": value.role,
                        //       "balance": value.balance,
                        //       "orders": value.orders,
                        //
                        //   });
                        //   console.log(data);
                        //   req.send("data=" + data);
                        //   console.log(data);
                        //   // url = "getorders" + "?userid=" +data;
                        //   // req.open("GET", url, true);
                        //   // req.send(null);


                        // row = "<tr id='tr'><td>" + value.firstName + "</td>" + "<td>"+value.lastName +"</td>"+"<td>"+btn+"</td>"+"</tr>";
                        //  document.getElementById("tr").appendChild(btn);
                        // $("#userTable").append(row);
                    })
                }, false)
            } else {
                console.log("failed to get a event source")
            }
        }

        function handleStateChange() {
            //  document.getElementById("thepass").value ="inside the handle";
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
											text-white"> <img alt="image" src="assets/img/users/user-1.png"
                                                              class="rounded-circle">
                  </span> <span class="dropdown-item-desc"> <span class="message-user">John
                      Deo</span>
                    <span class="time messege-text">Please check your mail !!</span>
                    <span class="time">2 Min Ago</span>
                  </span>
                            </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-avatar text-white">
                    <img alt="image" src="assets/img/users/user-2.png" class="rounded-circle">
                  </span> <span class="dropdown-item-desc"> <span class="message-user">Sarah
                      Smith</span> <span class="time messege-text">Request for leave
                      application</span>
                    <span class="time">5 Min Ago</span>
                  </span>
                        </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-avatar text-white">
                    <img alt="image" src="assets/img/users/user-5.png" class="rounded-circle">
                  </span> <span class="dropdown-item-desc"> <span class="message-user">Jacob
                      Ryan</span> <span class="time messege-text">Your payment invoice is
                      generated.</span> <span class="time">12 Min Ago</span>
                  </span>
                        </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-avatar text-white">
                    <img alt="image" src="assets/img/users/user-4.png" class="rounded-circle">
                  </span> <span class="dropdown-item-desc"> <span class="message-user">Lina
                      Smith</span> <span class="time messege-text">hii John, I have upload
                      doc
                      related to task.</span> <span class="time">30
                      Min Ago</span>
                  </span>
                        </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-avatar text-white">
                    <img alt="image" src="assets/img/users/user-3.png" class="rounded-circle">
                  </span> <span class="dropdown-item-desc"> <span class="message-user">Jalpa
                      Joshi</span> <span class="time messege-text">Please do as specify.
                      Let me
                      know if you have any query.</span> <span class="time">1
                      Days Ago</span>
                  </span>
                        </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-avatar text-white">
                    <img alt="image" src="assets/img/users/user-2.png" class="rounded-circle">
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
                                                                                                         src="assets/img/user.png"
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
                    <a href="index.jsp"> <img alt="image" src="assets/img/logo.png" class="header-logo"/> <span
                            class="logo-name">Otika</span>
                    </a>
                </div>
                <ul class="sidebar-menu">
                    <li class="menu-header">Main</li>
                    <li class="dropdown active">
                        <a href="index.jsp" class="nav-link"><i data-feather="monitor"></i><span>Dashboard</span></a>
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



                    <%--                    <li class="dropdown">--%>
                    <%--                        <a href="#" class="menu-toggle nav-link has-dropdown"><i--%>
                    <%--                                data-feather="alert-triangle"></i><span>Errors</span></a>--%>
                    <%--                        <ul class="dropdown-menu">--%>
                    <%--                            <li><a class="nav-link" href="errors-503.html">503</a></li>--%>
                    <%--                            <li><a class="nav-link" href="errors-403.html">403</a></li>--%>
                    <%--                            <li><a class="nav-link" href="errors-404.html">404</a></li>--%>
                    <%--                            <li><a class="nav-link" href="errors-500.html">500</a></li>--%>
                    <%--                        </ul>--%>
                    <%--                    </li>--%>


                </ul>
            </aside>
        </div>
        <!-- Main Content -->
        <div class="main-content">
            <section class="section">
                <div class="row ">

                    <div class="col-xl-4 col-md-12 col-lg-3">

                        <div class="card l-bg-orange">
                            <div class="card-body">
                                <div class="text-white">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-5">
                                            <h4 class="mb-0 font-26">12000</h4>
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
                    <div class="col-xl-4 col-md-12 col-lg-3">

                        <div class="card l-bg-cyan">
                            <div class="card-body">
                                <div class="text-white">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-5">
                                            <h4 class="mb-0 font-26">758</h4>
                                            <p class="mb-2">Number Of Orders</p>
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
                    <div class="col-xl-4 col-md-12 col-lg-3">
                        <div class="card l-bg-green">
                            <div class="card-body">
                                <div class="text-white">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-5">
                                            <h4 class="mb-0 font-26">758</h4>
                                            <p class="mb-2">Number Of Requests</p>
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


                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>All Cusotomers</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped" id="userTable">
                                        <%--                                        <thead>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <th class="text-center">--%>
                                        <%--                                                #--%>
                                        <%--                                            </th>--%>
                                        <%--                                            <th>Task Name</th>--%>
                                        <%--                                            <th>Progress</th>--%>
                                        <%--                                            <th>Members</th>--%>
                                        <%--                                            <th>Due Date</th>--%>
                                        <%--                                            <th>Status</th>--%>
                                        <%--                                            <th>Action</th>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        </thead>--%>
                                        <%--                                        <tbody>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                1--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>Create a mobile app</td>--%>
                                        <%--                                            <td class="align-middle">--%>
                                        <%--                                                <div class="progress progress-xs">--%>
                                        <%--                                                    <div class="progress-bar bg-success width-per-40">--%>
                                        <%--                                                    </div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-5.png" width="35">--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>2018-01-20</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <div class="badge badge-success badge-shadow">Completed</div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td><a href="#" class="btn btn-primary">Detail</a></td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                2--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>Redesign homepage</td>--%>
                                        <%--                                            <td class="align-middle">--%>
                                        <%--                                                <div class="progress progress-xs">--%>
                                        <%--                                                    <div class="progress-bar width-per-60"></div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-1.png" width="35">--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-3.png" width="35">--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-4.png" width="35">--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>2018-04-10</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <div class="badge badge-info badge-shadow">Todo</div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td><a href="#" class="btn btn-primary">Detail</a></td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                3--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>Backup database</td>--%>
                                        <%--                                            <td class="align-middle">--%>
                                        <%--                                                <div class="progress progress-xs">--%>
                                        <%--                                                    <div class="progress-bar bg-warning width-per-70"></div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-1.png" width="35">--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-2.png" width="35">--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>2018-01-29</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <div class="badge badge-warning badge-shadow">In Progress</div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td><a href="#" class="btn btn-primary">Detail</a></td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                4--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>Input data</td>--%>
                                        <%--                                            <td class="align-middle">--%>
                                        <%--                                                <div class="progress progress-xs">--%>
                                        <%--                                                    <div class="progress-bar bg-success width-per-90"></div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-2.png" width="35">--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-5.png" width="35">--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-4.png" width="35">--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-1.png" width="35">--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>2018-01-16</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <div class="badge badge-success badge-shadow">Completed</div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td><a href="#" class="btn btn-primary">Detail</a></td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                5--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>Create a mobile app</td>--%>
                                        <%--                                            <td class="align-middle">--%>
                                        <%--                                                <div class="progress progress-xs">--%>
                                        <%--                                                    <div class="progress-bar bg-success width-per-40">--%>
                                        <%--                                                    </div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-5.png" width="35">--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>2018-01-20</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <div class="badge badge-success badge-shadow">Completed</div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td><a href="#" class="btn btn-primary">Detail</a></td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                6--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>Redesign homepage</td>--%>
                                        <%--                                            <td class="align-middle">--%>
                                        <%--                                                <div class="progress progress-xs">--%>
                                        <%--                                                    <div class="progress-bar width-per-60"></div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-1.png" width="35">--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-3.png" width="35">--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-4.png" width="35">--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>2018-04-10</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <div class="badge badge-info badge-shadow">Todo</div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td><a href="#" class="btn btn-primary">Detail</a></td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                7--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>Backup database</td>--%>
                                        <%--                                            <td class="align-middle">--%>
                                        <%--                                                <div class="progress progress-xs">--%>
                                        <%--                                                    <div class="progress-bar bg-warning width-per-70"></div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-1.png" width="35">--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-2.png" width="35">--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>2018-01-29</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <div class="badge badge-warning badge-shadow">In Progress</div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td><a href="#" class="btn btn-primary">Detail</a></td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                8--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>Input data</td>--%>
                                        <%--                                            <td class="align-middle">--%>
                                        <%--                                                <div class="progress progress-xs">--%>
                                        <%--                                                    <div class="progress-bar bg-success width-per-90"></div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-2.png" width="35">--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-5.png" width="35">--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-4.png" width="35">--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-1.png" width="35">--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>2018-01-16</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <div class="badge badge-success badge-shadow">Completed</div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td><a href="#" class="btn btn-primary">Detail</a></td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                9--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>Create a mobile app</td>--%>
                                        <%--                                            <td class="align-middle">--%>
                                        <%--                                                <div class="progress progress-xs">--%>
                                        <%--                                                    <div class="progress-bar bg-success width-per-40">--%>
                                        <%--                                                    </div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-5.png" width="35">--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>2018-01-20</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <div class="badge badge-success badge-shadow">Completed</div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td><a href="#" class="btn btn-primary">Detail</a></td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                10--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>Redesign homepage</td>--%>
                                        <%--                                            <td class="align-middle">--%>
                                        <%--                                                <div class="progress progress-xs">--%>
                                        <%--                                                    <div class="progress-bar width-per-60"></div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-1.png" width="35">--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-3.png" width="35">--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-4.png" width="35">--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>2018-04-10</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <div class="badge badge-info badge-shadow">Todo</div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td><a href="#" class="btn btn-primary">Detail</a></td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                11--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>Backup database</td>--%>
                                        <%--                                            <td class="align-middle">--%>
                                        <%--                                                <div class="progress progress-xs">--%>
                                        <%--                                                    <div class="progress-bar bg-warning width-per-70"></div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-1.png" width="35">--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-2.png" width="35">--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>2018-01-29</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <div class="badge badge-warning badge-shadow">In Progress</div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td><a href="#" class="btn btn-primary">Detail</a></td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                12--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>Input data</td>--%>
                                        <%--                                            <td class="align-middle">--%>
                                        <%--                                                <div class="progress progress-xs">--%>
                                        <%--                                                    <div class="progress-bar bg-success width-per-90"></div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-2.png" width="35">--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-5.png" width="35">--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-4.png" width="35">--%>
                                        <%--                                                <img alt="image" src="assets/img/users/user-1.png" width="35">--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>2018-01-16</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <div class="badge badge-success badge-shadow">Completed</div>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td><a href="#" class="btn btn-primary">Detail</a></td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        </tbody>--%>
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
<script src="assets/js/page/widget-chart.js"></script>

<script src="assets/bundles/datatables/datatables.min.js"></script>
<script src="assets/bundles/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js"></script>
<script src="assets/bundles/jquery-ui/jquery-ui.min.js"></script>
<!-- Page Specific JS File -->
<script src="assets/js/page/datatables.js"></script>

<!-- Page Specific JS File -->
<script src="assets/js/page/index.js"></script>
<!-- Template JS File -->
<script src="assets/js/scripts.js"></script>
<!-- Custom JS File -->
<script src="assets/js/custom.js"></script>
</body>


<!-- index.html  21 Nov 2019 03:47:04 GMT -->
</html>