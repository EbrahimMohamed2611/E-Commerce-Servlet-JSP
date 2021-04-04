$(function () {

    // Get the Modal
    let links = $('.qtybutton');
    let removes = $('.removeFromCart');

    // Set up an event listener for the contact form.
    links.on("click", function (e) {
        // Stop the browser from submitting the form.
        e.preventDefault();
        // Serialize the form data.
        //var formData = $(modal).serialize();
        let link = $(e.currentTarget);
        let tr = link.parentsUntil("tbody").last();
        let amount = link.siblings(".cart-plus-minus-box").val()
        // Submit the form using AJAX.
        $.ajax({
            type: 'POST',
            url: 'adjuctPurchaseQuantity',
            data: {"orderedProductId": link.parent().data("product"), "productQuantity": amount}
        })
            .done(function (response) {
                let quantity = tr.find("input.cart-plus-minus-box");
                if (response == "Done Adjustment") {
                    let price = tr.find("span.amount").text().substr(1);
                    tr.find("span.total").text(price * quantity.val());
                } else {
                    quantity.val(quantity.val() - 1);
                }
            }).fail(function (data) {
            let quantity = tr.find("input.cart-plus-minus-box");
            quantity.val(quantity.val() - 1);
        });
    });

    removes.on("click", function (e) {
        // Stop the browser from submitting the form.
        e.preventDefault();
        // Serialize the form data.
        //var formData = $(modal).serialize();
        let removeBtn = $(e.currentTarget);
        // Submit the form using AJAX.
        $.ajax({
            type: 'POST',
            url: 'removePurchase',
            data: {"orderedProductId": removeBtn.data("product")}
        })
            .done(function (response) {
                removeBtn.parent().parent().remove();
            });
    });

});
