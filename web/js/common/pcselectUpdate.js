var selectMessage=$("#selectMessage").val();
jQuery(function (){
	var selectMessage=$("#selectMessage").val();
	//alert(selectMessage);
			var url="findPlaces.action";
			jQuery.post(url, {}, callback, "json");
			function callback(json) {
				jQuery.each(json.modelPlaceList, function(i, type) {
					if(selectMessage.split("#")[3]==type.modelPlaceId)
						$("<option value="+type.modelPlaceId+" selected='selected'>"+type.modelPlaceName+"</option>").appendTo("#modelPlaceId");
					else
						$("<option value="+type.modelPlaceId+">"+type.modelPlaceName+"</option>").appendTo("#modelPlaceId");
			});
	}});
	jQuery(function (){
		var selectMessage=$("#selectMessage").val();
				var url="findSite.action";
				jQuery.post(url, {}, callback, "json");
				function callback(json) {
					jQuery.each(json.siteManagementList, function(i, type) {
						if(selectMessage.split("#")[0]==type.siteManagementID)
							{$("<option value="+type.siteManagementID+" selected='selected'>"+type.siteName+"</option>").appendTo("#siteManagementID");
								queryUserinfoP(type.siteManagementID);
								findDevice(type.siteManagementID);
							}
						else
							$("<option value="+type.siteManagementID+">"+type.siteName+"</option>").appendTo("#siteManagementID");	
				});
		}}
);
	function findDevice(value){
		var selectMessage=$("#selectMessage").val();
		var url="findDevice.action?selectID="+value;
		jQuery.post(url, {}, callback, "json");
		$("#deviceId").empty();
		$("<option value=00 selected='selected'>请选择</option>").appendTo("#selectID");
		function callback(json) {
		jQuery.each(json.deviceList, function(i, type) {
			if(selectMessage.split("#")[1]==type.deviceId)
				$("<option value="+type.deviceId+" selected='selected'>"+type.deviceName+"</option>").appendTo("#deviceId");
			else
				$("<option value="+type.deviceId+">"+type.deviceNum+"</option>").appendTo("#deviceId");
		});
			
}}

	jQuery(function (){
		var selectMessage=$("#selectMessage").val();
		
		var url="selectTypeMachinebrand.action";
		
		jQuery.post(url, {}, callback, "json");
		function callback(json) {
			
		jQuery.each(json.typeInfosList, function(i, type) {
			
			if(selectMessage.split("#")[2]==type.typeInfoId)
				$("<option selected='selected' value="+type.typeInfoId+">"+type.typeName+"</option>").appendTo("#machinebrandId");
			else
				$("<option value="+type.typeInfoId+">"+type.typeName+"</option>").appendTo("#machinebrandId");
		});
			
}}
);
	function queryUserinfoP(value){
		var selectMessage=$("#selectMessage").val();
		var url="queryUserinfoP.action?selectID="+value;
		jQuery.post(url, {}, callback, "json");
		function callback(json) {
			$("#selectID").empty();
			$("<option value=00 selected='selected'>请选择</option>").appendTo("#selectID");
		jQuery.each(json.listUser, function(i, userInfo) {
			if(selectMessage.split("#")[4]==userInfo.userId)
				$("<option value="+userInfo.userId+" selected='selected' >"+userInfo.userName+"</option>").appendTo("#selectID");
			else
				$("<option value="+userInfo.userId+">"+userInfo.userName+"</option>").appendTo("#selectID");
		});
			
}}
	jQuery(function (){
		var url="selectOilBak.action";
		jQuery.post(url, {}, callback, "json");
		$("<option value=00 selected='selected'>请选择</option>").appendTo("#oilId");
		$("<option value=00 selected='selected'>请选择</option>").appendTo("#oilBak");
		$("<option value=00 selected='selected'>请选择</option>").appendTo("#oilNum");
		function callback(json) {
		jQuery.each(json.oilInfoList, function(i, type) {
				$("<option value="+type.oilBrand+">"+type.oilBrand+"</option>").appendTo("#oilId");
				$("<option value="+type.oilBrand+">"+type.oilBrand+"</option>").appendTo("#oilBak");
				$("<option value="+type.oilNum+">"+type.oilNum+"</option>").appendTo("#oilNum");
		});
			
}}
);

	function selectSite(value){
		queryUserinfoP(value);
		findDevice(value);
	}

