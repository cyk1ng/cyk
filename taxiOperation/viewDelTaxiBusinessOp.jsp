<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>巡游出租汽车车辆营运证查看注销</title>
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
<script src="${webProperties['app.url.approval']}/resources/js/taxi/dealComn.js" type="text/javascript"></script>
<script src="${webProperties['app.url.approval']}/resources/js/taxi/commonUtil.js" type="text/javascript"></script>
</head>
<body>
	<div class="mini-fit">
		<div id="tabs1" class="mini-tabs" activeIndex="0" style="width:100%;height:100%;" plain="false" buttons="#tabsButtons" buttonsAlign="right">
		    <div title="申请信息" >
		    	<form id="form" method="post">
		    		<table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
					    <tr id="applyNmTr">
							<td style="width:130px;" align="right" >受理编号：</td>
							<td style="width:100%">
								<input id="acceptNumber"  class="mini-textbox asLabel" style="width:96%;" readOnly="true" value="${taxiBussinessEntity.acceptNumber}"/>
							</td>
							<td style="width:130px;" align="right" ><!-- 处理结果： --></td>
							<td style="width:100%;">
<!-- 								<input id="result" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/> -->
							</td>
						</tr>
					    <tr>
					        <td style="width:130px;" align="right">申请日期：</td>
					        <td style="width:50%">
					            <input id="applyDate" name="applyDate" class="mini-datepicker asLabel" format="yyyy-MM-dd" style="width:96%;" readOnly="true" value="${taxiBussinessEntity.applyDate}"/>
					        </td>
					        <td style="width:130px;" align="right">申请人：</td>
					        <td style="width:50%">
					            <input id="applyName" name="applyName" class="mini-textbox  asLabel" style="width:98%;" readOnly="true" value="${taxiBussinessEntity.applyName}"/>
					        </td>
					    </tr>
					    <tr>
					         <td style="width:130px;" align="right">业户类型：</td>
							<td style="width:50%">
								<input id="companyEconomyType1" name="companyEconomyType1" class="mini-combobox asLabel" readOnly="true" valueField="typeCd" textField="typeNm" style="width:96%;" value="${taxiBussinessEntity.companyEconomyType1}"
								 url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=taxiEcoType"/>
							</td>
					        <td style="width:130px;" align="right">注册地址：</td>
					    	<td style="width:100%" >
					            <input id="registerAddress" name="registerAddress" class="mini-textbox  asLabel" style="width:98%;" readOnly="true" value="${taxiBussinessEntity.registerAddress}"/>
					        </td>
					        
					    </tr>
					     <tr>
					     	<td style="width:130px;" align="right">法定代表人：</td>
					        <td style="width:50%">
					            <input id="applyLegal" name="applyLegal" class="mini-textbox  asLabel" style="width:96%;" readOnly="true" value="${taxiBussinessEntity.applyLegal}"/>
					        </td>
					    	<td style="width:130px;" align="right">法定代表人电话：</td>
					    	<td style="width:100%" >
					            <input id="representativeTel" name="representativeTel" class="mini-textbox  asLabel" style="width:98%;" readOnly="true" value="${taxiBussinessEntity.representativeTel}"/>
					        </td>
					    </tr>
					    <tr>
					     	<td style="width:130px;" align="right">经营地址：</td>
					        <td style="width:50%">
					            <input id="operatingAddress" name="operatingAddress" class="mini-textbox  asLabel" style="width:96%;" readOnly="true" value="${taxiBussinessEntity.operatingAddress}"/>
					        </td>
					    	<td style="width:130px;" align="right">经营地址邮编：</td>
					    	<td style="width:100%" >
					            <input id="postcode" name="postcode" class="mini-textbox  asLabel" style="width:98%;" readOnly="true" value="${taxiBussinessEntity.postcode}"/>
					        </td>
					    </tr>
					    <tr>
					    	<td style="width:130px;" align="right">项目名称：</td>
					    	<td style="width:100%" colspan="3">
					            <input id="projectname" name="projectname" class="mini-textbox asLabel" style="width:98%;" readOnly="true" value="${taxiBussinessEntity.projectname}"/>
					        </td>
					    </tr>
					    <tr>
					        <td style="width:130px;" align="right">联系人：</td>
					        <td style="width:50%">
					            <input id="contact" name="contact" class="mini-textbox asLabel" style="width:96%;" readOnly="true" vtype="maxLength:20" value="${taxiBussinessEntity.contact}"/>
					        </td>
					        <td style="width:130px;" align="right">联系电话：</td>
					        <td style="width:50%">
					            <input id="contactNumber" name="contactNumber" class="mini-textbox asLabel" style="width:98%;" readOnly="true" onvalidation="onTelValidation" value="${taxiBussinessEntity.contactNumber}"/>
					        </td>
					    </tr>
					   
					    <tr>
					    	<td style="width:130px;" align="right">委托代理人：</td>
					    	<td style="width:100%" colspan="3">
					            <input id="agent" name="agent" class="mini-textbox asLabel" style="width:98%;" readOnly="true" vtype="maxLength:20" value="${taxiBussinessEntity.agent}"/>
					        </td>
					    </tr>
					    <tr>
					       	<td style="width:130px;" align="right">申请情况说明：</td>
					       	<td style="width:100%" colspan="3">
								<input id="applyDesc" name="applyDesc" class="mini-textarea asLabel" readOnly="true" style="width: 98%;height:130px;" value="${taxiBussinessEntity.applyDesc}"/>
							</td>
				       	</tr>
					    <tr>
							<td>
								<input id="applicationClass" name="applicationClass" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.applicationClass}"/>
								<input id="formType" name="formType" style="display:none" class="mini-textbox asLabel" value="${formType}"/>
