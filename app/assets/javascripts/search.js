$(document).ready(function() {
  searchBooks()
});

function searchBooks() {
  $("#filter").keyup(function(){
		var filter = $(this).val();
		$(".all-books").children().each(function(){
			if ($(this).text().search(new RegExp(filter, "i")) < 0) {
				$(this).fadeOut();
			} else {
				$(this).show();
			}
		});
	});
}
