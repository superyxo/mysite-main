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

function bindFormValidate() {
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

function pagin(page, size, count, pre) {

  Array.prototype.contains = function(needle) {
    for (i in this) {
      if (this[i] == needle)
        return true;
    }
    return false;
  }
  var maxnum = 5, pagin = $('#J_PAGIN'), pagePre = 'page.page', sizePre = 'page.size', prev = pagin.children('.prev'), next = pagin.children('.next'), href = location.href, prefix = '?';

  if (!pre) {
    if (href.indexOf('?') > -1 && href.indexOf(pagePre) == -1) {
      prefix = href + '&';
    } else if (href.indexOf(pagePre) > -1) {
      prefix = href.substring(0, href.indexOf(pagePre));
    } else {
      prefix = '?';
    }
  } else {
    prefix = pre;
  }

  var total = Math.ceil(count / size);

  if (page == 1) {
    prev.addClass('disabled');
  }
  if (page == total) {
    next.addClass('disabled');
  }

  pagin.children('span').children().remove();
  for ( i = 1; i <= total; i++) {
    var a = $('<a />').attr({
      'href' : prefix + pagePre + '=' + i + '&' + sizePre + '=' + size + ''
    }).html(i);
    pagin.children('span').append(a);
    if (i == page) {
      a.addClass('active');
      a.attr('href', '#');
    }
  }

  prev.attr({
    'href' : prefix + pagePre + '=' + (page - 1) + '&' + sizePre + '=' + size + ''
  });
  next.attr({
    'href' : prefix + pagePre + '=' + (page + 1) + '&' + sizePre + '=' + size + ''
  });

  function simplify(page) {
    var items = pagin.children('span').children('a'), active = pagin.children('span').children('.active'), aIndex, disNum = [], max = 10;
    if (items.length > max) {
      // get active index
      aIndex = active.index() + 1;

      items.each(function(i, link) {
        if (disNum.length >= max)
          return false;

        i = i + 1;

        if (i === aIndex || i === aIndex - 1 || i === aIndex + 1 || i === 1 || i === 2 || i === items.length - 1 || i === items.length) {
          disNum.push(i);
          return;
        }
      })
      for (var i = aIndex - 2; i > 2; i--) {
        if (disNum.length >= max)
          break;
        disNum.contains(i) || disNum.push(i);
      }

      for (var i = aIndex + 2; i < items.length - 1; i++) {
        if (disNum.length >= max)
          break;
        disNum.contains(i) || disNum.push(i);
      }

      disNum.sort(function(a, b) {
        return a > b;
      });

      items.each(function(i, link) {
        i = i + 1;
        disNum.contains(i) || $(this).remove();
      });

      items = pagin.children('span').children('a');

      for (var i = 1; i < disNum.length; i++) {
        if (disNum[i] - disNum[i - 1] > 1) {
          $(items[i - 1]).after('<strong> ... </strong>');
        }
      }
    }
  }

  simplify(page);
  pagin.find('a').addClass('j_pagin_link');
}

$(document).ready(function(){
  beautifyBanner();
  resetOptPanel(20);
  //checkfixTop();
  bindFormValidate();
  $(window).resize(function(){
    resetOptPanel(20);
  });
});