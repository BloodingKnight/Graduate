var selectID=null;	
jQuery(function (){
			var url="findPlaces.action";
			jQuery.post(url, {}, callback, "json");
			$("<option value=00 selected='selected'>请选择</option>").appendTo("#modelPlaceId");
			function callback(json) {
				jQuery.each(json.modelPlaceList, function(i, type) {
					$("<option value="+type.modelPlaceId+">"+type.modelPlaceName+"</option>").appendTo("#modelPlaceId");
			});
	}});
	jQuery(function (){
				var url="findSite.action";
				jQuery.post(url, {}, callback, "json");
				$("<option value=00 selected='selected'>请选择</option>").appendTo("#siteManagementID");
				function callback(json) {
					jQuery.each(json.siteManagementList, function(i, type) {
						if(i==0){selectID=type.siteManagementID;
							queryUserinfoP();
							findDevice();
						}
						$("<option value="+type.siteManagementID+">"+type.siteName+"</option>").appendTo("#siteManagementID");
				});
		}}
);
	function findDevice(){
		var url="findDevice.action?selectID="+selectID;
		jQuery.post(url, {}, callback, "json");
		$("#deviceId").empty();
		$("<option value=00 selected='selected'>请选择</option>").appendTo("#deviceId");
		function callback(json) {
		jQuery.each(json.deviceList, function(i, type) {
			    
				$("<option value="+type.deviceId+">"+type.deviceNum+"</option>").appendTo("#deviceId");
		});
			
}}

	jQuery(function (){
		var url="selectTypeMachinebrand.action";
		jQuery.post(url, {}, callback, "json");
		$("<option value=00 selected='selected'>请选择</option>").appendTo("#machinebrandId");
		function callback(json) {
		jQuery.each(json.typeInfosList, function(i, type) {
				$("<option value="+type.typeInfoId+">"+type.typeName+"</option>").appendTo("#machinebrandId");
		});
			
}}
);
	
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
	
	function queryUserinfoP(){
		var url="queryUserinfoP.action?selectID="+selectID;
		jQuery.post(url, {}, callback, "json");
		function callback(json) {
			$("#selectID").empty();
			$("<option value=00 selected='selected'>请选择</option>").appendTo("#selectID");
		jQuery.each(json.listUser, function(i, userInfo) {
				$("<option value="+userInfo.userId+">"+userInfo.userName+"</option>").appendTo("#selectID");
		});
			
}}
	function selectSite(value){
		selectID=value;
		queryUserinfoP();
		findDevice();
	}

