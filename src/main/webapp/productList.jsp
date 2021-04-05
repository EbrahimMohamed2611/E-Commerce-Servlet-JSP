<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Mahmoud Ali
  Date: 4/4/2021
  Time: 8:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>

<c:forEach items="${requestScope.products}" var="product">
    <div class="col-lg-3 col-md-4 col-sm-6 mt-40">
        <!-- single-product-wrap start -->
        <div class="single-product-wrap">
            <div class="product-image">
                <a href="single-product.jsp">
                    <img src="${product.image.path}"
                         alt="Product Image">
                </a>
                    <%-- <span class="sticker">New</span>--%>
            </div>
            <div class="product_desc">
                <div class="product_desc_info">
                    <div class="product-review">
                        <h5 class="manufacturer">
                            <a href="products?cat=${product.category.id}">${product.category.name}</a>
                        </h5>
                        <div class="rating-box">
                            <ul class="rating">
                                <li><i class="fa fa-star-o"></i></li>
                                <li><i class="fa fa-star-o"></i></li>
                                <li><i class="fa fa-star-o"></i></li>
                                <li class="no-star"><i
                                        class="fa fa-star-o"></i>
                                </li>
                                <li class="no-star"><i
                                        class="fa fa-star-o"></i>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <h4><a class="product_name"
                           href="productInfo?productId=${product.id}">${product.name}</a>
                    </h4>
                    <div class="price-box">
                        <span class="new-price">$${product.price}</span>
                    </div>
                </div>
                <div class="add-actions">
                    <ul class="add-actions-link">
                        <li class="add-cart active"><a
                                class="addProductToShoppingCart"
                                href=""
                                data-product="${product.id}">Add to
                            cart</a></li>
                        <li><a href="#" title="quick view"
                               class="quick-view-btn"
                               data-toggle="modal"
                               data-target="#exampleModalCenter"
                               data-product="${product.id}"><i
                                class="fa fa-eye"></i></a></li>
                        <li><a class="links-details"
                               href="wishlist.jsp"><i
                                class="fa fa-heart-o"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- single-product-wrap end -->
    </div>
</c:forEach>