<!-- 								<input id="applyId" style="display:none" class="mini-textbox asLabel" value=""/> -->
								<input id="overTime" name="overTime" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.overTime}"/>
								<input id="ownerId" name="ownerId" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.ownerId}"/>
								<input id="enterpriseNumber" name="enterpriseNumber" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.enterpriseNumber}"/>
								<input id="projectnameSix" name="projectnameSix" style="display:none" class="mini-textbox asLabel" value="${projectnameSix}"/>
								<input id="id" name="id" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.id}"/>
								<input id="type" style="display:none" class="mini-textbox asLabel" value="${type}"/>
								<input id="applyNumber" name="applyNumber" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.applyNumber }"/>
								<input id="companyEconomyType" name="companyEconomyType" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.companyEconomyType }"/>
							</td>
						</tr>
					</table>
		       </form>
		    </div>
		    <div title="业务信息" >
		    <%-- <div id="grid1" style="float:left;width:48%;height:800px">
				<div id="datagridCar" class="mini-datagrid" idField="eventId" url="${webProperties['app.url.approval']}/taxiBusinessOp/queryVehicleBasicTaxiList.htm"
					allowSortColumn="true" showPager="true" pageSize="10" 
					pager="pager1" style="width: 100%; height: 700px;"allowRowSelect="true" multiSelect="true" onloaderror="mini.alert(e.errorMsg);">
					<div property="columns">
					<div type="indexcolumn" align="center" width='50px'headerAlign="center">序号</div>
						<div field="vehiclelicense" align="center" width='100px' headerAlign="center">车牌照号</div>
						<div field="enterpriseName" align="center" width='100px'headerAlign="center">企业名称</div>
						<div field="isIllegal" align="center" width='100px'headerAlign="center">是否违法</div>
						<div field="id" id="id" visible="false"></div>
					</div>
				</div>
				</div> --%>
				<div id="grid2" style="float:right;width:100%;height:800px">
				<div id="datagridCarYes" class="mini-datagrid" idField="eventId"
					allowSortColumn="true" showPager="false" pageSize="10000"
					 style="width: 100%; height: 700px;"allowRowSelect="true" multiSelect="true" onloaderror="mini.alert(e.errorMsg);">
					<div property="columns">
					<div type="indexcolumn" align="center" width='50px'headerAlign="center">序号</div>
						<div field="licensePlate" align="center" width='100px' headerAlign="center">车牌照号</div>
						<div field="enterpriseName" align="center" width='100px'headerAlign="center">企业名称</div>
						<div field="isIllegal" align="center" width='100px'headerAlign="center">是否违章</div>
						<div field="id" id="id" visible="false"></div>
						<div field="selectCarId" id="selectCarId" visible="false"></div>
					</div>
				</div>
				</div>
			</div>
		    <div id="file" title="申请材料" >
