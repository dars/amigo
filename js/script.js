$(document).ready(function(){
	$('#main-nav ul li').hover(function(){
		var _this = $(this),
			_subnav = _this.children('ul');
		_this.css('backgroundColor', '#000');
		_subnav.stop(true, true).fadeIn(400);
		_subnav.css('zIndex', '9999');
		$(this).children('a').css('color','#FFF');
	},function(){
		$(this).css('backgroundColor', '').children('ul').stop(true, true).fadeOut(400);
		$(this).children('a').css('color','#FFF');
	});
	$('a').focus(function(){
		this.blur();
	});
	$('#boards_tb tr:odd').css('background','#FFF6E6');
	$('#boards_tb tr').hover(function(){
		$(this).children('td').css('background','#FFFEDA')},
		function(){
			$(this).children('td').css('background','transparent');
		}
	);
});