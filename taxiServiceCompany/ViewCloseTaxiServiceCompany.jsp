<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>巡游出租汽车客运服务企业歇业</title>
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
		    	<form id="formClose" method="post">
		    		<table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
						<tr id="applyNmTr">
							<td style="width:130px;" align="right" >受理编号：</td>
							<td style="width:100%">
								<input id="acceptNumber" name="acceptNumber" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value="${taxiBussinessEntity.acceptNumber}"/>
							</td>
							<td style="width:130px;" align="right" style="display: none"></td>
							<td style="width:100%">
							</td>
						</tr>
					    <tr>
					        <td style="width:130px;" align="right">申请日期：</td>
					        <td style="width:50%">
					            <input id="applyDate" name="applyDate" class="mini-datepicker asLabel" style="width:96%;" readOnly="true" value="${taxiBussinessEntity.applyDate}"/>
					        </td>
					        <td style="width:130px;" align="right">申请人：</td>
					        <td style="width:50%">
					            <input id="applyName" name="applyName" class="mini-textbox  asLabel" style="width:96%;" readOnly="true" value="${taxiBussinessEntity.applyName}"/>
					        </td>
						<tr>
						<tr>
							<td style="width:130px;" align="right">业户类型：</td>
							<td style="width:50%">
								<input id="companyEconomyType1" name="companyEconomyType1" class="mini-combobox asLabel" style="width:96%;" readOnly="true" valueField="typeCd" textField="typeNm" value="${taxiBussinessEntity.companyEconomyType1}" url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=taxiEcoType"/>
							</td>
							<td style="width:130px;" align="right">注册地址：</td>
							<td style="width:100%" >
								<input id="registerAddress" name="registerAddress" class="mini-textbox  asLabel" style="width:98%;" readOnly="true" value="${taxiBussinessEntity.registerAddress}"/>
							</td>
						<tr>
						<tr>
							<td style="width:130px;" align="right">法定代表人：</td>
							<td style="width:50%">
								<input id="applyLegal" name="applyLegal" class="mini-textbox  asLabel" style="width:96%;" readOnly="true" value="${taxiBussinessEntity.applyLegal}"/>
							</td>
							<td style="width:130px;" align="right">经营地址：</td>
							<td style="width:50%">
								<input id="operatingAddress" name="operatingAddress" class="mini-textbox  asLabel" style="width:98%;" readOnly="true" value="${taxiBussinessEntity.operatingAddress}"/>
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
					        <td style="width:50%" >
					            <input id="contact" name="contact" class="mini-textbox asLabel" style="width:98%;" readOnly="true" vtype="maxLength:20" readOnly="true" value="${taxiBussinessEntity.contact}"/>
					        </td>
							<td style="width:130px;" align="right">联系电话：</td>
							<td style="width:50%" >
								<input id="contactNumber" name="contactNumber" class="mini-textbox asLabel" readOnly="true" style="width:98%;" onvalidation="onTelValidation" value="${taxiBussinessEntity.contactNumber}"/>
							</td>
						<tr>
						<tr>
							<td style="width:130px;" align="right">委托代理人：</td>
							<td style="width:50%" colspan="3">
								<input id="agent" name="agent" class="mini-textbox asLabel" style="width:98%;" readOnly="true" vtype="maxLength:20" value="${taxiBussinessEntity.agent}"/>
							</td>
					    </tr>
					    <tr>
					       	<td style="width:130px;" align="right">申请情况说明：</td>
					       	<td style="width:100%" colspan="3">
								<input id="applyDesc" name="applyDesc" class="mini-textarea asLabel" style="width: 98%;height:130px;" readOnly="true" value="${taxiBussinessEntity.applyDesc}"/>
							</td>
				       	</tr>
						<tr>
							<td>
								<input id="applicationClass" name="applicationClass" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.applicationClass}"/>
								<input id="ownerId" name="ownerId" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.ownerId}"/>
								<input id="projectnameSix" name="projectnameSix" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.projectnameSix}"/>
                                <input id="id" name="id" style="display:none" class="mini-textbox asLabel" value="${id}"/>
                                <input id="enterpriseNumber" name="enterpriseNumber" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.enterpriseNumber}"/>
                                <input id="applyType" name="applyType" style="display:none" class="mini-textbox asLabel" value=""/>
								<input id="type" style="display:none" class="mini-textbox asLabel" value="${type}"/>
								<input id="applyNumber" name="applyNumber" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.applyNumber }"/>
								<input id="companyEconomyType" name="companyEconomyType" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.companyEconomyType }"/>
							</td>
						</tr>
					    
					</table>
		       </form>
		    </div>
            <div title="业务信息" >
                    <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
                        <form id="formDatagrid" method="post">
                            <div id="datagrid2" class="mini-datagrid"
                                 url="${webProperties['app.url.approval']}/taxiServiceComp/getTaxiData.htm" style="width:100%"
                                 idField="id" allowSortColumn="true" showPager="true"  pageSize="10" pager="pager1" style="width: 100%; height: 400px;"
                                 allowRowSelect="true" multiSelect="true"
                                 onloaderror="mini.alert(e.errorMsg);">
                                <div property="columns">
                                    <div type="indexcolumn" align="center" width='50px' headerAlign="center">序号</div>
                                    <div field="licensePlate" align="center" width='100px' headerAlign="center">车牌照号</div>
                                    <div field="operationCertificateClass" align="center" width='100px' headerAlign="center">营运证类别</div>
                                    <div field="vehicleColour" align="center" width='100px' headerAlign="center">车牌颜色</div>
                                    <div field="carType" align="center" width='100px' headerAlign="center">车辆类型</div>
                                    <div field="brandModel" align="center" width='100px' headerAlign="center">车辆型号</div>
                                    <div field="commissioningDate" align="center" width='100px' headerAlign="center" renderer="ondayRendererYYYYMMDD">投运日期</div>
                                    <div field="enginePower" align="center" width='100px' headerAlign="center">发动机功率</div>
                                    <div field="freightRate" align="center" width='100px' headerAlign="center">运价/公里</div>
                                    <div field="passengerNo" align="center" width='100px' headerAlign="center">载客人数</div>
                                </div>
                            </div>
                        </form>
                    </table>
            </div>
			<div title="申请材料">
