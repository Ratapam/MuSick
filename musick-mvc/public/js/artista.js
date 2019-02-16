window.addEventListener('DOMContentLoaded', function(){

	document.getElementById('img').addEventListener('mouseover', function(){
		document.getElementById('info').style.visibility = "visible";
		document.getElementById('img').style.width = "80%"
		document.getElementById('img').style.transition = "all 0.5s"
		document.getElementById('info').style.transition = "all 2s"
	});
	document.getElementById('img').addEventListener('mouseout', function(){
		document.getElementById('info').style.visibility = "hidden";
		document.getElementById('img').style.width = "100%"
	});

});