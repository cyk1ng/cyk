<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div name="book" title="法律文书" visible="false">
    <div id="datagrid" class="mini-datagrid" url="${webProperties['app.url.approval']}/commCertificate/getCommCertificateList.htm"
         style="width:auto;height:auto;" idField="id" allowSortColumn="true" sizeList="[10,20,30]"
         pageSize="10" onloaderror="mini.alert(e.errorMsg);" showPager='false'>
            <div property="columns">
                <div type="indexcolumn"  align="center"  headerAlign="center">序号</div>
                <div field="wsbh" align="center" visible='false' width='80' headerAlign="center">文书编号</div>
                <div field="wsname" align="center" width='80' headerAlign="center">文书名称</div>
                <div field="printstatus"  align="center" visible='false' width='80' headerAlign="center">打印状态</div>
                <div field="printstatusmc" align="center" width='80' headerAlign="center">打印状态</div>
                <div field="cz" align="center" width="80" headerAlign="center">操作</div>
            </div>
    </div>
    <script type="text/javascript">
		 /**
		* 查询流程历史任务集合
		*/
		function getHistoryTasksByCondition(paramObj,businessObj){
			var sortCondition = {};
			sortCondition.orderByTaskCreateTime = "asc";
			paramObj.sortCondition = sortCondition;
			$.ajax({
		       	url: "${webProperties['app.url.approval']}/approvalProcess/getHistoryTasksByCondition.htm",
				type: 'post',
		        contentType: "application/x-www-form-urlencoded; charset=utf-8",
				data:{data:mini.encode(paramObj)},
				success:function(data){
					var dataObj = mini.decode(data);
					var result = dataObj.data;
					
					acceptNumber = businessObj.acceptNumber;
					processInstanceId = paramObj.instanceId;
					
					var type = getRequestString("type");//这是前台传参数方法，通过modelview跳转页面通过别打的方法获取
					var param = {};
			        param.subitemid=businessObj.projectnameSix;
					if("2" == type){
						var curTask = result[result.length-1].taskDefinitionKey; 
						param.nodeTaskid = curTask;
					}
					if("3" == type){
						var arr = [];
						for(var i=0;i<result.length;i++){
							if(userId == result[i].assignee){
								arr.push(result[i].taskDefinitionKey);
							}
						}
						param.nodeTaskid = arr.join(",");
					}
					param.acceptNumber = acceptNumber;
					getLayerBook(param);
					//var curTaskObj = result[result.length-1];
					
				},
				error:function(jqXHR, textStatus, errorThrown){
					mini.alert(jqXHR.responseText);
				}
		    });
		}
		
		/**
	     * 获取法律文书
	     */
	    function getLayerBook(paramObj) {
	        var datagrid = mini.get("datagrid");
	        datagrid.on("drawcell", function (e) {
	            var record = e.record;
	            var field = e.field;
	            if (field == 'cz') {
	                var gridHtml = "";
	                gridHtml +=
	                    '<a href="javascript:;" target="sub-right-frame" class="btn btn-sm green" style="width:50px;" onclick="toPrint(&quot;' +record.attcd + '&quot;,&quot;' +record.wsbh + '&quot;,&quot;' +paramObj.nodeTaskid + '&quot;,&quot;' +paramObj.subitemid + '&quot;);"><i class="fa fa-pencil"></i> 打印 </a>';
	                e.cellHtml = gridHtml;
	            }
	        });
	        datagrid.load(paramObj);
	        var tabs = mini.get("tabs1");
	        var tab = tabs.getTab("book");
	        if (tab) {
	            tabs.updateTab(tab, {visible: true});
	        }
	    }

	    /**
	     * 打印预览
	     */
	    function toPrint(attcd,wsbh,nodeTaskid,subitemid) {
	        var param = {};
	        var url = "${webProperties['app.url.approval']}/commCertificate/openPdfFileView.htm";
	        mini.open({
	            url: url,
	            title: "文书预览",
	            width: 950,
	            height: 600,
	            allowResize: false,
	            onload: function () {
	                //debugger;
	                var iframe = this.getIFrameEl();
	                var param = {};
	                param.acceptNumber = acceptNumber,//业务编号
	                    param.processInstanceId = processInstanceId,//流程实例ID
	                    param.fileName = wsbh;//文书编号
	                param.nodeTaskid = nodeTaskid;
	                param.subitemid = subitemid;
	                param.attcd = attcd;
	                param.processStatus = window.parent.processStatus;
	                iframe.contentWindow.SetData(param);
	            },
	            ondestroy: function (action) {
	                var paramObj = {};
	                paramObj.subitemid = subitemid;
	                paramObj.nodeTaskid = nodeTaskid;
	                paramObj.acceptNumber = acceptNumber;
	                getLayerBook(paramObj);
	            }
	        });

	    } 
	</script>
</div>

