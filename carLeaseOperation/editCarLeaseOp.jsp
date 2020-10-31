<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>租赁汽车车辆营运证编辑</title>
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
		<div id="tabs1" class="mini-tabs" activeIndex="0" style="width:100%;height:100%;" plain="false" buttons="#tabsButtons" buttonsAlign="right" >
		    <div title="申请信息" >
		    	<%@ include file="/WEB-INF/jsp/carLeaseOperation/carApplyInfo.jsp"%>
		    </div>
		    <!-- START 业务信息 -->
		    <div title="业务信息">
		    	<%@ include file="/WEB-INF/jsp/carLeaseOperation/carBusinessInfo.jsp"%>
		    	<%@ include file="/WEB-INF/jsp/carLeaseOperation/carBusinessInfo_del.jsp"%>
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
			<a id="toggleBtn1" class="mini-button" iconCls="" onclick="doAccept()">当场办结</a>
			<a id="toggleBtn2" class="mini-button" iconCls="" onclick="doNotAccept()">不予受理</a>
		    <a id="toggleBtn3" class="mini-button" iconCls="" onclick="doSave()">保存</a>
		    <a id="toggleBtn4" class="mini-button" iconCls="" onclick="doReset()">重置</a>
		</div> 
	</div>
<script type="text/javascript">
	mini.parse();
	var datagrid01 = mini.get("datagrid01");
	// *******注销**************//
	var gridCarList = mini.get("datagridCar");//左侧
	var gridNewCarList = mini.get("datagridCarYes");//右侧
	var illegalCarInfoMap = {}; // 汽车违法信息
	var tabs = mini.get("tabs1");
	// *******注销**************//
	var userTaskId = "usertask26";
	
	var model;
	var acceptNum;

	//这两个全局变量必须定义，打印需要用到
	var acceptNumber;
	var processInstanceId;
	var userId = "${userId}";
	var editFlag = "${editFlag}";
	
	$(document).ready(function(){
		// 办证显示
		var projectnameSix = mini.get("projectnameSix").getValue();
		if (projectnameSix == "089204002002") {
			$("#banzheng").show();
			$("#tuizheng").hide();
		} else {
			$("#banzheng").hide();
			$("#tuizheng").show();
		}
		// 初始化页面信息
		mini.get("#applyDate").setValue(new Date());
		mini.get("#projectname").setValue(window.parent.itemObj.name);
	    mini.get("#applicationClass").setValue(window.parent.itemId);
	    mini.get("#overTime").setValue(window.parent.itemObj.approveTime);
	    
	 	// 无申请号时，获取申请号
	    if ("${taxiBussinessEntity.applyNumber}" == "" || "${taxiBussinessEntity.applyNumber}" == null) {
	    	getSq(); // 获取申请号
	    }
	 
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
			var applyName = mini.get("applyName").getValue();
			if(applyName != "" && applyName != null){
				window.parent.setComInfo(applyName);
			}
            window.parent.setHangYe("租赁","2012","","");
        }
        if (projectnameSix == "089204002002") {
			 // 业务信息初始化
		    doYeWuTab();
		} else {
			// 初始化右表数据
			 initGridData();
			//初始化左表数据
			initLeftGridData();
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
        <%--if (!${empty getFileEntity}){--%>
            <%--applyMaterials = ${getFileEntity};--%>
        <%--}--%>
		// 列表
		datagrid01.on("drawcell", function (e) {
			
            var record = e.record;
            var field = e.field;
            
            if (field == 'checkcolumn') {
            	if (record.addFlag != "1" ) {
            		e.cellHtml = '';
            	}
            }
            if (field == 'operationCertificateClass') {
            	var gridHtml = getNameByKeyRetailType(record.operationCertificateClass);
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
            if (record.addFlag == "1" || record._state == "modified") {
            	e.rowStyle= "background:#FFDAB9";
            }
            if (field == 'cz') {
            	var gridHtml = "";
            	// 有受理编号查看，没有就可编辑/删除
            	var acceptNumber = mini.get("#acceptNumber").getValue();
            	if (acceptNumber == "" || acceptNumber == null || acceptNumber == "null") {
	            	
	            	if (record.addFlag == "1" ) {
	            		gridHtml += '&nbsp;<a href="javascript:;" class="btn btn-sm green" style="width:50px;" onclick="editCarInfo();"><i class="fa fa-pencil"></i> 编辑 </a>';
	            		gridHtml += '&nbsp;<a href="javascript:;" class="btn btn-sm red" style="width:50px;" onclick="deleteCarInfo();"><i class="fa fa-remove"></i> 删除 </a>';
	            	}
            	} else {
            		gridHtml += '&nbsp;<a href="javascript:;" class="btn btn-sm green" style="width:50px;" onclick="viewCarInfo();"><i class="fa fa-eye"></i> 查看 </a>';
            	}
            	e.cellHtml = gridHtml;
            }
		});
		// 表格渲染完毕事件
		datagrid01.on("update",function(e){
			/* var data =  datagrid01.getData();
			if (data == null || data == '' || data.length == 0) {
				 //表数据为空时，去掉全选框的勾选
				 
		 	} */
			$("#datagrid01 .mini-grid-checkbox").removeClass("mini-grid-checkbox-checked");
		}); 
		
		 // 头部行单元格操作时：checkbox
		datagrid01.on("headercellclick",function(e) {
			if (e.column.field == "checkcolumn") {
				var allcheck = $("#datagrid01").find("span[id*=mini-][id*=checkall]")[0];
				var allCheckBoxClass = $(allcheck).attr("class");
				// 判断是否处于全选状态:处于选中
				if (allCheckBoxClass.indexOf("mini-grid-checkbox-checked") > 0) {
					var data = datagrid01.getData();
					for (var i = 0; i < data.length; i++) {
						// 判断是否处于选中
						if (datagrid01.isSelected(data[i]) && data[i].addFlag != "1") {
							datagrid01.deselect(data[i]);
						}
					}
				}
			}
		});
		 
		//***************************注销****************************//
		gridCarList.on("drawcell", function (e) {
            var record = e.record;
            var field = e.field;
            if (field == 'enterpriseName') {
            	var gridHtml = mini.get("applyName").getValue();
            	e.cellHtml = gridHtml;
            	e.record.enterpriseName = gridHtml;
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
            if(field == "checkcolumn"){
            	var rightGridData = gridNewCarList.getData();
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
		gridCarList.on("beforeload",function(e){
			var obj = [];
			var rightGridData = gridNewCarList.getData();
			if(rightGridData !=null && rightGridData.length>0){
				for(var i =0;i<rightGridData.length;i++){
					obj.push(rightGridData[i].licensePlate);
				}
				gridCarList.getLoadParams().gridData = obj; //将右表数据带到后台 ，加载左边表数据去除掉左表中右表有的数据
			};
		});
		
		// 表格渲染完毕事件
		gridCarList.on("update",function(e){
			var data =  gridCarList.getData();
			if (data == null || data == '' || data.length == 0) {
				 //表数据为空时，去掉全选框的勾选
				 $("#datagridCar .mini-grid-checkbox").removeClass("mini-grid-checkbox-checked");
		 	}
		});
		// 表格渲染完毕事件
		gridNewCarList.on("update",function(e){
			var data =  gridNewCarList.getData();
			if (data == null || data == '' || data.length == 0) {
				 //表数据为空时，去掉全选框的勾选
				 $("#datagridCarYes .mini-grid-checkbox").removeClass("mini-grid-checkbox-checked");
		 	}
		});
		
		// tab切换
		tabs.on("activechanged",function(e){
			var tab = e.tab;
			var projectnameSix = mini.get("projectnameSix").getValue();
			if(tab.title == "业务信息" && projectnameSix == "089204002001"){
				$("#datagridCar .mini-pager-reload").trigger("click");
			}
		});
		// 模拟列表的刷新
		$("#datagridCar .mini-pager-reload").on("click", function (){
			mini.get('datagridCarYes').setData([]);
	        var param = {};
	        param.ownerId = mini.get("ownerId").getValue();
	        var enterpriseNumber = mini.get("#enterpriseNumber").getValue();
	        param.compamyNumber = enterpriseNumber;
	        getIllegalCarInfo(enterpriseNumber);//获取违法信息
			var vehicleColour = mini.get("vehicleColour").getValue();
	 		var licensePlate1 = mini.get("licensePlate1").getText();
	 		var licensePlate4 = mini.get("licensePlate4").getValue();
			param.licensesubject = vehicleColour;
			param.locations = licensePlate1;
			param.vehiclelicense = licensePlate4;
			gridCarList.load(param);
		});
		//***************************注销****************************//
	});
	
	// 业务事项change事件
    function projectnameSixChange(flag) {
    	// 办证显示
		var projectnameSix = mini.get("projectnameSix").getValue();
		if (projectnameSix == "089204002002") {
			$("#banzheng").show();
			$("#tuizheng").hide();
			
			doYeWuTab();
		} else {
			$("#tuizheng").show();
			$("#banzheng").hide();
		}
		// 清除申请信息
		mini.get("applyDesc").setValue("");
	}
	// tab切换
	function doYeWuTab() {
       	// 初始化列表数据
   		initEditGridData();
   		// 初始化额度
   		initCarCreditData();
	}
	// 刷新列表数据
	function initEditGridData() {
		// 新增更新页面
		if (editFlag == '1') {
			var vehicles = '${vehicles}';
			if(vehicles != null && vehicles != ""){
				vehicles = eval(vehicles);
				for (var i = 0; i< vehicles.length; i++) {
					vehicles[i].addFlag = "1";
				}
				mini.get('datagrid01').setData(eval(vehicles));
			}
		// 编辑更新
		} else {
			var ownerId = mini.get("#ownerId").getValue();
			$.ajax({
				type : "POST", 
				url : "${webProperties['app.url.approval']}/carLeaseOp/getCarLeaseOpEditData.htm",
				data : {  
					enterpriseId: ownerId
				},
				success : function(data){
					datagrid01.setData("")
					if(data != null && data != ""){
						datagrid01.setData(eval(data));
					}
				},
			})
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
					// 设置剩余额度
					setLeftCarQuotaRight(mini.get('datagrid01').getData());
				}else{
					mini.get('spare1').setValue("0");
					mini.get('totalMaxCarQuota').setValue("0");
					mini.get('totalMaxCarQuota_right').setValue("0");
					mini.get('spare2').setValue("0");
					mini.get('leftMaxCarQuota').setValue("0");
					mini.get('leftMaxCarQuota_right').setValue("0");
					mini.get('spare3').setValue("0");
					mini.get('totalMidCarQuota').setValue("0");
					mini.get('totalMidCarQuota_right').setValue("0");
					mini.get('spare4').setValue("0");
					mini.get('leftMidCarQuota').setValue("0");
					mini.get('leftMidCarQuota_right').setValue("0");
					mini.get('spare5').setValue("0");
					mini.get('totalMinCarQuota').setValue("0");
					mini.get('totalMinCarQuota_right').setValue("0");
					mini.get('spare6').setValue("0");
					mini.get('leftMinCarQuota').setValue("0");
					mini.get('leftMinCarQuota_right').setValue("0");
					// 设置剩余额度
					setLeftCarQuotaRight(mini.get('datagrid01').getData());
				}
			},
		})
	}
	//***************************注销****************************//
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
	//重置左表数据
	function doResetGrid(){
		initLeftGridData();
	}
	//控制左侧列表的选中状态
	function checkOnLeftCar(status,text){
		if(status == "removeRight"){
			$("#datagridCar").find("tr[class*='mini-grid-row-selected']").addClass("row-background-color1");
		}else if(status == "removeLeft"){
			gridCarList.deselectAll(false);
			$(getJqObjByText(text)).parent("td").parent("tr").removeClass("row-background-color1").attr("style","");
			
		}
	}
	function getJqObjByText(text){
		var ele;
		$("#datagridCar").find("div:contains('"+text+"')").each(function(){
			if(this.innerHTML==text){
				ele = this; //此处，如果希望直接返回jquery对象，那就给 $(this) 的值
				return false; //加上这句，在找到第一个符合的元素时跳出$.each。
			}
		});
		return ele;
	}
	//加入右侧
	function addRigthCar(){
		 var rowsCar = gridCarList.getSelecteds();
         if (rowsCar.length > 0) {
            for(var i=0;i<rowsCar.length;i++){
            	//验证右侧是否已经存在号牌 已存在 不进行添加
            	if(checkRightCarIFYes(rowsCar[i].vehiclelicense)==true){
            		var newRow = { id: rowsCar[i].id,selectCarId: rowsCar[i].id,licensePlate: rowsCar[i].vehiclelicense,enterpriseName:rowsCar[i].enterpriseName,isIllegal:rowsCar[i].isIllegal};
            		var gridNew = mini.get("datagridCarYes");
            		var listSize=gridNew.getData();
            		gridNewCarList.addRow(newRow, listSize.length);
            		addPlateNm();
            	}
            }    
            checkOnLeftCar("removeRight");
            //删除左侧
            /* deleteLeftCar(); */
         }
		
	}
	//验证右侧是否已经存在号牌
	function checkRightCarIFYes(val){
		var rebool=true;
		var listcar=gridNewCarList.getData();
		for(var i=0;i<listcar.length;i++){
			if(listcar[i].licensePlate==val){
				rebool=false;
			}
		}
		return rebool;
	}
	//删除右侧车辆数据
	function deleteRightCar(){
		var rows = gridNewCarList.getSelecteds();
		 if (rows.length > 0) {
			 gridNewCarList.removeRows(rows, false);    
			 for (var i = 0; i < rows.length; i++) {
				 delPlateNm(rows[i].licensePlate);
			}
         }
		 var data =  gridNewCarList.getData();
		 if (data == null || data == '' || data.length == 0) {
			 //表数据为空时，去掉全选框的勾选
			 $("#datagridCarYes .mini-grid-checkbox").removeClass("mini-grid-checkbox-checked");
		 	}
	}
	//加入左侧
	function addLeftCar(){
		 var rowsCar = gridNewCarList.getSelecteds();
         if (rowsCar.length > 0) {
            for(var i=0;i<rowsCar.length;i++){
            	//验证右侧是否已经存在号牌 已存在 不进行添加
            	if(checkLeftCarIFYes(rowsCar[i].licensePlate)==true){
            		var newRow = { id: rowsCar[i].selectCarId,vehiclelicense: rowsCar[i].licensePlate,enterpriseName: rowsCar[i].enterpriseName,isIllegal:rowsCar[i].isIllegal};
            		var gridCar = mini.get("datagridCar");
            		var listSize=gridCar.getData();
            		gridCarList.addRow(newRow, listSize.length);
            		
            	}
            	checkOnLeftCar("removeLeft",rowsCar[i].licensePlate);
            }  
            //删除右侧
            deleteRightCar();
         }
		
	}
	//验证左侧是否已经存在号牌
	function checkLeftCarIFYes(val){
		var rebool=true;
		var listcar=gridCarList.getData();
		for(var i=0;i<listcar.length;i++){
			if(listcar[i].vehiclelicense==val){
				rebool=false;
			}
		}
		return rebool;
	}
	//删除左侧车辆数据
	function deleteLeftCar(){
		var rows = gridCarList.getSelecteds();
		 if (rows.length > 0) {
			 gridCarList.removeRows(rows, false); 
			
         }
		 var data =  gridCarList.getData();
		 if (data == null || data == '' || data.length == 0) {
			//表数据为空时，去掉全选框的勾选
			 $("#datagridCar .mini-grid-checkbox").removeClass("mini-grid-checkbox-checked");
			 		 	
		 }
	}
	// 刷新右表数据
	function initGridData() {
		gridNewCarList.clearRows();
		var vehicles = '${vehicles}';
		if(vehicles != null && vehicles != ""){
			mini.get('datagridCarYes').setData(eval(vehicles));
		}
	}
	// 刷新左表数据
	function initLeftGridData() {
		var param = {};
	     param.compamyNumber = mini.get("enterpriseNumber").getValue();
	     param.ownerId = mini.get("ownerId").getValue();
	     if((param.compamyNumber != "" && param.compamyNumber != null) && (param.ownerId != "" && param.ownerId != null)){
	    	var vehicleColour = mini.get("vehicleColour").getValue();
	 		var licensePlate1 = mini.get("licensePlate1").getText();
	 		var licensePlate4 = mini.get("licensePlate4").getValue();
	 		param.licensesubject = vehicleColour;
	 		param.locations = licensePlate1;
	 		param.vehiclelicense = licensePlate4;
	    	gridCarList.load(param);
	     }
	}
	//***************************注销****************************//
	
	//重置
	function doReset(){
	  mini.confirm("确定重置？", "确定？",function (action) {
		if (action == "ok") {
			// 重置申请企业信息
			resetCompanyData();
			
			mini.get("contact").setValue("");
			mini.get("contactNumber").setValue("");
			mini.get("agent").setValue("");
			mini.get("applyDesc").setValue("");
			mini.get('datagrid01').setData([]);
			//***************************注销****************************//
			mini.get('datagridCar').setData([]);
			mini.get('datagridCarYes').setData([]);
			//***************************注销****************************//
			initCarCreditData();
			// 重置车辆列表查询
			mini.get("vehicleColour").setValue("");
			mini.get("licensePlate1").setValue("02");
			mini.get("licensePlate4").setValue("");
			
			// 清除附件选中状态:重置用
			$("#fileupload")[0].contentWindow.setCeckNoChe();
			// 清文件列表的
			var projectnameSix = mini.get("#projectnameSix").getValue();
            $("#fileupload")[0].contentWindow.getList(projectnameSix);
            //重置editFlag
			editFlag = "0";
		}
	});
}
	//获取小、中、大型车额度
	function getCarQuota(){
		var min = mini.get("miniCarQuota").getValue();
		var medium = mini.get("mediumCarQuota").getValue();
		var large = mini.get("largeCarQuota").getValue();
		if(min == ""){
			min = 0;
		}
		if(medium == ""){
			medium = 0;
		}
		if(large == ""){
			large = 0;
		}
		var gridData = datagrid01.getChanges("added");
		if(gridData != "" && gridData != null){
			for(var i = 0; i< gridData.length; i++){
				if(gridData[i].carType == "3"){
					min++;
				}else if(gridData[i].carType == "4"){
					medium++;
				}else if(gridData[i].carType == "6"){
					large++;
				}
			}
		}
		mini.get("miniCarQuota").setValue(min + "");
		mini.get("mediumCarQuota").setValue(medium + "");
		mini.get("largeCarQuota").setValue(large + "");
	}
	// 暂存
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
		var vehicles = "";
        var projectnameSix = mini.get("projectnameSix").getValue();
		if (projectnameSix == "089204002002") {
			// 编辑取所有datagrid
			if (editFlag == '1') {
				vehicles = datagrid01.getData();
			} else {
				// 更新取datagrid更新数据
				vehicles = datagrid01.getChanges();
			}
		} else {
			vehicles = gridNewCarList.getData();
		}
		
		jQuery.extend(businessObj, data);
// 		return;
		$.ajax({
	       	url: "${webProperties['app.url.approval']}/carLeaseOp/saveCarLeaseOp.htm",
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
		var vehicles = "";
		var projectnameSix = mini.get("projectnameSix").getValue();
		if (projectnameSix == "089204002002") {
			// 编辑取所有datagrid
			if (editFlag == '1') {
				vehicles = datagrid01.getData();
			} else {
				// 更新取datagrid更新数据
				vehicles = datagrid01.getChanges();
			}
			if (vehicles == '' || vehicles == '[]' || vehicles.length == 0) {
				mini.alert("请填写车辆信息！");
				return;
			}
			// 校验剩余额度
			if (checkLeftCarQuota() == false) {
				return;
			}
		} else {
			var vehicles = gridNewCarList.getData();
			if (vehicles == '' || vehicles == '[]' || vehicles.length == 0) {
				mini.alert("请选择注销车辆！");
				return;
			}
		}
		mini.confirm("确定办结？", "确定？",function (action) {
			if (action == "ok") {
				if (projectnameSix == "089204002002") {
					scene(vehicles);
				} else {
					var j = 0;
					for(var i = 0; i< vehicles.length; i++){
						if(vehicles[i].isIllegal != '无违章信息' && vehicles[i].isIllegal != null){
							j++;
						}
					}
					if( j > 0){
						mini.confirm("有违法车辆是否继续受理？", "确定？",function (action) {
							if (action == "ok") {
								scene(vehicles);
							}
						});
					}else{
						scene(vehicles);
					}
				}
			}
		});
	}
	function scene(vehicles){
		loading(true);
		var businessObj = {};
		var obj = new mini.Form("form");
		var data = obj.getData();
		data.overTime = "0";
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
        data.applyMaterials = {
            copyCode:arr
		}
		jQuery.extend(businessObj, data);
		
		$.ajax({
	       	url: "${webProperties['app.url.approval']}/carLeaseOp/acceptCarLeaseOp.htm",
			type: 'post',
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data:{data:mini.encode(businessObj), vehicles:mini.encode(vehicles)},
			success:function(data){
// 				loading(false);
//                 mini.alert("办结成功");
                var result = eval("("+data+")");
                changeType(result.acceptNumber,"已办结");
                getCurrentImg({instanceId:result.processInstanceId});
              //受理成功将受理号，流程实例号赋值给全局变量
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
                //制证
                operCert(acceptNumber,'lease');
            },
            error: function (jqXHR, textStatus, errorThrown) {
            	loading(false);
                mini.alert("办结失败");
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
		var projectnameSix = mini.get("projectnameSix").getValue();
		if (projectnameSix == "089204002002") {
			var vehicles = "";
			// 编辑取所有datagrid
			if (editFlag == '1') {
				vehicles = datagrid01.getData();
			} else {
				// 更新取datagrid更新数据
				vehicles = datagrid01.getChanges();
			}
			if (vehicles == '' || vehicles == '[]' || vehicles.length == 0) {
				mini.alert("请填写车辆信息！");
				return;
			}
			// 校验剩余额度
			if (checkLeftCarQuota() == false) {
				return;
			}
			
		} else {
			var vehicles = gridNewCarList.getData();
			if (vehicles == '' || vehicles == '[]' || vehicles.length == 0) {
				mini.alert("请选择注销车辆！");
				return;
			}
		}
		mini.confirm("确定不予受理？", "确定？",function (action) {
			if (action == "ok") {
				if (projectnameSix == "089204002002") {
					noAccept(vehicles);
				} else {
					var j = 0;
					for(var i = 0; i< vehicles.length; i++){
						if(vehicles[i].isIllegal != '无违章信息' && vehicles[i].isIllegal != null){
							j++;
						}
					}
					if(j>0){
						mini.confirm("有违法车辆是否继续不予受理？", "确定？",function (action) {
							if (action == "ok") {
								noAccept(vehicles);
							}
						});
					}else{
						noAccept(vehicles);
					}
				}
			}
		});
	}
	
	function noAccept(vehicles){
		loading(true);
		var businessObj = {};
		var obj = new mini.Form("form");
		var data = obj.getData();
		data.overTime = "0";
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
	       data.applyMaterials = {
	           copyCode:arr
		}
		jQuery.extend(businessObj, data);
		
		$.ajax({
	       	url: "${webProperties['app.url.approval']}/carLeaseOp/noAcceptCarLeaseOp.htm",
			type: 'post',
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data:{data:mini.encode(businessObj), vehicles:mini.encode(vehicles)},
			success:function(data){
					loading(false);
	               mini.alert("不予受理成功");
	               var result = eval("("+data+")");
	               getCurrentImg({instanceId:result.processInstanceId});
	               changeType(result.acceptNumber,"不予受理");
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
	//新增
	function doAddCar() {
		var enterpriseNumber = mini.get("enterpriseNumber").getValue();
		var companyName = mini.get("companyName").getValue();
		
	    var url = "${webProperties['app.url.approval']}/carLeaseOp/addCarInfo.htm?enterpriseNumber="+ enterpriseNumber 
	    		+ "&companyName="+companyName + "&model="+model + "&acceptNum="+acceptNum;
	    larerOpen(url, "新增车辆信息");
	}
	//批量更新
	function editCarInfo() {
		var rows = datagrid01.getSelecteds();
		if (rows == '' || rows == '[]') {
			mini.alert("请至少选择一条记录！");
			return;
		}
		for(var i=0;i < rows.length;i++){
			if (rows[i].addFlag != "1") {
				mini.alert("您选择的车辆存在历史车辆，不能进行更新，请确认！");
				return;
			}
		}
		// 冒泡排序
		var temp = {};
		for(var i=0;i<rows.length-1;i++){
		 	for(var j=0;j<rows.length-1-i;j++) {
		 		if(rows[j].licensePlate > rows[j+1].licensePlate) {
		 			temp=rows[j];
		 			rows[j]=rows[j+1];
		 			rows[j+1]=temp;
		 		}
		 	}
	 	}
		var uidArr = [];
		var batchInsertion = rows.length;
		for (var i = 0; i < batchInsertion; i++) {
			uidArr.push(rows[i]._uid);
		}
		var firstRow = rows[0];
		var enterpriseNumber = mini.get("enterpriseNumber").getValue();
		var companyName = mini.get("companyName").getValue();
	    var url = "${webProperties['app.url.approval']}/carLeaseOp/editCarInfo.htm?enterpriseNumber="+ enterpriseNumber 
	    		+ "&companyName="+companyName + "&uidArr="+uidArr 
	    		+ "&row=" + encodeURIComponent(JSON.stringify(firstRow));
	    larerOpen(url, "更新车辆信息");
	}
	// 查看
	function viewCarInfo() {
		var row = datagrid01.getSelected();
		var enterpriseNumber = mini.get("enterpriseNumber").getValue();
		var companyName = mini.get("companyName").getValue();
	    var url = "${webProperties['app.url.approval']}/carLeaseOp/viewCarInfo.htm?enterpriseNumber="+ enterpriseNumber 
	    		+ "&companyName="+companyName+ "&row=" + encodeURIComponent(JSON.stringify(row));
	    larerOpen(url, "查看车辆信息");
	}
	// 查询
	function doSearch() {
		var projectnameSix = mini.get("projectnameSix").getValue();
		if (projectnameSix == "089204002002") {
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
		} else {
			var param = {};
			var compamyNumber = mini.get("enterpriseNumber").getValue;
			var ownerId = mini.get("#ownerId").getValue();
			var vehicleColour = mini.get("vehicleColour").getValue();
			var licensePlate1 = mini.get("licensePlate1").getText();
			var licensePlate4 = mini.get("licensePlate4").getValue();
			param.licensesubject = vehicleColour;
			param.locations = licensePlate1;
			param.vehiclelicense = licensePlate4;
			param.ownerId = ownerId;
			param.compamyNumber = compamyNumber;
			param.searchFlag = "search";
			gridCarList.load(param,function(){
				var data =  gridCarList.getData();
			 	if (data == null || data == '' || data.length == 0) {
					$("#datagridCar .mini-grid-checkbox").removeClass("mini-grid-checkbox-checked");
			 	}
			});
		}
	}
	
	//重置查询条件
	function forReset(){
		mini.get("vehicleColour").setValue("");
		mini.get("licensePlate1").setValue("02");
		/* mini.get("licensePlate2").setValue("");
		mini.get("licensePlate3").setValue(""); */
		mini.get("licensePlate4").setValue("");
		doSearch();
		
		initGridData();
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
        $("#toggleBtnEdit").hide();
        var data = datagrid01.getData();
        mini.get('datagrid01').setData(data);
        datagrid01.hideColumn(datagrid01.getColumn(0));
        $("#applyNmTr").show();
        
        mini.get("#projectnameSix").setReadOnly(true);
        mini.get("#projectnameSix").addCls("asLabel");
        $("#grid1").hide();
		$("#grid2").css("width","100%");
		$("#add").hide();
		$("#topFill").hide();
		gridNewCarList.hideColumn(gridNewCarList.getColumn(0));
		
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
        mini.get("#toggleBtnEdit").hide();
        datagrid01.hideColumn(datagrid01.getColumn(0));
        
        mini.get("#projectnameSix").setReadOnly(true);
        mini.get("#projectnameSix").addCls("asLabel");
        $("#grid1").hide();
		$("#add").hide();
		$("#topFill").hide();
		gridNewCarList.hideColumn(gridNewCarList.getColumn(0));
        
        $("#toggleBtn1").hide();
        $("#toggleBtn2").hide();
        $("#toggleBtn3").hide();
        $("#toggleBtn4").hide();
	}
	 //删除行
	 function deleteCarInfo() {
		 var row = datagrid01.getSelected();
		 datagrid01.removeRow(row, false);
		 delPlateNm(row.licensePlate);
		// 设置剩余额度
		if (editFlag == '1') {
			var vehicles = datagrid01.getData();
		} else {
			// 更新取datagrid更新数据
			var vehicles = datagrid01.getChanges();
		}
		setLeftCarQuotaRight(vehicles);
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
			var licensePlate =  dataParam['licensePlate1Nm'] + dataParam['licensePlate4'];
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
							dataParam['licensePlate'] = dataParam['licensePlate1Nm'] + dataParam[key];
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
					data.addFlag = "1";
					// 置顶
					dataList.add(data);
				}
				if(dataList != null && dataList.length){
					for(var i = dataList.length-1;i >= 0;i--){
						datagrid01.addRow(dataList[i], 0);
					}
				}
			} else {
				dataParam.addFlag = "1";
				// 置顶
				datagrid01.addRow(dataParam, 0);
			}
			// 设置剩余额度
			if (editFlag == '1') {
				var vehicles = datagrid01.getData();
			} else {
				// 更新取datagrid更新数据
				var vehicles = datagrid01.getChanges();
			}
			setLeftCarQuotaRight(vehicles);
		}
	}
	// 刷新列表数据
	function updateGridData(dataParam, uidArr) {
		
		var newRow = '';
		if (uidArr.length > 1) {
			if (dataParam != null && dataParam != "" && typeof(dataParam) != "undefined") {
				for (var i = 0; i < uidArr.length; i++) {
					var data={};
					Object.keys(dataParam).forEach(function(key){
						data[key] = dataParam[key];
						if ("licensePlate4" == key) {
// 							dataParam['licensePlate'] = dataParam['licensePlate1Nm'] +  dataParam['licensePlate2'] 
// 													  + dataParam['licensePlate3'] +  dataParam[key];
							dataParam['licensePlate'] = dataParam['licensePlate1Nm'] + dataParam[key];
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
							var numberStr =dataParam[key].substring(0,em+1)
							// 数字相加
							var numberInt =parseInt(index)+parseInt(1);
							
							dataParam[key] = numberStr + numberInt;
						}
					});
					newRow = ''
					newRow = datagrid01.getRowByUID(uidArr[i]);
					data._uid = newRow._uid;
					data._id = newRow._id;
					datagrid01.updateRow(newRow, data);
					/* // 置顶
					newRow = datagrid01.getRowByUID(uidArr[i]);
					datagrid01.moveRow(newRow, 0 ); */
				}
			}
		} else {
			newRow = datagrid01.getRowByUID(uidArr[0]);
			datagrid01.updateRow(newRow, dataParam);
			// 置顶
			newRow = datagrid01.getRowByUID(uidArr[0]);
			datagrid01.moveRow(newRow, 0 );
		}
		// 设置修改前车型的剩余额度
		if (editFlag == '1') {
			var vehicles = datagrid01.getData();
		} else {
			// 更新取datagrid更新数据
			var vehicles = datagrid01.getChanges();
		}
		setLeftCarQuotaRight(vehicles);
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
        var projectnameSix = mini.get("projectnameSix").getValue();
		if (projectnameSix == "089204002002") {
	        // 刷新业务信息tab页
	        doYeWuTab();
		} else {
			
	        mini.get('datagridCarYes').setData([]);
	        var param = {};
	        param.ownerId = comInfo.b_enterpriseId;
	        param.compamyNumber = comInfo.taxiBaseNumber;
	        getIllegalCarInfo(comInfo.taxiBaseNumber);//获取违法信息
			var vehicleColour = mini.get("vehicleColour").getValue();
	 		var licensePlate1 = mini.get("licensePlate1").getText();
	 		var licensePlate4 = mini.get("licensePlate4").getValue();
			param.licensesubject = vehicleColour;
			param.locations = licensePlate1;
			param.vehiclelicense = licensePlate4;
			gridCarList.load(param);
		}
		
		 mini.get("applyDesc").setValue("");
	}
	
    /**
	  * 重置企业信息
	 */
	function resetCompanyData(){
		try {
    		window.parent.setNone(); // 清空父页面的申请单位
    		window.parent.setHangYe("租赁","2012","",""); // 设置申请单位为企业
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
 		var projectnameSix = mini.get("projectnameSix").getValue();
 		if (projectnameSix == "089204002002") {
			var vehicles = datagrid01.getChanges();
 		} else {
 			var vehicles = gridNewCarList.getChanges();
 		}
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