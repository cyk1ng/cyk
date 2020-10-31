<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>租赁汽车车辆营运证查看</title>
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
.asLabel .mini-textbox-border,
.asLabel .mini-textbox-input,
.asLabel .mini-buttonedit-border,
.asLabel .mini-buttonedit-input,
.asLabel .mini-textboxlist-border
{
    border:0;background:#f3f0f0;cursor:default;
}
.asLabel .mini-buttonedit-button,
.asLabel .mini-textboxlist-close
{
    display:none;
}
.asLabel .mini-textboxlist-item
{
    padding-right:8px;
}    

.mini-tabs-buttons{
	padding-right: 30px;
}
</style>
    <script src="${webProperties['app.url.approval']}/resources/js/taxi/commonUtil.js" type="text/javascript"></script>
    <script src="${webProperties['app.url.approval']}/resources/js/taxi/dealComn.js" type="text/javascript"></script>
</head>
<body>
	<div class="mini-fit">
		<div id="tabs1" class="mini-tabs" activeIndex="0" style="width:100%;height:100%;" plain="false" buttons="#tabsButtons" buttonsAlign="right" onactivechanged="doYeWuTab()">
		    <div title="申请信息" >
		    	<%@ include file="/WEB-INF/jsp/carLeaseOperation/viewCarApplyInfo.jsp"%>
		    </div>
			 <!-- START 业务信息 -->
			 <div title="业务信息">
		    	<%@ include file="/WEB-INF/jsp/carLeaseOperation/carBusinessInfo.jsp"%>
		    	<c:if test="${fromPageType == 'edit'}">
		    	<%@ include file="/WEB-INF/jsp/carLeaseOperation/viewCarBusinessInfo_del.jsp"%>
		    	</c:if>
	    	</div>
	    	<!-- END 业务信息 -->
		    <div title="申请材料">
<%-- 		        <%@ include file="/WEB-INF/jsp/include/commFileUploadPage.jsp" %> --%>
		        <iframe id="fileupload" src="${webProperties['app.url.commProcess']}/entrance/commFileListPage.htm" frameborder="0"
			 		scrolling="no" marginheight="0" marginwidth="0" height="100%" width="100%" >
				</iframe>
		    </div>
		     <!-- START 法律文书 -->
			<%@ include file="/WEB-INF/jsp/include/commLawInfo.jsp" %>
			<!-- END 法律文书 -->
			<!-- START 流程图 -->
		    <%@ include file="/WEB-INF/jsp/include/tab.jsp" %>
		    <!-- END 流程图 -->
		</div>
		<div id="tabsButtons">
			<!-- <a id="toggleBtn1" class="mini-button" iconCls="" onclick="test()">当场办结</a>
			<a id="toggleBtn2" class="mini-button" iconCls="" onclick="toggleTabs()">不予受理</a>
		    <a id="toggleBtn3" class="mini-button" iconCls="" onclick="doSave()">保存</a>
		    <a id="toggleBtn4" class="mini-button" iconCls="" onclick="toggleTabs()">重置</a> -->
		    <a id="toggleBtn5" class="mini-button" style="display:none" iconCls="" onclick="saveFileClick('lease')">保存</a>
		</div>
	</div>
