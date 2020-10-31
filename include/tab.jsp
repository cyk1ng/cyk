<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div name="flow_tab_name" title="流程图" visible="false">
	<div id=""  style="height:100%">
		<img id="imageFullScreen" src="" style="width: 100%;height: auto;"/>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			if(window.parent.processInstanceId){
				getCurrentImg({instanceId:window.parent.processInstanceId});
			}
			
		});
		
		function getCurrentImg(paramObj){
			$.ajax({
		       	url: "${webProperties['app.url.businessApproval']}/common/getCurrentImage.htm",
				type: 'post',
		        contentType: "application/x-www-form-urlencoded; charset=utf-8",
				data:{instanceId:paramObj.instanceId},
				success:function(data){
					var obj = mini.decode(data);
					
					$("#imageFullScreen").attr("src","data:image/png;base64," + obj.pngStr);
					var tabs = mini.get("tabs1");
		            var tab = tabs.getTab("flow_tab_name");
		            if (tab) {
		                tabs.updateTab(tab, { visible: true });
		            }
					
					tabs.on("activechanged", function(e){
		            	if (e.tab.title == "流程图") {
					            $('#imageFullScreen').smartZoom({'containerClass':'zoomableContainer'});     
		            	}
		            });
					//console.log(data);
					
				},
				error:function(jqXHR, textStatus, errorThrown){
					mini.alert(jqXHR.responseText);
				}
		    });
		}
	</script>
</div>