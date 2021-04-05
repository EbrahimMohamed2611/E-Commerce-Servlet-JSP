$(function () {

    // Get the Modal
    let categoriesContainer = $('#categoriesContainer');

    // Submit the form using AJAX.
    $.ajax({
        type: 'GET',
        url: 'addCategory'
    })
        .done(function (response) {
            console.log(response);
            response.forEach(e => {
                console.log(e);
                categoriesContainer.append(`<option value="${e.categoryId}">${e.categoryName}</option>`);
                // categoriesContainer.next().children(".list").append($("<option></option>").val(e.categoryId).text(e.categoryName));
                categoriesContainer.next().children(".list").append(`<li data-value="${e.categoryId}" class="option">${e.categoryName}</li>`);
            });
        });

});
