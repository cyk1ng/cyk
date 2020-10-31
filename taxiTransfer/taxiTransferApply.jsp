<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>巡游出租汽车车辆营运证过户</title>
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
	.row-background-color1 {
		background-color:#FFDAB9 !important;
	}
</style>
    <script src="${webProperties['app.url.approval']}/resources/js/taxi/commonUtil.js" type="text/javascript"></script>
    <script src="${webProperties['app.url.approval']}/resources/js/taxi/dealComn.js" type="text/javascript"></script>
</head>
<body>
	<div class="mini-fit">
		<div id="tabs1" class="mini-tabs" activeIndex="0" style="width:100%;height:100%;" plain="false" buttons="#tabsButtons" buttonsAlign="right">
		    <!-- START 申请信息 -->
			<%@ include file="taxiTransferApply_applyInfo.jsp" %>
			<!-- END 申请信息 -->
			<!-- START 业务信息 -->
			<%@ include file="taxiTransferApply_businessInfo.jsp" %>
			<!-- END 业务信息 -->
			<!-- START 申请材料 -->
			<%@ include file="taxiTransferApply_applyMaterial.jsp" %>
			<!-- END 申请材料 -->
			<!-- START 法律文书 -->
			<%@ include file="/WEB-INF/jsp/include/commLawInfo.jsp" %>
			<!-- END 法律文书 -->
			<!-- START 流程图 -->
			<%@ include file="/WEB-INF/jsp/include/tab.jsp" %>
			<!-- END 流程图 -->
		</div>
		<div id="tabsButtons">
			<a id="toggleBtn1" class="mini-button" iconCls="" onclick="doAccept()">当场办结</a>
			<a id="toggleBtn2" class="mini-button" iconCls="" onclick="doNotAccept()">不予受理</a>
		    <a id="toggleBtn3" class="mini-button" iconCls="" onclick="doSave()">保存</a>
		    <a id="toggleBtn4" class="mini-button" iconCls="" onclick="doReset()">重置</a>
		    <a id="toggleBtn5" class="mini-button" style="display:none" iconCls="" onclick="saveFileClick('taxi')">保存</a>
		</div> 
	</div>
	<input id="formType" style="display:none" class="mini-textbox asLabel" value="${formType}"/>
	<input id="outManageclass" style="display:none" class="mini-textbox asLabel"/>
	
	<form id="form_hidden">
		<input id="applicationClass" name="applicationClass" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.applicationClass }"/>
		<input id="enterpriseNumber" name="enterpriseNumber" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.enterpriseNumber }"/>
		<input id="ownerId" name="ownerId" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.ownerId }"/>
		<input id="overTime" name="overTime" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.overTime }"/>
		<input id="id" name="id" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.id }"/>
		<input id="outEnterpriseId" name="outEnterpriseId" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.outEnterpriseId }"/>
		<input id="applyNumber" name="applyNumber" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.applyNumber }"/>
		<input id="companyEconomyType" name="companyEconomyType" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.companyEconomyType }"/>
		<input id="companyName" name="companyName" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.companyName }"/>
	</form>
<script type="text/javascript">
// 全局参数
var carColorList = []; // 汽车颜色
var carColorMap = {}; // 汽车颜色
var carTypeList = []; // 汽车类型
var carTypeMap = {}; // 汽车类型
var illegalCarInfoMap = {}; // 汽车违法信息
var approvalMap = {};


// 法律文书用全局变量
var userTaskId = "usertask26";
var userId = "${userId}";
var acceptNumber;
var processInstanceId;

// 获取汽车颜色
getCarColorList();
// 获取汽车类型
getCarTypeList();

// 获取汽车颜色
function getCarColorList() {
	$.ajax({
         url: "${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=vehicleColor",
         data:{},
         type:'POST',
         dataType:"json",
         async: false,
         success:function(data){
        	 carColorList = data;
        	 // 转换成MAP
        	 if (carColorList != null && carColorList.length > 0) {
        		 for (var i = 0; i < carColorList.length; i++) {
        			 carColorMap[carColorList[i].typeCd] = carColorList[i].typeNm;
        		 }
        	 }
         },
         error: function (jqXHR, textStatus, errorThrown) {
        	 carColorMap = {};
         }
   	});
}

// 获取汽车类型
function getCarTypeList() {
	$.ajax({
        url: "${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=taxiSize",
        data:{},
        type:'POST',
        dataType:"json",
        async: false,
        success:function(data){
        	 carTypeList = data;
	       	 // 转换成MAP
	       	 if (carTypeList != null && carTypeList.length > 0) {
	       		 for (var i = 0; i < carTypeList.length; i++) {
	       			 carTypeMap[carTypeList[i].typeCd] = carTypeList[i].typeNm;
	       		 }
	       	 }
        },
        error: function (jqXHR, textStatus, errorThrown) {
        	carTypeMap = {};
        }
  	});
}

// 通过企业ID获取过户企业信息，并设置额度
function setCompanyQuota(enterpriseId) {
	//额度类型 1.出租 2.大中客车 3.租赁 4.特准 5.社会特准
	$.ajax({
		type : "POST", 
		url : "${webProperties['app.url.approval']}/taxiTransfer/getCarCreditData.htm",
		data : {  
			enterpriseId: enterpriseId,
			limitType: '1'
		},
		async: true,
		success : function(data){
			if(data != null && data != ""){
				data = $.parseJSON(data);
				mini.get('miniCarInfo').setValue(data.miniCarQuota);
				mini.get('mediumCarInfo').setValue(data.mediumCarQuota);
				mini.get('largeCarInfo').setValue(data.largeCarQuota);
			}
		}, error: function (jqXHR, textStatus, errorThrown) {
			mini.get('miniCarInfo').setValue("");
			mini.get('mediumCarInfo').setValue("");
			mini.get('largeCarInfo').setValue("");
		}
	})
}

// 通过企业ID获取申请企业信息，并设置额度
function setApplyCompanyQuota(enterpriseId) {
	//额度类型 1.出租 2.大中客车 3.租赁 4.特准 5.社会特准
	$.ajax({
		type : "POST", 
		url : "${webProperties['app.url.approval']}/taxiTransfer/getCarCreditData.htm",
		data : {  
			enterpriseId: enterpriseId,
			limitType: '1'
		},
		async: true,
		success : function(data){
			if(data != null && data != ""){
				data = $.parseJSON(data);
				var ownQuota = parseInt(data.authorizedQty);
				$("#ownQuota").text(ownQuota);
				$("#sumQuota").text(4 - ownQuota);
			}
		}, error: function (jqXHR, textStatus, errorThrown) {
			$("#ownQuota").text(0);
		}
	})
}

