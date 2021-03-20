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
    <title>Profile</title>
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
        var xmlHttp;

        function createXMLHttpRequest() {
            if (window.ActiveXObject)
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            else if (window.XMLHttpRequest)
                xmlHttp = new XMLHttpRequest();
        }

           function handleStateChange() {
            console.log("beofr condition"+xmlHttp.status+"---response ",xmlHttp.responseText);
            if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                console.log("after condition");
                var val = xmlHttp.responseText;
                var myjsonobject = eval('(' + val + ')');

                var month = myjsonobject.birthDate.month.toString();
                if(month.length==1)
                {
                    month = '0'+month;
                }

                var day=myjsonobject.birthDate.day.toString();
                if(day.length==1)
                {
                    day = '0'+day;
                }
                console.log(myjsonobject.birthDate.year);
                console.log("month lenght--> " +month.length);
                console.log("month --> " +month);
                var date = myjsonobject.birthDate.year + '-' +month+ '-' + day;
                console.log("date---> " + date);
                document.getElementById("firstName").value = myjsonobject.firstName;
                document.getElementById("lastName").value = myjsonobject.lastName;
                document.getElementById("password").value = myjsonobject.password;
                document.getElementById("phoneNumber").value = myjsonobject.phone;
                //var date = JSON.stringify(myjsonobject.birthDate);
                document.getElementById("birthDate").value = date;
                document.getElementById("country").value = myjsonobject.address.country;
                document.getElementById("state").value = myjsonobject.address.state;
                document.getElementById("city").value = myjsonobject.address.city;
                document.getElementById("street").value = myjsonobject.address.street;
                document.getElementById("zipCode").value = myjsonobject.address.zipCode;
                window.alert("Succeffully updated");
                document.getElementById("firstName").readOnly = true;
                document.getElementById("firstName").style.backgroundColor = "#6c757d";


                document.getElementById("lastName").readOnly = true;
                document.getElementById("lastName").style.backgroundColor = "#6c757d";

                document.getElementById("password").readOnly = true;
                document.getElementById("password").style.backgroundColor = "#6c757d";

                document.getElementById("confirmPassword").readOnly = true;
                document.getElementById("confirmPassword").style.backgroundColor = "#6c757d";

                document.getElementById("phoneNumber").readOnly = true;
                document.getElementById("phoneNumber").style.backgroundColor = "#6c757d";


                document.getElementById("birthDate").readOnly = true;
                document.getElementById("birthDate").style.backgroundColor = "#6c757d";

                document.getElementById("country").disabled = true;
                document.getElementById("country").style.backgroundColor = "#6c757d";

                document.getElementById("state").readOnly = true;
                document.getElementById("state").style.backgroundColor = "#6c757d";

                document.getElementById("city").readOnly = true;
                document.getElementById("city").style.backgroundColor = "#6c757d";

                document.getElementById("street").readOnly = true;
                document.getElementById("street").style.backgroundColor = "#6c757d";


                document.getElementById("zipCode").readOnly = true;
                document.getElementById("zipCode").style.backgroundColor = "#6c757d";


                document.getElementById("updbtn").hidden = true;

                //message with already updated and update the fileds
                //return an object
            }
            // document.getElementById("results").innerHTML =xmlHttp.responseText;
        }

        function update() {

            var label = document.getElementById("firstnamelabel")
            var label0 = document.getElementById("lastnamelabel")
            var label1 = document.getElementById("passlabel")
            var label2 = document.getElementById("passlabe2")
            var label3 = document.getElementById("pass22label")
            var label4 = document.getElementById("pass2label")
            var label5 = document.getElementById("phonelabel")
            var label6 = document.getElementById("phonelabel2")
            var label7 = document.getElementById("countrylabel")
            var label8 = document.getElementById("statelabel")
            var label9 = document.getElementById("citylabel")
            var label10 = document.getElementById("streetlabel")
            var label11 = document.getElementById("codelabel")
            var label12 = document.getElementById("codelabel2")
            if (label.hidden == false || label0 == false || label1 == false ||
                label2.hidden == false || label3 == false || label4 == false
                || label5.hidden == false || label6 == false || label7 == false ||
                label8.hidden == false || label9 == false || label10 == false ||
                label11.hidden == false || label12 == false) {
                console.log("inside the if condition of hidden labels")
                return;
            }


            var firstname = document.getElementById("firstName").value;
            var lastName = document.getElementById("lastName").value;
            var password = document.getElementById("password").value;
            var phoneNumber = document.getElementById("phoneNumber").value;
            var birthDate = document.getElementById("birthDate").value;
            var country = document.getElementById("country").value;
            var state = document.getElementById("state").value;
            var city = document.getElementById("city").value;
            var street = document.getElementById("street").value;
            var zipCode = document.getElementById("zipCode").value;
            createXMLHttpRequest();
            xmlHttp.onreadystatechange = handleStateChange;
            xmlHttp.open("POST", "profile", true);

            xmlHttp.setRequestHeader("content-type", "application/x-www-form-urlencoded");
            var data = JSON.stringify({
                "firstname": firstname,
                "lastName": lastName,
                "password": password,
                "phoneNumber": phoneNumber,
                "birthDate": birthDate,
                "country": country,
                "state": state,
                "city": city,
                "street": street,
                "zipCode": zipCode
            });

            console.log("befor send");
            console.log(data);
            xmlHttp.send("data=" + data);
            console.log(data);
        }

        function editdata() {
            document.getElementById("firstName").readOnly = false;
            document.getElementById("firstName").style.backgroundColor = "white";


            document.getElementById("lastName").readOnly = false;
            document.getElementById("lastName").style.backgroundColor = "white";

            document.getElementById("password").readOnly = false;
            document.getElementById("password").style.backgroundColor = "white";

            document.getElementById("confirmPassword").readOnly = false;
            document.getElementById("confirmPassword").style.backgroundColor = "white";

            document.getElementById("phoneNumber").readOnly = false;
            document.getElementById("phoneNumber").style.backgroundColor = "white";


            document.getElementById("birthDate").readOnly = false;
            document.getElementById("birthDate").style.backgroundColor = "white";

            document.getElementById("country").disabled = false;
            document.getElementById("country").style.backgroundColor = "white";

            document.getElementById("state").readOnly = false;
            document.getElementById("state").style.backgroundColor = "white";

            document.getElementById("city").readOnly = false;
            document.getElementById("city").style.backgroundColor = "white";

            document.getElementById("street").readOnly = false;
            document.getElementById("street").style.backgroundColor = "white";


            document.getElementById("zipCode").readOnly = false;
            document.getElementById("zipCode").style.backgroundColor = "white";


            document.getElementById("updbtn").hidden = false;
        }

        function checkfirstname() {
            var firstname = document.getElementById("firstName").value;
            if (firstname == "") {
                document.getElementById("firstnamelabel").hidden = false;
            } else {
                document.getElementById("firstnamelabel").hidden = true;
            }
        }

        function checklastname() {
            var lastName = document.getElementById("lastName").value;
            if (lastName == "") {
                document.getElementById("lastnamelabel").hidden = false;
            } else {
                document.getElementById("lastnamelabel").hidden = true;
            }
        }

        function checkpass() {
            var password = document.getElementById("password").value;
            var pattern = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,}$";
            if (password == "") {
                document.getElementById("passlabel").hidden = false;
            } else {
                document.getElementById("passlabel").hidden = true;
            }
            if (password != "" && !password.match(pattern)) {
                document.getElementById("passlabe2").hidden = false;
            } else {
                document.getElementById("passlabe2").hidden = true;
            }
        }

        function checkpass2() {

            var password2 = document.getElementById("confirmPassword").value;
            if (password2 == "") {
                document.getElementById("pass22label").hidden = false;
                document.getElementById("pass2label").hidden = true;

            } else {
                document.getElementById("pass22label").hidden = true;
            }

        }

        function checkmatchpass2() {
            document.getElementById("pass22label").hidden = true;
            var password = document.getElementById("password").value;
            var password2 = document.getElementById("confirmPassword").value;

            if (password == password2) {
                document.getElementById("pass2label").hidden = true;
            } else {
                document.getElementById("pass2label").hidden = false;
            }
        }

        function checkphone() {
            var phoneNumber = document.getElementById("phoneNumber").value;
            var pattern = "^(\\+2)?01\\d{9}$";
            if (phoneNumber == "") {
                document.getElementById("phonelabel").hidden = false;
            } else {
                document.getElementById("phonelabel").hidden = true;
            }
            if (phoneNumber != "" && !phoneNumber.match(pattern)) {
                document.getElementById("phonelabel2").hidden = false;
            } else {
                document.getElementById("phonelabel2").hidden = true;
            }
        }

        function checkcountry() {
            var country = document.getElementById("country").value;
            if (country == "") {
                document.getElementById("countrylabel").hidden = false;
            } else {
                document.getElementById("countrylabel").hidden = true;
            }
        }

        function checkstate() {
            var state = document.getElementById("state").value;
            if (state == "") {
                document.getElementById("statelabel").hidden = false;
            } else {
                document.getElementById("statelabel").hidden = true;
            }
        }

        function checkcity() {
            var city = document.getElementById("city").value;
            if (city == "") {
                document.getElementById("citylabel").hidden = false;
            } else {
                document.getElementById("citylabel").hidden = true;
            }
        }

        function checkstreet() {
            var street = document.getElementById("street").value;
            if (street == "") {
                document.getElementById("streetlabel").hidden = false;
            } else {
                document.getElementById("streetlabel").hidden = true;
            }
        }

        function checkzipcode() {
            var zipCode = document.getElementById("zipCode").value;
            var pattern = "^\d{5}(?:[-\s]\d{4})?$";
            if (zipCode == "") {
                document.getElementById("codelabel").hidden = false;
            } else {
                document.getElementById("codelabel").hidden = true;
            }
            if (zipCode != "" && !zipCode.match(pattern)) {
                document.getElementById("codelabel2").hidden = false;
            } else {
                document.getElementById("codelabel2").hidden = true;
            }
        }
    </script>
