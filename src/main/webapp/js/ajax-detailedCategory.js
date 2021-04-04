$(function () {

    // Get the Modal
    let categoriesContainer = $('#detailedCategoryContainer');
    test();

    // Set up an event listener for the contact form.
    function test() {
        // Submit the form using AJAX.
        $.ajax({
            type: 'GET',
            url: 'addCategory'
        })
            .done(function (response) {
                let threshold = 8;
                let count = 0;
                response.forEach(e => {
                    if (count < threshold) {
                        categoriesContainer.append(`<li><a href="products?cat=${e.categoryId}">${e.categoryName}</a></li>`);
                    } else {
                        categoriesContainer.append(`<li class="rx-child"><a href="products?cat=${e.categoryId}">${e.categoryName}</a></li>`);
                    }
                    count++;
                });
                if (count >= threshold) {
                    categoriesContainer.append(`<li class="rx-parent">
                                            <a class="rx-default">More Categories</a>
                                            <a class="rx-show">Less Categories</a>
                                        </li>`);
                    $('.rx-parent').on('click', function(){
                        $('.rx-child').slideToggle();
                        $(this).toggleClass('rx-change');
                    });
                }

            });
    }

});
