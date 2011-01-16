$(document).ready(function(){
	$('#main-nav ul li').hover(function(){
		var _this = $(this),
			_subnav = _this.children('ul');
		_this.css('backgroundColor', '#AB9965');
		_subnav.stop(true, true).fadeIn(400);
		_subnav.css('zIndex', '9999');
		$(this).children('a').css('color','#FFFFFF');
	},function(){
		$(this).css('backgroundColor', '').children('ul').stop(true, true).fadeOut(400);
		$(this).children('a').css('color','#CCCCCC');
	});
	$('a').focus(function(){
		this.blur();
	});
});