<%-- 		    	<%@ include file="/WEB-INF/jsp/include/commFileUploadPage.jsp" %> --%>
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
		    <a id="toggleBtn5" class="mini-button" style="display:none" iconCls="" onclick="saveFileClick('taxi')">保存</a>
		</div>
	</div>
<script type="text/javascript">
	mini.parse();
	 /* var gridCarList = mini.get("datagridCar");//左侧 */
	 var gridNewCarList = mini.get("datagridCarYes");//右侧
	 var tabs = mini.get("tabs1");
	 
	 var userTaskId = "usertask26"
	 //这两个全局变量必须定义，打印需要用到
	 var acceptNumber;
	 var processInstanceId;
	 var userId = "${userId}";
	 
	 var illegalCarInfoMap = {}; // 汽车违法信息
	
	//获取url中的请求参数
	function getRequestString(key){
	    var reg = new RegExp("(^|&)"+key+"=([^&]*)(&|$)");
	    var result = window.location.search.substr(1).match(reg);
	    return result?decodeURIComponent(result[2]):null;
	}
	$(document).ready(function(){
		 var enterpriseNumber = mini.get("enterpriseNumber").getValue();
	        if(enterpriseNumber != "" && enterpriseNumber != null){
	        	getIllegalCarInfo(enterpriseNumber);//获取违法信息
	        }
		// 初始化右表数据
		initGridData();
		/* //初始化左表数据
		 initLeftGridData(); */
		 
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
		
		/* gridCarList.on("drawcell", function (e) {
            var record = e.record;
            var field = e.field;
            if (field == 'enterpriseName') {
            	var gridHtml = mini.get("applyName").getValue();
            	e.cellHtml = gridHtml;
            	e.record.value = gridHtml;
            }
         	// 车辆违章信息:isIllegal
         	if (field == "isIllegal") {
				var gridHtml = "";
				var vehiclelicense = (record.vehiclelicense != null && record.vehiclelicense != "") ? record.vehiclelicense :"";
				vehiclelicense = vehiclelicense.replace("-", "");
                
                if (illegalCarInfoMap[vehiclelicense] != null && illegalCarInfoMap[vehiclelicense] != "") {
       				gridHtml += illegalCarInfoMap[vehiclelicense];
       				
       				// 如果存在违章，则显示其他颜色
       				if (illegalCarInfoMap[vehiclelicense] != "无违章信息") {
       					e.rowStyle= "background:#DEB887";
       				}
        	    } else {
        	    	gridHtml += "无违章信息";
        	    }
           		e.cellHtml = gridHtml;
         	}
		}); */
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
				$("#toggleBtn5").attr("style","");
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
	/* // 刷新左表数据
	function initLeftGridData() {
		var param = {};
	     param.compamyNumber = mini.get("enterpriseNumber").getValue();
	     param.ownerId = mini.get("ownerId").getValue();
	     if((param.compamyNumber != "" && param.compamyNumber != null) && (param.ownerId != "" && param.ownerId != null)){
	    	 gridCarList.load(param);
	     }
	} */
	
	// 通过企业编号，获取汽车违法信息
	function getIllegalCarInfo(enterpriseNumber) {
		$.ajax({
	        url: "${webProperties['app.url.approval']}/taxiBusinessOp/queryIllegalCarInfoAllByCom.htm",
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
