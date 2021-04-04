$(function () {

    // Get the Modal
    let links = $('.addProductToShoppingCart');

    // Get the messages div.
    let modalButtons = $('.quick-view-btn');

    // Set up an event listener for the contact form.
    links.on("click", function (e) {
        // Stop the browser from submitting the form.
        e.preventDefault();
        // Serialize the form data.
        //var formData = $(modal).serialize();
        let link = $(e.currentTarget);
        // Submit the form using AJAX.
        $.ajax({
            type: 'POST',
            url: 'addToCart',
            data: {"productId": link.data("product")}
        })
            .done(function (response) {
                link.text("Remove from cart");
                $("#shoppingCardContainer").append(`<li>
                                                        <a href="single-product.jsp" class="minicart-product-image">
                                                            <img src="${response.image.path}"
                                                                alt="cart products">
                                                        </a>
                                                        <div class="minicart-product-details">
                                                            <h6><a href="single-product.jsp">${response.name}</a></h6>
                                                            <span>$${response.price}</span>
                                                        </div>
                                                        <button class="close" title="Remove">
                                                            <i class="fa fa-close"></i>
                                                        </button>
                                                    </li>`);
            });
    });

});
