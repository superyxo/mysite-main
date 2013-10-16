/*
 * global javascript
 */
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
  $(window).scrollTop(0);
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

function bindJQValiEngin() {
  var set = {
    onFailure : function(ui) {
      $(ui).length && $(ui).removeClass('success').addClass('error');
    },
    onSuccess : function(ui) {
      $(ui).length && $(ui).removeClass('error').addClass('success');
    }
  };
  
  $.fn.formvalidate.defaults = $.extend({}, $.fn.formvalidate.defaults, set);
  $('.j_vali_form').formvalidate();
}

function beautifyBanner(){
  if( !Utils.isMobile() ) {
    var screeW = screen.width
        , $banner = $('.banner');
    $banner.css('background', 'url(http://rayzy1991-media.stor.sinaapp.com/banner/banner-' + new Date().getDay() + '.jpg) center center no-repeat');
      $banner.css('background-size', screeW);
  }
}

function prettyCode(ctn){
  ctn && $(ctn).find('.codearea').addClass('prettyprint');
  window.prettyPrint && prettyPrint();
}

$(document).ready(function(){
  beautifyBanner();
  resetOptPanel(20);
  //checkfixTop();
  bindJQValiEngin();
  $(window).resize(function(){
    resetOptPanel(20);
  });
});