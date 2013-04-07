var $document = $(document);
var $body     = $('body');

var $container = $('<div></div>');
$body.append($container);

$container.css({
    'height':   '100%',
    'width':    '100%',
    'position': 'absolute'
});

var $balls     = [];
var numOfBalls = 50;

for (var i = 0; i < numOfBalls; i++ ) {

    $ball  = $('<div class="ball"></div>');

    diameter = i;

    red      = Math.floor(Math.random() * 255);
    green    = Math.floor(Math.random() * 255);
    blue     = Math.floor(Math.random() * 255);

    $ball.css({
        'height': diameter + 'px',
        'width':  diameter + 'px',
        'border-radius':  diameter / 2,
        'margin-left':  - diameter / 2 + 'px',
        'margin-top':   - diameter / 2 + 'px',
        'background-color': 'rgb(' + red + ',' + green + ',' + blue + ')'
    });

    $container.append($ball);
    $balls.push($ball);
}

function moveBallTo($ball, x, y, duration) {

    $ball.animate({
      "top":  y + "px",
      "left": x + "px",
    },{
        queue: false,
        duration: duration,
        easing: 'linear'
    });
}

$document.on('mousemove', function(e) {
    for (var i = 0; i < numOfBalls; i++ ) {
        moveBallTo($balls[i], e.clientX, e.clientY,  Math.floor(Math.random() * 1000) + 1);
    }
});