var selectrole=null;
function moveOption(obj1, obj2)   
        {   
             for(var i = obj1.options.length - 1 ; i >= 0 ; i--)   
             {   
                 if(obj1.options[i].selected)   
                 {   
                    var opt = new Option(obj1.options[i].text,obj1.options[i].value);   
                    opt.selected = true;   
                    obj2.options.add(opt);   
                    obj1.remove(i);   
                }   
             }   
        } 
    	jQuery( findDemo=function() {
    		var url = "findAllSiteFun.action";
    		jQuery.post(url, {}, callback, "json");
    		function callback(json) {
    			var fun = document.getElementById("leftFun");
    			var site =document.getElementById("leftSite");
    			jQuery.each(json.functionList, function(i, type) {
    				var name = type.functionName;
    				var id = type.functionId;
    				var option = new Option(name, id);
    				fun.options.add(option);
    			});
    		if(selectrole!=null)
    		for(var ii=0;ii<selectrole.split(",").length;ii++){
    			fun.options[selectrole.split(",")[ii]].selected=true;
    		}
    			
    			moveOption(document.getElementById('leftFun'), document.getElementById('rightFun'));
    			jQuery.each(json.siteList, function(i, type) {
    				var name = type.siteName;
    				var id = type.siteManagementID;
    				var option = new Option(name, id);
    				site.options.add(option);
    			});
    		}
    	}); 
    	function resetRight(){
    		$("#leftSite").empty();
    		$("#rightSite").empty();
    		$("#leftFun").empty();
    		$("#rightFun").empty();
			findDemo();
        	}
    	
    	
    	function selectAll() {
			$("#rightFun option").attr("selected", true);
			$("#rightSite option").attr("selected", true);
		}
    	