<%@ page import="java.time.LocalDate" %><%--

  Created by IntelliJ IDEA.
  User: Salma El-kady
  Date: 3/14/2021
  Time: 10:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users</title>
    <%--    <%@include file="common/header.jsp" %>--%>
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
<div class="container">
    <h2>Users</h2>

    <table class="table" id="userTable">
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>Firstname</th>--%>
<%--            <th>Lastname</th>--%>
<%--            <th>Email</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
        <%--            <tbody>--%>
        <%--            <tr>--%>
        <%--                <td>John</td>--%>
        <%--                <td>Doe</td>--%>
        <%--                <td>john@example.com</td>--%>
        <%--            </tr>--%>
        <%--            <tr>--%>
        <%--                <td>Mary</td>--%>
        <%--                <td>Moe</td>--%>
        <%--                <td>mary@example.com</td>--%>
        <%--            </tr>--%>
        <%--            <tr>--%>
        <%--                <td>July</td>--%>
        <%--                <td>Dooley</td>--%>
        <%--                <td>july@example.com</td>--%>
        <%--            </tr>--%>
        <%--            </tbody>--%>
    </table>


</div>
<%--<%@include file="common/footer.jsp" %>--%>
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

<%--<script src="js/user.js"></script>--%>
</body>
</html>
