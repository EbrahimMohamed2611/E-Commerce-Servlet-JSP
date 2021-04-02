$(function () {

    // Get the Modal
    let links = $('.addProductToShoppingCart');

    // Get the messages div.
    let modalButtons = $('.quick-view-btn');

    // Set up an event listener for the contact form.
    $(link).on("click", function (e) {
        // Stop the browser from submitting the form.
        e.preventDefault();
        // Serialize the form data.
        //var formData = $(modal).serialize();
        let link = $(e.currentTarget);
        // Submit the form using AJAX.
        $.ajax({
            type: 'POST',
            url: 'productInfo',
            data: {"productId": link.data("product")}
        })
            .done(function (response) {
                $("#productImage").attr("src", response.image.path);
                $("#productName").text(response.name);
                $("#productDescription").text(response.description);
                $("#productPrice").text("$" + response.price);
            });
    });

});