// 通过企业编号，获取汽车违法信息
function getIllegalCarInfo(enterpriseNum) {
	$.ajax({
        url: "${webProperties['app.url.approval']}/taxiTransfer/queryIllegalCarInfoAllByCom.htm",
        data:{
       	 'enterpriseNum':enterpriseNum
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

// 获取流程分类
getApprovalType({});
function getApprovalType(obj){
    $.ajax({
        url: "${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm",
        type: 'get',
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data:{clCd:"approve"},
        success:function(data){
            var dataArr = mini.decode(data);
            for(var i=0;i<dataArr.length;i++){
                approvalMap[dataArr[i].typeCd] = dataArr[i].typeNm;
            }
        },
        error:function(jqXHR, textStatus, errorThrown){
            mini.alert(jqXHR.responseText);
        }
    });
}
// 获取申请号
//type    01 :窗口  02:网申
function getSq(){
	debugger;
    $.ajax({
        url: "${webProperties['app.url.commProcess']}/entrance/getAcceptNumber.htm",
        type: 'get',
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data:{itemId: window.parent.itemId,type:'01'},
        async:false,
        success:function(data){
        	if (data != null && data != "") {
	            mini.get("#applyNumber").setValue(data.substring(1, data.length-1));
        	}
        },
        error:function(jqXHR, textStatus, errorThrown){
            mini.alert(jqXHR.responseText);
        }
    });
}
</script>
<script type="text/javascript">
	mini.parse();
	var datagrid01 = mini.get("datagrid01");
	var datagrid02 = mini.get("datagrid02");
	var datagridReadOnly = mini.get("datagridReadOnly");
	var tabs = mini.get("tabs1");
	// 初始化datagrid
	initDatagird();
	$(function() {
		try {if ("${taxiBussinessEntity.projectname}" == null || "${taxiBussinessEntity.projectname}" == "") {mini.get("#projectname").setValue(window.parent.itemObj.name);}} catch(e) {mini.get("#projectname").setValue("${taxiBussinessEntity.projectname}");console.log(e);}
		try {if ("${taxiBussinessEntity.applicationClass}" == null || "${taxiBussinessEntity.applicationClass}" == "") {mini.get("#applicationClass").setValue(window.parent.itemId);}} catch(e) {mini.get("#applicationClass").setValue("${taxiBussinessEntity.applicationClass }");console.log(e);}
		try {if ("${taxiBussinessEntity.overTime}" == null || "${taxiBussinessEntity.overTime}" == "") {mini.get("#overTime").setValue(window.parent.itemObj.approveTime);}} catch(e) {mini.get("#overTime").setValue("${taxiBussinessEntity.overTime }");console.log(e);}
		
		// 业务事项change事件
	    projectnameSixChange("init");
		
	 	// 无申请号时，获取申请号
	    if ("${taxiBussinessEntity.applyNumber}" == "" || "${taxiBussinessEntity.applyNumber}" == null) {
	    	getSq(); // 获取申请号
	    }
		// 获取对应事项的所有附件
		var projectnameSix = mini.get("#projectnameSix").getValue();
        $("#fileupload").load(function() {
         	$("#fileupload")[0].contentWindow.getList(projectnameSix);
        });
        // 获取当前申请中已申请的附件信息
        var fileInfo = [];
        var applyMaterials = '${getFileEntity}';
        applyMaterials = eval(applyMaterials);
        for (var i = 0; i < applyMaterials.length; i++) {
            var params = {};
            params.id = applyMaterials[i].materialCode;
            params.fileName = applyMaterials[i].materialName;
            params.shoudao = applyMaterials[i].getFileCount;
            fileInfo.push(params);
        }
        // 设置进去
        $("#fileupload").load(function() {
        	$("#fileupload")[0].contentWindow.setFileInfo(fileInfo, mini.get("#applyNumber").getValue());
        });
		
		// 获取URL参数
		var model = getRequestString("model");
		var id = getRequestString("id");
		// 查看模式时，都处于非编辑状态
		if(model == "view") {
			setQuotaValue();
			changeType('${taxiBussinessEntity.acceptNumber}', "", model);
			getCurrentImg({instanceId:'${taxiBussinessEntity.processInstanceId}'});
			
			// 通过企业ID获取企业信息，并设置额度
		    setCompanyQuota('${taxiBussinessEntity.outEnterpriseId }');
		    // 通过企业编号，获取汽车违法信息
		    getIllegalCarInfo('${taxiBussinessEntity.outEnterpriseNumber }');
			
			mini.get("#outEnterpriseName").setText('${taxiBussinessEntity.outEnterpriseName }'); // 该控件需手动设置页面内容
			mini.get("#outEnterpriseName").setValue('${taxiBussinessEntity.outEnterpriseName }'); // 该控件需手动设置页面内容
		}
		
		// 编辑模式，初始化企业额度和汽车违法信息
		if (model == "edit" && id != "" && id != null) {
		 	// 通过企业ID获取企业信息，并设置额度
		    setCompanyQuota('${taxiBussinessEntity.outEnterpriseId }');
		    // 通过企业编号，获取汽车违法信息
		    getIllegalCarInfo('${taxiBussinessEntity.outEnterpriseNumber }');
		    
		    mini.get("#outEnterpriseName").setText('${taxiBussinessEntity.outEnterpriseName }'); // 该控件需手动设置页面内容
			mini.get("#outEnterpriseName").setValue('${taxiBussinessEntity.outEnterpriseName }'); // 该控件需手动设置页面内容
			try {window.parent.setComInfo(mini.get("#applyName").getValue());} catch(e) {console.log(e);} // 回写申请单位信息
		}
		
		// 这是前台传参数方法，通过modelview跳转页面通过别打的方法获取（1：申请页面，4：草稿箱）这两个类型没法律文书
		var type = getRequestString("type");
		if("1" != type && "4" != type){
			var dataObj = {};
			dataObj.acceptNumber = '${taxiBussinessEntity.acceptNumber }';
			dataObj.projectnameSix = '${taxiBussinessEntity.projectnameSix }';
			try {
				getHistoryTasksByCondition({instanceId:window.parent.processInstanceId},dataObj);
			} catch(e) {
				console.log(e);
			}
		}
		
		// 车辆：下拉表单字段转换
		datagrid01.on("drawcell", function (e) {
            var record = e.record;
            var field = e.field;
            // 颜色
            if (field == 'color') {
                var gridHtml = "";
                
                if (carColorMap[record.color] != null) {
       				gridHtml += carColorMap[record.color];
        	    }
           		e.cellHtml = gridHtml;
            }
            
         	// 车辆类型 
            if (field == 'vehicleclass') {
                var gridHtml = "";
                
                if (carTypeMap[record.vehicleclass] != null) {
       				gridHtml += carTypeMap[record.vehicleclass];
        	    }
           		e.cellHtml = gridHtml;
            }
         	
         	// 车辆违章信息:ifPeccancy
         	if (field == "ifPeccancy") {
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
            
            // 车牌号去掉横杠
            if (field == "vehiclelicense") {
            	var gridHtml = "";
            	var vehiclelicense = (record.vehiclelicense != null && record.vehiclelicense != "") ? record.vehiclelicense :"";
            	gridHtml = vehiclelicense.replace("-", "");
            	e.cellHtml = gridHtml;
            }
            if(field == "checkcolumn"){
            var rightGridData = datagrid02.getData();
         	if(rightGridData != null && rightGridData.length > 0){
				for (var i = 0; i < rightGridData.length; i++) {
					if (e.record.vehiclelicense == rightGridData[i].licensePlate){
						e.rowStyle = "background:#FFDAB9";
						/* gridCarList.setSelected (e.row); */
					}

				}
			}
            }
        });
		
		// 车辆：下拉表单字段转换
		datagrid02.on("drawcell", function (e) {
            var record = e.record;
            var field = e.field;
            // 颜色
            if (field == 'licenseColor') {
                var gridHtml = "";
                
                if (carColorMap[record.licenseColor] != null) {
       				gridHtml += carColorMap[record.licenseColor];
        	    }
           		e.cellHtml = gridHtml;
            }
            
        	// 车辆类型 
            if (field == 'carType') {
                var gridHtml = "";
                
                if (carTypeMap[record.carType] != null) {
       				gridHtml += carTypeMap[record.carType];
        	    }
           		e.cellHtml = gridHtml;
            }
        	
         	// 车辆违章信息:ifPeccancy
         	if (field == "ifPeccancy") {
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
           		e.cellHtml = gridHtml;
         	}
            
            // 车牌号去掉横杠
            if (field == "licensePlate") {
            	var gridHtml = "";
            	var licensePlate = (record.licensePlate != null && record.licensePlate != "") ? record.licensePlate :"";
            	gridHtml = licensePlate.replace("-", "");
            	e.cellHtml = gridHtml;
            }
        });
		datagrid01.on("beforeload",function(e){
			var obj = [];
			var rightGridData = datagrid02.getData();
			if(rightGridData !=null && rightGridData.length>0){
				for(var i =0;i<rightGridData.length;i++){
					obj.push(rightGridData[i].licensePlate);
				}
				datagrid01.getLoadParams().gridData = obj; //将右表数据带到后台 ，加载左边表数据去除掉左表中右表有的数据
			};
		});
		
		// 车辆：下拉表单字段转换
		datagridReadOnly.on("drawcell", function (e) {
            var record = e.record;
            var field = e.field;
            // 颜色
            if (field == 'licenseColor') {
                var gridHtml = "";
                
                if (carColorMap[record.licenseColor] != null) {
       				gridHtml += carColorMap[record.licenseColor];
        	    }
           		e.cellHtml = gridHtml;
            }
            
        	// 车辆类型 
            if (field == 'carType') {
                var gridHtml = "";
                
                if (carTypeMap[record.carType] != null) {
       				gridHtml += carTypeMap[record.carType];
        	    }
           		e.cellHtml = gridHtml;
            }
        	
         	// 车辆违章信息:ifPeccancy
         	if (field == "ifPeccancy") {
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
           		e.cellHtml = gridHtml;
         	}
            
         	// 车牌号去掉横杠
            if (field == "licensePlate") {
            	var gridHtml = "";
            	var licensePlate = (record.licensePlate != null && record.licensePlate != "") ? record.licensePlate :"";
            	gridHtml = licensePlate.replace("-", "");
            	e.cellHtml = gridHtml;
            }
        });
		
		// 表格渲染完毕事件
		datagrid01.on("update",function(e){
			var data =  datagrid01.getData();
			if (data == null || data == '' || data.length == 0) {
				 //表数据为空时，去掉全选框的勾选
				 $("#datagrid01 .mini-grid-checkbox").removeClass("mini-grid-checkbox-checked");
		 	}
		});
		// 表格渲染完毕事件
		datagrid02.on("update",function(e){
			var data =  datagrid02.getData();
			if (data == null || data == '' || data.length == 0) {
				 //表数据为空时，去掉全选框的勾选
				 $("#datagrid02 .mini-grid-checkbox").removeClass("mini-grid-checkbox-checked");
		 	}
		});
		tabs.on("activechanged",function(e){
			var type = getRequestString("type");
			var tab = e.tab;
			if(tab.title == "申请材料" && model == "view" && type == "2"){
				$("#toggleBtn5").attr("style","")
			}else{
				$("#toggleBtn5").attr("style","display:none");
			}
		})
	})
	
	//查看状态时， 额度为空时设置默认值0
	function setQuotaValue(){
		var miniCarQuotaValue = mini.get("miniCarQuota").getValue();
		var mediumCarQuotaValue = mini.get("mediumCarQuota").getValue();
		var largeCarQuotaValue = mini.get("largeCarQuota").getValue();
		if(miniCarQuotaValue == "" || miniCarQuotaValue == null){
			mini.get("miniCarQuota").setValue("0");
		}
		if(mediumCarQuotaValue == "" || mediumCarQuotaValue == null){
			mini.get("mediumCarQuota").setValue("0");
		}
		if(largeCarQuotaValue == "" || largeCarQuotaValue == null){
			mini.get("largeCarQuota").setValue("0");
		}
	}
	// 初始化datagrid
	function initDatagird() {
		// 加载右侧数据、显示用datagird数据
		var vehicles = '${vehicles }';
		if(vehicles != null && vehicles != ""){
			datagrid02.setData(eval(vehicles));
			datagridReadOnly.setData(eval(vehicles));
		}
		// 加载左侧数据
		datagrid01.load({'enterpriseId':'${taxiBussinessEntity.outEnterpriseId }'}); 
	}
	
	// 车辆信息查询
	function execQuery(){
   	    mini.parse();
   	 	datagrid01.clearRows();
   	    var licensePlate1=mini.get("licensePlate1").getText();
   	 	/* var licensePlate2=mini.get("licensePlate2").getValue();
   		var licensePlate3=mini.get("licensePlate3").getValue(); */
   		var licensePlate4=mini.get("licensePlate4").getValue();
   		licensePlate4 = (licensePlate4 != null && licensePlate4 != "") ? licensePlate4 : "";
   		licensePlate4 = licensePlate4.toUpperCase(); // 小写转大写
   		var params={};
   		// 牌照第二位和第三位都存在时，中间加上横杠
   		/* if ((licensePlate2 != null && licensePlate2 != "")
   				&& (licensePlate3 != null && licensePlate3 != "")) {
	   		params.vehiclelicense=licensePlate1+licensePlate2+"-"+licensePlate3+licensePlate4; // 汽车牌照
   		} else {
   			params.vehiclelicense=licensePlate1+licensePlate2+licensePlate3+licensePlate4; // 汽车牌照
   		} */
   		params.locations = licensePlate1; // 属地
   		params.vehiclelicense=licensePlate4; // 汽车牌照
   		params.enterpriseId = mini.get("outEnterpriseId").getValue(); // 过户企业ID
   		params.t_seatcapacity = mini.get("#licenseTypeCd").getValue(); // 车辆类型
   		params.searchFlag = "search";
   		datagrid01.load(params,function(){
   			var data =  datagrid01.getData();
		 	if (data == null || data == '' || data.length == 0) {
				$("#datagrid01 .mini-grid-checkbox").removeClass("mini-grid-checkbox-checked");
		 	}
   		});
   }

    // 重置车辆查询
    function restQuery() {
    	// 重置查询条件
    	mini.get("licensePlate1").setValue("02");
   	 	/* mini.get("licensePlate2").setValue("");
   		mini.get("licensePlate3").setValue(""); */
   		mini.get("licensePlate4").setValue("");
   		mini.get("#licenseTypeCd").setValue("");
   		// 回调车辆查询
   		execQuery();
    }
  //控制左侧列表的选中状态
	function checkOnLeftCar(status,text){
	  debugger;
		if(status == "removeRight"){
			$("#datagrid01").find("tr[class*='mini-grid-row-selected']").addClass("row-background-color1");
		}else if(status == "removeLeft"){
			datagrid01.deselectAll(false);
			$(getJqObjByText(text)).parent("td").parent("tr").removeClass("row-background-color1").attr("style","");
			
		}
	}
	function getJqObjByText(text){
		text = text.replace("-","");
		var ele;
		$("#datagrid01").find("div:contains('"+text+"')").each(function(){
			if(this.innerHTML==text){
				ele = this; //此处，如果希望直接返回jquery对象，那就给 $(this) 的值
				return false; //加上这句，在找到第一个符合的元素时跳出$.each。
			}
		});
		return ele;
	}
	// 加入右侧
	function addRigthCar(){
		 var rowsCar = datagrid01.getSelecteds();
         if (rowsCar.length > 0) {
            for(var i=0;i<rowsCar.length;i++){
            	//验证右侧是否已经存在号牌 已存在 不进行添加
            	if(checkRightCarIFYes(rowsCar[i].vehiclelicense)){
            		var newRow = {
            				id: rowsCar[i].id,
            				selectCarId: rowsCar[i].id,
            				licensePlate: rowsCar[i].vehiclelicense,
            				licenseColor : rowsCar[i].color,
            				carType : rowsCar[i].vehicleclass,
            				ifPeccancy : rowsCar[i].ifPeccancy
            			};
            		var listSize=datagrid02.getData();
            		datagrid02.addRow(newRow, listSize.length);
            		addPlateNm();
            	}
            }
            // 控制左侧列表的选中状态
        	checkOnLeftCar("removeRight");
            // 删除左侧
//             deleteLeftCar();
         }
         
      	// 计算剩余的车辆
		 var data = datagrid02.getData();
		 $("#carCnt").text(data.length);
	}
	
	// 加入左侧
	function addLeftCar(){
		 var rowsCar = datagrid02.getSelecteds();
         if (rowsCar.length > 0) {
            for(var i=0;i<rowsCar.length;i++) {
            	// 验证左侧是否已经存在号牌 已存在 不进行添加
            	if(checkLeftCarIFYes(rowsCar[i].licensePlate)){
            		var newRow = {
            				id: rowsCar[i].selectCarId,
            				vehiclelicense: rowsCar[i].licensePlate,
            				color : rowsCar[i].licenseColor,
            				vehicleclass : rowsCar[i].carType,
            				ifPeccancy : rowsCar[i].ifPeccancy
            			};
            		var listSize= datagrid01.getData();
            		datagrid01.addRow(newRow, listSize.length);
            	}
            	checkOnLeftCar("removeLeft",rowsCar[i].licensePlate);
            }  
            // 删除右侧
            deleteRightCar();
         }
	}
	
	// 删除左侧车辆数据
	function deleteLeftCar(){
		var rows = datagrid01.getSelecteds();
		 if (rows.length > 0) {
			 datagrid01.removeRows(rows, false);                
         }
// 		 datagrid01.clearSelect(true); // 清除选中状态
		 // 表数据为空时，去掉全选框的勾选
		 $("#datagrid01").find("span[class*='mini-grid-checkbox']").removeClass("mini-grid-checkbox-checked");
	}
	
	// 删除右侧车辆数据
	function deleteRightCar(){
		var rows = datagrid02.getSelecteds();
		 if (rows.length > 0) {
			 datagrid02.removeRows(rows, false);
			 for (var i = 0; i < rows.length; i++) {
				 delPlateNm(rows[i].licensePlate);
			}
         }
// 		 datagrid02.clearSelect(true); // 清除选中状态
		 // 表数据为空时，去掉全选框的勾选
		 $("#datagrid02").find("span[class*='mini-grid-checkbox']").removeClass("mini-grid-checkbox-checked");
		 // 计算剩余的车辆
		 var data = datagrid02.getData();
		 $("#carCnt").text(data.length);
	}
	
	// 验证左侧是否已经存在号牌
	function checkLeftCarIFYes(val){
		var rebool=true;
		var listcar=datagrid01.getData();
		for(var i=0;i<listcar.length;i++){
			if(listcar[i].vehiclelicense==val){
				rebool=false;
			}
		}
		return rebool;
	}
	
	// 验证右侧是否已经存在号牌
	function checkRightCarIFYes(val){
		var rebool=true;
		var listcar=datagrid02.getData();
		for(var i=0;i<listcar.length;i++){
			if(listcar[i].licensePlate==val){
				rebool=false;
			}
		}
		return rebool;
	}
	
	// 重置业务信息
	function resetBusssInfo(enterpriseId) {
		// 清空form表单
		new mini.Form("#form_company").clear();
		new mini.Form("#form_quota").clear();
		new mini.Form("#form_car").clear();
		
		// 重置datagrid
		if (enterpriseId != "" && enterpriseId != null) {
			var params = {'enterpriseId':enterpriseId};
			datagrid01.load(params); // 左侧datagrid
		} else {
			datagrid01.setData([]);
		}
		datagrid02.setData([]);  // 右侧datagrid
		datagridReadOnly.setData([]);  // 显示用DataGird
		// 去掉datagird的勾选
		$("#datagrid01").find("span[class*='mini-grid-checkbox']").removeClass("mini-grid-checkbox-checked");
		$("#datagrid02").find("span[class*='mini-grid-checkbox']").removeClass("mini-grid-checkbox-checked");
		
		// 清空已选车辆的数量
		$("#carCnt").text(0);
		
		// 属地设置默认值
		mini.get("licensePlate1").setValue("02");
		
		mini.get("applyDesc").setValue("");
		mini.get("outEnterpriseId").setValue(""); // 清空
	}
	
    // 业务事项change事件
    function projectnameSixChange(flag) {
    	var projectnameSix = mini.get("projectnameSix").getValue();
    	// 个体工商户转给个体工商户、 个体工商户转给符合条件的其他人、个体工商户转给企业
    	if (projectnameSix == "089106006001" || projectnameSix == "089106006003" || projectnameSix == "089106006004") {
    		$("#companyCarQuota").hide(); // 影藏“过户企业信息”中的额度信息
    		$("#quotaDiv").hide(); // 影藏“额度信息”选项
    		$("#carInfoRdio").hide(); // 影藏“车辆信息”中的单选框
    		$("#form_car").show(); // 显示车辆列表
    		
    		// 转出单位必须是个体工商户
    		mini.get("#outManageclass").setValue("1");
    	// 企业转给企业
    	} else {
    		$("#companyCarQuota").show(); // 显示“过户企业信息”中的额度信息
    		$("#quotaDiv").show(); // 显示“额度信息”选项
    		$("#carInfoRdio").show(); // 显示“车辆信息”中的单选框
    		
    		// 初始化时
    		if (flag == "init") {
	    		// 根据查询数据中是否是否有车辆信息
	    		var vehicles = eval('${vehicles}');
	    		if (vehicles != null && vehicles != undefined && vehicles.length > 0) {
	    			mini.get("carInfoRdio").setValue("1"); // 车辆设置选中状态
	    			// 车辆单选change事件
	    		    carInfoChange();
	    		} else {
		    		mini.get("quotaInfoRdio").setValue("1"); // 额度设置选中状态
		    		// 额度单选change事件
		    		quotaInfoChange();
	    		}
    		} else {
    			mini.get("quotaInfoRdio").setValue("1"); // 额度设置选中状态
	    		// 额度单选change事件
	    		quotaInfoChange();
    		}
    		
    		// 转出单位必须是企业
    		mini.get("#outManageclass").setValue("2");
    	}
    	
    	// 非初始化时
    	if (flag != "init") {
    		// 重置申请信息
    		try {window.parent.setNone();} catch(e) {console.log(e);}
    		// 清空选择申请企业后的设置值
	  		setCompanyDataBySelectUnit({});
    		
    		// 重置业务信息
	    	resetBusssInfo();
			
    		// 重新获取选择事项的所有附件列表
	    	var projectnameSix = mini.get("#projectnameSix").getValue();
        	$("#fileupload")[0].contentWindow.getList(projectnameSix);
    	}
    	
    	// 个体工商户转给个体工商户、 个体工商户转给符合条件的其他人
    	if (projectnameSix == "089106006001" || projectnameSix == "089106006003") {
    		// 在车辆栏显示“额度范围”
    		$("#carQuotaLimit").show();
    		// 初始化时，加载额度范围数据的限制数据
    		if (flag == "init") {
	    		var ownerId = mini.get("#ownerId").getValue();
	    		// 取得申请企业的已有车辆额度
	    		setApplyCompanyQuota(ownerId);
	    		// 统计右侧选择的车辆
	    		var data = datagrid02.getData() != null ? datagrid02.getData() : [];
	    		var dataSize = Array.isArray(data) ? data.length : 0;
	    		$("#carCnt").text(dataSize);
    		}
    		
    		try {
	    		// 设置申请单位为个体工商户
	    		window.parent.setHangYe("出租","2011","","1");
    		} catch(e) {
    			console.log(e);
    		}
    	// 其他事项，影藏“额度范围”
    	} else {
    		$("#carQuotaLimit").hide();
    		
    		try {
	    		// 设置申请单位为企业
	    		window.parent.setHangYe("出租","2011","","2");
    		} catch(e) {
    			console.log(e);
    		}
    	}
    }
    
    // 额度单选change事件
    function quotaInfoChange() {
    	var quotaInfoRdio = mini.get("quotaInfoRdio").getValue();
    	if (quotaInfoRdio == "1") {
    		$("#form_quota").show();
    		$("#form_car").hide();
    		
    		mini.get("carInfoRdio").setValue(""); // 清除选中装填
    	}
    }
    
    // 车辆单选change事件
    function carInfoChange() {
    	var carInfoRdio = mini.get("carInfoRdio").getValue();
    	if (carInfoRdio == "1") {
    		$("#form_quota").hide();
    		$("#form_car").show();
    		
    		mini.get("quotaInfoRdio").setValue(""); // 清除选中装填
    	}
    }
	
  	// 获取url中的请求参数
	function getRequestString(key){
	    var reg = new RegExp("(^|&)"+key+"=([^&]*)(&|$)");
	    var result = window.location.search.substr(1).match(reg);
	    return result?decodeURIComponent(result[2]):null;
	}
  	// 非活性控制
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
  	
  	// 保存
  	function doSave(){
		var applyName = mini.get("applyName").getValue();
		if (applyName == '' || applyName == null) {
			mini.alert("企业申请信息不能为空！");
			return;
		}
  		// 获取form数据
	  	var formData = {};
	  	var vehicles = [];
  		if (!getFromData(formData, vehicles, "doSave")) {
  			return "";
  		}
  		loading(true);
		$.ajax({
	       	url: "${webProperties['app.url.approval']}/taxiTransfer/saveTaxiTransfer.htm",
			type: 'post',
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data:{
				data:mini.encode(formData),
				vehicles:mini.encode(vehicles)
				},
			success:function(data){
				loading(false);
				 mini.alert("保存成功");
				 var result = $.parseJSON(eval(data));
				 // 新增保存成功后，赋予ID
				 var id = mini.get("#id").getValue();
				 if (id == "" || id == null) {
					 mini.get("#id").setValue(result.id);
				 }
			},
			error:function(jqXHR, textStatus, errorThrown){
				loading(false);
				mini.alert("保存失败");
			}
	    });
	}
  	
  	// 当场办结
	function doAccept(){
		var ownerId = mini.get("#ownerId").getValue();
		var outEnterpriseId = mini.get("#outEnterpriseId").getValue();
		// 申请企业不能为空
		var applyName = mini.get("applyName").getValue();
		if (applyName == '' || applyName == null) {
			mini.alert("企业申请信息不能为空！");
			return;
		}
		// 过户企业不能不为空
		if (outEnterpriseId == "" || outEnterpriseId == null) {
			mini.alert("出让企业信息不能为空！");
			return;
		}
		mini.confirm("确认要办结吗？", "确定", function(action) {
			if (action == "ok") {
				// 过户企业和申请业务一致，提示错误
				if (ownerId != null && ownerId != "" 
						&& outEnterpriseId != null && outEnterpriseId != ""
						&& ownerId == outEnterpriseId) {
					mini.alert("申请企业和过户企业不能一致！");
					return "";
				}
				
		  		// 校验失败后，直接停止
		  		if (!isValidMoreQuota()) {
		  			return "";
		  		}
		  		
		  		// 获取form数据
			  	var formData = {};
			  	var vehicles = [];
		  		if (!getFromData(formData, vehicles, "doAccept")) {
		  			return "";
		  		}
		  		
				// 配置流程判断
				var approvingAuth = window.parent.itemObj.approvingAuth;
				formData.applyType = approvalMap[approvingAuth];
				
				loading(true);
				
				$.ajax({
			       	url: "${webProperties['app.url.approval']}/taxiTransfer/acceptTaxiTransfer.htm",
					type: 'post',
			        contentType: "application/x-www-form-urlencoded; charset=utf-8",
					data:{
						data:mini.encode(formData),
						vehicles:mini.encode(vehicles)
						},
					success:function(data){
// 						loading(false);
// 		                mini.alert("办结成功");
		               	var result = eval("("+data+")");
		                changeType(result.acceptNumber, "已办结", "");
		                getCurrentImg({instanceId:result.processInstanceId});
		                
		                // 受理成功将受理号，流程实例号赋值给全局变量
		                acceptNumber = result.acceptNumber;
						processInstanceId = result.processInstanceId;
						// 调用查询法律文书方法
						var paramObj = {};
						paramObj.subitemid = formData.projectnameSix;
						paramObj.nodeTaskid = userTaskId;
						paramObj.acceptNumber = result.acceptNumber;
						getLayerBook(paramObj);

						// 切换法律文书tab
						mini.get('tabs1').setActiveIndex(3);
						// 调用制证接口
						operCert(acceptNumber,'taxi');
	
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		            	loading(false);
		                mini.alert("办结失败");
		            }
			    });
			}
  		});
	}
  	
	// 不予受理
	function doNotAccept(){
		var ownerId = mini.get("#ownerId").getValue();
		var outEnterpriseId = mini.get("#outEnterpriseId").getValue();
		
		// 申请企业不能为空
		var applyName = mini.get("applyName").getValue();
		if (applyName == '' || applyName == null) {
			mini.alert("企业申请信息不能为空！");
			return;
		}
		// 过户企业不能不为空
		if (outEnterpriseId == "" || outEnterpriseId == null) {
			mini.alert("出让企业信息不能为空！");
			return;
		}
		mini.confirm("确认要不予受理吗？", "确定", function(action){
			if (action == "ok") {
				// 过户企业和申请业务一致，提示错误
				if (ownerId != null && ownerId != "" 
						&& outEnterpriseId != null && outEnterpriseId != ""
						&& ownerId == outEnterpriseId) {
					mini.alert("申请企业和过户企业不能一致！");
					return "";
				}
				// 校验失败后，直接停止
		  		if (!isValidMoreQuota()) {
		  			return "";
		  		}
				// 获取form数据
			  	var formData = {};
			  	var vehicles = [];
		  		if (!getFromData(formData, vehicles, "doNotAccept")) {
		  			return "";
		  		}
				
				// 配置流程判断
				var approvingAuth = window.parent.itemObj.approvingAuth;
				formData.applyType = approvalMap[approvingAuth];
				loading(true);
				$.ajax({
			       	url: "${webProperties['app.url.approval']}/taxiTransfer/noAcceptTaxiTransfer.htm",
					type: 'post',
			        contentType: "application/x-www-form-urlencoded; charset=utf-8",
					data:{
						data:mini.encode(formData),
						vehicles:mini.encode(vehicles)
						},
					success:function(data){
						loading(false);
		                mini.alert("不予受理成功");
						var result = eval("("+data+")");
						changeType(result.acceptNumber, "不予受理", "");
						getCurrentImg({instanceId:result.processInstanceId});

						// 不予受理成功将受理号，流程实例号赋值给全局变量
						acceptNumber = result.acceptNumber;
						processInstanceId = result.processInstanceId;
						// 调用查询法律文书方法
						var paramObj = {};
						paramObj.subitemid = formData.projectnameSix;
						paramObj.nodeTaskid = userTaskId;
						paramObj.acceptNumber = result.acceptNumber;
						getLayerBook(paramObj);
						// 切换法律文书tab
						mini.get('tabs1').setActiveIndex(3);
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		            	loading(false);
		                mini.alert("不予受理失败");
		            }
			    });
			}
  		});
	}
	
	// 获取form数据
	function getFromData(formData, vehicles, type) {
		// 表单信息
		var form_apply = new mini.Form("form_apply");
		var form_company = new mini.Form("#form_company");
		var form_quota = new mini.Form("#form_quota");
		var form_hidden = new mini.Form("#form_hidden");
		
		// 表单校验
		form_apply.validate();
		form_company.validate();
		form_quota.validate();
        if (form_apply.isValid() == false || form_company.isValid() == false || form_quota.isValid() == false){
        	mini.alert("您填写的信息中可能存在异常，请确认后再操作。");
            return false;
        }
     	// 表单信息
		var form_applyData = form_apply.getData(true);
		var form_companyData = form_company.getData(true);
		var form_quotaData = form_quota.getData(true);
		var form_hiddenData = form_hidden.getData(true);
		Object.assign(formData, form_applyData, form_companyData, form_quotaData, form_hiddenData); // 多个form合拼成一个
		
		// 据不同业务事项，进行设置额度数据
		setQuotaData(formData);
		
		// 车辆信息
		var vehiclesData = datagrid02.getData();
		var quotaInfoRdio = mini.get("#quotaInfoRdio").getValue(); // 额度选择框
	 	// 根据不同业务事项，是否保存车型信息(注：过户额度时，不保存车辆信息)
	    var projectnameSix = mini.get("#projectnameSix").getValue();
		if (projectnameSix == "089106006002" && quotaInfoRdio == "1") {
			vehiclesData = [];
		}
		// 把数组复制到传入参数中
		for (var i = 0; i < vehiclesData.length; i++) {
			vehiclesData[i].operationCertificateClass = "1"; // 迅游固定传1
			// 车辆类型没有值时
			if (vehiclesData[i].carType == "" || vehiclesData[i].carType == null) {
				vehiclesData[i].carType = "3";
			}
			vehicles.push(vehiclesData[i]);
		}
		
		// 获取附件信息
		$("#fileupload")[0].contentWindow.getFileInfo(mini.get("#applyNumber").getValue());
		var fileInfo = $("#fileupload")[0].contentWindow.fileInfo;
        var arr = [];
        for (var i = 0; i < fileInfo.length; i++) {
            var GetFileEntity = {};
            GetFileEntity.materialCode = fileInfo[i].id;
            GetFileEntity.materialName = fileInfo[i].fileName;
            GetFileEntity.getFileCount = fileInfo[i].shoudao;
            arr.push(GetFileEntity);
        }
        formData.applyMaterials = {
            'copyCode':arr
		}
        
        return true;
	}
	
	// 校验是否超出额度
	function isValidMoreQuota() {
		var result = true;
		// 根据不同业务事项，进行校验
		var projectnameSix = mini.get("#projectnameSix").getValue();
		
		// 个体工商户转给个体工商户、企业转给企业
		if (projectnameSix == "089106006001" || projectnameSix == "089106006003") {
			var vehicles = datagrid02.getData() != null ? datagrid02.getData() : [];
			var ownQuota = parseInt($("#ownQuota").text()); // 申请企业的额度
			if ((vehicles.length + ownQuota) > 4) {
				mini.alert("个体工商户额度上限为4");
				return false;
			}
		}
		
		// 个体工商户转给个体工商户、企业转给企业、个体工商户转给企业：办结时，必须选择车辆
		if (projectnameSix == "089106006001" || projectnameSix == "089106006003" || projectnameSix == "089106006004") {
			var vehicles = datagrid02.getData();
			// 未选择车辆
			if (vehicles == null || vehicles.length == 0) {
				mini.alert("未选择过户车辆");
				return false;
			}
		}
		
		var quotaInfoRdio = mini.get("#quotaInfoRdio").getValue(); // 额度选择框
		var carInfoRdio = mini.get("#carInfoRdio").getValue(); // 车辆选择框
		// 企业的额度:出让企业查询出的额度
		var miniCarInfo = mini.get("#miniCarInfo").getValue();
		miniCarInfo = (miniCarInfo != "" && miniCarInfo != null) ? parseInt(miniCarInfo) : parseInt(0);
		var mediumCarInfo = mini.get("#mediumCarInfo").getValue();
		mediumCarInfo = (mediumCarInfo != "" && mediumCarInfo != null) ? parseInt(mediumCarInfo) : parseInt(0);
		var largeCarInfo = mini.get("#largeCarInfo").getValue();
		largeCarInfo = (largeCarInfo != "" && largeCarInfo != null) ? parseInt(largeCarInfo) : parseInt(0);
		// 个体工商户转给企业：选择了填写额度
		if (projectnameSix == "089106006002" && quotaInfoRdio == "1") {
			// 输入的额度
			var miniCarQuota = mini.get("#miniCarQuota").getValue();
			var mediumCarQuota = mini.get("#mediumCarQuota").getValue();
			var largeCarQuota = mini.get("#largeCarQuota").getValue();
			// 大中小的额度都未输入时
			if ((miniCarQuota == "" || miniCarQuota == null)
					&& (mediumCarQuota == "" || mediumCarQuota == null)
					&& (largeCarQuota == "" || largeCarQuota == null)) {
				mini.alert("“额度过户”信息未填写。");
				return false;
			}
			
			miniCarQuota = (miniCarQuota != "" && miniCarQuota != null) ? parseInt(miniCarQuota) : parseInt(0);
			mediumCarQuota = (mediumCarQuota != "" && mediumCarQuota != null) ? parseInt(mediumCarQuota) : parseInt(0);
			largeCarQuota = (largeCarQuota != "" && largeCarQuota != null) ? parseInt(largeCarQuota) : parseInt(0);
			if (miniCarQuota > miniCarInfo) {
				mini.alert("“额度过户”的小型车额度超出“过户企业”的小型车额度。");
				return false;
			}
			if (mediumCarQuota > mediumCarInfo) {
				mini.alert("“额度过户”的中型车额度超出“过户企业”的中型车额度。");
				return false;
			}
			if (largeCarQuota > largeCarInfo) {
				mini.alert("“额度过户”的大型车额度超出“过户企业”的大型车额度。");
				return false;
			}
		}
		
		// 个体工商户转给企业：选择了选择具体过户的车辆
		if (projectnameSix == "089106006002" && carInfoRdio == "1") {
			var miniCarQuota = 0;
		    var mediumCarQuota = 0;
		    var largeCarQuota = 0;
		    var vehicles = datagrid02.getData(); // 车辆数据
		    if (vehicles != null && vehicles.length > 0) {
				for (var i = 0; i < vehicles.length; i++) {
					if (vehicles[i].carType == "3") {
						miniCarQuota = miniCarQuota + 1;
					} else if (vehicles[i].carType == "2") {
						mediumCarQuota = mediumCarQuota + 1;
					}  else if (vehicles[i].carType == "1") {
						largeCarQuota = largeCarQuota + 1;
					} else {
						// 以外都是小车
						miniCarQuota = miniCarQuota + 1;
					}
				}
			} else {
				mini.alert("未选择过户车辆");
				return false;
			}
		    
		    if (miniCarQuota > miniCarInfo) {
				mini.alert("“车辆过户”的小型车额度超出“过户企业”的小型车额度。");
				return false;
			}
			if (mediumCarQuota > mediumCarInfo) {
				mini.alert("“车辆过户”的中型车额度超出“过户企业”的中型车额度。");
				return false;
			}
			if (largeCarQuota > largeCarInfo) {
				mini.alert("“车辆过户”的大型车额度超出“过户企业”的大型车额度。");
				return false;
			}
		}
		return result;
	}
	
	// 据不同业务事项，进行设置额度数据
	function setQuotaData(formData) {
		var miniCarQuota = 0;
	    var mediumCarQuota = 0;
	    var largeCarQuota = 0;
	    var vehicles = datagrid02.getData(); // 车辆数据
	    var quotaInfoRdio = mini.get("#quotaInfoRdio").getValue(); // 额度选择框
	    var carInfoRdio = mini.get("#carInfoRdio").getValue(); // 车辆选择框
	 	// 根据不同业务事项，进行设置 
	    var projectnameSix = mini.get("#projectnameSix").getValue();
	 	// 个体工商户转给个体工商户、企业转给企业、个体工商户转给符合条件的其他人、
	 	if (projectnameSix == "089106006001" || projectnameSix == "089106006003" || projectnameSix == "089106006004") {
	 		if (vehicles != null) {
				for (var i = 0; i < vehicles.length; i++) {
					if (vehicles[i].carType == "3") {
						miniCarQuota = miniCarQuota + 1;
					} else if (vehicles[i].carType == "2") {
						mediumCarQuota = mediumCarQuota + 1;
					}  else if (vehicles[i].carType == "1") {
						largeCarQuota = largeCarQuota + 1;
					} else {
						// 以外都认为是小车
						miniCarQuota = miniCarQuota + 1;
					}
				}
			}
	 		// 设置额度
	 		formData.miniCarQuota = miniCarQuota;
	 		formData.mediumCarQuota = mediumCarQuota;
	 		formData.largeCarQuota = largeCarQuota;
	 	// 个体工商户转给企业：选择了具体的车辆
	 	} else if (projectnameSix == "089106006002" && carInfoRdio == "1") {
	 		if (vehicles != null) {
				for (var i = 0; i < vehicles.length; i++) {
					if (vehicles[i].carType == "3") {
						miniCarQuota = miniCarQuota + 1;
					} else if (vehicles[i].carType == "2") {
						mediumCarQuota = mediumCarQuota + 1;
					}  else if (vehicles[i].carType == "1") {
						largeCarQuota = largeCarQuota + 1;
					} else {
						// 以外都认为是小车
						miniCarQuota = miniCarQuota + 1;
					}
				}
			}
	 		// 设置额度
	 		formData.miniCarQuota = miniCarQuota;
	 		formData.mediumCarQuota = mediumCarQuota;
	 		formData.largeCarQuota = largeCarQuota;
	 	// 个体工商户转给企业：填写具体额度
	 	} else {
	 		// 不做处理
	 	}
	}
	
	// 修改为查看状态
    function changeType(acceptNumber,result, model) {
	    mini.get("#acceptNumber").setValue(acceptNumber);
	    // 结果为空时，表示为查看模式
	    if (result == null || result == "") {
	    	// 不显示处理结果
	    	$("#resultLabel").html("");
	    	$("#result").hide();
	    } else {
		    mini.get("#result").setValue(result);
	    }
	    mini.get("#contact").setReadOnly(true);
	    mini.get("#contact").addCls("asLabel");
	    mini.get("#contactNumber").setReadOnly(true);
	    mini.get("#contactNumber").addCls("asLabel");
	    mini.get("#agent").setReadOnly(true);
	    mini.get("#agent").addCls("asLabel");
        mini.get("#applyDesc").setReadOnly(true);
        mini.get("#applyDesc").addCls("asLabel");
        mini.get("#projectnameSix").setReadOnly(true);
        mini.get("#projectnameSix").addCls("asLabel");
        // 申请材料checkbox不可编辑
        if (model == "view") {
        	var type = getRequestString("type");
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
        } else {
        	$("#fileupload")[0].contentWindow.setCeckDis(); // 设置复选框不能选择
        	$("#fileupload")[0].contentWindow.setUploadDis(); // 隐藏上传按钮
	        $("#fileupload")[0].contentWindow.shouJianBuZhen(); // 隐藏收件补正按钮
        }
        
        // 查看模式时，不显示业务事项的radio,仅显示具体选中的业务事项
        if (model == "view") {
        	$("#projectnameSixTr1").hide();
        	$("#projectnameSixTr2").show();
        	mini.get("#projectnameSix2").setValue(mini.get("#projectnameSix").l0oOO.text);
        }
        
        mini.get("#outEnterpriseName").setReadOnly(true);
        mini.get("#outEnterpriseName").addCls("asLabel");
        mini.get("#miniCarQuota").setReadOnly(true);
        mini.get("#miniCarQuota").addCls("asLabel");
        mini.get("#mediumCarQuota").setReadOnly(true);
        mini.get("#mediumCarQuota").addCls("asLabel");
        mini.get("#largeCarQuota").setReadOnly(true);
        mini.get("#largeCarQuota").addCls("asLabel");
        
        var projectnameSix = mini.get("projectnameSix").getValue();
        var quotaInfoRdio = mini.get("#quotaInfoRdio").getValue();
        var carInfoRdio = mini.get("#carInfoRdio").getValue();
        // 第四个事项时,
        if (projectnameSix = "089106006002") {
        	// 且选择为额度时
        	if (quotaInfoRdio == "1") {
        		$("#quotaDiv").show();
        		$("#carDiv").hide();
        	} else {
        		$("#quotaDiv").hide();
        		$("#carDiv").show();
        	}
        }
        $("#quotaInfoRdio").hide();
        $("#carInfoRdio").hide();
        
        $("#toggleBtn1").hide();
        $("#toggleBtn2").hide();
        $("#toggleBtn3").hide();
        $("#toggleBtn4").hide();
        $("#applyNmTr").show();
        
        // 获得转出的车辆数据
        var data = datagrid02.getData();
        // 把数据放入显示用的车辆datagrid
        datagridReadOnly.setData(data);
        
        // 影藏车辆选择，显示车辆显示用的列表
        $("#form_car").hide();
        $("#datagridReadOnly").show();
        
    }
  	
  	// 重置
  	function doReset() {
		mini.confirm("确认要重置吗？", "确定", function(action) {
			if (action == "ok") {
		  		// 申请信息
	    		try {
		    		window.parent.setNone(); // 清空父页面的申请单位
		    		window.parent.setHangYe("出租","2011","","1"); // 设置申请单位为个体工商户
				} catch(e) {
					console.log(e);
				}
	    		// 清空选择申请企业后的设置值
		  		setCompanyDataBySelectUnit({});
		  		mini.get("contact").setValue("");
				mini.get("contactNumber").setValue("");
				mini.get("agent").setValue("");
				mini.get("applyDesc").setValue("");
				mini.get("projectnameSix").setValue("089106006001");
		  		
		  		// 业务信息-清空form表单
				new mini.Form("#form_company").clear();
				new mini.Form("#form_quota").clear();
				new mini.Form("#form_car").clear();
				// 业务信息-重置datagrid
				datagrid01.setData([]); // 左侧datagrid
				datagrid02.setData([]);  // 右侧datagrid
				datagridReadOnly.setData([]);  // 重置显示用dataGrid
				
				// 属地重置为沪
				mini.get("licensePlate1").setValue("02");
				
				// 清除附件选中状态
				$("#fileupload")[0].contentWindow.setCeckNoChe();
				// 清文件列表的
				var projectnameSix = mini.get("#projectnameSix").getValue();
                $("#fileupload")[0].contentWindow.getList(projectnameSix);
			}
  		});
  	}
  	
 	// 设置申请企业信息
    function setCompanyData(comInfo){
    	// 相邻两次的申请企业ID不一致
        var oldOwnerId = mini.get("#ownerId").getValue();
        if (oldOwnerId != comInfo.b_enterpriseId) {
        	// 重置业务信息
	    	resetBusssInfo();
        }
    	// 根据选择的申请单位设置企业信息
        setCompanyDataBySelectUnit(comInfo);
    	
     	// 个体工商户转给个体工商户、 个体工商户转给符合条件的其他人，设置额度限制范围数据
     	var projectnameSix = mini.get("projectnameSix").getValue();
    	if (projectnameSix == "089106006001" || projectnameSix == "089106006003") {
    		var ownerId = mini.get("#ownerId").getValue();
    		// 取得申请企业的已有车辆额度
    		setApplyCompanyQuota(ownerId);
    		// 统计右侧选择的车辆
    		var data = datagrid02.getData() != null ? datagrid02.getData() : [];
    		var dataSize = Array.isArray(data) ? data.length : 0;
    		$("#carCnt").text(dataSize);
    	}
 	}
  	
	// 根据选择的申请单位设置企业信息
    function setCompanyDataBySelectUnit(comInfo) {
        mini.get("#applyName").setValue(comInfo.b_cnname);
        mini.get("#companyEconomyType1").setValue(comInfo.b_manageclass);
        mini.get("#companyEconomyType").setValue(comInfo.b_economictype);
        mini.get("#registerAddress").setValue(comInfo.b_registeredaddress);
        mini.get("#applyLegal").setValue(comInfo.b_legalperson);
        mini.get("#representativeTel").setValue(comInfo.b_legalpersonphone);
        mini.get("#operatingAddress").setValue(comInfo.operateaddress);
        mini.get("#postcode").setValue(comInfo.operatepostalcode);
        mini.get("#enterpriseNumber").setValue(comInfo.taxiBaseNumber);
        mini.get("#ownerId").setValue(comInfo.b_enterpriseId);
        mini.get("#companyName").setValue(comInfo.b_cnname);
        mini.get("applyDesc").setValue("");
    }
	
 	// 查询企业信息
	function onButtonEdit(e) {
		var btnEdit = this;
		var tradeId = "2011";
		var type = "";
		var manageclass = mini.get("#outManageclass").getValue();
		mini.open({
// 		     url: "${webProperties['app.url.commProcess']}/entrance/commYeHuListPage.htm?industry="+this.value,
		     url : "${webProperties['app.url.commProcess']}/entrance/commYeHuListPage.htm?tradeId="+tradeId+"&type="+type+"&manageClass="+manageclass,
		     title: "选择企业",
		     width: 850,
		     height: 560,
		     ondestroy: function (action) {
		    	 var oldOutEnterprise = mini.get("outEnterpriseId").getValue();
		         if (action == "ok") {
		             var iframe = this.getIFrameEl();
		             var data = iframe.contentWindow.GetData();
		             data = mini.clone(data);    //必须
		             if (data) {
		                 comInfo = data;
		              	 // 两次所选企业不一致时，重新加载以下信息
		                 if (oldOutEnterprise != data.b_enterpriseId) {
		                	 // 重置业务信息
		                	 resetBusssInfo(data.b_enterpriseId);
		                 }
		             	 // 通过企业ID获取企业信息，并设置额度
		         	     setCompanyQuota(data.b_enterpriseId);
		         	     // 通过企业编号，获取汽车违法信息
		         	     getIllegalCarInfo(data.taxiBaseNumber);
		         	     
		              	 // 设置数据
		                 btnEdit.setValue(data.b_cnname);
		                 btnEdit.setText(data.b_cnname);
// 		                 mini.get("outEnterpriseNumber").setValue(data.b_economictypemc);
// 		                 mini.get("outRegisterAddress").setValue(data.b_organizationcode);
// 		                 mini.get("outApplyLegal").setValue(data.scopename);
		                 mini.get("outEnterpriseNumber").setValue(data.taxiBaseNumber); // 企业编号：查询违法记录
		                 mini.get("outRegisterAddress").setValue(data.b_registeredaddress);
		                 mini.get("outApplyLegal").setValue(data.b_legalperson);
		                 mini.get("outEnterpriseId").setValue(data.b_enterpriseId); // 查询过户企业额度用的
		             }
		         }
	    	}
		});
	}
	//申请信息自动输入车牌号
	function addPlateNm(){
 		var applyDescVl=mini.get("applyDesc").getValue();
		var vehicles = datagrid02.getChanges();
		var plateNm="";
		for (var i = 0; i < vehicles.length; i++) {
			if (applyDescVl.indexOf(vehicles[i].licensePlate) == -1) {
				if(vehicles[i]._state == "added"){
					plateNm+=vehicles[i].licensePlate+";"
				}
			}
		}
		mini.get("applyDesc").setValue(applyDescVl+plateNm);
	}
	//申请信息删除车牌号
	function delPlateNm(licensePlate){
 		var applyDescVl=mini.get("applyDesc").getValue();
 		applyDescVl = applyDescVl.replace(licensePlate+";", "");
		mini.get("applyDesc").setValue(applyDescVl);
	}
	

</script>
<!-- 校验信息 -->
<script type="text/javascript">
// // 联系方式校验
// function onTelValidation(e){
// 	if (e.isValid) {
//         if (isTel(e.value) == false) {
//             e.errorText = "请输入11位号码";
//             e.isValid = false;
//         }
//     }
// }
// // 手机号码
// function isTel(value){
// 	if(value){
// 		if (/^1\d{10}$/.test(value)) return true;
//         return false;
// 	}else{
// 		return true;
// 	}
// }
// 整数校验
function onIntValidation(e){
	if (e.isValid) {
		if (e.value) {
	        if (/^[0-9]\d*$/.test(e.value)) {
	        	return true;
	        } else {
	        	e.errorText = "请输入整数数字";
	            e.isValid = false;
	        }
		}
    }
}
</script>
</body>
</html>
