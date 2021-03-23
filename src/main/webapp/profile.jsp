<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<script>

    var xmlHttp;

    function createXMLHttpRequest() {
        if (window.ActiveXObject)
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        else if (window.XMLHttpRequest)
            xmlHttp = new XMLHttpRequest();
    }

    function handleStateChange() {
        console.log("beofr condition" + xmlHttp.status + "---response ", xmlHttp.responseText);
        if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
            console.log("after condition");
            var val = xmlHttp.responseText;
            console.log(val);
            var myjsonobject = eval('(' + val + ')');

            var month = myjsonobject.birthDate.month.toString();
            if (month.length == 1) {
                month = '0' + month;
            }

            var day = myjsonobject.birthDate.day.toString();
            if (day.length == 1) {
                day = '0' + day;
            }
            console.log(myjsonobject.birthDate.year);
            console.log("month lenght--> " + month.length);
            console.log("month --> " + month);
            var date = myjsonobject.birthDate.year + '-' + month + '-' + day;
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
            document.getElementById("myname").innerHTML = myjsonobject.firstName;
            document.getElementById("firstName").readOnly = true;
            document.getElementById("firstName").style.backgroundColor = "#FCF4A3";


            document.getElementById("lastName").readOnly = true;
            document.getElementById("lastName").style.backgroundColor = "#FCF4A3";

            document.getElementById("password").readOnly = true;
            document.getElementById("password").style.backgroundColor = "#FCF4A3";

            document.getElementById("confirmPassword").readOnly = true;
            document.getElementById("confirmPassword").style.backgroundColor = "#FCF4A3";

            document.getElementById("phoneNumber").readOnly = true;
            document.getElementById("phoneNumber").style.backgroundColor = "#FCF4A3";


            document.getElementById("birthDate").readOnly = true;
            document.getElementById("birthDate").style.backgroundColor = "#FCF4A3";

            document.getElementById("country").disabled = true;
            document.getElementById("country").style.backgroundColor = "#FCF4A3";

            document.getElementById("state").readOnly = true;
            document.getElementById("state").style.backgroundColor = "#FCF4A3";

            document.getElementById("city").readOnly = true;
            document.getElementById("city").style.backgroundColor = "#FCF4A3";

            document.getElementById("street").readOnly = true;
            document.getElementById("street").style.backgroundColor = "#FCF4A3";


            document.getElementById("zipCode").readOnly = true;
            document.getElementById("zipCode").style.backgroundColor = "#FCF4A3";

            document.getElementById("balance").readOnly = true;
            document.getElementById("balance").style.backgroundColor = "#FCF4A3";


            document.getElementById("updbtn").hidden = true;

            //message with already updated and update the fileds
            //return an object
        }
        // document.getElementById("results").innerHTML =xmlHttp.responseText;
    }

    function update() {
        console.log("${sessionScope.userDto.userId}");
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
        var label13 = document.getElementById("balancelabel")

        if (label.hidden == false || label0.hidden == false || label1.hidden == false ||
            label2.hidden == false || label3.hidden == false || label4.hidden == false
            || label5.hidden == false || label6.hidden == false || label7.hidden == false ||
            label8.hidden == false || label9.hidden == false || label10.hidden == false ||
            label11.hidden == false || label12.hidden == false || label13.hidden == false) {
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
        var balance = document.getElementById("balance").value;
        createXMLHttpRequest();
        xmlHttp.onreadystatechange = handleStateChange;
        xmlHttp.open("POST", "profile", true);

        xmlHttp.setRequestHeader("content-type", "application/x-www-form-urlencoded");
        var data = JSON.stringify({
            "id": "${sessionScope.userDto.userId}",
            "email": "${sessionScope.userDto.email}",
            "gender": "${sessionScope.userDto.gender}",
            "role": "${sessionScope.userDto.role}",
            "firstname": firstname,
            "lastName": lastName,
            "password": password,
            "phoneNumber": phoneNumber,
            "birthDate": birthDate,
            "country": country,
            "state": state,
            "city": city,
            "street": street,
            "zipCode": zipCode,
            "balance": balance
        });

        console.log("befor send");
        console.log(data);
        xmlHttp.send("data=" + data);
        console.log(data);
    }

    function editdata() {
        console.log("inside edit button")
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


        document.getElementById("balance").readOnly = false;
        document.getElementById("balance").style.backgroundColor = "white";


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

    function checkbalance() {
        var balance = document.getElementById("balance").value;
        if (balance == "") {
            document.getElementById("balancelabel").hidden = false;
        } else {
            document.getElementById("balancelabel").hidden = true;
        }
    }

    function checkzipcode() {
        var zipCode = document.getElementById("zipCode").value;
        var pattern = /^\d{5}(?:[-\s]\d{4})?$/;
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
<style>
    body {
        background: -webkit-linear-gradient(left, #C29200, #F9C802);
    }

    .emp-profile {
        padding: 3%;
        margin-top: 3%;
        margin-bottom: 3%;
        border-radius: 0.5rem;
        background: #fff;
    }

    .profile-img {
        text-align: center;
    }

    .profile-img img {
        /*width: 100%;*/
        /*height: 100%;*/
        /*float: left;*/
        /*margin-right: 20px;*/
        /* If you want to crop the image to a certain size, use something like this */
        object-fit: contain;
        width: 200px;
        height: 200px;
    }

    .profile-img .file {
        position: relative;
        overflow: hidden;
        margin-top: -20%;
        width: 70%;
        border: none;
        border-radius: 0;
        font-size: 15px;
        background: #212529b8;
    }

    .profile-img .file input {
        position: absolute;
        opacity: 0;
        right: 0;
        top: 0;
    }

    .profile-head h5 {
        color: #333;
    }

    .profile-head h6 {
        color: #C29200;
    }

    .profile-edit-btn {
        border: none;
        border-radius: 1.5rem;
        width: 70%;
        padding: 2%;
        font-weight: 600;
        color: #C29200;
        cursor: pointer;
    }

    .proile-rating {
        font-size: 12px;
        color: #818182;
        margin-top: 5%;
    }

    .proile-rating span {
        color: #495057;
        font-size: 15px;
        font-weight: 600;
    }

    .profile-head .nav-tabs {
        margin-bottom: 5%;
    }

    .profile-head .nav-tabs .nav-link {
        font-weight: 600;
        border: none;
    }

    .profile-head .nav-tabs .nav-link.active {
        border: none;
        border-bottom: 2px solid #C29200;
    }

    .profile-work {
        padding: 14%;
        margin-top: -15%;
    }

    .profile-work p {
        font-size: 12px;
        color: #818182;
        font-weight: 600;
        margin-top: 10%;
    }

    .profile-work a {
        text-decoration: none;
        color: #495057;
        font-weight: 600;
        font-size: 14px;
    }

    .profile-work ul {
        list-style: none;
    }

    .profile-tab label {
        font-weight: 600;
    }

    .profile-tab p {
        font-weight: 600;
        color: #C29200;
    }
</style>
<body>
<div class="container emp-profile">
    <form>
        <div class="row">
            <div class="col-md-4">
                <div class="profile-img">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS52y5aInsxSm31CvHOFHWujqUx_wWTS9iM6s7BAm21oEN_RiGoog"
                         alt="" id="profile-pic"/>
                    <div class="file btn btn-lg btn-primary">
                        Change Photo
                        <input type="file" name="file" id="my-file"/>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="profile-head">
                    <h5 id="myname">
                        ${sessionScope.userDto.firstName}
                    </h5>
                    <h6>
                        ${sessionScope.userDto.email}
                    </h6>
                    <%--                    <p class="proile-rating">RANKINGS : <span>8/10</span></p>--%>
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="homee-tab" data-toggle="tab" href="#home" role="tab"
                               aria-controls="home" aria-selected="true">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="index.jsp" role="tab"
                               aria-controls="home" aria-selected="true">Home</a>
                        </li>

                    </ul>
                </div>
            </div>
            <div class="col-md-2">
                <input type="button" class="profile-edit-btn" name="btnAddMore" value="Edit Profile"
                       onclick="editdata()"/>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <%--                <div class="profile-work">--%>
                <%--                    <p>WORK LINK</p>--%>
                <%--                    <a href="">Website Link</a><br/>--%>
                <%--                    <a href="">Bootsnipp Profile</a><br/>--%>
                <%--                    <a href="">Bootply Profile</a>--%>
                <%--                    <p>SKILLS</p>--%>
                <%--                    <a href="">Web Designer</a><br/>--%>
                <%--                    <a href="">Web Developer</a><br/>--%>
                <%--                    <a href="">WordPress</a><br/>--%>
                <%--                    <a href="">WooCommerce</a><br/>--%>
                <%--                    <a href="">PHP, .Net</a><br/>--%>
            </div>
            <%--            </div>--%>

            <%--            <div class="col-md-6">--%>
            <%--                <div class="checkout-form-list">--%>
            <%--                    <label for="lastName" class="form-label">Last Name</label>--%>
            <%--                    <input style="background-color: #C29200" readonly type="text" class="form-control" name="lastName" id="lastName"--%>
            <%--                           aria-describedby="emailHelp" value="${sessionScope.userDto.lastName}" onblur="checklastname()">--%>
            <%--                    <label id="lastnamelabel" style="color:red" hidden>Please enter your lastname</label>--%>
            <%--                </div>--%>
            <%--            </div>        --%>
            <div class="col-md-8">
                <div class="tab-content profile-tab" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <div class="row">
                            <div class="col-md-6">
                                <label>First Name</label>

                                <input style="background-color: #FCF4A3" readonly type="text" class="form-control"
                                       name="firstName" id="firstName" value="${sessionScope.userDto.firstName}"
                                       onblur="checkfirstname()">
                                <label id="firstnamelabel" style="color:red" hidden>Please enter your name</label>
                            </div>


                            <div class="col-md-6">
                                <label for="lastName" class="form-label">Last Name</label>
                                <input style="background-color: #FCF4A3" readonly type="text" class="form-control"
                                       name="lastName" id="lastName"
                                       value="${sessionScope.userDto.lastName}" onblur="checklastname()">
                                <label id="lastnamelabel" style="color:red" hidden>Please enter your lastname</label>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="password" class="form-label">Password</label>
                                <input readonly style="background-color: #FCF4A3" type="password" name="password"
                                       class="form-control"
                                       id="password" value="${sessionScope.userDto.password}"
                                       pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,}$" title="Weak Password"
                                       onblur="checkpass()">
                                <label id="passlabel" style="color:red" hidden>Please enter your password</label>
                                <label id="passlabe2" style="color:red" hidden>Must contains uppercase and
                                    numbers</label>
                            </div>


                            <div class="col-md-6">
                                <label for="confirmPassword" class="form-label">Password</label>
                                <input readonly style="background-color: #FCF4A3" type="password"
                                       onkeyup="checkmatchpass2()"
                                       name="confirmPassword" value="${sessionScope.userDto.password}"
                                       class="form-control"
                                       id="confirmPassword" onblur="checkpass2()">
                                <label id="pass2label" style="color:red" hidden>Missmatch password</label>
                                <label id="pass22label" style="color:red" hidden>Please enter a password</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="phoneNumber">Phone number</label>
                                <input readonly style="background-color: #FCF4A3" name="phoneNumber" type="text"
                                       class="form-control"
                                       id="phoneNumber" pattern="^(\\+2)?01\\d{9}$"
                                       title="Invalid phone number" onblur="checkphone()"
                                       value="${sessionScope.userDto.phone}">
                                <label id="phonelabel" style="color:red" hidden>Please enter a phone number</label>
                                <label id="phonelabel2" style="color:red" hidden>phone must be in formate
                                    01XXXXXXXXX</label>
                            </div>


                            <div class="col-md-6">
                                <label for="birthDate">Birth date</label>
                                <input readonly style="background-color: #FCF4A3" name="birthDate" type="date"
                                       class="form-control"
                                       id="birthDate" value="${sessionScope.userDto.birthDate}">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <br>
                                <label for="country">Country</label>
                                <select id="country" class="nice-select wide" disabled="true"
                                        style="background-color: #FCF4A3;color: black">
                                    <option selected>${sessionScope.userDto.address.country}</option>
                                    <option>Egypt</option>
                                    <option>Russia</option>
                                    <option>India</option>

                                </select>
                                <%--            <input readonly style="background-color: #C29200" name="country" type="text" class="form-control"--%>
                                <%--                   id="country"--%>
                                <%--                   onblur="checkcountry()" value="Egypt">--%>
                                <label id="countrylabel" style="color:red" hidden>Please enter a country</label>
                            </div>


                            <div class="col-md-6">
                                <label for="state">State</label>
                                <input readonly style="background-color: #FCF4A3" name="state" type="text"
                                       class="form-control" id="state"
                                       onblur="checkstate()" value="${sessionScope.userDto.address.state}">
                                <label id="statelabel" style="color:red" hidden>Please enter a state</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="city">City</label>
                                <input readonly style="background-color: #FCF4A3" name="city" type="text"
                                       class="form-control" id="city"
                                       onblur="checkcity()" value="${sessionScope.userDto.address.city}">
                                <label id="citylabel" style="color:red" hidden>Please enter a city</label>
                            </div>


                            <div class="col-md-6">
                                <label for="street">Street</label>
                                <input readonly style="background-color: #FCF4A3" name="street" type="text"
                                       class="form-control" id="street"
                                       onblur="checkstreet()" value="${sessionScope.userDto.address.street}">
                                <label id="streetlabel" style="color:red" hidden>Please enter a street</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="zipCode">Zip Code</label>
                                <input readonly style="background-color: #FCF4A3" name="zipcode" type="text"
                                       class="form-control"
                                       id="zipCode"
                                       pattern="^\d{5}(?:[-\s]\d{4})?$" title="invalid code" onblur="checkzipcode()"
                                       value="${sessionScope.userDto.address.zipCode}">
                                <label id="codelabel" style="color:red" hidden>Please enter a zip code</label>
                                <label id="codelabel2" style="color:red" hidden>Enter a zip code in right
                                    formate</label>
                            </div>


                            <div class="col-md-6">
                                <label for="balance">Balance</label>
                                <input readonly style="background-color: #FCF4A3" name="balance" type="number"
                                       class="form-control"
                                       id="balance"
                                       onblur="checkbalance()"
                                       value="${sessionScope.userDto.balance}">
                                <label id="balancelabel" style="color:red" hidden>Please enter your balance</label>
                            </div>
                        </div>
                    </div>
                    <br><br>
                    <button id="updbtn" hidden type="button" class="btn btn-primary" onclick="update()">Update</button>
                    <%--                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">--%>
                    <%--                        <div class="row">--%>
                    <%--                            <div class="col-md-6">--%>
                    <%--                                <label>Experience</label>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="col-md-6">--%>
                    <%--                                <p>Expert</p>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="row">--%>
                    <%--                            <div class="col-md-6">--%>
                    <%--                                <label>Hourly Rate</label>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="col-md-6">--%>
                    <%--                                <p>10$/hr</p>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="row">--%>
                    <%--                            <div class="col-md-6">--%>
                    <%--                                <label>Total Projects</label>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="col-md-6">--%>
                    <%--                                <p>230</p>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="row">--%>
                    <%--                            <div class="col-md-6">--%>
                    <%--                                <label>English Level</label>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="col-md-6">--%>
                    <%--                                <p>Expert</p>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="row">--%>
                    <%--                            <div class="col-md-6">--%>
                    <%--                                <label>Availability</label>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="col-md-6">--%>
                    <%--                                <p>6 months</p>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="row">--%>
                    <%--                            <div class="col-md-12">--%>
                    <%--                                <label>Your Bio</label><br/>--%>
                    <%--                                <p>Your detail description</p>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <%--                </div>--%>
                </div>
            </div>
        </div>
    </form>

</div>
<script>
    document.getElementById("my-file").onchange = function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
// e.target.result is a base64-encoded url that contains the image data
                document.getElementById('profile-pic').setAttribute('src', e.target.result);
                //todo set image on the session
            };
            reader.readAsDataURL(this.files[0]);
        }
    }
</script>
</body>