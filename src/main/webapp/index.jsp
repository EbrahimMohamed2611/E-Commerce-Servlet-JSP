<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <%@include file="common/header.jsp" %>
</head>
<body>


<div class="container">
    <div class="alert alert-success col-sm-12">
        Fontawesome Testing
    </div>
    <div class="col" >
    <i class="fas fa-address-book"></i>
    </div>
    <div class="col">
        <i class="fab fa-amazon"></i>
    </div>
    <i class="fas fa-address-book"></i>
    <i class="fas fa-atom"></i>
    <div class="col">
        <i class="fab fa-amazon-pay"></i>
    </div>
    <div class="col">
        <i class="fas fa-angry"></i>
    </div>
    <div class="col">
        <i class="far fa-angry"></i>
    </div>

    <div class="card" style="width: 18rem;">
        <img src="Images/angular.svg" class="card-img-top" alt="Angular Client side" style="margin: auto; width: 100px; height: 100px;">
        <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
    </div>


    <div class="alert alert-primary" role="alert">
        A simple primary alert—check it out!
    </div>
    <div class="alert alert-secondary" role="alert">
        A simple secondary alert—check it out!
    </div>
    <div class="alert alert-success" role="alert">
        A simple success alert—check it out!
    </div>
    <div class="alert alert-danger" role="alert">
        A simple danger alert—check it out!
    </div>
    <div class="alert alert-warning" role="alert">
        A simple warning alert—check it out!
    </div>
    <div class="alert alert-info" role="alert">
        A simple info alert—check it out!
    </div>
    <div class="alert alert-light" role="alert">
        A simple light alert—check it out!
    </div>
    <div class="alert alert-dark" role="alert">
        A simple dark alert—check it out!
    </div>



    <!-- Example single danger button -->
    <div class="btn-group">
        <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Action
        </button>
        <div class="dropdown-menu">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <a class="dropdown-item" href="#">Something else here</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Separated link</a>
        </div>
    </div>
</div>



<%@include file="common/footer.jsp" %>
</body>
</html>
