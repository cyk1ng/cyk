<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>巡游出租汽车车辆营运证新增</title>
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
		    <div title="申请信息" >
		    	<%@ include file="/WEB-INF/jsp/taxiOperation/taxiApplyInfo.jsp"%>
		    </div>
		    <!-- START 业务信息 -->
		    <div title="业务信息" >
		    	<%@ include file="/WEB-INF/jsp/taxiOperation/taxiBusinessInfo.jsp"%>
	    	</div>
			<!-- END 业务信息 -->
		    <div title="申请材料">
<%-- 		       <%@ include file="/WEB-INF/jsp/include/commFileUploadPage.jsp" %> --%>
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
			<a id="toggleBtn1" class="mini-button" iconCls="" onclick="doAccept()">当场办结</a>
			<a id="toggleBtn2" class="mini-button" iconCls="" onclick="doNotAccept()">不予受理</a>
		    <a id="toggleBtn3" class="mini-button" iconCls="" onclick="doSave()">保存</a>
		    <a id="toggleBtn4" class="mini-button" iconCls="" onclick="doReset()">重置</a>
		</div> 
	</div>
<script type="text/javascript">
	mini.parse();
	var datagrid01 = mini.get("datagrid01");
	var userTaskId = "usertask26";
	var userId = "${userId}";
	
	//这两个全局变量必须定义，打印需要用到
	var acceptNumber;
	var processInstanceId;
	
	var model;
	var acceptNum;
	
	$(document).ready(function(){
		// 批量更新按钮隐藏
		$("#toggleBtnEdit").hide();
		// 隐藏列表checkcolunm
		datagrid01.hideColumn('cc');
		
		try {
			// 页面信息
			mini.get("#applyDate").setValue(new Date());
	        mini.get("#projectname").setValue(window.parent.itemObj.name);
	        mini.get("#applicationClass").setValue(window.parent.itemId);
	        mini.get("#overTime").setValue(window.parent.itemObj.approveTime);
		} catch(e) {
			console.log(e);
		}
		// 无申请号时，获取申请号
	    if ("${taxiBussinessEntity.applyNumber}" == "" || "${taxiBussinessEntity.applyNumber}" == null) {
	    	getSq(); // 获取申请号
	    }
		
	    // 业务信息初始化
	    doYeWuTab();
		
	    model = getRequestString("model");
	    acceptNum = getRequestString("acceptNumber");
        if("view" == model){
            labelModel("form");
            //form1.setData({name1:"test"});
            //form1.setEnabled(true);
            var type = mini.get("#type").getValue();
            //这是前台传参数方法，通过modelview跳转页面通过别打的方法获取（1：申请页面，4：草稿箱）这两个类型没法律文书
            if("1" != type && "4" != type){
                getHistoryTasksByCondition({instanceId:window.parent.processInstanceId},dataObj);
            }

        }else if("edit" == model && (acceptNum != "" && acceptNum != null)){
			labelModel("form");
			var type = mini.get("#type").getValue();
            //这是前台传参数方法，通过modelview跳转页面通过别打的方法获取（1：申请页面，4：草稿箱）这两个类型没法律文书
            if("1" != type && "4" != type){
                getHistoryTasksByCondition({instanceId:window.parent.processInstanceId},dataObj);
            }
			setSomeReadOnly();
		}else{
			try {window.parent.setHangYe("出租","2011","","");} catch(e) {console.log(e);}
        }
        
        var id = getRequestString("id");
        // 草稿箱
        if (model == "edit" && (id != null && id != "")) {
	        try {window.parent.setComInfo(mini.get("#applyName").getValue());} catch(e) {console.log(e);}
        }

		// 附件
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
		// 列表
		datagrid01.on("drawcell", function (e) {
			
            var record = e.record;
            var field = e.field;
            if (field == 'operationCertificateClass') {
            	var gridHtml = getNameByKeyType(record.operationCertificateClass);
            	e.cellHtml = gridHtml;
            }
            if (field == 'carType') {
            	var gridHtml = getNameByKeySize(record.carType);
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
	            	gridHtml += '&nbsp;<a href="javascript:;" class="btn btn-sm green" style="width:50px;" onclick="editTaxiInfo();"><i class="fa fa-pencil"></i> 编辑 </a>';
	            	gridHtml += '&nbsp;<a href="javascript:;" class="btn btn-sm red" style="width:50px;" onclick="deleteTaxiInfo();"><i class="fa fa-remove"></i> 删除 </a>';
            	} else {
            		gridHtml += '&nbsp;<a href="javascript:;" class="btn btn-sm green" style="width:50px;" onclick="viewTaxiInfo();"><i class="fa fa-eye"></i> 查看 </a>';
            	}
            	e.cellHtml = gridHtml;
            }
		});
	});
	// tab切换
	function doYeWuTab() {
       	// 初始化列表数据
   		initGridData();
   		// 初始化额度
   		initCarCreditData();
	}
	// 刷新列表数据
	function initGridData() {
		var vehicles = '${vehicles}';
		if(vehicles != null && vehicles != ""){
			mini.get('datagrid01').setData(eval(vehicles));
		} else {
			mini.get('datagrid01').setData([]);
		}
	}
	// 刷新列表数据
	function initCarCreditData() {
		var ownerId = mini.get("#ownerId").getValue();
		//额度类型 1.出租 2.大中客车 3.租赁 4.特准 5.社会特准
		$.ajax({
			type : "POST", 
			url : "${webProperties['app.url.approval']}/taxiBusinessOp/getCarCreditData.htm",
			data : {  
				enterpriseId: ownerId,
				limitType: '1'
			},
			success : function(data){
				if(data != null && data != ""){
					data = $.parseJSON(data);
					mini.get('spare1').setValue(data.spare1);
					mini.get('totalCarQuota').setValue(data.spare1);
					mini.get('spare2').setValue(data.spare2);
					mini.get('leftCarQuota').setValue(data.spare2);
					// 设置剩余额度
					setTaxiLeftCarQuotaRight(mini.get('datagrid01').getData());
				}else{
					mini.get('totalCarQuota').setValue("0");
					mini.get('totalCarQuota_right').setValue("0");
					mini.get('spare1').setValue("0");
					mini.get('leftCarQuota').setValue("0");
					mini.get('leftCarQuota_right').setValue("0");
					mini.get('spare2').setValue("0");
					// 设置剩余额度
					setTaxiLeftCarQuotaRight(mini.get('datagrid01').getData());
				}
			},
		})
	}
	
	//重置
	function doReset(){
		mini.confirm("确定重置？", "确定？",function (action) {
			if (action == "ok") {
				// 重置申请企业信息
				resetCompanyData();
				// 重置额度
				mini.get('totalCarQuota').setValue("0");
				mini.get('spare1').setValue("0");
				mini.get('totalCarQuota_right').setValue("0");
				mini.get('leftCarQuota').setValue("0");
				mini.get('spare2').setValue("0");
				mini.get('leftCarQuota_right').setValue("0");
				// 重置申请信息
				mini.get("contact").setValue("");
				mini.get("contactNumber").setValue("");
				mini.get("agent").setValue("");
				mini.get("applyDesc").setValue("");
				initGridData();
				initCarCreditData();
				
				// 重置列表查询条件
				mini.get("vehicleColour").setValue("");
				mini.get("licensePlate1").setValue("02");
				mini.get("licensePlate4").setValue("");
				
				// 清除附件选中状态:重置用
				$("#fileupload")[0].contentWindow.setCeckNoChe();
				// 清文件列表的
				var projectnameSix = mini.get("#projectnameSix").getValue();
                $("#fileupload")[0].contentWindow.getList(projectnameSix);
			}
		});
	}
	
	//获取小、中、大型车额度
	function getCarQuota(){
		var min = 0;
		var medium = 0;
		var large = 0;
		var gridData = datagrid01.getData();
		if(gridData != "" && gridData != null){
			for(var i = 0; i< gridData.length; i++){
				if(gridData[i].carTypeNm == "小"){
					min++;
				}else if(gridData[i].carTypeNm == "中"){
					medium++;
				}else if(gridData[i].carTypeNm == "大"){
					large++;
				}
			}
		}
		mini.get("miniCarQuota").setValue(min + "");
		mini.get("mediumCarQuota").setValue(medium + "");
		mini.get("largeCarQuota").setValue(large + "");
	}
	
	//保存
	function doSave(){
		var obj = new mini.Form("form");
		if(obj.validate() == false){
			return;
		}
		var applyName = mini.get("applyName").getValue();
		if (applyName == '' || applyName == null) {
			mini.alert("企业申请信息不能为空！");
			return;
		}
		loading(true);
		getCarQuota();
		var businessObj = {};
		var data = obj.getData();
		data.overTime = '0';
		$("#fileupload")[0].contentWindow.getFileInfo(mini.get("#applyNumber").getValue());
		var fileInfo = $("#fileupload")[0].contentWindow.fileInfo;
		obj.validate();
		var arr = [];
        for (var i = 0; i < fileInfo.length; i++) {
            var GetFileEntity = {};
            GetFileEntity.materialCode = fileInfo[i].id;
            GetFileEntity.materialName = fileInfo[i].fileName;
            GetFileEntity.getFileCount = fileInfo[i].shoudao;
            arr.push(GetFileEntity);
        }
        data.applyMaterials = {
            copyCode:arr
		}
// 		form.validate();
// 		var vehicles = datagrid01.getChanges();
		var vehicles = datagrid01.getData();
		jQuery.extend(businessObj, data);
		
		$.ajax({
	       	url: "${webProperties['app.url.approval']}/taxiBusinessOp/saveTaxiBusinessOp.htm",
			type: 'post',
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data:{data:mini.encode(businessObj), vehicles:mini.encode(vehicles)},
			success:function(data){
				loading(false);
				 mini.alert("保存成功");
				 var result = eval("("+data+")");
				 // 新增保存成功后，赋予ID
				 var id = mini.get("#id").getValue();
				 if (id == "" || id == null) {
					 mini.get("#id").setValue(result.id);
				 }
			},
			error:function(){
				loading(false);
				mini.alert("保存失败");
			}
	    });
	}
	//办结
	function doAccept(){
		var obj = new mini.Form("form");
		if(obj.validate() == false){
			return;
		}
		var applyName = mini.get("applyName").getValue();
		if (applyName == '' || applyName == null) {
			mini.alert("企业申请信息不能为空！");
			return;
		}
		var vehicles = datagrid01.getData();
		if (vehicles == '' || vehicles == '[]' || vehicles.length == 0) {
			mini.alert("请填写车辆信息！");
			return;
		}
		// 校验剩余额度
		if (checkTaxiLeftCarQuota() == false) {
			return;
		}
		mini.confirm("确定办结？", "确定？",function (action) {
			if (action == "ok") {
				loading(true);
				getCarQuota();
				var businessObj = {};
				var data = obj.getData();
				data.overTime = '0';
				$("#fileupload")[0].contentWindow.getFileInfo(mini.get("#applyNumber").getValue());
				var fileInfo = $("#fileupload")[0].contentWindow.fileInfo;
				obj.validate();
				var arr = [];
		        for (var i = 0; i < fileInfo.length; i++) {
		            var GetFileEntity = {};
		            GetFileEntity.materialCode = fileInfo[i].id;
		            GetFileEntity.materialName = fileInfo[i].fileName;
		            GetFileEntity.getFileCount = fileInfo[i].shoudao;
		            arr.push(GetFileEntity);
		        }
		        data.applyMaterials = {
		            copyCode:arr
				}
			 	//form.validate();
			 	//var vehicles = datagrid01.getChanges();
				
				jQuery.extend(businessObj, data);
					
				$.ajax({
			        url: "${webProperties['app.url.approval']}/taxiBusinessOp/acceptTaxiBusinessOp.htm",
				    type: 'post',
			        contentType: "application/x-www-form-urlencoded; charset=utf-8",
					data:{data:mini.encode(businessObj), vehicles:mini.encode(vehicles)},
					success:function(data){
// 						loading(false);
// 		                mini.alert("办结成功");
		                var result = eval("("+data+")");
		                changeType(result.acceptNumber,"已办结");
		                getCurrentImg({instanceId:result.processInstanceId});
		                
		                acceptNumber = result.acceptNumber;
						processInstanceId = result.processInstanceId;
					
						//调用查询法律文书方法
						var paramObj = {};
						paramObj.subitemid = mini.get("#projectnameSix").getValue();
						paramObj.nodeTaskid = userTaskId;
						paramObj.acceptNumber = result.acceptNumber;
						getLayerBook(paramObj);
						// 切换法律文书tab
						mini.get('tabs1').setActiveIndex(3);

						//调用制证接口
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
	//不受理
	function doNotAccept(){
		var obj = new mini.Form("form");
		if(obj.validate() == false){
			return;
		}
		var applyName = mini.get("applyName").getValue();
		if (applyName == '' || applyName == null) {
			mini.alert("企业申请信息不能为空！");
			return;
		}
		var vehicles = datagrid01.getData();
		if (vehicles == '' || vehicles == '[]' || vehicles.length == 0) {
			mini.alert("请填写车辆信息！");
			return;
		}
		// 校验剩余额度
		if (checkTaxiLeftCarQuota() == false) {
			return;
		}
		mini.confirm("确定不予受理？", "确定？",function (action) {
			if (action == "ok") {
				loading(true);
				getCarQuota();
				var businessObj = {};
				var data = obj.getData();
				data.overTime = '0';
				$("#fileupload")[0].contentWindow.getFileInfo(mini.get("#applyNumber").getValue());
				var fileInfo = $("#fileupload")[0].contentWindow.fileInfo;
				obj.validate();
				var arr = [];
		        for (var i = 0; i < fileInfo.length; i++) {
		            var GetFileEntity = {};
		            GetFileEntity.materialCode = fileInfo[i].id;
		            GetFileEntity.materialName = fileInfo[i].fileName;
		            GetFileEntity.getFileCount = fileInfo[i].shoudao;
		            arr.push(GetFileEntity);
		        }
		        data.applyMaterials = {
		            copyCode:arr
				}
			 	//form.validate();
			 	//var vehicles = datagrid01.getChanges();
				var vehicles = datagrid01.getData();
				jQuery.extend(businessObj, data);
					
				$.ajax({
			       	url: "${webProperties['app.url.approval']}/taxiBusinessOp/noAcceptTaxiBusinessOp.htm",
					type: 'post',
			        contentType: "application/x-www-form-urlencoded; charset=utf-8",
					data:{data:mini.encode(businessObj), vehicles:mini.encode(vehicles)},
					success:function(data){
						loading(false);
		                mini.alert("不予受理成功");
		                var result = eval("("+data+")");
		                changeType(result.acceptNumber,"不予受理");
		                getCurrentImg({instanceId:result.processInstanceId});
		                
		                acceptNumber = result.acceptNumber;
						processInstanceId = result.processInstanceId;
						
						var paramObj = {};
						paramObj.subitemid = mini.get("#projectnameSix").getValue();
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
	//新增
	function doAddTaxi() {
		var enterpriseNumber = mini.get("enterpriseNumber").getValue();
		var companyName = mini.get("companyName").getValue();
		
	    var url = "${webProperties['app.url.approval']}/taxiBusinessOp/addTaxiInfo.htm?enterpriseNumber="+ enterpriseNumber 
	    		+ "&companyName="+companyName + "&model="+model + "&acceptNum="+acceptNum;
	    larerOpen(url, "新增车辆信息");
	}

	 //编辑行
	 function editTaxiInfo() {
		var rows = datagrid01.getSelecteds();
		if (rows == '' || rows == '[]') {
			mini.alert("请至少选择一条记录！");
			return;
		}
		var uidArr = [];
		var batchInsertion = rows.length;
		for (var i = 0; i < batchInsertion; i++) {
			uidArr.push(rows[i]._uid);
		}
		uidArr.sort()
		var firstRow = datagrid01.getRowByUID(uidArr[0]);
		var enterpriseNumber = mini.get("enterpriseNumber").getValue();
		var companyName = mini.get("companyName").getValue();
		var url = "${webProperties['app.url.approval']}/taxiBusinessOp/editTaxiInfo.htm?enterpriseNumber="+ enterpriseNumber 
				+ "&companyName="+companyName + "&uidArr="+uidArr + "&row=" + encodeURIComponent(JSON.stringify(firstRow)); 
		larerOpen(url, "编辑车辆信息");
	 }
	// 查看
	function viewTaxiInfo() {
		var row = datagrid01.getSelected();
		var enterpriseNumber = mini.get("enterpriseNumber").getValue();
		var companyName = mini.get("companyName").getValue();
	    var url = "${webProperties['app.url.approval']}/taxiBusinessOp/viewTaxiInfo.htm?enterpriseNumber="+ enterpriseNumber 
	    		+ "&companyName="+companyName+ "&row=" + encodeURIComponent(JSON.stringify(row));
	    larerOpen(url, "查看车辆信息");
	}
	// 查询
	function doSearch() {
		var vehicleColour = mini.get("vehicleColour").getValue();
		var licensePlate1 = mini.get("licensePlate1").getText();
		/* var licensePlate2 = mini.get("licensePlate2").getText();
		var licensePlate3 = mini.get("licensePlate3").getText(); */
		var licensePlate4 = mini.get("licensePlate4").getValue();
		var licensePlate = licensePlate1;
		var plate = licensePlate4;
		
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
            var r3 = true;
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
	
	//修改为查看状态
    function changeType(acceptNumber,result) {
	    mini.get("#acceptNumber").setValue(acceptNumber);
	    mini.get("#result").setValue(result);
	    mini.get("#contact").setReadOnly(true);
	    mini.get("#contact").addCls("asLabel");
	    mini.get("#contactNumber").setReadOnly(true);
	    mini.get("#contactNumber").addCls("asLabel");
	    mini.get("#agent").setReadOnly(true);
	    mini.get("#agent").addCls("asLabel");
        mini.get("#applyDesc").setReadOnly(true);
        mini.get("#applyDesc").addCls("asLabel");
        $("#toggleBtn1").hide();
        $("#toggleBtn2").hide();
        $("#toggleBtn3").hide();
        $("#toggleBtn4").hide();
        $("#toggleBtnAdd").hide();
        var data = datagrid01.getData();
        mini.get('datagrid01').setData(data);
        $("#applyNmTr").show();
        $("#fileupload")[0].contentWindow.setCeckDis(); // 设置复选框不能选择
    	$("#fileupload")[0].contentWindow.setUploadDis(); // 隐藏上传按钮
        $("#fileupload")[0].contentWindow.shouJianBuZhen(); // 隐藏收件补正按钮
    }
	
    function setSomeReadOnly(){
	    mini.get("#contact").setReadOnly(true);
	    mini.get("#contact").addCls("asLabel");
	    mini.get("#contactNumber").setReadOnly(true);
	    mini.get("#contactNumber").addCls("asLabel");
	    mini.get("#agent").setReadOnly(true);
	    mini.get("#agent").addCls("asLabel");
        mini.get("#applyDesc").setReadOnly(true);
        mini.get("#applyDesc").addCls("asLabel");
        $("#toggleBtn1").hide();
        $("#toggleBtn2").hide();
        $("#toggleBtn3").hide();
        $("#toggleBtn4").hide();
	}
	 //删除行
	 function deleteTaxiInfo() {
		 var row = datagrid01.getSelected();
		 datagrid01.removeRow(row, false);
		 delPlateNm(row.licensePlate);
		 
		// 设置剩余额度
		setTaxiLeftCarQuotaRight(datagrid01.getData());
	 }
	// 验证是否有相同的车牌
	function checkEditGridData(dataParam, uidArr) {
		var flag = true;
// 		var licensePlate =  dataParam['licensePlate1Nm'] +  dataParam['licensePlate2'] 
// 		  + dataParam['licensePlate3'] +  dataParam['licensePlate4'];
		var licensePlate =  dataParam['licensePlate1Nm'] + dataParam['licensePlate4'];
		var licensePlateArr = [];
		var licensePlate4 = "";
		if (uidArr.length > 1) {
			for (var j = 0; j < uidArr.length; j++) {
				licensePlateArr.push(licensePlate);
				var em = 0;
				for(var i = 0;i < 26; i++){ 
					var charCode =String.fromCharCode(65+i);
					var lastIndex = parseInt(dataParam['licensePlate4'].lastIndexOf(charCode))
					if( dataParam['licensePlate4'].lastIndexOf(charCode) !=-1 && lastIndex > em){
						em = dataParam['licensePlate4'].lastIndexOf(charCode)
					}
				}
				// 获得数字组合
				var index =dataParam['licensePlate4'].substring(em+1,dataParam['licensePlate4'].length);
				// 获得其他组合
				var numberStr =dataParam['licensePlate4'].substring(0,em+1)
				// 数字相加
				var numberInt =parseInt(index)+parseInt(1);
				
				licensePlate4 = numberStr + numberInt;
// 				licensePlate = dataParam['licensePlate1Nm'] +  dataParam['licensePlate2'] 
// 				  + dataParam['licensePlate3'] + licensePlate4;
				licensePlate = dataParam['licensePlate1Nm'] + licensePlate4;
			}
		} else {
			licensePlateArr.push(licensePlate);
		}
		var data = datagrid01.getData();
		
		for (var j = 0; j < licensePlateArr.length; j++) {
			for (var i = 0; i < data.length; i++) {
				if (licensePlateArr[j] == data[i]['licensePlate'] && $.inArray(data[i]['_uid'] + "", uidArr) < 0 ) {
					flag = false;
					break;
				}
			}
		}
		return flag;
	}
	// 验证是否有相同的车牌
	function checkGridData(dataParam) {
		var flag = true;
		var data = datagrid01.getData();
		for (var i = 0; i < data.length; i++) {
// 			var licensePlate =  dataParam['licensePlate1Nm'] +  dataParam['licensePlate2'] 
// 			  + dataParam['licensePlate3'] +  dataParam['licensePlate4'];
			var licensePlate =  dataParam['licensePlate1Nm'] +  dataParam['licensePlate4'];
			if (data[i]['licensePlate'] == licensePlate) {
				flag = false;
			}
		}
		return flag;
	}
	// 刷新列表数据
	function setGridData(dataParam) {
		// 批量插入不为空，并且大于1，牌照号自增
		if (dataParam != null && dataParam != "" && typeof(dataParam) != "undefined") {
			var dataList = new Array();
			if (dataParam.batchInsertion != "" && dataParam.batchInsertion > 1) {
				for (var i = 0; i < dataParam.batchInsertion; i++) {
					var data={};
					Object.keys(dataParam).forEach(function(key){
						data[key] = dataParam[key];
						if ("licensePlate4" == key) {
// 							dataParam['licensePlate'] = dataParam['licensePlate1Nm'] +  dataParam['licensePlate2'] 
// 													  + dataParam['licensePlate3'] +  dataParam[key];
							dataParam['licensePlate'] = dataParam['licensePlate1Nm'] +  dataParam[key];
							var em = 0;
							for(var i = 0;i < 26; i++){ 
								var charCode =String.fromCharCode(65+i);
								var lastIndex = parseInt(dataParam[key].lastIndexOf(charCode))
								if( dataParam[key].lastIndexOf(charCode) !=-1 && lastIndex > em){
									em = dataParam[key].lastIndexOf(charCode)
								}
							}
							// 获得数字组合
							var index =dataParam[key].substring(em+1,dataParam[key].length);
							// 获得其他组合
							var paramStr =dataParam[key].substring(0,em+1);
							// 数字相加
							var numberStr ="00000"+(parseInt(index)+parseInt(1));
							var numberInt=numberStr.substring( numberStr.length-index.length,numberStr.length);
							
							dataParam[key] = paramStr + numberInt;
						}
					});
					dataList.add(data);
				}
				if(dataList != null && dataList.length){
					for(var i = dataList.length-1;i >= 0;i--){
						datagrid01.addRow(dataList[i], 0);
					}
				}
			} else {
				datagrid01.addRow(dataParam, 0);
			}
			// 设置剩余额度
			setTaxiLeftCarQuotaRight(datagrid01.getData());
		}
	}
	
	// 刷新列表数据
	function updateGridData(dataParam, uidArr) {
		var newRow = datagrid01.getRowByUID(uidArr[0]);
		datagrid01.updateRow(newRow, dataParam);
		// 设置剩余额度
		setTaxiLeftCarQuotaRight(datagrid01.getData());
	}
	/**
     * 设置企业信息
     */
    function setCompanyData(comInfo){
        mini.get("#enterpriseNumber").setValue(comInfo.taxiBaseNumber);
        mini.get("#companyName").setValue(comInfo.b_cnname);
        mini.get("#applyName").setValue(comInfo.b_cnname);
        mini.get("#companyEconomyType1").setValue(comInfo.b_manageclass);
        mini.get("#companyEconomyType").setValue(comInfo.b_economictype);
        mini.get("#registerAddress").setValue(comInfo.b_registeredaddress);
        mini.get("#applyLegal").setValue(comInfo.b_legalperson);
        mini.get("#representativeTel").setValue(comInfo.b_phonenumber);
        mini.get("#operatingAddress").setValue(comInfo.operateaddress);
        mini.get("#postcode").setValue(comInfo.operatepostalcode);
        mini.get("#ownerId").setValue(comInfo.b_enterpriseId);
        
        mini.get("applyDesc").setValue("");
        // 刷新业务信息tab页
        doYeWuTab();
    }
	
    /**
           * 重置申请企业信息
     */
    function resetCompanyData() {
    	try {
    		window.parent.setNone(); // 清空父页面的申请单位
    		window.parent.setHangYe("出租","2011","","");
		} catch(e) {
			console.log(e);
		}
        mini.get("#enterpriseNumber").setValue("");
        mini.get("#companyName").setValue("");
        mini.get("#applyName").setValue("");
        mini.get("#companyEconomyType1").setValue("");
        mini.get("#companyEconomyType").setValue("");
        mini.get("#registerAddress").setValue("");
        mini.get("#applyLegal").setValue("");
        mini.get("#representativeTel").setValue("");
        mini.get("#operatingAddress").setValue("");
        mini.get("#postcode").setValue("");
        mini.get("#ownerId").setValue("");
    }
    
 	// 获取申请号
	//type    01 :窗口  02:网申
	function getSq(){
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
	//申请信息自动输入车牌号
	function addPlateNm(){
 		var applyDescVl=mini.get("applyDesc").getValue();
		var vehicles = datagrid01.getChanges();
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
	
	//申请信息编辑车牌号
	function replacePlateNm(licensePlateOld, licensePlateNew){
 		var applyDescVl=mini.get("applyDesc").getValue();
 		applyDescVl = applyDescVl.replace(licensePlateOld+";", licensePlateNew+";");
		mini.get("applyDesc").setValue(applyDescVl);
	}

</script>
</body>
</html>
