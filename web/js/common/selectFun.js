jQuery(function(){
	var url = "findFun.action";
	$("span[id='selectFun']").each(
			function(){
			var data="selectFun="+$(this).attr("class");
			var select=$(this);
			jQuery.post(url, data, callback, "json");
			function callback(json) {
				var sdf=json.display;
				if(sdf=="")
					select.removeAttr("style");
				else
					select.attr("style",json.display);
				}
});});