</head>
<body>
<div class="container">
    <div class="raw">
        <div class="col-sm-12 col-md-12 col-lg-6 col-xs-12">
            <button type="button" onclick="editdata()">Edit profile</button>
            <form style="align-items: center">
                <h3>Profile</h3>
                <div class="row">

                    <%--        <div class="col-md-6">--%>
                    <%--            <div class="checkout-form-list">--%>
                    <%--                <label for="firstName">First Name <span class="required">*</span></label>--%>
                    <%--                <input placeholder="" name="firstName" id="firstName" type="text" required>--%>
                    <%--            </div>--%>
                    <%--        </div>--%>
                    <div class="col-md-6">
                        <div class="checkout-form-list">
                            <label for="firstName" class="form-label">First Name</label>
                            <input style="background-color: #6c757d" readonly type="text" class="form-control" name="firstName"
                                   id="firstName" value="salma"
                                   aria-describedby="emailHelp" onblur="checkfirstname()">
                            <label id="firstnamelabel" style="color:red" hidden>Please enter your name</label>
                        </div>
                    </div>
                    <br>

                    <div class="col-md-6">
                        <div class="checkout-form-list">
                            <label for="lastName" class="form-label">Last Name</label>
                            <input style="background-color: #6c757d" readonly type="text" class="form-control" name="lastName" id="lastName"
                                   aria-describedby="emailHelp" value="elkady" onblur="checklastname()">
                            <label id="lastnamelabel" style="color:red" hidden>Please enter your lastname</label>
                        </div>
                    </div>
                    <br>


                    <div class="col-md-6">
                        <div class="checkout-form-list">
                            <label for="password" class="form-label">Password</label>
                            <input readonly style="background-color: #6c757d" type="password" name="password" class="form-control"
                                   id="password" value="Salma123"
                                   pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,}$" title="Weak Password" onblur="checkpass()">
                            <label id="passlabel" style="color:red" hidden>Please enter your password</label>
                            <label id="passlabe2" style="color:red" hidden>Must contains uppercase and numbers</label>
                        </div>
                    </div>
                    <br>

                    <div class="col-md-6">
                        <div class="checkout-form-list">
                            <label for="confirmPassword" class="form-label">Password</label>
                            <input readonly style="background-color: #6c757d" type="password" onkeyup="checkmatchpass2()"
                                   name="confirmPassword" value="Salma123"
                                   class="form-control"
                                   id="confirmPassword" onblur="checkpass2()">
                            <label id="pass2label" style="color:red" hidden>Missmatch password</label>
                            <label id="pass22label" style="color:red" hidden>Please enter a password</label>
                        </div>
                    </div>
                    <br>

                    <%--    <div class="form-row">--%>

                    <%--        <div class="form-group col-md-6">--%>
                    <div class="col-md-6">
                        <div class="checkout-form-list">
                            <label for="phoneNumber">Phone number</label>
                            <input readonly style="background-color: #6c757d" name="phoneNumber" type="text" class="form-control"
                                   id="phoneNumber" pattern="^(\\+2)?01\\d{9}$"
                                   title="Invalid phone number" onblur="checkphone()" value="01007320202">
                            <label id="phonelabel" style="color:red" hidden>Please enter a phone number</label>
                            <label id="phonelabel2" style="color:red" hidden>phone must be in formate 01XXXXXXXXX</label>
                        </div>
                    </div>
                    <br>

                    <%--        <div class="form-group col-md-6">--%>
                    <div class="col-md-6">
                        <div class="checkout-form-list">
                            <label for="birthDate">Birth date</label>
                            <input readonly style="background-color: #6c757d" name="birthDate" type="date" class="form-control"
                                   id="birthDate" value="2018-07-22">
                        </div>
                    </div>
                    <br>
                    <%--    </div>--%>

                    <%--    <div class="form-row">--%>

                    <%--        <div class="form-group col-md-6">--%>
                    <div class="col-md-6">
                        <div class="checkout-form-list">
                            <label for="country">Country</label>
                            <select id="country"  disabled="true" style="background-color: #6c757d;color: black">
                                <option selected>Egypt</option>
                                <option>Russia</option>
                                <option>India</option>

                            </select>
                            <%--            <input readonly style="background-color: #6c757d" name="country" type="text" class="form-control"--%>
                            <%--                   id="country"--%>
                            <%--                   onblur="checkcountry()" value="Egypt">--%>
                            <label id="countrylabel" style="color:red" hidden>Please enter a country</label>
                        </div>
                    </div>
                    <br>

                    <div class="form-group col-md-6">
                        <div class="checkout-form-list">
                            <label for="state">State</label>
                            <input readonly style="background-color: #6c757d" name="state" type="text" class="form-control" id="state"
                                   onblur="checkstate()" value="state">
                            <label id="statelabel" style="color:red" hidden>Please enter a state</label>
                        </div>
                    </div>
                    <br>

                    <%--    </div>--%>
                    <%--    <div class="form-row">--%>

                    <div class="form-group col-md-6">
                        <div class="checkout-form-list">
                            <label for="city">City</label>
                            <input readonly style="background-color: #6c757d" name="city" type="text" class="form-control" id="city"
                                   onblur="checkcity()" value="Cairo">
                            <label id="citylabel" style="color:red" hidden>Please enter a city</label>
                        </div>
                    </div>
                    <br>

                    <div class="form-group col-md-6">
                        <div class="checkout-form-list">
                            <label for="street">Street</label>
                            <input readonly style="background-color: #6c757d" name="street" type="text" class="form-control" id="street"
                                   onblur="checkstreet()" value="Nasr">
                            <label id="streetlabel" style="color:red" hidden>Please enter a street</label>
                        </div>
                    </div>
                    <br>

                    <div class="form-group col-md-6">
                        <div class="checkout-form-list">
                            <label for="zipCode">Zip Code</label>
                            <input readonly style="background-color: #6c757d" name="zipcode" type="text" class="form-control"
                                   id="zipCode"
                                   pattern="^\d{5}(?:[-\s]\d{4})?$" title="invalid code" onblur="checkzipcode()"
                                   value="5555-5555-5555-5555">
                            <label id="codelabel" style="color:red" hidden>Please enter a zip code</label>
                            <label id="codelabel2" style="color:red" hidden>Enter a zip code in write formate</label>
                        </div>
                    </div>
                    <br>

                    <%--    </div>--%>
                </div>
                <button id="updbtn" hidden type="button" class="btn btn-primary" onclick="update()">Update</button>

            </form>
        </div>
    </div>
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

<script src="js/user.js"></script>
</body>
</html>
