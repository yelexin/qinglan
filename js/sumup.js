$(function() {
	var price=200;
	$("#course-hours")[0].onchange=function() {
		$("#cost")[0].innerHTML=$("#course-hours")[0].value*price+'￥';
	}
});

$(function() {
$("#course-hours")[0].onkeyup=function(){if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}}
 $("#course-hours")[0].onafterpaste=function(){if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}}
});
