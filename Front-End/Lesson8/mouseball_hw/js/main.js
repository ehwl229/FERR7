
var $document = $(document); // document is the entire page //use $ to represent jquery object   
/* var $ball1 = $('.ball[ball=1]'); 
var $ball2 = $('.ball[ball=2]'); */

var $body = $('body');
var $ball1 = $('<div class="ball" ball="1"></div>');
var $ball2 = $('<div class="ball" ball="2"></div>'); // More dynamic way

$body.append($ball1);
$body.append($ball2); //You can append to anything.


/* $ball.on('click', function() {

	var top = $ball.position().top;
	var left = $ball.position().left;

	$ball.animate({
		"top": (top + 50) + "px",
		"left": (left + 50) + "px"
	});
}); */


function moveBallTo1($ball, x, y, duration) {

	$ball.animate({
		"top": y + "px", 
		"left": x + "px",

	},{
		queue: false,
		duration: duration,
		easing: 'linear'
	});

}

function moveBallTo2($ball, x, y, duration) {

	$ball.animate({
		"top": y + "px", 
		"left": x + "px",

	},{
		queue: false,
		duration: duration,
		easing: 'linear'
	});

}

$document.on('mousemove', function(e) {
	// console.log("x: %s y: %s", e.clientX, e.clientY);        //e is how you access where the mouse is
	moveBallTo1($ball1, e.clientX, e.clientY, 2000); // dont repeat yourself so...
	moveBallTo2($ball2, e.clientX, e.clientY, 1000);
});


