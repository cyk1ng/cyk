<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>租赁汽车车辆营运证注销</title>
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
.row-background-color1{
	background-color:#FFDAB9 !important;
}
</style>
<script src="${webProperties['app.url.approval']}/resources/js/taxi/commonUtil.js" type="text/javascript"></script>
<script src="${webProperties['app.url.approval']}/resources/js/taxi/dealComn.js" type="text/javascript"></script>
</head>
<body>
	<div class="mini-fit">
		<div id="tabs1" class="mini-tabs" activeIndex="0" style="width:100%;height:100%;" plain="false" buttons="#tabsButtons" buttonsAlign="right">
		    <div title="申请信息" >
		    	<%@ include file="/WEB-INF/jsp/carLeaseOperation/carApplyInfo.jsp"%>
		    </div>
		    <!-- START 业务信息 -->
		    <div title="业务信息">
		    	<%@ include file="/WEB-INF/jsp/carLeaseOperation/carBusinessInfo_del.jsp"%>
	    	</div>
			<!-- END 业务信息 -->
		    <div title="申请材料" >
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
			<a id="toggleBtn1" class="mini-button" iconCls="" onclick="sceneDelCarLeaseOp()">当场办结</a>
			<a id="toggleBtn2" class="mini-button" iconCls="" onclick="noAcceptDelCarLeaseOp()">不予受理</a>
		    <a id="toggleBtn3" class="mini-button" iconCls="" onclick="doSave()">保存</a>
		    <a id="toggleBtn4" class="mini-button" iconCls="" onclick="doReset()">重置</a>
		</div> 
	</div>
