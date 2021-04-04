$(function() {

	// Get the Modal
	let modal = $('#exampleModalCenter');

	// Get the messages div.
	let modalButtons = $('.quick-view-btn');

	// Set up an event listener for the contact form.
	$(modalButtons).on("click",function(e) {
		// Stop the browser from submitting the form.
		e.preventDefault();
		// Serialize the form data.
		//var formData = $(modal).serialize();
		let modalButton = $(e.currentTarget);
		// Submit the form using AJAX.
		$.ajax({
			type: 'POST',
			url: 'productInfo',
			data: {"productId": modalButton.data("product")}
		})
		.done(function(response) {
			$("#productImage").attr("src", response.image.path);
			$("#productName").text(response.name);
			$("#productDescription").text(response.description);
			$("#productPrice").text("$" + response.price);
		})
		.fail(function(data) {
			// Make sure that the formMessages div has the 'error' class.
			modal.hide();
		});
	});

});
