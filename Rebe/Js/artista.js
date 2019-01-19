window.addEventListener('DOMContentLoaded', function(){

	document.getElementById('foto').addEventListener('mouseover', () =>{
		document.getElementById('texto').style.display = 'block';
		document.getElementById('foto').style.backgroundImage = 'url(img/vivaldi2.png)';
	})
	document.getElementById('foto').addEventListener('mouseout', () =>{
		document.getElementById('texto').style.display = 'none';
		document.getElementById('foto').style.backgroundImage = 'url(img/vivaldi.jpg)';
	})
	document.getElementById('uno').addEventListener('click', () =>{
		document.getElementById('uno').src = 'img/tick.png';
	})
	document.getElementById('dos').addEventListener('click', () =>{
		document.getElementById('dos').src = 'img/tick.png';
	})
	document.getElementById('tres').addEventListener('click', () =>{
		document.getElementById('tres').src = 'img/tick.png';
	})
	document.getElementById('cuatro').addEventListener('click', () =>{
		document.getElementById('cuatro').src = 'img/tick.png';
	})

});