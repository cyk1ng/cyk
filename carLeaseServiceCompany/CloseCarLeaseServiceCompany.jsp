<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>客运车辆租赁服务企业歇业</title>
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
						<tr id="applyNmTr" style="display: none">
							<td style="width:130px;" align="right" >受理编号：</td>
							<td style="width:100%">
								<input id="acceptNumber" name="acceptNumber" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>
							</td>
							<td style="width:130px;" align="right" >处理结果：</td>
							<td style="width:100%">
								<input id="result" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>
							</td>
						</tr>
					    <tr>
					        <td style="width:130px;" align="right">申请日期：</td>
					        <td style="width:50%">
					            <input id="applyDate" name="applyDate" class="mini-datepicker asLabel" style="width:96%;" readOnly="true" value="" format="yyyy-MM-dd"/>
					        </td>
					        <td style="width:130px;" align="right">申请人：</td>
					        <td style="width:50%">
					            <input id="applyName" name="applyName" class="mini-textbox  asLabel" style="width:96%;" readOnly="true" value="${taxiBussinessEntity.applyName}"/>
					        </td>
						<tr>
						<tr>
							<td style="width:130px;" align="right">业户类型：</td>
							<td style="width:50%">
								<input id="companyEconomyType1" name="companyEconomyType1" class="mini-combobox asLabel" readOnly="true" valueField="typeCd" textField="typeNm" style="width:96%;" value="${taxiBussinessEntity.companyEconomyType1}" url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=taxiEcoType"/>
							</td>
							<td style="width:130px;" align="right">注册地址：</td>
							<td style="width:100%" colspan="2">
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
					            <input id="contact" name="contact" class="mini-textbox" style="width:98%;" vtype="maxLength:20" value="${taxiBussinessEntity.contact}" maxlength="20"/>
					        </td>
							<td style="width:130px;" align="right">联系电话：</td>
							<td style="width:50%" >
								<input id="contactNumber" name="contactNumber" class="mini-textbox" style="width:98%;" onvalidation="onTelValidation" value="${taxiBussinessEntity.contactNumber}"  maxlength="15"/>
							</td>
						<tr>
						<tr>
							<td style="width:130px;" align="right">委托代理人：</td>
							<td style="width:50%" >
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
							<td>
								<input id="applicationClass" name="applicationClass" style="display:none" class="mini-textbox asLabel" value="${applicationClass}"/>
								<input id="ownerId" name="ownerId" style="display:none" class="mini-textbox asLabel" value="${ownerId}"/>
								<input id="projectnameSix" name="projectnameSix" style="display:none" class="mini-textbox asLabel" value="${projectnameSix}"/>
                                <input id="id" name="id" style="display:none" class="mini-textbox asLabel" value="${id}"/>
								<input id="overTime" name="overTime" style="display:none" class="mini-textbox asLabel" value=""/>
								<input id="enterpriseNumber" name="enterpriseNumber" style="display:none" class="mini-textbox asLabel" value="${enterpriseNumber}"/>
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
							url="${webProperties['app.url.approval']}/carLeaseServiceComp/getTaxiData.htm" style="width:100%"
								 idField="id" allowSortColumn="true" showPager="true"  pageSize="10" pager="pager1" style="width: 100%; height: 400px;"
								 allowRowSelect="true" multiSelect="true" allowUnselect="true"
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
		<a id="toggleBtn1" class="mini-button" iconCls="" onclick="acceptInput()">当场办结</a>
		<a id="toggleBtn2" class="mini-button" iconCls="" onclick="declareInput()">不予受理</a>
		<a id="toggleBtn3" class="mini-button" iconCls="" onclick="saveInput()">保存</a>
		<a id="toggleBtn4" class="mini-button" iconCls="" onclick="resetInput()">重置</a>
	</div>