<%-- 				<%@ include file="/WEB-INF/jsp/include/commFileUploadPage.jsp" %> --%>
				<iframe id="fileupload" src="${webProperties['app.url.commProcess']}/entrance/commFileListPage.htm" frameborder="0"
			 		scrolling="no" marginheight="0" marginwidth="0" height="100%" width="100%" >
				</iframe>
			</div>
			<!-- START 法律文书 -->
			<%@ include file="/WEB-INF/jsp/include/commLawInfo.jsp" %>
			<!-- END 法律文书 -->
			<%@ include file="/WEB-INF/jsp/include/tab.jsp" %>
		</div>
		<div id="tabsButtons">
			<%--<a id="toggleBtn1" class="mini-button" iconCls="" onclick="acceptInput()">受理</a>--%>
			<%--<a id="toggleBtn2" class="mini-button" iconCls="" onclick="declareInput()">不予受理</a>--%>
		    <%--<a id="toggleBtn3" class="mini-button" iconCls="" onclick="saveInput()">保存</a>--%>
		    <%--<a id="toggleBtn4" class="mini-button" iconCls="" onclick="resetInput()">重置</a>--%>
		    <a id="toggleBtn5" class="mini-button" style="display:none" iconCls="" onclick="saveFileClick('taxi')">保存</a>
		</div>
	</div>
<script type="text/javascript">
	mini.parse();
    var datagrid = mini.get("datagrid2");
    var tabs = mini.get("tabs1");
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
		var model = getRequestString("model");
        var projectnameSix = mini.get("#projectnameSix").getValue();
        $("#fileupload").load(function() {
         	$("#fileupload")[0].contentWindow.getList(projectnameSix);
        });
        var fileInfo = [];
        var applyMaterials = ${getFileEntity};
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
		if("view" == model){
			// labelModel("form");
			// labelModel("form1");
			// labelModel("form2");
			//var form1 = new mini.Form("#form1");
			//form1.setData({name1:"test"});
			//form1.setEnabled(true);
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
        loadTaxiGrid();
        // 列表
        datagrid.on("drawcell", function (e) {

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

    function loadTaxiGrid() {
        var param = {};
        param.enterpriseId = mini.get("#ownerId").getValue();
        // param.enterpriseId = "2646";
        datagrid.load(param);
    }

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

	//重置
	function resetInput() {
		mini.get("#contact").setValue("");
		mini.get("#contactNumber").setValue("");
		mini.get("#agent").setValue("");
		$("#fileupload")[0].contentWindow.setCeckNoChe();
    }

    //保存
    function saveInput() {
        var form = new mini.Form("#formClose");
        var data = form.getData(true);
        var url = "${webProperties['app.url.approval']}/taxiServiceComp/saveCloseTaxiInfo.htm";
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

        $.ajax({
            url:url,
            data:{
                data:mini.encode(data)
            },
            type:'POST',
            success:function(data){
                mini.alert("保存成功");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                mini.alert("保存失败");
            }
        })
    }

    //受理
    function acceptInput() {
        var form = new mini.Form("#formClose");
        form.validate();
        var data = form.getData(true);
        var url = "${webProperties['app.url.approval']}/taxiServiceComp/acceptCloseTaxiInfo.htm";
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


        $.ajax({
            url:url,
            data:{
                data:mini.encode(data)
            },
            type:'POST',
            success:function(data){
                mini.alert("受理成功");
                var result = eval("("+data+")");
                changeType(result.acceptNumber,"受理");
                getCurrentImg({instanceId:result.processInstanceId});
            },
            error: function (jqXHR, textStatus, errorThrown) {
                mini.alert("受理失败");
            }
        })
    }

    //不予受理
    function declareInput() {
        var form = new mini.Form("#formClose");
        form.validate();
        var data = form.getData(true);
        var url = "${webProperties['app.url.approval']}/taxiServiceComp/declareCloseTaxiInfo.htm";
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

        $.ajax({
            url:url,
            data:{
                data:mini.encode(data)
            },
            type:'POST',
            success:function(data){
                mini.alert("不予受理成功");
                var result = eval("("+data+")");
                changeType(result.acceptNumber,"不予受理");
                getCurrentImg({instanceId:result.processInstanceId});
            },
            error: function (jqXHR, textStatus, errorThrown) {
                mini.alert("不予受理失败");
            }
        })
    }
</script>
</body>
</html>