<script type="text/javascript">
	mini.parse();
	var datagrid01 = mini.get("datagrid01");
	var gridNewCarList = mini.get("datagridCarYes");//右侧
	var userTaskId = "usertask26";
	var tabs = mini.get("tabs1");

	//这两个全局变量必须定义，打印需要用到
	var acceptNumber;
	var processInstanceId;
	 var userId = "${userId}";
	 
	 var illegalCarInfoMap = {}; // 汽车违法信息
	
	$(document).ready(function(){
		// 批量更新按钮隐藏
		$("#toggleBtnAdd").hide();
		$("#toggleBtnEdit").hide();
		// 隐藏列表checkcolunm
		datagrid01.hideColumn('cc');
		
		// 办证显示
		var projectnameSix = mini.get("projectnameSix").getValue();
		if (projectnameSix == "089204002002") {
			$("#banzheng").show();
			$("#tuizheng").hide();
			
			initEditGridData();
			// 初始化额度
	   		initCarCreditData();
		} else if (projectnameSix == "089204002001"){
			$("#banzheng").hide();
			$("#tuizheng").show();
			var enterpriseNumber = mini.get("enterpriseNumber").getValue();
	        if(enterpriseNumber != "" && enterpriseNumber != null){
	        	getIllegalCarInfo(enterpriseNumber);//获取违法信息
	        }
			initGridData();
		} else {
			initEditGridData();
			// 初始化额度
	   		initCarCreditData();
		}
// 		mini.get("#projectname").setValue(window.parent.itemObj.name);
//         mini.get("#applicationClass").setValue(window.parent.itemId);
//         mini.get("#overTime").setValue(window.parent.itemObj.approveTime);
		
		
		var model = getRequestString("model");
		//附件
		var projectnameSix = mini.get("#projectnameSix").getValue();
		$("#fileupload").load(function() {
         	$("#fileupload")[0].contentWindow.getList(projectnameSix);
        });
		var fileInfo = [];
        var applyMaterialsString = '${getFileEntity}';
        if(applyMaterialsString != "" && applyMaterialsString!=null){
	        var applyMaterials = JSON.parse(applyMaterialsString);
	        for (var i = 0; i < applyMaterials.length; i++) {
	            var params = {};
	            params.id = applyMaterials[i].materialCode;
	            params.fileName = applyMaterials[i].materialName;
	            params.shoudao = applyMaterials[i].getFileCount;
	            fileInfo.push(params);
	        }
	        $("#fileupload").load(function() {
	        	$("#fileupload")[0].contentWindow.setFileInfo(fileInfo, mini.get("#applyNumber").getValue());
	        });
        }
		if("view" == model){
			/* labelModel("form"); */
			var type = mini.get("#type").getValue();
            //这是前台传参数方法，通过modelview跳转页面通过别打的方法获取（1：申请页面，4：草稿箱）这两个类型没法律文书
            if("1" != type && "4" != type){
                var dataObj = {};
                dataObj.acceptNumber = mini.get("#acceptNumber").getValue();
                dataObj.projectnameSix = mini.get("#projectnameSix").getValue();
                getHistoryTasksByCondition({instanceId:window.parent.processInstanceId},dataObj);
            }
            if(type == "2"){
            	$("#fileupload").load(function() {
    		        $("#fileupload")[0].contentWindow.shouJianBuZhen(); // 隐藏收件补正按钮
            	});
    		} else {
    			$("#fileupload").load(function() {
    		        $("#fileupload")[0].contentWindow.setCeckDis(); // 设置复选框不能选择
    		        $("#fileupload")[0].contentWindow.setUploadDis(); // 隐藏上传按钮
    		        $("#fileupload")[0].contentWindow.shouJianBuZhen(); // 隐藏收件补正按钮
            	});
    		}
		}
// 		$("#fileupload").load(function() {
// 	        $("#fileupload")[0].contentWindow.setCeckDis(); // 设置复选框不能选择
// 	        $("#fileupload")[0].contentWindow.setUploadDis(); // 隐藏上传按钮
// 	        $("#fileupload")[0].contentWindow.shouJianBuZhen(); // 隐藏收件补正按钮
//     	});
		
		datagrid01.on("drawcell", function (e) {
            var record = e.record;
            var field = e.field;
            if (field == 'operationCertificateClass') {
            	var gridHtml = getNameByKeyType(record.operationCertificateClass);
            	e.cellHtml = gridHtml;
            }
            if (field == 'carType') {
            	var gridHtml = getNameByKeyRetail(record.carType);
            	e.cellHtml = gridHtml;
            }
            if (field == 'vehicleColour') {
            	var gridHtml = getNameByKeyColor(record.vehicleColour);
            	e.cellHtml = gridHtml;
            }
            if (field == 'cz') {
            	var gridHtml = "";
            	// 有受理编号查看，没有就可编辑/删除
            	var acceptNumber = mini.get("#acceptNumber").getValue();
            	if (acceptNumber == "" || acceptNumber == null || acceptNumber == "null") {
	            	gridHtml += '&nbsp;<a href="javascript:;" class="btn btn-sm green" style="width:50px;" onclick="editCarInfo();"><i class="fa fa-pencil"></i> 编辑 </a>';
	            	gridHtml += '&nbsp;<a href="javascript:;" class="btn btn-sm red" style="width:50px;" onclick="deleteCarInfo();"><i class="fa fa-remove"></i> 删除 </a>';
            	} else {
            		gridHtml += '&nbsp;<a href="javascript:;" class="btn btn-sm green" style="width:50px;" onclick="viewCarInfo();"><i class="fa fa-eye"></i> 查看 </a>';
            	}
            	e.cellHtml = gridHtml;
            }
		});
		datagrid01.on("rowdblclick",function(e){
		    var record=e.record;
		    viewCarInfo();
		});
		tabs.on("activechanged",function(e){
			var tab = e.tab;
			var type = mini.get("#type").getValue();
			if(tab.title == "申请材料" && model == "view" && type == "2"){
				$("#toggleBtn5").attr("style","")
			}else{
				$("#toggleBtn5").attr("style","display:none");
			}
		});
		
		gridNewCarList.on("drawcell", function (e) {
            var record = e.record;
            var field = e.field;
            if (field == 'enterpriseName') {
            	var gridHtml = mini.get("applyName").getValue();
            	e.cellHtml = gridHtml;
            }
         	// 车辆违章信息:isIllegal
         	if (field == "isIllegal") {
				var gridHtml = "";
				var licensePlate = (record.licensePlate != null && record.licensePlate != "") ? record.licensePlate :"";
				licensePlate = licensePlate.replace("-", "");
                
                if (illegalCarInfoMap[licensePlate] != null && illegalCarInfoMap[licensePlate] != "") {
       				gridHtml += illegalCarInfoMap[licensePlate];
       				
       				// 如果存在违章，则显示其他颜色
       				if (illegalCarInfoMap[licensePlate] != "无违章信息") {
       					e.rowStyle= "background:#DEB887";
       				}
        	    } else {
        	    	gridHtml += "无违章信息";
        	    }
                e.record.isIllegal = gridHtml;
           		e.cellHtml = gridHtml;
         	}
		});
		tabs.on("activechanged",function(e){
			var tab = e.tab;
			var type = mini.get("#type").getValue();
			if(tab.title == "申请材料" && model == "view" && type == "2"){
				$("#toggleBtn5").attr("style","")
			}else{
				$("#toggleBtn5").attr("style","display:none");
			}
		})
	});
	// 查看
	function viewCarInfo() {
		var row = datagrid01.getSelected();
		var enterpriseNumber = mini.get("enterpriseNumber").getValue();
		var companyName = mini.get("companyName").getValue();
	    var url = "${webProperties['app.url.approval']}/carLeaseOp/viewCarInfo.htm?enterpriseNumber="+ enterpriseNumber 
	    		+ "&companyName="+companyName+ "&row=" + encodeURIComponent(JSON.stringify(row));
	    larerOpen(url, "查看车辆信息");
	}
	// 刷新列表数据
	function initEditGridData() {
		var vehicles = '${vehicles}';
		if (vehicles != null && vehicles != "") {
			mini.get('datagrid01').setData(eval(vehicles));
		}
	}
	// 刷新右表数据
	function initGridData() {
		var vehicles = '${vehicles}';
		if(vehicles != null && vehicles != ""){
			mini.get('datagridCarYes').setData(eval(vehicles));
		}
	}
	// 刷新列表数据
	function initCarCreditData() {
		var ownerId = mini.get("#ownerId").getValue();
		//额度类型 1.出租 2.大中客车 3.租赁 4.特准 5.社会特准
		$.ajax({
			type : "POST", 
			url : "${webProperties['app.url.approval']}/carLeaseOp/getCarCreditData.htm",
			data : {  
				enterpriseId: ownerId,
				limitType: '3'
			},
			success : function(data){
				if(data != null && data != ""){
					data = $.parseJSON(data);
					mini.get('spare1').setValue(data.spare1);
					mini.get('totalMaxCarQuota').setValue(data.spare1);
					mini.get('spare2').setValue(data.spare2);
					mini.get('leftMaxCarQuota').setValue(data.spare2);
					mini.get('spare3').setValue(data.spare3);
					mini.get('totalMidCarQuota').setValue(data.spare3);
					mini.get('spare4').setValue(data.spare4);
					mini.get('leftMidCarQuota').setValue(data.spare4);
					mini.get('spare5').setValue(data.spare5);
					mini.get('totalMinCarQuota').setValue(data.spare5);
					mini.get('spare6').setValue(data.spare6);
					mini.get('leftMinCarQuota').setValue(data.spare6);
				}
			},
		})
	}
	// 查询
	function doSearch() {
		var vehicleColour = mini.get("vehicleColour").getValue();
		var licensePlate1 = mini.get("licensePlate1").getText();
		/* var licensePlate2 = mini.get("licensePlate2").getText();
		var licensePlate3 = mini.get("licensePlate3").getText(); */
		var licensePlate4 = mini.get("licensePlate4").getValue();
		var licensePlate = licensePlate1;
		var plate =  licensePlate4;
		// 冒泡排序
		var data = datagrid01.getData();
		var temp = {};
		for(var i=0;i<data.length-1;i++){
		 	for(var j=0;j<data.length-1-i;j++) {
		 		if(data[j].licensePlate > data[j+1].licensePlate) {
		 			temp=data[j];
		 			data[j]=data[j+1];
		 			data[j+1]=temp;
		 		}
		 	}
	 	}
		datagrid01.setData(data);
		
		datagrid01.filter(function(row) {
			var r1 = true;
            if (vehicleColour) {
                r1 = String(row.vehicleColour).indexOf(vehicleColour) != -1;
            }
            var r2 = true;
            var r3= true;
            var licen1=(row.licensePlate).substr(0,1);
            var licen2=(row.licensePlate).substr(1);
            if(licensePlate){
            	r2 = String(licen1).indexOf(licensePlate) != -1;
            }
            if (plate) {
           		r3 = String(licen2).indexOf(plate) != -1;
                
            }
            return r1 && r2 && r3;
		});
	}
	//重置查询条件
	function forReset(){
		mini.get("vehicleColour").setValue("");
		mini.get("licensePlate1").setValue("02");
		/* mini.get("licensePlate2").setValue("");
		mini.get("licensePlate3").setValue(""); */
		mini.get("licensePlate4").setValue("");
		doSearch();
	}
	
	// tab切换
	function doYeWuTab() {
		var tabs = mini.get("tabs1");
		// 业务信息tab
        if (tabs.activeIndex == 1) {
    		// 初始化额度
    		initCarCreditData();
        }
	}
	/**
     * 设置企业信息
     */
    function setCompanyData(comInfo){
    	// 初始化额度
		initCarCreditData();
	}

    
	// 通过企业编号，获取汽车违法信息
	function getIllegalCarInfo(enterpriseNumber) {
		$.ajax({
	        url: "${webProperties['app.url.approval']}/carLeaseOp/queryIllegalCarInfoAllByCom.htm",
	        data:{
	       	 'compamyNumber':enterpriseNumber
	        },
	        type:'POST',
	        dataType:"json",
	        async: true,
	        success:function(data){
	        	illegalCarInfoMap = data;
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
	        	illegalCarInfoMap = {};
	        }
	  	});
	}
</script>
</body>
</html>