</div>
<script type="text/javascript">
    mini.parse();
    var datagrid = mini.get("datagrid2");
    var eduFlag;
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
        console.log(window.parent.iframe);
        mini.get("#applyDate").setValue(new Date());
        mini.get("#applicationClass").setValue(window.parent.itemId);
        mini.get("#projectname").setValue(window.parent.itemObj.name);
        mini.get("#overTime").setValue(window.parent.itemObj.approveTime);
        getApprovalType({});
     	// 无申请号时，获取申请号
	    if ("${taxiBussinessEntity.applyNumber}" == "" || "${taxiBussinessEntity.applyNumber}" == null) {
	    	getSq(); // 获取申请号
	    }

        // mini.get("#applyName").setValue("上海公司");
        // mini.get("#companyEconomyType").setValue("100");
        // mini.get("#registerAddress").setValue("上海公司");
        // mini.get("#applyLegal").setValue("上海公司");
        // mini.get("#operatingAddress").setValue("上海公司");
        //var form1 = new mini.Form("#form1");
        var projectnameSix = mini.get("#projectnameSix").getValue();
		$("#fileupload").load(function() {
         	$("#fileupload")[0].contentWindow.getList(projectnameSix);
        });

        var model = getRequestString("model");
        if("view" == model){
            labelModel("form");
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
        }else{
        	try {window.parent.setHangYe("租赁","2012","","2");} catch(e) {console.log(e);}
        }
        var id = getRequestString("id");
        // 草稿箱
        if (model == "edit" && (id != null && id != "")) {
	        try {window.parent.setComInfo(mini.get("#applyName").getValue());} catch(e) {console.log(e);}
        }
        var fileInfo = [];
        var applyMaterials = ${getFileEntity};
        for (var i = 0; i < applyMaterials.length; i++) {
            var params = {};
            params.id = applyMaterials[i].materialCode;
            params.fileName = applyMaterials[i].materialName;
            params.shoudao = applyMaterials[i].getFileCount;
            fileInfo.push(params);
        }
        loadTaxiGrid();
     	// 设置进去
        $("#fileupload").load(function() {
        	$("#fileupload")[0].contentWindow.setFileInfo(fileInfo, mini.get("#applyNumber").getValue());
        });

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

	});
	
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

    var approvalMap = {};
    function getApprovalType(obj){
        $.ajax({
            url: "${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm",
            type: 'get',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data:{clCd:"approve"},
            success:function(data){
                var dataArr = mini.decode(data);
                console.log(dataArr);
                for(var i=0;i<dataArr.length;i++){
                    approvalMap[dataArr[i].typeCd] = dataArr[i].typeNm;
                }
                console.log(dataArr);
                console.log(approvalMap);
            },
            error:function(jqXHR, textStatus, errorThrown){
                mini.alert(jqXHR.responseText);
            }
        });
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
        mini.confirm("是否重置？", "确定？",
            function (action) {
                if (action == "ok") {
                    // 重置申请企业信息
                    resetCompanyData();
                    mini.get("#contact").setValue("");
                    mini.get("#contactNumber").setValue("");
                    mini.get("#agent").setValue("");
                    mini.get("#applyDesc").setValue("");
                    
                    // 重置车辆表
                    mini.get("datagrid2").setData([]);
                    
                 	// 清除附件选中状态:重置用
            		$("#fileupload")[0].contentWindow.setCeckNoChe();
            		//清除文件列表
                    var projectnameSix = mini.get("#projectnameSix").getValue();
                    $("#fileupload")[0].contentWindow.getList(projectnameSix);
                } else {

                }
            }
        );
    }

    //保存
    function saveInput() {
        var form = new mini.Form("#formClose");
        var data = form.getData(true);
        var url = "${webProperties['app.url.approval']}/carLeaseServiceComp/saveCloseCarLeaseInfo.htm";

        var enterpriseId = mini.get("#ownerId").getValue();
        if (enterpriseId == "" || enterpriseId == null || enterpriseId == undefined) {
            mini.alert("请选择申请人");
            return;
        }

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

        loading(true);

        $.ajax({
            url:url,
            data:{
                data:mini.encode(data)
            },
            type:'POST',
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
        })
    }

    //受理前操作
    function acceptInput() {
        var enterpriseId = mini.get("#ownerId").getValue();
        if (enterpriseId == "" || enterpriseId == null || enterpriseId == undefined) {
            mini.alert("请选择申请人");
            return;
        }
        var form = new mini.Form("#formClose");
        form.validate();
        if (form.isValid() == false) {
            mini.alert("输入数据不符合规范");
            return;
        }

        var obj = {};
        //是否完成
        obj.isFinished = "0";

        var arr1 = [];
        var obj1 = {};
        obj1.conditionKey = "ownerId";
        obj1.conditionValue = enterpriseId;
        arr1.push(obj1);

        var filterCondition = {variableValueEquals:arr1};
        obj.filterCondition = filterCondition;
        $.ajax({
            url: "${webProperties['app.url.approval']}/common/getProcessInstanceByCondition.htm",
            type: 'post',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data:{data:mini.encode(obj)},
            success:function(data){
                var dataObj = mini.decode(data);
                if (dataObj.data.length>0) {
                    mini.alert("该企业还有事项未办结,不予歇业")
                }else {
                    if (eduFlag == 2) {
                        shouli();
                    }else{
                        mini.confirm("还有剩余额度，是否继续办结？", "确定？",
                            function (action) {
                                if (action == "ok") {
                                    shouli();
                                } else {

                                }
                            }
                        );
                    }
                }
            },
            error:function(jqXHR, textStatus, errorThrown){
                mini.alert(jqXHR.responseText);
            }
        });



    }


    function shouli() {
        var approvingAuth = window.parent.itemObj.approvingAuth;
        mini.get("#applyType").setValue("3");
        var form = new mini.Form("#formClose");
        form.validate();
        var data = form.getData(true);
        var url = "${webProperties['app.url.approval']}/carLeaseServiceComp/acceptCloseCarLeaseInfo.htm";
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

        loading(true);
        $.ajax({
            url:url,
            data:{
                data:mini.encode(data)
            },
            type:'POST',
            success:function(data){
//                 loading(false);
//                 mini.alert("当场办结成功");
                var result = eval("("+data+")");
                changeType(result.acceptNumber,"受理");
                mini.get('tabs1').setActiveIndex(3);
                getCurrentImg({instanceId:result.processInstanceId});

                acceptNumber = result.acceptNumber;
                processInstanceId = result.processInstanceId;

                //调用查询法律文书方法
                var paramObj = {};
                paramObj.subitemid = mini.get("#projectnameSix").getValue();
                paramObj.nodeTaskid = userTaskId;
                paramObj.acceptNumber = result.acceptNumber;
                getLayerBook(paramObj);

                //制证
                operCert(result.acceptNumber,'lease');
            },
            error: function (jqXHR, textStatus, errorThrown) {
                loading(false);
                mini.alert("当场办结失败");
            }
        })
    }

    //不予受理
    function declareInput() {
    	 var enterpriseId = mini.get("#ownerId").getValue();
         if (enterpriseId == "" || enterpriseId == null || enterpriseId == undefined) {
             mini.alert("请选择申请人");
             return;
         }
         var form = new mini.Form("#formClose");
         form.validate();
         if (form.isValid() == false) {
             mini.alert("输入数据不符合规范");
             return;
         }

         var obj = {};
         //是否完成
         obj.isFinished = "0";

         var arr1 = [];
         var obj1 = {};
         obj1.conditionKey = "ownerId";
         obj1.conditionValue = enterpriseId;
         arr1.push(obj1);

         var filterCondition = {variableValueEquals:arr1};
         obj.filterCondition = filterCondition;
         $.ajax({
             url: "${webProperties['app.url.approval']}/common/getProcessInstanceByCondition.htm",
             type: 'post',
             contentType: "application/x-www-form-urlencoded; charset=utf-8",
             data:{data:mini.encode(obj)},
             success:function(data){
                 var dataObj = mini.decode(data);
                 if (dataObj.data.length>0) {
                     mini.alert("该企业还有事项未办结")
                 }else {
                     if (eduFlag == 2) {
                    	 buyushouli();
                     }else{
                         mini.confirm("还有剩余额度，是否不予受理？", "确定？",
                             function (action) {
                                 if (action == "ok") {
                                	 buyushouli();
                                 } else {

                                 }
                             }
                         );
                     }
                 }
             },
             error:function(jqXHR, textStatus, errorThrown){
                 mini.alert(jqXHR.responseText);
             }
         });
    }

    function buyushouli() {
        var form = new mini.Form("#formClose");
        form.validate();
        var data = form.getData(true);
        var url = "${webProperties['app.url.approval']}/carLeaseServiceComp/declareCloseCarLeaseInfo.htm";
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
        loading(true);

        $.ajax({
            url:url,
            data:{
                data:mini.encode(data)
            },
            type:'POST',
            success:function(data){
                loading(false);
                mini.alert("不予受理成功");
                var result = eval("("+data+")");
                changeType(result.acceptNumber,"不予受理");
                getCurrentImg({instanceId:result.processInstanceId});
                mini.get('tabs1').setActiveIndex(3);

                acceptNumber = result.acceptNumber;
                processInstanceId = result.processInstanceId;

                var paramObj = {};
                paramObj.subitemid = mini.get("#projectnameSix").getValue();
                paramObj.nodeTaskid = userTaskId;
                paramObj.acceptNumber = result.acceptNumber;
                getLayerBook(paramObj);

            },
            error: function (jqXHR, textStatus, errorThrown) {
                loading(false);
                mini.alert("不予受理失败");
            }
        })
    }

    //修改为查看状态
    function changeType(acceptNumber,result) {
        mini.get("#acceptNumber").setValue(acceptNumber);
        mini.get("#result").setValue(result);
        mini.get("#contact").setReadOnly(true);
        mini.get("#contactNumber").setReadOnly(true);
        mini.get("#agent").setReadOnly(true);
        mini.get("#applyDesc").setReadOnly(true);
        $("#toggleBtn1").hide();
        $("#toggleBtn2").hide();
        $("#toggleBtn3").hide();
        $("#toggleBtn4").hide();
        $("#applyNmTr").show();
        $("#fileupload")[0].contentWindow.setCeckDis(); // 设置复选框不能选择
    	$("#fileupload")[0].contentWindow.setUploadDis(); // 隐藏上传按钮
        $("#fileupload")[0].contentWindow.shouJianBuZhen(); // 隐藏收件补正按钮
    }

    /**
          * 设置企业信息
     */
    function setCompanyData(comInfo){
        // console.log(comInfo);
        mini.get("#applyName").setValue(comInfo.b_cnname);
        mini.get("#companyEconomyType1").setValue(comInfo.b_manageclass);
        mini.get("#companyEconomyType").setValue(comInfo.b_economictype);
        mini.get("#registerAddress").setValue(comInfo.b_registeredaddress);
        mini.get("#applyLegal").setValue(comInfo.b_legalperson);
        mini.get("#operatingAddress").setValue(comInfo.operateaddress);
        console.log(window.parent.itemObj);
        mini.get("#ownerId").setValue(comInfo.b_enterpriseId);
        mini.get("#enterpriseNumber").setValue(comInfo.taxiBaseNumber);
        loadTaxiGrid();
        eduValid();
    }
    
    /**
	  * 重置企业信息
	 */
	function resetCompanyData(){
		try {
    		window.parent.setNone(); // 清空父页面的申请单位
    		window.parent.setHangYe("租赁","2012","","2"); // 设置申请单位为企业
		} catch(e) {
			console.log(e);
		}
	   	mini.get("#applyName").setValue("");
	   	mini.get("#companyEconomyType1").setValue("");
	   	mini.get("#companyEconomyType").setValue("");
	   	mini.get("#registerAddress").setValue("");
	   	mini.get("#applyLegal").setValue("");
	   	mini.get("#operatingAddress").setValue("");
	   	mini.get("#ownerId").setValue("");
	   	mini.get("#enterpriseNumber").setValue("");
	}

    function loadTaxiGrid() {
        var param = {};
        param.enterpriseId = mini.get("#ownerId").getValue();
        // param.enterpriseId = "2646";
        datagrid.load(param);
    }

    function eduValid() {
        var url = "${webProperties['app.url.approval']}/carLeaseServiceComp/getEDuData.htm";
        var enterpriseId = mini.get("#ownerId").getValue();
        $.ajax({
            url:url,
            data:{
                enterpriseId:enterpriseId
            },
            type:'POST',
            success:function(data){
                var result = eval("("+data+")");
                if (result.miniCarQuota != 0 ) {
                    eduFlag = 1;
                }else{
                    eduFlag = 2;
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                mini.alert("查询额度失败");
            }
        })
    }

    /**
     * 加载。。。
     * @param flag true:开始加载 false:停止加载
     * */
    function loading(flag) {
        if (flag) {
            mini.mask({
                el: document.body,
                cls: 'mini-mask-loading',
                html: '加载中...'
            });
        } else {
            mini.unmask(document.body);
        }
    }
</script>
</body>
</html>
