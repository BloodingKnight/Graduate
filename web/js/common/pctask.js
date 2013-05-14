var selectID=null;
//		<!-- 自动加载--%>	
	$(function ajaxpost(){
		var url="showProjectSetJspToDiv.action";
		var auData="";
		jQuery.post(url, auData, callback, "json");
		function callback(json) {
		jQuery.each(json.typeInfosList, function(i, type) {
			$("<option value='"+type.typeInfoId+"'>"+type.typeName+"</option>").appendTo("#typeInfoId");
		})
}})
//yaoqiu
jQuery(function(){
	var url="selectTypeAsk.action";
	var auData="";
	jQuery.post(url, auData, callback, "json");
	function callback(json) {
	jQuery.each(json.typeInfosList, function(i, type) {
		$("<option value='"+type.typeName+"'>"+type.typeName+"</option>").appendTo("#requestState");
	})}
})
//fangfa
jQuery(function(){
	var url="selectTypefun.action";
	var auData="";
	jQuery.post(url, auData, callback, "json");
	function callback(json) {
	jQuery.each(json.typeInfosList, function(i, type) {
		$("<option value='"+type.typeInfoId+"'>"+type.typeName+"</option>").appendTo("#pointCheckMethod");
	})}
})
jQuery(function(){
	var url="selectJobsType.action";
	var auData="";
	jQuery.post(url, auData, callback, "json");
	function callback(json) {
	jQuery.each(json.typeInfosList, function(i, type) {
		$("<option value='"+type.typeName+"'>"+type.typeName+"</option>").appendTo("#jobsType");
	})}
})
//<%-- 一级加载--%>	
		function selectType(value){
		var url="selectType.action?selectId="+value;
		jQuery.post(url, {}, callback, "json");
		function callback(json) {
			$("#typeBrandId").empty();
			$("#brandModelId").empty();
			$("#modelPlaceId").empty();
			$("<option value=00 selected='selected'>请选择</option>").appendTo("#typeBrandId");
			$("<option value=00 selected='selected'>请选择</option>").appendTo("#brandModelId");
			$("<option value=00 selected='selected'>请选择</option>").appendTo("#modelPlaceId");
		jQuery.each(json.typeBrandsList, function(j, type) {
			$("<option value='"+type.typeBrandId+"'>"+type.typeBrandName+"</option>").appendTo("#typeBrandId");
		}
		);
		}		
		}
//<%-- 二级加载--%>
function selectBrand(value){
	var url="selectBrand.action?selectId="+value;
	jQuery.post(url, {}, callback, "json");
	function callback(json) {
		$("#brandModelId").empty();
		$("#modelPlaceId").empty();
		$("<option value=00 selected='selected'>请选择</option>").appendTo("#brandModelId");
		$("<option value=00 selected='selected'>请选择</option>").appendTo("#modelPlaceId");
		jQuery.each(json.brandModelsList, function(jj, type) {
			$("<option value="+type.brandModelId+">"+type.brandModelName+"</option>").appendTo("#brandModelId");
			
		});}

	}
//<%-- 三级加载--%>
function selectModel(value){
	
	var url="selectModel.action?selectId="+value;
	jQuery.post(url, {}, callback, "json");
	function callback(json) {
		$("#modelPlaceId").empty();
		$("<option value=00 selected='selected'>请选择</option>").appendTo("#modelPlaceId");
		jQuery.each(json.modelPlacesList, function(jjj, type) {
			$("<option value="+type.modelPlaceId+">"+type.modelPlaceName+"</option>").appendTo("#modelPlaceId");
			}
		)
		}
}

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
function findDevice(){
	var url="findDevice.action?selectID="+selectID;
	jQuery.post(url, {}, callback, "json");
	function callback(json) {
	jQuery.each(json.deviceList, function(i, type) {
			$("<option value="+type.deviceId+">"+type.deviceNum+"</option>").appendTo("#deviceId");
	});
		
}}

jQuery(function (){
	var url="findSite.action";
	jQuery.post(url, {}, callback, "json");
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


