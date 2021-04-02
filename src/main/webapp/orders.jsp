<%@ page import="eg.gov.iti.jets.model.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="eg.gov.iti.jets.model.Purchase" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.*" %>
<%@ page import="eg.gov.iti.jets.controller.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Salma El-kady
  Date: 3/25/2021
  Time: 12:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="common/header.jsp" %>
<head>
    <title>Title</title>
</head>
<body>
<!--Shopping Cart Area Strat-->

<div class="Shopping-cart-area pt-60 pb-60">
    <div class="container">

        <div class="row">
            <div class="col-12">
                <c:forEach items="${requestScope.orders}" var="o">
                <form action="#">
                    <div class="table-content table-responsive">

                                   <label class="badge bg-warning text-dark">${o.getOrderTimestamp()}</label>

                            <table class="table">

                            <thead>
                            <tr>
                                <th class="li-product-thumbnail">images</th>
                                <th class="cart-product-name">Product</th>
                                <th class="li-product-price">Unit Price</th>
                                <th class="li-product-quantity">Quantity</th>
                                <th class="li-product-subtotal">Total</th>
                            </tr>
                            </thead>
                                <tbody>

                                    <c:forEach items="${o.getPurchase()}" var="p">

                            <tr>
<%--                                <td class="li-product-remove"><a href="#"><i class="fa fa-times"></i></a></td>--%>
<%--                                <td class="li-product-thumbnail"><a href="#"><img src="" alt="Li's Product Image"></a></td>--%>
                                    <td><img src="images/menu/logo/laptop.png"></td>
<%--                                <td class="li-product-name"><a href="#">${p.getProduct().getProductName()}</a></td>--%>
    <td class="li-product-name"><label><b>${p.getProduct().getProductName()}</b></label></td>
                                <td class="li-product-price"><span class="amount">${p.getProduct().getPrice()}</span></td>
    <td class="li-product-price"><span class="amount">${p.getQuantity()}</span></td>
<%--                                <td >--%>
<%--                                    <label class="quantity">${p.getQuantity()}</label>--%>
<%--                                </td>--%>
                                <td class="product-subtotal"><span class="amount">${p.getProduct().getPrice()*p.getQuantity()}</span></td>
                            </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                    </div>

                </c:forEach>

                </form>
            </div>
        </div>
    </div>
</div>
<%@include file="common/footer.jsp" %>
<script src="js/user.js"></script>
</body>
</html>
