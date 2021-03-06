<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="cn.seisys.iti.pdd.auth.entity.UserInfo" %>
<%@ page import="cn.seisys.iti.pdd.auth.util.ShiroUtils" %>
<%@ page import="cn.seisys.iti.pdd.approval.constant.SubItemConstant" %>
<%@ page isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp" %>
<%@ include file="/WEB-INF/jsp/include/meta.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>网络预约出租汽车歇业</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
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
        #yw2 .asLabel .mini-textbox-border,
        #yw2 .asLabel .mini-textbox-input,
        #yw2 .asLabel .mini-buttonedit-border,
        #yw2 .asLabel .mini-buttonedit-input,
        #yw2 .asLabel .mini-textboxlist-border
        {
            border:0;background:none;cursor:default;
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
</head>
<body>
<div class="mini-fit">
    <div id="tabs1" class="mini-tabs" activeIndex="0" style="width:100%;height:95%;" plain="false" buttons="#tabsButtons" buttonsAlign="right">
        <div title="申请信息:网络预约出租汽车歇业" >
            <form id="hiddenValue">
                <input id="applicationClass" name="applicationClass" class="mini-hidden" value=""/>
                <input id="ownerId" name="ownerId" class="mini-hidden" value=""/>
                <input id="id" name="id" class="mini-hidden" value=""/>
            </form>
            <form id="form" method="post">
                <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
                    <tr id="acceptNumber_tr_id" style="display:none;">
                        <td style="width:130px;" align="right">受理编号：</td>
                        <td style="width:100%" colspan="3">
                            <input id="acceptNumber" name="acceptNumber" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">申请日期：</td>
                        <td style="width:50%">
                            <input id="applyDate" name="applyDate" class="mini-datepicker asLabel" style="width:96%;" readOnly="true" format="yyyy-MM-dd"/>
                        </td>
                        <td style="width:130px;" align="right">申请人：</td>
                        <td style="width:50%">
					            <input id="applyName" name="applyName" class="mini-textbox asLabel" readOnly="true" style="width:96%;"  value="" onblur="onBlurCompanyName" required="true"/><span style="color: red;">*</span>
				        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">经济类型：</td>
                        <td style="width:50%">
					        	<input id="companyEconomyType" name="companyEconomyType" class="mini-combobox  asLabel" url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=taxiEcoType"
					        	textField="typeNm" valueField="typeCd" readOnly="true" style="width:96%;" value="1"/>
					        </td>
                        <td style="width:130px;" align="right">注册地址：</td>
                        <td style="width:50%">
                        	<input id="registerAddress" name="registerAddress" class="mini-textbox asLabel" readOnly="true" required="true" style="width:96%;" value="" onblur="onBlurCompanyRegisterAddress"/><span style="color: red;">*</span>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">法定代表人：</td>
                        <td style="width:50%">
                            <input id="applyLegal" name="applyLegal" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value="张飞"/>
                        </td>
                        <td style="width:130px;" align="right">联系人：</td>
                        <td style="width:50%">
                            <input id="contact" name="contact" class="mini-textbox" style="width:96%;" value=""/>
                        </td>
                    </tr>
                    <tr>
                     	<td style="width:130px;" align="right">联系电话：</td>
                        <td style="width:50%">
                            <input id="contactNumber" name="representativeTel" class="mini-textbox" style="width:96%;" maxLength="12"/>
                        </td>
                        <td style="width:130px;" align="right">委托代理人：</td>
                        <td style="width:100%" colspan="3">
                            <input name="agent" class="mini-textbox" style="width:96%;" vtype="maxLength:20"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">申请许可项目名称：</td>
                        <td style="width:100%" colspan="3">
                            <input id="projectname" name="projectname" class="mini-textbox asLabel" style="width:98%;" readOnly="true" value=""/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div title="申请材料">
            <iframe id="fileupload" src="${webProperties['app.url.commProcess']}/entrance/commFileListPage.htm" frameborder="0"
         		scrolling="no" marginheight="0" marginwidth="0" height="100%" width="100%" ></iframe>
        </div>
        <div name="book" title="法律文书" visible="false">
            <div id="datagrid" class="mini-datagrid" url="${webProperties['app.url.approval']}/commCertificate/getCommCertificateList.htm"
                 style="width:auto;height:auto;" idField="id" allowSortColumn="true" sizeList="[10,20,30]"
                 pageSize="10" onloaderror="mini.alert(e.errorMsg);" showPager='false'>
                    <div property="columns">
                        <div type="indexcolumn"  align="center"  headerAlign="center">序号</div>
                        <div field="wsbh" align="center" visible='false' width='80' headerAlign="center">文书编号</div>
                        <div field="wsname" align="center" width='80' headerAlign="center">文书名称</div>
                        <div field="printstatus"  align="center" visible='false' width='80' headerAlign="center">打印状态</div>
                        <div field="printstatusmc" align="center" width='80' headerAlign="center">打印状态</div>
                        <div field="cz" align="center" width="80" headerAlign="center">操作</div>
                    </div>
            </div>
        </div>
		<%@ include file="/WEB-INF/jsp/include/tab.jsp" %>
    </div>

    <div id="tabsButtons">
        <a id="toggleBtn1" class="mini-button" iconCls="" onclick="accept()">受理</a>
        <a id="toggleBtn2" class="mini-button" iconCls="" onclick="save('noaccept')">不予受理</a>
        <a id="toggleBtn3" class="mini-button" iconCls="" onclick="save('save')">保存</a>
        <a id="toggleBtn4" class="mini-button" iconCls="" onclick="reset()">重置</a>
    </div>
</div>
<script type="text/javascript">
mini.parse();

var acceptNumber = getRequestString("acceptNumber");
<%UserInfo userinfo = ShiroUtils.getUserInfo(request);%>
var user = '<%=userinfo.getUsername()%>';
var userId = '<%=userinfo.getUserid()%>';

var userGroupName = '<%=userinfo.getOrgName()%>';
var processInstanceId;
var acceptNumber;
var userTaskId = "usertask26";
var model = getRequestString("model");
var applyNumber;

	$(document).ready(function(){
		var acceptNumber = getRequestString("acceptNumber");
    	var id = getRequestString("id");
    	var type = getRequestString("type");
    	if(type=="1"){
    		//创建申请 号
        	getSq();
    	}
    	//判断隐藏上传和收证补证
//     	if(type!="1" && type!="4"){
//     		$("#fileupload").load(function(){
//     			$("#fileupload")[0].contentWindow.setUploadDis();
// 	    		$("#fileupload")[0].contentWindow.shouJianBuZhen();
//     		})
//     	}
		if("view" == model){
        	
            labelModel("form");
            $("#acceptNumber_tr_id").show();
            $("#tabsButtons").hide();
        }
        
		if("" != acceptNumber && null != acceptNumber){
	       	 $("#fileupload").load(function(){
	       		 getTaxiById({acceptNumber:acceptNumber});
	       	 });
        }else{
	       	 if((id != "" && id!= null)){
	       		 $("#fileupload").load(function(){
	       		 	getTaxiById({id:id});
	           	 });
	       	 }else{
	       		 var strCurDate = mini.formatDate(new Date(),'yyyy-MM-dd HH:mm:ss');
                 mini.get("applyDate").setValue(strCurDate);
	           	 mini.get("projectname").setValue(window.parent.itemObj.name);
	             mini.get("applicationClass").setValue(window.parent.itemId);
	             $("#fileupload").load(function(){
	               	 $("#fileupload")[0].contentWindow.getList(window.parent.itemId);
	             });
	       	 }
        }
		getApprovalType({});
	});
	
	//获取申请号
    //type    01 :窗口  02:网申
    function getSq(){
        $.ajax({
            url: "${webProperties['app.url.commProcess']}/entrance/getAcceptNumber.htm",
            type: 'get',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data:{itemId: window.parent.itemId,type:'01'},
            async:false,
            success:function(data){
            	//截取字符串
                applyNumber = data.substring(1,(data.length-1));
            },
            error:function(jqXHR, textStatus, errorThrown){
                mini.alert(jqXHR.responseText);
            }
        });
    }
	
	function getTaxiById(id){
        $.ajax({
            url: "${webProperties['app.url.approval']}/taxiInter/getById.htm",
            type: 'post',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data:{data : mini.encode(id)},
            success:function(data){
                var result = mini.decode(data);
                var dataObj = result.data[0];
                var type = getRequestString("type");

                applyNumber = dataObj.applyNumber;
                var form = new mini.Form("form");
                new mini.Form("hiddenValue").setData(dataObj);
                form.setData(dataObj);

                if(type=="4"&&model=="edit"){
                	window.parent.setComInfo(dataObj.applyName);
                }
               
                if("1" != type && "4" != type){
					getHistoryTasksByCondition({instanceId:window.parent.processInstanceId},dataObj);
				}

                // if(dataObj.processInstanceId != "" || dataObj.processInstanceId !=null){
                //     getCurrentImg({instanceId:data.processInstanceId});
                // }

                //调用材料列表，得到信息
                $("#fileupload")[0].contentWindow.getList(dataObj.formType);

                var fileInfo = [];
                //展示材料信息
                var applyMaterials = dataObj.applyMaterials;
                var applyMaterialArr = [];

                for (var key in applyMaterials) {
                    applyMaterialArr = applyMaterials[key];
                }
                for (var i = 0; i < applyMaterialArr.length; i++) {
                    var params = {};
                    params.id = applyMaterialArr[i].materialCode;
                    params.fileName = applyMaterialArr[i].materialName;
                    params.shoudao = applyMaterialArr[i].getFileCount;
                    fileInfo.push(params);
                }
                $("#fileupload")[0].contentWindow.setFileInfo(fileInfo,dataObj.applyNumber);
                
                
            },
            error : function(jqXHR, textStatus, errorThrown) {
                if (jqXHR.status != 200) {
                    mini.alert("【status" + jqXHR.status + "】" + " "
                        + jqXHR.responseText);
                }
            }
        });
    }
	/**
     * 设置企业信息
     */
    function setCompanyData(comInfo){
		console.log(comInfo);
        mini.get("applyName").setValue(comInfo.b_cnname);
        mini.get("companyEconomyType").setValue(comInfo.b_economictypemc);
        mini.get("registerAddress").setValue(comInfo.b_registeredaddress);
        mini.get("ownerId").setValue(comInfo.b_enterpriseId);

        mini.get("applyLegal").setValue(comInfo.b_legalperson);
        mini.get("contactNumber").setValue(comInfo.b_phonenumber);

    }
	
	/**
		受理
	*/
	function accept(){
		var businessObj = {};
        var form = new mini.Form("form");

        form.validate();
        if(!form.isValid()){
        	mini.alert("输入数据不符合规范，请重新填写");
			return false;
        }
        jQuery.extend(businessObj,form.getData(),new mini.Form("hiddenValue").getData());
        
        businessObj.certUser = user;
        businessObj.certId = userId;
        businessObj.formType = window.parent.itemId;
        var approvingAuth = window.parent.itemObj.approvingAuth;
        businessObj.applyType = approvalMap[approvingAuth];
        businessObj.overTime = window.parent.itemObj.approveTime;
        //申请号码
        businessObj.applyNumber = applyNumber;
        
        if(businessObj.applyDate){
        	businessObj.applyDate = mini.formatDate(businessObj.applyDate,"yyyy-MM-dd HH:mm:ss");
		}

        //保存材料信息
        $("#fileupload")[0].contentWindow.getFileInfo(applyNumber);

        var fileInfo = $("#fileupload")[0].contentWindow.fileInfo;

        var arr = [];
        for (var i = 0; i < fileInfo.length; i++) {
            var GetFileEntity = {};
            GetFileEntity.materialCode = fileInfo[i].id;
            GetFileEntity.materialName = fileInfo[i].fileName;
            GetFileEntity.getFileCount = fileInfo[i].shoudao;
            arr.push(GetFileEntity);
        }
        businessObj.applyMaterials = {
            copyCode: arr
        }
        mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: '受理中...'
        });
        $.ajax({
            url: "${webProperties['app.url.approval']}/taxiInter/acceptTaxiBusinessLicense.htm",
            type: 'post',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data:{data:mini.encode(businessObj)},
            success:function(data){
            	mini.unmask(document.body);
                var dataObj = mini.decode(data);
                if(dataObj){
                    mini.get("acceptNumber").setValue(dataObj.acceptNumber);
                    $("#acceptNumber_tr_id").show();
                    $("#tabsButtons").hide();

                    acceptNumber = dataObj.acceptNumber;
                    processInstanceId = dataObj.processInstanceId;
                    getCurrentImg({instanceId:dataObj.processInstanceId});
                    
                    var paramObj = {};
					paramObj.subitemid = window.parent.itemId;
					paramObj.nodeTaskid = userTaskId;
					paramObj.acceptNumber = dataObj.acceptNumber;
					getLayerBook(paramObj);
                }
                labelModel("form");
                mini.alert("受理成功!");
                mini.get("tabs1").setActiveIndex(2);
                $("#fileupload")[0].contentWindow.setCeckDis();
                $("#fileupload")[0].contentWindow.setUploadDis();
 	    		$("#fileupload")[0].contentWindow.shouJianBuZhen();
            },
            error:function(jqXHR, textStatus, errorThrown){
            	mini.unmask(document.body);
                mini.alert(jqXHR.responseText);
            }
        });
	}
	
	function save(type){
    	var obj = {};
    	
    	var form = new mini.Form("form");

        form.validate();
        if(!form.isValid()){
        	mini.alert("输入数据不符合规范，请重新填写");
			return false;
        }
    	
        jQuery.extend(obj,form.getData(),new mini.Form("hiddenValue").getData());
        obj.formType = window.parent.itemId;
        if(type == "noaccept"){
            obj.certOrgName = userGroupName;
            var approvingAuth = window.parent.itemObj.approvingAuth;
            obj.applyType = approvalMap[approvingAuth];
        }
        obj.overTime = window.parent.itemObj.approveTime;
        //申请号码
        obj.applyNumber = applyNumber;
        if(obj.applyDate){
        	obj.applyDate = mini.formatDate(obj.applyDate,"yyyy-MM-dd HH:mm:ss");
		}
      
        //保存材料信息
        $("#fileupload")[0].contentWindow.getFileInfo(applyNumber);
        
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
            copyCode: arr
        }
        mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: '处理中...'
        });
        $.ajax({
            url: "${webProperties['app.url.approval']}/taxiInter/saveTaxiIndividual.htm",
            type: 'post',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data:{data : mini.encode(obj),type : type},
            success:function(result){
                mini.unmask(document.body);
                var data = mini.decode(result);
                if(type == "noaccept"){
                    mini.alert("不予受理成功");
                    mini.get("acceptNumber").setValue(data.acceptNumber);
                    $("#acceptNumber_tr_id").show();
                    $("#tabsButtons").hide();
                    
                    acceptNumber = data.acceptNumber;
                    processInstanceId = data.processInstanceId;
                    var paramObj = {};
					paramObj.subitemid = obj.projectnameSix;
					paramObj.nodeTaskid = userTaskId;
					paramObj.acceptNumber = data.acceptNumber;
					
					getLayerBook(paramObj);
                    getCurrentImg({instanceId:data.processInstanceId});

                    labelModel("form");
                    $("#fileupload")[0].contentWindow.setCeckDis();
                    $("#fileupload")[0].contentWindow.setUploadDis();
     	    		$("#fileupload")[0].contentWindow.shouJianBuZhen();
                }else{
                    mini.alert("保存成功");
                }
            },
            error : function(jqXHR, textStatus, errorThrown) {
            	mini.unmask(document.body);
                if (jqXHR.status != 200) {
                    mini.alert("【status" + jqXHR.status + "】" + " "
                        + jqXHR.responseText);
                }
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
                for(var i=0;i<dataArr.length;i++){
                    approvalMap[dataArr[i].typeCd] = dataArr[i].typeNm;
                }
            },
            error:function(jqXHR, textStatus, errorThrown){
                mini.alert(jqXHR.responseText);
            }
        });
    }
    /**
	* 获取法律文书
	*/
	function getLayerBook(paramObj) {
        var datagrid = mini.get("datagrid");
        datagrid.on("drawcell", function (e) {
            var record = e.record;
            var field = e.field;
            if (field == 'cz') {
                var gridHtml = "";
                gridHtml +=
                    '<a href="javascript:;" target="sub-right-frame" class="btn btn-sm green" style="width:50px;" onclick="toPrint(&quot;' +record.attcd + '&quot;,&quot;' +record.wsbh + '&quot;,&quot;' +paramObj.nodeTaskid + '&quot;,&quot;' +paramObj.subitemid + '&quot;);"><i class="fa fa-pencil"></i> 打印 </a>';
                e.cellHtml = gridHtml;
            }
        });
        datagrid.load(paramObj);
        var tabs = mini.get("tabs1");
        var tab = tabs.getTab("book");
        if (tab) {
            tabs.updateTab(tab, {visible: true});
        }
	}
	
	/**
	* 打印预览
	*/
	function toPrint(attcd,wsbh,nodeTaskid,subitemid) {
        var param = {};
        var url = "${webProperties['app.url.approval']}/commCertificate/openPdfFileView.htm";
        mini.open({
            url: url,
            title: "文书预览",
            width: 950,
            height: 600,
            allowResize: false,
            onload: function () {
                var iframe = this.getIFrameEl();
                var param = {};
                	param.acceptNumber = acceptNumber,//业务编号
                    param.processInstanceId = processInstanceId,//流程实例ID
                    param.fileName = wsbh;//文书编号
                    param.nodeTaskid = nodeTaskid;
                    param.subitemid = subitemid;
                    param.attcd = attcd;
                    param.processStatus = window.parent.processStatus;
                iframe.contentWindow.SetData(param);
            },
            ondestroy: function (action) {
                var paramObj = {};
                paramObj.subitemid = subitemid;
                paramObj.nodeTaskid = nodeTaskid;
                paramObj.acceptNumber = acceptNumber;
                getLayerBook(paramObj);
            }
        });
    }
	
	 /**
	* 查询流程历史任务集合
	*/
	function getHistoryTasksByCondition(paramObj,businessObj){
		var sortCondition = {};
		sortCondition.orderByTaskCreateTime = "asc";
		paramObj.sortCondition = sortCondition;
		$.ajax({
	       	url: "${webProperties['app.url.approval']}/approvalProcess/getHistoryTasksByCondition.htm",
			type: 'post',
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data:{data:mini.encode(paramObj)},
			success:function(data){
				var dataObj = mini.decode(data);
				var result = dataObj.data;
				
				acceptNumber = businessObj.acceptNumber;
				processInstanceId = paramObj.instanceId;
				
				var type = getRequestString("type");//这是前台传参数方法，通过modelview跳转页面通过别打的方法获取
				var param = {};
		        param.subitemid=businessObj.projectnameSix;
		        param.acceptNumber = businessObj.acceptNumber;
		        //type：2 待办
				if("2" == type){
					var curTask = result[result.length-1].taskDefinitionKey; 
					param.nodeTaskid = curTask;
					if("usertask3" == curTask || "usertask11" == curTask){
						updateBusinessModel();
					}
					//如果是复核节点可以上传，否则全部隐藏
					if("usertask3" == curTask){
						//隐藏上传和收件补正按钮
	    				$("#fileupload")[0].contentWindow.shouJianBuZhen();
					}else{
						$("#fileupload")[0].contentWindow.setUploadDis();
         	    		$("#fileupload")[0].contentWindow.shouJianBuZhen();
         	    		$("#fileupload")[0].contentWindow.setCeckDis();
					}
				}
		        //type：3是已办
				if("3" == type){
					$("#fileupload")[0].contentWindow.setUploadDis();
     	    		$("#fileupload")[0].contentWindow.shouJianBuZhen();
     	    		$("#fileupload")[0].contentWindow.setCeckDis();
     	    		
					var arr = [];
					for(var i=0;i<result.length;i++){
						if(userId == result[i].assignee){
							arr.push(result[i].taskDefinitionKey);
						}
					}
					param.nodeTaskid = arr.join(",");
				}
				getLayerBook(param);
				//var curTaskObj = result[result.length-1];
				
			},
			error:function(jqXHR, textStatus, errorThrown){
				mini.alert(jqXHR.responseText);
			}
	    });
	}
	 
	//获取企业名称
    function getApplyName(){
    	var contact = mini.get("contact").getValue();
    	var contactNumber = mini.get("contactNumber").getValue();
    	var projectname = mini.get("projectname").getValue();
    	var applyName =  mini.get("applyName").getValue();
    	var itemId = window.parent.itemId;
    	
    	var param = {};
    	param["contact"] = contact;
    	param["contactTel"] = contactNumber;
    	param["projectname"] = projectname;
    	param["applyName"] = applyName;
    	param["itemId"] = itemId;
    	
    	return param;
    }
	 
	//方法体里将业务信息里所有非申请信息的内容变为可编辑模式
	function updateBusinessModel(){
    	
        	var names = "contact,representativeTel,agent";
        	var form = new mini.Form("form");
            var fields = form.getFields();
            for (var i = 0, l = fields.length; i < l; i++) {
                var c = fields[i];
                if(names.indexOf(c.getName()) >= 0){
                	if (c.setReadOnly) c.setReadOnly(false);
                	if (c.removeCls) c.removeCls("asLabel");
                }
            }
    } 
	
	  function labelModel(formId) {
	        var form = new mini.Form(formId);
	        var fields = form.getFields();
	        for (var i = 0, l = fields.length; i < l; i++) {
	            var c = fields[i];
	            if(c.getValue() == ""){
	                c.setValue("");
	            }
	            if (c.setReadOnly) c.setReadOnly(true);     //只读
	            if (c.setIsValid) c.setIsValid(true);      //去除错误提示
	            if (c.addCls) c.addCls("asLabel");          //增加asLabel外观
	        }
	    }
	  
	
	  function reset() {
	    	mini.confirm("是否确定重置？", "提示",function(action){
				 if(action == "ok"){
				    	$("#fileupload")[0].contentWindow.setCeckNoChe();
				        $("#fileupload")[0].contentWindow.getList(window.parent.itemId);
				        new mini.Form("form").clear();

				        mini.get("projectname").setValue(window.parent.itemObj.name);
				        var strCurDate = mini.formatDate(new Date(),'yyyy-MM-dd HH:mm:ss');
				        mini.get("applyDate").setValue(strCurDate);
				        window.parent.setNone();
				 }
			});			 
	    }
	  
	//获取url中的请求参数
    function getRequestString(key){
        var reg = new RegExp("(^|&)"+key+"=([^&]*)(&|$)");
        var result = window.location.search.substr(1).match(reg);
        return result?decodeURIComponent(result[2]):null;
    }
</script>
</body>
</html>
