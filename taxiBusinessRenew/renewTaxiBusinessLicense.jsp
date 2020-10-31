<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>巡游出租汽车客运服务企业（含个体公司工商户）经营资格证换证、补证</title>
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
		    	<form id="form" method="post">
		    		<table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
					    <tr id="applyNmTr" style="display: none">
							<td style="width:130px;" align="right" >受理编号：</td>
							<td style="width:100%">
								<input id="acceptNumber" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>
							</td>
							<td style="width:130px;" align="right" >处理结果：</td>
							<td style="width:100%">
								<input id="result"  class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>
							</td>
						</tr>
					    <tr>
					        <td style="width:130px;" align="right">申请日期：</td>
					        <td style="width:50%">
					            <input id="applyDate" name="applyDate" class="mini-datepicker asLabel" style="width:96%;" readOnly="true" format="yyyy-MM-dd" value="${taxiBussinessEntity.applyDate}"/>
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
					    	<td style="width:130px;" align="right">申项目名称：</td>
					    	<td style="width:100%" colspan="3">
					            <input id="projectname" name="projectname" class="mini-textbox asLabel" style="width:98%;" readOnly="true" value="${taxiBussinessEntity.projectname}"/>
					        </td>
					    </tr>
					    <tr>
					        <td style="width:130px;" align="right">联系人：</td>
					        <td style="width:50%">
					            <input id="contact" name="contact" class="mini-textbox" style="width:96%;" vtype="maxLength:20" value="${taxiBussinessEntity.contact}" maxlength="20"/>
					        </td>
					        <td style="width:130px;" align="right">联系电话：</td>
					        <td style="width:50%">
					            <input id="contactNumber" name="contactNumber" class="mini-textbox" style="width:98%;" onvalidation="onTelValidation" value="${taxiBussinessEntity.contactNumber}"  maxlength="12"/>
					        </td>
					    </tr>
					   
					    <tr>
					    	<td style="width:130px;" align="right">委托代理人：</td>
					    	<td style="width:100%" colspan="3">
					            <input id="agent" name="agent" class="mini-textbox" style="width:98%;" vtype="maxLength:20" value="${taxiBussinessEntity.agent}"/>
					        </td>
					    </tr>
					    <tr>
					       	<td style="width:130px;" align="right">申请情况说明：</td>
					       	<td style="width:100%" colspan="3">
								<input id="applyDesc" name="applyDesc" class="mini-textarea" style="width: 98%;height:130px;" value="${taxiBussinessEntity.applyDesc}"/>
							</td>
				       	</tr>
					    <tr>
					       	<td style="width:130px;" align="right">业务事项：</td>
					       	<td style="width:100%" colspan="3"> 
							<div class="mini-radiobuttonlist" id="projectnameSix" name="projectnameSix" repeatItems="1" repeatLayout="table" required="true" onvaluechanged= "projectnameSixChange()" repeatDirection="vertical" textField="text" valueField="id"  data="[{id:'089105001',text:'换证'},{id:'089105002',text:'补证'}]" value="${taxiBussinessEntity.projectnameSix}"></div>
							</td>
				       	</tr>
					    <tr>
							<td>
								<input id="applicationClass" name="applicationClass" class="mini-textbox asLabel" style="display:none" value="${applicationClass}"/>
								<input id="formType" name="formType" style="display:none" class="mini-textbox asLabel" value="${formType}"/>
<!-- 								<input id="applyId" style="display:none" class="mini-textbox asLabel" value=""/> -->
								<input id="ownerId" name="ownerId" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.ownerId}"/>
								<input id="overTime" name="overTime" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.overTime}"/>
								<input id="id" name="id" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.id}"/>
								<input id="type" style="display:none" class="mini-textbox asLabel" value="${type}"/>
								<input id="applyNumber" name="applyNumber" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.applyNumber }"/>
								<input id="companyEconomyType" name="companyEconomyType" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.companyEconomyType }"/>
							</td>
						</tr>
					</table>
		       </form>
		    </div>
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
			<a id="toggleBtn1" class="mini-button" iconCls="" onclick="sceneTaxiBusinessRenew()">当场办结</a>
			<a id="toggleBtn2" class="mini-button" iconCls="" onclick="noAcceptTaxiBusinessRenew()">不予受理</a>
		    <a id="toggleBtn3" class="mini-button" iconCls="" onclick="saveTaxiBusinessRenew()">保存</a>
		    <a id="toggleBtn4" class="mini-button" iconCls="" onclick="doReset()">重置</a>
		</div> 
	</div>
