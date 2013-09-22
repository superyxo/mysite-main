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

Utils.encodeXML = function(code){
	return code.replace(/</g,'&lt;').replace(/>/g,'&gt;');
}

document.getElementsByClassName || (document.getElementsByClassName = function(searchClass,node,tag){
		node = node || document;
        tag = tag || '*';
        var returnElements = []
        var els =  (tag === "*" && node.all)? node.all : node.getElementsByTagName(tag);
        var i = els.length;
        searchClass = searchClass.replace(/\-/g, "\\-");
        var pattern = new RegExp("(^|\\s)"+searchClass+"(\\s|$)");
        while(--i >= 0){
            if (pattern.test(els[i].className) ) {
                returnElements.push(els[i]);
            }
        }
        return returnElements;
});