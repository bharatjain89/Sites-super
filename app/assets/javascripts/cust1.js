$(document).on( "ready page:load", function() {
	$("#search_event").on( "keyup", function() {
		var val1 = $('#search_event').val();
		$.ajax({
			method: 'GET',
			url: "/events",
			data: {query: val1},
			type: "json"
		});
	});
});