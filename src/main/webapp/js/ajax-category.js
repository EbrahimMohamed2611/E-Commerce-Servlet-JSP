$(function () {

    // Get the Modal
    let categoriesContainer = $('#categoriesContainer');
    test();

    // Set up an event listener for the contact form.
    function test() {
        // Submit the form using AJAX.
        $.ajax({
            type: 'GET',
            url: 'addCategory'
        })
            .done(function (response) {
                categoriesContainer.clear();
                console.log(response);
                response.forEach(e => {
                    categoriesContainer.next().children(".list").append($("<option></option>").val(e.categoryId).text(e.categoryName));
                });
            });
    }

});