<script type="text/javascript">
	mini.parse();
	var gridCarList = mini.get("datagridCar");//左侧
	 var gridNewCarList = mini.get("datagridCarYes");//右侧
	 
	//法律文书 全局变量
		var userTaskId = "usertask26";
		
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
		mini.get("#applyDate").setValue(new Date());
		mini.get("#projectname").setValue(window.parent.itemObj.name);
        mini.get("#applicationClass").setValue(window.parent.itemId);
        mini.get("#overTime").setValue(window.parent.itemObj.approveTime);
        window.parent.setHangYe("租赁", "2012", "", ""); 
        
        var enterpriseNumber = mini.get("enterpriseNumber").getValue();
        if(enterpriseNumber != "" && enterpriseNumber != null){
        	getIllegalCarInfo(enterpriseNumber);//获取违法信息
        }
		// 无申请号时，获取申请号
	    if ("${taxiBussinessEntity.applyNumber}" == "" || "${taxiBussinessEntity.applyNumber}" == null) {
	    	getSq(); // 获取申请号
	    }
		
		var model = getRequestString("model");
		var acceptNum = getRequestString("acceptNumber");
		
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
        
		if("view" == model){
			labelModel("form");
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
		// 初始化右表数据
		 initGridData();
		//初始化左表数据
		initLeftGridData();
		
		var id = getRequestString("id");
        // 草稿箱
        if (model == "edit" && (id != null && id != "")) {
	        try {window.parent.setComInfo(mini.get("#applyName").getValue());} catch(e) {console.log(e);}
        }
		
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
	//重置
	function doReset(){
	  mini.confirm("确定重置？", "确定？",
			function (action) {
				if (action == "ok") {
					// 重置申请企业信息
					resetCompanyData();
					
					mini.get("contact").setValue("");
					mini.get("contactNumber").setValue("");
					mini.get("agent").setValue("");
					mini.get("applyDesc").setValue("");
// 					initGridData();
// 					initLeftGridData();
					mini.get('datagridCar').setData([]);
					mini.get('datagridCarYes').setData([]);
					
					// 重置车辆列表查询
					mini.get("vehicleColour").setValue("");
					mini.get("licensePlate1").setValue("02");
					mini.get("licensePlate4").setValue("");
					
					// 清除附件选中状态:重置用
					$("#fileupload")[0].contentWindow.setCeckNoChe();
					// 清文件列表的
					var projectnameSix = mini.get("#projectnameSix").getValue();
	                $("#fileupload")[0].contentWindow.getList(projectnameSix);
				}
			}
		);
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

	// 查询
	function doSearch() {
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
	
	//重置查询条件
	function forReset(){
		mini.get("vehicleColour").setValue("");
		mini.get("licensePlate1").setValue("02");
		/* mini.get("licensePlate2").setValue("");
		mini.get("licensePlate3").setValue(""); */
		mini.get("licensePlate4").setValue("");
		doSearch();
		/* initLeftGridData(); */
		initGridData();
	}
	//保存
	function doSave(){
		var applyName = mini.get("applyName").getValue();
		if (applyName == '' || applyName == null) {
			mini.alert("企业申请信息不能为空！");
			return;
		}
		var businessObj = {};
		var obj = new mini.Form("form");
		if(obj.validate() == false){
			return;
		}
		loading(true);
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
		var vehicles = gridNewCarList.getData();
		jQuery.extend(businessObj, data);
		$.ajax({
	       	url: "${webProperties['app.url.approval']}/carLeaseOp/saveCarLeaseOp.htm",
			type: 'post',
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data:{data:mini.encode(businessObj), vehicles:mini.encode(vehicles)},
			success:function(data){
				loading(false);
				var result = eval("("+data+")");
                mini.get("#id").setValue(result.id);
				mini.alert("保存成功");
            },
            error: function (jqXHR, textStatus, errorThrown) {
            	loading(false);
                mini.alert("保存失败");
            }
	    });
	}
	
	//当场办结
	function sceneDelCarLeaseOp(){
		var applyName = mini.get("applyName").getValue();
		if (applyName == '' || applyName == null) {
			mini.alert("企业申请信息不能为空！");
			return;
		}
		var vehicles = gridNewCarList.getData();
		if (vehicles == '' || vehicles == '[]' || vehicles.length == 0) {
			mini.alert("请选择注销车辆！");
			return;
		}
		var object = new mini.Form("form");
		if(object.validate() == false){
			return;
		}
		mini.confirm("确定办结？", "确定？",function (action) {
				if (action == "ok") {
					var j = 0;
					var data = gridNewCarList.getData();
					for(var i = 0; i< data.length; i++){
						if(data[i].isIllegal != '无违章信息' && data[i].isIllegal != null){
							j++;
						}
					}
					if(j>0){
						mini.confirm("有违法车辆是否继续受理？", "确定？",function (action) {
							if (action == "ok") {
								scene();
							}else{
								
							}
						});
					}else{
						scene();
					}
				}
		});
	}
	
	function scene(){
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
		var vehicles = gridNewCarList.getData();
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
	//不予受理
	function noAcceptDelCarLeaseOp(){
		var applyName = mini.get("applyName").getValue();
		if (applyName == '' || applyName == null) {
			mini.alert("企业申请信息不能为空！");
			return;
		}
		var vehicles = gridNewCarList.getData();
		if (vehicles == '' || vehicles == '[]' || vehicles.length == 0) {
			mini.alert("请选择注销车辆！");
			return;
		}
		var obj = new mini.Form("form");
		if(obj.validate() == false){
			return;
		}
		mini.confirm("确定不予受理？", "确定？",function (action) {
			if (action == "ok") {
				var j = 0;
				var data = gridNewCarList.getData();
				for(var i = 0; i< data.length; i++){
					if(data[i].isIllegal != '无违章信息' && data[i].isIllegal != null){
						j++;
					}
				}
				if(j>0){
					mini.confirm("有违法车辆是否继续不予受理？", "确定？",function (action) {
						if (action == "ok") {
							noAccept();
						}else{
							
						}
					});
				}else{
					noAccept();
				}
			}
		});
	}
	function noAccept(){
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
		var vehicles = gridNewCarList.getData();
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
        $("#applyNmTr").show();
        //表格隐藏
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
		$("#grid1").hide();
		$("#add").hide();
		$("#topFill").hide();
		gridNewCarList.hideColumn(gridNewCarList.getColumn(0));
		//隐藏办结等四个按钮
		$("#toggleBtn1").hide();
        $("#toggleBtn2").hide();
        $("#toggleBtn3").hide();
        $("#toggleBtn4").hide();
	}
    /**
     * 设置企业信息
     */
    function setCompanyData(comInfo){
//         mini.get("#applyId").setValue(comInfo.b_organizationcode);
        mini.get("#applyName").setValue(comInfo.b_cnname);
        mini.get("#companyEconomyType1").setValue(comInfo.b_manageclass);
        mini.get("#companyEconomyType").setValue(comInfo.b_economictype);
        mini.get("#registerAddress").setValue(comInfo.b_registeredaddress);
        mini.get("#applyLegal").setValue(comInfo.b_legalperson);
        mini.get("#representativeTel").setValue(comInfo.b_phonenumber);
        mini.get("#operatingAddress").setValue(comInfo.operateaddress);
        mini.get("#postcode").setValue(comInfo.operatepostalcode);
        mini.get("#ownerId").setValue(comInfo.b_enterpriseId);
        mini.get("#enterpriseNumber").setValue(comInfo.taxiBaseNumber);
       
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
		
		 mini.get("applyDesc").setValue("");
    }
    
    /**
         * 设置企业信息
     */
    function resetCompanyData(){
    	try {
    		window.parent.setNone(); // 清空父页面的申请单位
    		window.parent.setHangYe("租赁","2012","",""); // 设置申请单位为企业
		} catch(e) {
			console.log(e);
		}
//         mini.get("#applyId").setValue("");
        mini.get("#applyName").setValue("");
        mini.get("#companyEconomyType1").setValue("");
        mini.get("#companyEconomyType").setValue("");
        mini.get("#registerAddress").setValue("");
        mini.get("#applyLegal").setValue("");
        mini.get("#representativeTel").setValue("");
        mini.get("#operatingAddress").setValue("");
        mini.get("#postcode").setValue("");
        mini.get("#ownerId").setValue("");
        mini.get("#enterpriseNumber").setValue("");
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
		var vehicles = gridNewCarList.getChanges();
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
</body>
</html>
