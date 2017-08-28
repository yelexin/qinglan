$(function() {
	$(".free-time-search td").bind("click",function(ev) {
		$(ev.target).find("span").toggleClass("fa fa-check-circle green");
	})
	$(".free-time-search span").bind("click",function(ev) {
		$(ev.target).toggleClass("fa fa-check-circle green");
	})

});
