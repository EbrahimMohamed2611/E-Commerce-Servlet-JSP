$(function () {

    $("#filterPrice").on('click', function (e) {
        e.preventDefault();
        // Submit the form using AJAX.
        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);
        let parameters = {'min': $("#slider-range").slider("values", 0), 'max': $("#slider-range").slider("values", 1)};
        if (urlParams.has('cat') && urlParams.has('search')) {
            parameters.search = urlParams.get('search');
            parameters.cat = urlParams.get('cat');
        } else if (urlParams.has('cat')) {
            parameters.cat = urlParams.get('cat');
        } else if (urlParams.has('search')) {
            parameters.search = urlParams.get('search');
        }
        $.ajax({
            type: 'POST',
            url: 'products',
            data: parameters
        })
            .done(function (response) {
                $('#productContainer').html(response);
            });
    });

});
