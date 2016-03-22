$(document).on( "ready page:load", function() {
	$("#search_article").on( "keyup", function(){
		var val = $('#search_article').val();
		$.ajax({
			method: 'GET',
			url: "/",
			data: {query: val},
			type: "json"
		});
	});
});