<script type="text/javascript">
	mini.parse();

	//法律文书 全局变量
	var userTaskId = "usertask26";
	
	//这两个全局变量必须定义，打印需要用到
	var acceptNumber;
	var processInstanceId;
	var userId = "${userId}";
	
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
        window.parent.setHangYe("出租", "2011", "", ""); 
		var model = getRequestString("model");
		var acceptNum = getRequestString("acceptNumber");
		
		// 无申请号时，获取申请号
	    if ("${taxiBussinessEntity.applyNumber}" == "" || "${taxiBussinessEntity.applyNumber}" == null) {
	    	getSq(); // 获取申请号
	    }
		
		var projectnameSix = mini.get("#projectnameSix").getValue();
		$("#fileupload").load(function() {
         	$("#fileupload")[0].contentWindow.getList(projectnameSix);
        });
        
		if("view" == model){
			labelModel("form");
			//var form1 = new mini.Form("#form1");
			//form1.setData({name1:"test"});
			//form1.setEnabled(true);
			var type = mini.get("#type").getValue();
            //这是前台传参数方法，通过modelview跳转页面通过别打的方法获取（1：申请页面，4：草稿箱）这两个类型没法律文书
            if("1" != type && "4" != type){
                getHistoryTasksByCondition({instanceId:window.parent.processInstanceId},dataObj);
            }
		}else if("edit" == model && (acceptNum != "" && acceptNum != null)){
			 labelModel("form");
			//var form1 = new mini.Form("#form1");
			//form1.setData({name1:"test"});
			//form1.setEnabled(true);
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
       
	        
	});
	
	function test(){
		var form = new mini.Form("form");
		var test = form.validate();
		return test;
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
	//业务事项切换
	function projectnameSixChange(){
		var projectnameSix = mini.get("#projectnameSix").getValue();
		$("#fileupload").load(function() {
			$("#fileupload")[0].contentWindow.getList(projectnameSix);
		});
	}
	//重置
	   function doReset(){
		   mini.confirm("确定重置吗？", "确定？",
			function (action) {
				if (action == "ok") {
					// 重置申请企业信息
					resetCompanyData();
					mini.get("contact").setValue("");
					mini.get("contactNumber").setValue("");
					mini.get("agent").setValue("");
					mini.get("applyDesc").setValue("");
					mini.get("projectnameSix").setValue('${taxiBussinessEntity.projectnameSix}');
					
					// 清除附件选中状态:重置用
					$("#fileupload")[0].contentWindow.setCeckNoChe();
					// 清文件列表的
					var projectnameSix = mini.get("#projectnameSix").getValue();
	                $("#fileupload")[0].contentWindow.getList(projectnameSix);
				}
			}
		);
	}  
	 
	//保存
	function saveTaxiBusinessRenew(){
		var form = new mini.Form("form");
		if(form.validate() == false){
			return;
		}
		var applyName = mini.get("applyName").getValue();
		if (applyName == '' || applyName == null) {
			mini.alert("企业申请信息不能为空！");
			return;
		}
		var businessObj = {};
		loading(true);
		var obj = form.getData();
		obj.overTime = "0";
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
        obj.applyMaterials = {
            copyCode:arr
		}
		jQuery.extend(businessObj,obj);
		$.ajax({
	       	url: "${webProperties['app.url.approval']}/taxiBusinessRenew/saveTaxiBusinessRenew.htm",
			type: 'post',
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data:{data:mini.encode(businessObj)},
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
	function sceneTaxiBusinessRenew(){
		var form = new mini.Form("form");
		if(form.validate() == false){
			return;
		}
		var applyName = mini.get("applyName").getValue();
		if (applyName == '' || applyName == null) {
			mini.alert("企业申请信息不能为空！");
			return;
		}
		mini.confirm("确定办结？", "确定？",function (action) {
				if (action == "ok") {
					loading(true);
					var obj = form.getData();
					obj.overTime = "0";
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
			        obj.applyMaterials = {
			            copyCode:arr
					}
			        
					$.ajax({
				       	url: "${webProperties['app.url.approval']}/taxiBusinessRenew/sceneTaxiBusinessRenew.htm",
						type: 'post',
						data:{
			                data:mini.encode(obj)
						},
						success:function(data){
// 							loading(false);
// 			                mini.alert("办结成功");
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
							mini.get('tabs1').setActiveIndex(2);
			                //制证
			                operCert(acceptNumber,'taxi');
			            },
			            error: function (jqXHR, textStatus, errorThrown) {
			            	loading(false);
			                mini.alert("办结失败");
			            }
				    });
				}
			}
		);
	}
	//不予受理
	function noAcceptTaxiBusinessRenew(){
		var form = new mini.Form("form");
		if(form.validate() == false){
			return;
		}
		var applyName = mini.get("applyName").getValue();
		if (applyName == '' || applyName == null) {
			mini.alert("企业申请信息不能为空！");
			return;
		}
		mini.confirm("确定不予受理？", "确定？",
			function (action) {
				if (action == "ok") {
					loading(true);
					var obj = form.getData();
					obj.overTime = "0";
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
			        obj.applyMaterials = {
			            copyCode:arr
					}
					$.ajax({
				       	url: "${webProperties['app.url.approval']}/taxiBusinessRenew/noAcceptTaxiBusinessRenew.htm",
						type: 'post',
						data:{
			                data:mini.encode(obj)
						},
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
							mini.get('tabs1').setActiveIndex(2);
			            },
			            error: function (jqXHR, textStatus, errorThrown) {
			            	loading(false);
			                mini.alert("不予受理失败");
			            }
				    });
				}
			}
		);
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
        mini.get("#projectnameSix").setReadOnly(true);
        mini.get("#projectnameSix").addCls("asLabel");
        $("#toggleBtn1").hide();
        $("#toggleBtn2").hide();
        $("#toggleBtn3").hide();
        $("#toggleBtn4").hide();
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
        mini.get("#projectnameSix").setReadOnly(true);
        mini.get("#projectnameSix").addCls("asLabel");
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
    }
    
    /**
	 * 设置企业信息
	*/
	function resetCompanyData(){
		try {
    		window.parent.setNone(); // 清空父页面的申请单位
    		window.parent.setHangYe("出租","2011","","");
		} catch(e) {
			console.log(e);
		}
// 	   	mini.get("#applyId").setValue("");
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
</script>
</body>
</html>
