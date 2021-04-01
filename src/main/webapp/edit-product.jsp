<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<script>



 function edit()
 {
     name = document.getElementById("productName").value;
     price =  document.getElementById("price").value;
     quan =  document.getElementById("quantity").value;
     desc = document.getElementById("productDesc").value;
     cate = document.getElementById("category").value;

     window.location.href = "editprodb?name="+name+"&desc="+desc+"&price="+price+"&quantity="+quan+"&cat="+cate+"&id="+${requestScope.data.getProductId()};

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
        if (password == "") {
            document.getElementById("passlabel").hidden = false;
        } else {
            document.getElementById("passlabel").hidden = true;
        }

    }

    function checkpass2() {

        var password2 = document.getElementById("confirmPassword").value;
        if (password2 == "") {
            document.getElementById("pass22label").hidden = false;
          //  document.getElementById("pass2label").hidden = true;

        } else {
            document.getElementById("pass22label").hidden = true;
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
        background:white;
    }

    .emp-profile {
        padding: 3%;
        margin-top: 3%;
        margin-bottom: 3%;
        border-radius: 0.5rem;
        background: darkcyan;
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
                    <img src="images/menu/logo/laptop.png"
                         alt="" id="profile-pic"/>
                    <div class="file btn btn-lg btn-primary">
                        Change Photo
                        <input type="file" name="file" id="my-file"/>
                    </div>
                </div>
            </div>
<%--            <div class="col-md-6">--%>
<%--                <div class="profile-head">--%>
<%--                    <h5 id="myname">--%>



        <div class="row">
            <div class="col-md-4">

            </div>

            <div class="col-md-8">
                <div class="tab-content profile-tab" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Product Name</label>

                                <input  type="text" class="form-control"
                                       name="firstName" id="productName" value="${requestScope.data.getProductName()}"
                                       onblur="checkfirstname()">
                                <label id="firstnamelabel" style="color:red" hidden>Please product name</label>
                            </div>


                            <div class="col-md-6">
                                <label for="productDesc" class="form-label">Description</label>
                                <input  type="text" class="form-control"
                                       name="lastName" id="productDesc"
                                       value="${requestScope.data.getDescription()}" onblur="checklastname()">
                                <label id="lastnamelabel" style="color:red" hidden>Please enter Description</label>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="price" class="form-label">Price</label>
                                <input  type="number" name="password"
                                       class="form-control"
                                       id="price" value="${requestScope.data.getPrice()}"
                                       pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,}$" title="Weak Password"
                                       onblur="checkpass()">
                                <label id="passlabel" style="color:red" hidden>Please enter the price</label>

                            </div>


                            <div class="col-md-6">
                                <label for="quantity" class="form-label">Quantity</label>
                                <input  type="number"
                                       onkeyup="checkmatchpass2()"
                                       name="confirmPassword" value="${requestScope.data.getQuantity()}"
                                       class="form-control"
                                       id="quantity" onblur="checkpass2()">

                                <label id="pass22label" style="color:red" hidden>Please enter a Quantity</label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <br>
                                <label for="category">Category</label>
                                <select id="category" class="nice-select wide">
                                    <option selected>${requestScope.data.category.getCategoryName()}</option>
                                    <option>Clothes</option>
                                    <option>Food</option>


                                </select>

                                <label id="countrylabel" style="color:red" hidden>Please enter a country</label>
                            </div>



                        </div>
                        <br><br>
                        <button type="button" class="btn btn-primary" onclick="edit()"> Update</button>
                        <button type="button" class="btn btn-primary" onclick="back()"> Back</button>


                    </div>

                </div>
            </div>
        </div>
    </form>

</div>
<script>
    function back()
    {
        window.location.href="adminhome";
    }
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


