<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration Form</title>
    <%@include file="common/header.jsp" %>
</head>
<body>

<div class="container">
    <div class="card">
        <h3 class="card-title">
            Registration Form
        </h3>
        <form method="post" action="register">
            <div class="mb-3">
                <label for="firstName" class="form-label">First Name</label>
                <input type="text" class="form-control" name="firstName" id="firstName" aria-describedby="emailHelp">
            </div>

            <div class="mb-3">
                <label for="lastName" class="form-label">Last Name</label>
                <input type="text" class="form-control" name="lastName" id="lastName" aria-describedby="emailHelp">
            </div>


            <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp" required>
                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" id="password"
                       pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,}$" title="Weak Password" required>
            </div>

            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Password</label>
                <input type="password" name="confirmPassword" class="form-control" id="confirmPassword" required>
            </div>

            <div class="form-row">

                <div class="form-group col-md-6">
                    <label for="phoneNumber">Phone number</label>
                    <input name="phoneNumber" type="text" class="form-control" id="phoneNumber" required>
                </div>

                <div class="form-group col-md-6">
                    <label for="birthDate">Birth date</label>
                    <input name="birthDate" type="date" class="form-control" id="birthDate" required>
                </div>
            </div>

            <div class="form-row">

                <div class="form-group col-md-6">
                    <label for="country">Country</label>
                    <input name="country" type="text" class="form-control" id="country" required>
                </div>

                <div class="form-group col-md-6">
                    <label for="state">State</label>
                    <input name="state" type="text" class="form-control" id="state" required>
                </div>

            </div>
            <div class="form-row">

                <div class="form-group col-md-4">
                    <label for="city">City</label>
                    <input name="city" type="text" class="form-control" id="city" required>
                </div>

                <div class="form-group col-md-4">
                    <label for="street">Street</label>
                    <input name="street" type="text" class="form-control" id="street" required>
                </div>

                <div class="form-group col-md-4">
                    <label for="zipCode">Zip Code</label>
                    <input name="zipcode" type="text" class="form-control" id="zipCode"
                           pattern="^\d{5}(?:[-\s]\d{4})?$" title="invalid code" required>
                </div>

            </div>

            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                <label class="form-check-label" for="exampleCheck1">Remember me</label>
            </div>
            <button type="submit" class="btn btn-primary">Register</button>
            <button type="reset" class="btn btn-warning">Reset</button>
        </form>


    </div>
</div>

<%@include file="common/footer.jsp" %>
</body>
</html>
