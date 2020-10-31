<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>经营许可</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@ include file="/WEB-INF/jsp/include/meta.jsp" %>
<style type="text/css">
html, body {
	padding: 0;
	margin: 0;
	border: 0;
	height: 100%;
	overflow: hidden;
	background-color: white;
}
.mini-tabs-buttons{
	padding-right: 30px;
}
</style>
</head>
<body>
	<div style="height: 100%">
		<div id="panel1" class="mini-panel" title="" iconCls="icon-add" style="width:100%;height:170px;" 
		    showToolbar="true" showCollapseButton="true"  collapseOnTitleClick="true" expanded="false" 
		>
			<%@ include file="/WEB-INF/jsp/include/commShiXiangInfo.jsp" %> 
		</div>
		<div id="panel2" class="mini-panel" title="企业信息" iconCls="icon-add" style="width:100%;height:135px;" 
		    showToolbar="true" showCollapseButton="true"  collapseOnTitleClick="true" expanded="true"
		    
		>
			<%@ include file="/WEB-INF/jsp/include/commYeHuPage.jsp" %>
		</div>
		
		<div id="bussinessFrameId"  class="mini-fit">
		  	<iframe id="license_frame" src="" frameborder="0" scrolling="no" scroll="no" marginheight="0" marginwidth="0" height="100%" width="100%" ></iframe>
		</div>
	</div>
<script type="text/javascript">
	var itemId;
	var isPanel1Display = false;
	var isPanel2Display = true;
	$(document).ready(function(){
		itemId = getRequestString("itemId");
		queryItemInfo(itemId);
		var panelResizeListener = setInterval(function(){
			var isPanel1DisplayCurrent = $("#panel1 .mini-panel-viewport").css("display") == "block";
			var isPanel2DisplayCurrent = $("#panel2 .mini-panel-viewport").css("display") == "block";
			if (isPanel1Display != isPanel1DisplayCurrent || isPanel2Display != isPanel2DisplayCurrent) {
				mini.layout();				
				isPanel1Display = isPanel1DisplayCurrent;
				isPanel2Display = isPanel2DisplayCurrent;
			}
		}, 100);
	});
	//获取url中的请求参数
	function getRequestString(key){
	    var reg = new RegExp("(^|&)"+key+"=([^&]*)(&|$)");
	    var result = window.location.search.substr(1).match(reg);
	    return result?decodeURIComponent(result[2]):null;
	}
	var url = getRequestString("url");
	var id = getRequestString("id");
	var type = getRequestString("type");
	var srcurl = "<c:url value='"+url+"'/>?model=edit&id="+id+"&type="+type;
	//if(hid == '12'){
		$("#license_frame").attr("src",srcurl);
	//}
</script>
</body>
</html>
