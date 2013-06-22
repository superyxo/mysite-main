var Utils = {}

Utils.hasFeature = function(str){
	return document.getElementsByTagName('html')[0].className.indexOf(str) > -1;
}

Utils.filterFileName = function(fullPath){
	if (fullPath) {
		var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
		var filename = fullPath.substring(startIndex);
		if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
			filename = filename.substring(1);
		}
		return filename;
	}
}

Utils.isMobile = function(){
	return /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent);
}

// stop default link behavior
$(document).on('click', '[href="#"],.disabled', function(e) {
	e.preventDefault();
});

function resetOptPanel( margin ){
	var ctnLeft = $($('.container')[0]).offset().left
		, panWidth
		, panel = $('.opt-panel')
		, ctn = $($('.container')[0]);
	ctnLeft = ctn.offset().left;
	panWidth = panel.width();
	panel.css('right', ctnLeft - panWidth - margin);
	
}

function toTop(){
	var i = 100, timing;
	$(window).scrollTop(i);
	
	timing = setInterval(function(){
		i == -1 && clearInterval(timing);
		$(window).scrollTop(i);
		i--;
	},0.16);
}

function beautifyBannerHome(){
	if( !Utils.isMobile() ) {
		var screeW = screen.width;
		$('.banner-home').css('background-size',screeW);
	}
}

function checkfixTop(){
	var head = $('.navbar')
		, headH = head.height();
	if( head.hasClass('navbar-fixed-top') ){
		$('body').css('padding-top',headH);
	}else{
		$('body').css('padding-top',0);
	}
}

function fixTop(){
	var head = $('.navbar')
		, headH = head.height();
	
	if( $(window).scrollTop() > headH ){
		head.hasClass('navbar-fixed-top') || head.addClass('navbar-fixed-top');
	}else {
		head.removeClass('navbar-fixed-top');
	}
}

$(document).ready(function(){
	resetOptPanel(20);
	beautifyBannerHome();
	checkfixTop();
	window.prettyPrint && prettyPrint();
	
	$(window).resize(function(){
		resetOptPanel(20);
	});
	
	$(window).scroll(function(){
		//checkfixTop();
	});
});
