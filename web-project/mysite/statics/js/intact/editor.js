/*
 * editor page js
 */
$(document).ready(function() {
	$(document).delegate('#clearStyle', 'click', function(){
		$('#editor').html($('#editor').cleanHtml());
	});
	
	$(document).delegate('#review', 'click', function(){
		var str = $('#editor').html();
		str = $.trim( str.replace(/div/g, 'p') );
		$('#article').children('.container').html(str);
	});
	
	$(document).delegate('#submit', 'click', function(){
		if( window.confirm('确定上传文章吗？') ){
			beforeSubmit('#editor', '#formArticle');
			$('#formArticle').submit();
		}
	});
	
	var beforeSubmit = function(editor, form){
		var imgName, article, imgs = [];
		$(editor).find('img').each(function(i, img){
			imgName = $(img).attr('name');
			if( imgName ){
				$(img).after('##'+imgName+'##').remove();
				imgs.push( imgName );
			}
		});
		
		$(form).find('input[type=file]').each(function(i, file){
			var fileName = Utils.filterFileName( $(file).val() );
			if( !fileName || imgs.indexOf(fileName) == -1 ){
				$(file).remove();
			}else{
				//$(file).attr('filename', fileName);
			}
		});
		
		article = $(editor).html().replace(/div/g, 'p');
		// $(editor).html(article);
		$('#content').val(article);
	}
})