/*
 * @name: jquery 表单验证插件
 * @author: zhangyang
 */
(function($){
  
  var Element = function( elem, ruleIds, options ){
    this.elem = elem;
    this.options = options;
    this.$elem = $(elem);
    this.rules = [];
    this.init( ruleIds );
  };
  Element.prototype = {
    init : function( ruleIds ){
      var self = this;
      var nodeName = self.$elem[0].nodeName;
      
      var ruleIdArray = $.trim(ruleIds).split(',');
      for( var i in ruleIdArray ){
        this.rules.push( this.options.ruleMap[$.trim(ruleIdArray[i])] );
      }
      
      if( nodeName === "INPUT" || nodeName === "TEXTAREA"){
        self.$elem.blur(function(){
          setTimeout(function(){
            self.check();
          }, 200);
        });
        
      } else if( nodeName === "DIV" ){
        self.$elem.find('input[type]').each(function(){
          $(this).mouseup(function(){
            setTimeout(function(){
              self.check();
            }, 200);
          });
        });  
      } else if( nodeName === "SELECT" ) {
        self.$elem.change(function(){
          setTimeout(function(){
            self.check();
          }, 200);
        });
      }
    },
    check : function(){
      var self = this;
      var nodeName = this.$elem[0].nodeName;
      
      if( nodeName === "INPUT" || nodeName === "TEXTAREA"){
        var val = $.trim( this.$elem.val() );
        
        for( var i in this.rules ){
          if( this.rules[i].exp.test( val.replace(/\s/g,'') ) ){
            this.options.onSuccess( this.elem );
          }else{
            this.options.onFailure( this.elem, this.rules[i].tip );
            return false;
          }
        }
        return true;
        
      } else if( nodeName === "DIV" ) {
        if( self.$elem.find(':checked').length ){
          this.options.onSuccess( this.elem );
          return true;
        }
        this.options.onFailure( this.elem, this.rules[0].tip );
        return false;
        
      } else if( nodeName === "SELECT" ){
        if( self.$elem.children(':selected').val() ){
          this.options.onSuccess( this.elem );
          return true;
        }
        this.options.onFailure( this.elem, this.rules[0].tip );
        return false;
      }
    }
  };
  
  var Form = function( elem, options ){
    this.$elem = $(elem);
    this.options = options;
    this.list = [];
    this.init();
  };
  Form.prototype = {
    init : function(){
      var self = this;
      self.$elem.find('[data-validate]').each(function(){
        var rules = $(this).data('validate');
        if( /^\S+$/.test( rules ) ){
          self.list.push( new Element( this, rules, self.options ) );
        }
      });
    },
    validateAll : function(){
      var back = [];
      for( var i in this.list ){
        back.push( this.list[i].check() );
      }
      return $.inArray(false, back) === -1;
    }
  };
  
  $.fn.formvalidate = function( options ){
    return this.each(function(){
      var opts = $.extend(true, $.fn.formvalidate.defaults, options);
      var form = new Form(this, opts);
      $(this).data('form', form);
    });
  };
  
  $.fn.formvalidate.defaults = {
    onSuccess : function( elem ){
      var $td = $( $(elem).parents('td')[0] );
      var $tip = $td.children('.tip-info');
      $td.removeClass('error').addClass('success');
      $tip.length && $tip.addClass('hide');
    },
    onFailure : function( elem, tip ){
      var $td = $( $(elem).parents('td')[0] );
      var $tip = $td.children('.tip-info');
      $td.addClass('error');
      ( $tip.length && $tip.removeClass('hide').html(tip) ) || $td.prepend('<span class="tip-info">'+ tip +'</span>');
    },
    ruleMap : gtmap.formbiz_config
  };
  
}(jQuery));