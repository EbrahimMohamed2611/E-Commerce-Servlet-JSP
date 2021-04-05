$(function () {

    // Get the Modal
    let links = $('.addProductToShoppingCart');

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
            data: {"orderedProductId": link.data("product")}
        })
            .done(function (response) {
                console.log(response);
                $("#shoppingCardContainer").append(`<li>
                                                        <a href="productInfo?productId=${response.productId}" class="minicart-product-image">
                                                            <img src="${response.productImage.imagePath}"
                                                                alt="cart products">
                                                        </a>
                                                        <div class="minicart-product-details">
                                                            <h6><a href="productInfo?productId=${response.productId}">${response.productName}</a></h6>
                                                            <span>$${response.price}</span>
                                                        </div>
                                                        <button class="close removeFromCart" title="Remove" data-product="${response.productId}" onclick="removeElement(this)">
                                                            <i class="fa fa-close"></i>
                                                        </button>
                                                    </li>`);
            });
        $("#shopCartCounter").text(Number.parseInt($("#shopCartCounter").text()) + 1);
    });

});

function removeElement(element) {
    $.ajax({
        type: 'POST',
        url: 'removePurchase',
        data: {"orderedProductId": $(element).data("product")}
    }).done(function (response) {
        $("#shoppingCardContainer").empty();
        response.itemsOrdered.forEach(e => {
            let productData = e.orderedProductDTO;
            $("#shoppingCardContainer").append(`<li>
                                                        <a href="productInfo?productId=${productData.productId}" class="minicart-product-image">
                                                            <img src="${productData.productImage.path}"
                                                                alt="cart products">
                                                        </a>
                                                        <div class="minicart-product-details">
                                                            <h6><a href="productInfo?productId=${productData.productId}">${productData.productName}</a></h6>
                                                            <span>$${productData.price}</span>
                                                        </div>
                                                        <button class="close removeFromCart" title="Remove" data-product="${productData.productId}" onclick="removeElement(this)">
                                                            <i class="fa fa-close"></i>
                                                        </button>
                                                    </li>`);
        });
    });

}
