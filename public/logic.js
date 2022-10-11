// Torvalds Movement and LED
$('#north').on('mousedown', function(){
	$.get('/forward');
	});
$('#north').on('mouseup', function(){
	$.get('/stop');
	});
$('#south').on('mousedown', function(){
	$.get('/backward');
	});
$('#south').on('mouseup', function(){
	$.get('/stop');
	});
$('#west').on('mousedown', function(){
	$.get('/left');
	});
$('#west').on('mouseup', function(){
	$.get('/stop');
	});
$('#east').on('mousedown', function(){
	$.get('/right');
	});
$('#east').on('mouseup', function(){
	$.get('/stop');
	});
$('#torvalds').on('mousedown', function(){
	$.get('/torvaldson');
	});
$('#torvalds').on('mouseup', function(){
	$.get('/torvaldsoff');
	});
// Linus LED, Motor and PWM Control
$('#linus').on('mousedown', function(){
	$.get('/linuson');
	});
$('#linus').on('mouseup', function(){
	$.get('/linusoff');
	});
$('#forward').on('mousedown', function(){
	$.get('/north');
	});
$('#forward').on('mouseup', function(){
	$.get('/stoptwo');
	});
$('#backward').on('mousedown', function(){
	$.get('/south');
	});
$('#backward').on('mouseup', function(){
	$.get('/stoptwo');
	});
$('#left').on('mousedown', function(){
	$.get('/west');
	});
$('#left').on('mouseup', function(){
	$.get('/stoptwo');
	});
$('#right').on('mousedown', function(){
	$.get('/east');
	});
$('#right').on('mouseup', function(){
	$.get('/stoptwo');
    });
$('#thirty').on('mousedown', function(){
	$.get('/thirty');
	});
$('#fifty').on('mousedown', function(){
	$.get('/fifty');
	});
$('#full').on('mousedown', function(){
	$.get('/full');
	});


