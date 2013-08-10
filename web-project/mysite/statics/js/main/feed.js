$(document).ready(function(){
	//1. feed submit default is -> article
	//2. feed someone
	//		feed someone must has some special operation hide 一个 kommentId 标签
	//		click [回复] -> textarea -> #回复给xxxx# 如果  #存在# 并且kommentId存在，那么该条评论就是回复给某人的
	//		否则就是默认提交给该条文章
	
	//		我需要做的就是，点击 [回复] 获取 commentId 放入到hide标签，然后添加 #回复给xxxx#就ok了 
	$(document).on('click', '.j_feed_reply', function(){
		var cId = $(this).attr('data-comment-id')
			, uName = $(this).attr('data-usrname')
			, sWill = '#-回复给'+ uName + '-# '
			, rootId = $(this).attr('data-root-id');
			
		
		$('input[name=cId]').val(cId);
		$('input[name=rootId]').val(rootId);
		$('textarea[name=content]').focus().val(sWill);
		return true;
	});
})
