<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>网络预约出租汽车运输证查看</title>
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
		<div id="tabs1" class="mini-tabs" activeIndex="0" style="width:100%;height:100%;" plain="false" buttons="#tabsButtons" buttonsAlign="right">
		    <!-- START 申请信息 -->
		    <%@ include file="networkReservationTaxiOp_applyInfo_view.jsp" %>
		    <!-- END 申请信息 -->
		    <!-- START 业务信息 -->
			<%@ include file="networkReservationTaxiOp_businessInfo_view.jsp" %>
			<!-- END 业务信息 -->
			<!-- START 申请材料 -->
	    	<%@ include file="networkReservationTaxiOp_applyMaterial.jsp" %>
	    	<!-- END 申请材料 -->
	    	<!-- START 法律文书 -->
	    	<%@ include file="/WEB-INF/jsp/include/commLawInfo.jsp" %>
	    	<!-- END 法律文书 -->
		    <!-- START 流程图 -->
		    <%@ include file="/WEB-INF/jsp/include/tab.jsp" %>
		    <!-- END 流程图 -->
		</div>
		 <div id="tabsButtons">
			<!--<a id="toggleBtn1" class="mini-button" iconCls="" onclick="test()">当场办结</a>
			<a id="toggleBtn2" class="mini-button" iconCls="" onclick="toggleTabs()">不予受理</a>
		    <a id="toggleBtn3" class="mini-button" iconCls="" onclick="doSave()">保存</a>
		    <a id="toggleBtn4" class="mini-button" iconCls="" onclick="toggleTabs()">重置</a>-->
		<a id="toggleBtn5" class="mini-button" style="display:none" iconCls="" onclick="saveFileClick()">保存</a>
		</div>  
	</div>
<script type="text/javascript">
	mini.parse();
	 var gridNewCarList = mini.get("datagridCarYes");//右侧
	 var tabs = mini.get("tabs1");
	 var userTaskId = "usertask26"
	 //这两个全局变量必须定义，打印需要用到
	 var acceptNumber;
	 var processInstanceId;
	 var userId = "${userId}";
	 var pageType = "${pageType}";
	 
	 var illegalCarInfoMap = {}; // 汽车违法信息
	
	//获取url中的请求参数
	function getRequestString(key){
	    var reg = new RegExp("(^|&)"+key+"=([^&]*)(&|$)");
	    var result = window.location.search.substr(1).match(reg);
	    return result?decodeURIComponent(result[2]):null;
	}
	$(document).ready(function(){
		// 个人不需要企业信息
		if (pageType == 'perTaxiAdd' || pageType == 'perTaxiDel' || pageType == 'perTaxiLicense') {
			$('#panel2', window.parent.document).css('display','none');
			gridNewCarList.hideColumn(gridNewCarList.getColumn(2));
		}
		var enterpriseNumber = mini.get("enterpriseNumber").getValue();
        if(enterpriseNumber != "" && enterpriseNumber != null){
        	getIllegalCarInfo(enterpriseNumber);//获取违法信息
        }
		// 初始化右表数据
		initGridData();
		 
		var model = getRequestString("model");
		//附件
		var projectnameSix = mini.get("#projectnameSix").getValue();
		$("#fileupload").load(function() {
         	$("#fileupload")[0].contentWindow.getList(projectnameSix);
        });
        
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
		/* setCeckDis();//设置材料为不可编辑 */
		
		$("#fileupload").load(function() {
	        $("#fileupload")[0].contentWindow.setCeckDis(); // 设置复选框不能选择
	        $("#fileupload")[0].contentWindow.setUploadDis(); // 隐藏上传按钮
	        $("#fileupload")[0].contentWindow.shouJianBuZhen(); // 隐藏收件补正按钮
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
	
	function test(){
		var form = new mini.Form("form");
		form.validate();
	}
	function onButtonEdit(e) {
	    alert("弹出选择");
	}
	function labelModel(formId) {
		var form = new mini.Form(formId);
        var fields = form.getFields();                
        for (var i = 0, l = fields.length; i < l; i++) {
            var c = fields[i];
            if(c.getEmptyText() && c.getValue() == ""){
            	c.setEmptyText("");
            }
            
            if (c.setReadOnly) c.setReadOnly(true);     //只读
            if (c.setIsValid) c.setIsValid(true);      //去除错误提示
            if (c.addCls) c.addCls("asLabel");          //增加asLabel外观
        }
    }
	
	//联系方式校验
	function onTelValidation(e){
		if (e.isValid) {
            if (isTel(e.value) == false) {
                e.errorText = "联系方式格式不对";
                e.isValid = false;
            }
        }
	}
	
	function isTel(value){
		if(value){
			if (/^\d+-?\d+$/.test(value)) return true;
	        return false;
		}else{
			return true;
		}
	}
	// 刷新右表数据
	function initGridData() {
		var vehicles = '${vehicles}';
		if(vehicles != null && vehicles != ""){
			mini.get('datagridCarYes').setData(eval(vehicles));
		}
	}
	
	// 通过企业编号，获取汽车违法信息
	function getIllegalCarInfo(enterpriseNumber) {
		$.ajax({
	        url: "${webProperties['app.url.approval']}/networkReservationTaxiOp/queryIllegalCarInfoAllByCom.htm",
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
