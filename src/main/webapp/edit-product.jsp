<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel='stylesheet'  href='css/style.css'/>
<script src="js/product.js"></script>
<script>

    function edit()
    {


        name = document.getElementById("productName").value;
        price =  document.getElementById("price").value;
        quan =  document.getElementById("quantity").value;
        desc = document.getElementById("productDesc").value;
        if(document.getElementById("nameLabel").hidden==false || document.getElementById("descLabel").hidden==false || document.getElementById("priceLabel").hidden==false ||document.getElementById("quantityLabel").hidden==false)
        {
            return;
        }

        window.location.href = "editprodb?name="+name+"&desc="+desc+"&price="+price+"&cat="+'${requestScope.data.getCategory().getCategoryName()}'+"&quantity="+quan+"&id="+${requestScope.data.getProductId()};

    }
    function checkname() {
        var p = document.getElementById("productName").value;
        if (p == "") {
            document.getElementById("nameLabel").hidden = false;
        } else {
            document.getElementById("nameLabel").hidden = true;
        }
    }

    function checkDesc() {
        var desc = document.getElementById("productDesc").value;
        if (desc == "") {
            document.getElementById("descLabel").hidden = false;
        } else {
            document.getElementById("descLabel").hidden = true;
        }
    }

    function checkPrice() {
        var price = document.getElementById("price").value;
        if (price == "") {
            document.getElementById("priceLabel").hidden = false;
        } else {
            document.getElementById("priceLabel").hidden = true;
        }

    }

    function checkQuantity() {

        var quantity = document.getElementById("quantity").value;
        if (quantity == "") {
            document.getElementById("quantityLabel").hidden = false;
            //  document.getElementById("pass2label").hidden = true;

        } else {
            document.getElementById("quantityLabel").hidden = true;
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
    .emp-profile {
        padding: 3%;
        margin-top: 3%;
        margin-bottom: 3%;
        border-radius: 0.5rem;
        background:#8bacf9 ;
    }
</style>


<body>
<div class="container emp-profile">
    <form>


<%--        <div class="row">--%>
<%--            <div class="col-md-4">--%>

<%--            <div class="form-group">--%>
<%--                <div class="product-img">--%>
<%--                    <img src="images/product/small-size/2.jpg" style="width: 50%;border-radius: 6px; object-fit: contain;" class="col-lg-12"--%>
<%--                         alt="" id="product-pic" />--%>
<%--                    <div class="file btn btn-lg btn-primary">--%>
<%--                        Product Picture--%>
<%--                        <input type="file" name="picturePicture" id="product-img" />--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            </div>--%>
<%--            <div class="col-md-4">--%>
<%--                <div class="profile-img">--%>

<%--                    <img src="images/menu/logo/laptop.png"--%>
<%--                         alt="" id="profile-pic"/>--%>
<%--                    <div class="file btn btn-lg btn-primary">--%>
<%--                        Change Photo--%>
<%--                        <input type="file" name="file" id="my-file"/>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-md-6">--%>
<%--                <div class="profile-head">--%>
<%--                    <h5 id="myname">--%>



        <div class="row">
            <div class="col-md-8">

            </div>

            <div class="col-md-6">
                <div class="tab-content profile-tab" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Product Name</label>

                                <input  type="text" class="form-control"
                                       name="productName" id="productName" value="${requestScope.data.getProductName()}"
                                       onblur="checkname()" style="background-color: gainsboro">
                                <label id="nameLabel" style="color:red" hidden>Please product name</label>
                            </div>


                            <div class="col-md-6">
                                <label for="productDesc" class="form-label">Description</label>
                                <textarea class="form-control"
                                       name="desc" id="productDesc"
                                         onblur="checkDesc()"style="background-color: gainsboro">${requestScope.data.getDescription()}</textarea>
                                <label id="descLabel" style="color:red" hidden>Please enter Description</label>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="price" class="form-label">Price</label>
                                <input  type="number" name="price"
                                       class="form-control"
                                       id="price" value="${requestScope.data.getPrice()}"
                                       onblur="checkPrice()"style="background-color: gainsboro">
                                <label id="priceLabel" style="color:red" hidden>Please enter the price</label>

                            </div>


                            <div class="col-md-6">
                                <label for="quantity" class="form-label">Quantity</label>
                                <input  type="number"
                                       name="quantity" value="${requestScope.data.getQuantity()}"
                                       class="form-control" style="background-color: gainsboro"
                                       id="quantity" onblur="checkQuantity()">

                                <label id="quantityLabel" style="color:red" hidden>Please enter a Quantity</label>
                            </div>
                        </div>

<%--                        <div class="row">--%>
<%--                            <div class="col-md-6">--%>
<%--                                <br>--%>
<%--                                <label for="category-id">Category</label>--%>
<%--                                <select id="category-id" class="nice-select wide" name="categoryName">--%>
<%--                                    <option selected>${requestScope.data.category.getCategoryName()}</option>--%>



<%--                                </select>--%>

<%--                                <label id="countrylabel" style="color:red" hidden>Please enter a country</label>--%>
<%--                            </div>--%>



<%--                        </div>--%>
                        <br><br>
                        <button type="button" class="btn btn-primary" onclick="edit()" >Update</button>
                        <button type="button" class="btn btn-primary" onclick="back()"> Back</button>


                    </div>

                </div>
            </div>
        </div>
    </form>

<%--</div>--%>
<script>
    function back()
    {
        window.location.href="adminhome";
    }

</script>

</body>


