$(function () {
    let selection = $('#sortSelector');
    let productContainer = $('#productContainer');
    selection.on('change', function (e) {
        productContainer.find('div.col-lg-3.col-md-4.col-sm-6.mt-40').sort((a, b) => {
            if (selection.val() == 'n-asc') {
                return $('a.product_name', a).text().localeCompare($('a.product_name', b).text());
            } else if (selection.val() == 'n-desc') {
                return $('a.product_name', b).text().localeCompare($('a.product_name', a).text());
            } else if (selection.val() == 'p-asc') {
                return $('span.new-price', a).text().substr(1) - $('span.new-price', b).text().substr(1);
            } else if (selection.val() == 'p-desc') {
                return $('span.new-price', b).text().substr(1) - $('span.new-price', a).text().substr(1);
            } else {
                return Math.floor((Math.random() * 3) - 1);
            }
        }).appendTo(productContainer);
    })
});