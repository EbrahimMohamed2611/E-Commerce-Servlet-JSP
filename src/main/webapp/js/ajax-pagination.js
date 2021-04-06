$(function () {
    // var paginationIndex = 4;
    // $("a.Next").on("click", function (e) {
    //     e.preventDefault();
    //     let currentSlide = $('.pagination-box').find('li.page-position:first');
    //     // currentSlide.removeClass("active");
    //     let middleSlide = $('.pagination-box').find('li.page-position:eq(1)');
    //     let lastSlide = $('.pagination-box').find('li.page-position:last');
    //     // currentSlide.children().text(paginationIndex++);
    //     currentSlide.children().text(lastSlide.children().text());
    //     middleSlide.children().text(currentSlide.children().text());
    //     let last = Number.parseInt(lastSlide.children().text());
    //     lastSlide.children().text(last + 1);
    //     currentSlide.before(middleSlide);
    // });
    // $("a.Previous").on("click", function (e) {
    //     e.preventDefault();
    //     let currentSlide = $('.pagination-box').find('li.page-position:first');
    //     // currentSlide.removeClass("active");
    //     let lastSlide = $('.pagination-box').find('li.page-position:last');
    //     lastSlide.children().text(currentSlide.children().text());
    //     lastSlide.after(currentSlide);
    // })

    $(".paginatoin-area").html(
        `<div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <p>Showing <span id="pageOffset">1-10</span> of items</p>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <ul class="pagination-box">
                                            <li class="page-position active"><a href="#">1</a></li>
                                        </ul>
                                    </div>
                                </div>`
    );
    console.log(maxPages);
    for (let i = 2; i <= maxPages; i++) {
        $(".pagination-box").html($(".pagination-box").html() + `<li class="page-position"><a href="#">${i}</a></li>`);
    }
    $(".page-position > a").on("click", function (e) {
        e.preventDefault();
        $("li.page-position.active").removeClass("active");
        $(e.currentTarget).parent().addClass("active");
        // Submit the form using AJAX.
        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);
        let parameters = {'page': $(e.currentTarget).text()};
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
            url: 'pagination',
            data: parameters
        })
            .done(function (response) {
                let page = Number.parseInt($(e.currentTarget).parent().text());
                let outcome;
                if (page == 1) {
                    outcome = "1-10";
                } else {
                    let first = ((10 + 1) * (page - 1));
                    let second = first + 10;
                    outcome =  first + "-" + second;
                }
                $("#pageOffset").text(outcome);
                $('#productContainer').html(response);
            });
    });
});