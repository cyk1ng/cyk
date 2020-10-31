<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<%@ page import="cn.seisys.iti.pdd.auth.entity.UserInfo" %>
<%@ page import="cn.seisys.iti.pdd.auth.util.ShiroUtils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>审批流程</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@ include file="/WEB-INF/jsp/include/meta.jsp" %>
<style type="text/css">
html, body {
	padding: 0;
	margin: 0;
	border: 0;
	height: 100%;
	width:100%;
	overflow: hidden;
	background-color: white;
}
.asLabel .mini-textbox-border,
.asLabel .mini-textbox-input,
.asLabel .mini-buttonedit-border,
.asLabel .mini-buttonedit-input,
.asLabel .mini-textboxlist-border
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
.td_bg{
	background-color: #f1f4f7;
	text-align: right!important;
}
.mini-grid-rows-view{
	overflow-x:hidden; 
}
#approvalInfoPanel .mini-panel-body {
	overflow-y: hidden;
}
#applyInfoTable tr {
	height: 35px;
}
#applyInfoTable .td_value {
	padding-left : 5px!important;
	text-align: left!important;
}
.audit-opinion {
	font-size: 14px;
	font-family: 微软雅黑;
}
</style>
</head>
<body>
	<% String formKey = request.getAttribute("formKey").toString(); %>
	<div class="mini-fit">
		<div class="mini-splitter" style="width:100%;height:100%;" handlerSize="6">
		    <div size="400" showCollapseButton="true" style="border-right: 0px;">
		        <div class="mini-splitter" vertical="true" style="width:100%;height:100%;border: 0px;" handlerSize="0" allowResize="false">
				    <div size="190" showCollapseButton="false" style="border: 0px;">
				    	<div id="approvalInfoPanel" class="mini-panel" title="受理信息" style="width:100%;height:100%;" >
				    	<form action="" id="form1">
				        <table id="applyInfoTable" border="1" cellpadding="1" cellspacing="2" style="width:99%;table-layout:fixed;border-color: #E7ECF1;border:1px;">
						    <tr>
						        <td style="width:80px;text-align:right" align="right" class="td_bg">受理编号：</td>
						        <td style="width:100%;" colspan="3" class="td_value">
						            <span id="acceptNumber" name="acceptNumber" ></span>
						        </td>
						    </tr>
						    <tr>
						        <td style="width:80px;" align="right" class="td_bg">受理时间：</td>
						        <td style="width:45%;" class="td_value">
						        	<span id="acceptTime" name="acceptTime" ></span>
						        </td>
						        <td style="width:80px;" align="right" class="td_bg">受理人员：</td>
						        <td style="width:45%;" class="td_value">
						            <span id="acceptUser" name="acceptUser" ></span>
						        </td>
						    </tr>
						    <tr>
						    	<td style="width:80px;" align="right" class="td_bg">送审部门：</td>
						        <td style="width:100%" colspan="3" class="td_value">
						            <span id="approvingAuth" name="approvingAuth" ></span>
						        </td>
						    </tr>
						    <tr>
						        <td style="width:80px;" align="right" class="td_bg">进程状态：</td>
						        <td style="width:100%" colspan="3" class="td_value">
						            <span id="processStatus" name="processStatus" ></span>
						        </td>
						    </tr>
						</table>
						</form>
						</div>
				    </div>
				    <div showCollapseButton="false" style="border: 0px;">
				    	<div class="mini-splitter" vertical="true" style="width:100%;height:100%;border: 0px;" handlerSize="0" allowResize="false">
				    		<div showCollapseButton="false" style="border: 0px;">
				    			<div class="mini-panel" title="流程历史" style="width:100%;height:100%;" >
					        		<div id="datagrid1" class="mini-datagrid" style="width:100%;height:100%;" 
									    url="" showpager="false" onrowclick="onRowClickProcessHis" 
									>
									    <div property="columns">
									        <div field="name" headerAlign="center" align="center">流程节点</div>    
									        <div field="processStatus" width="60" headerAlign="center" align="center" renderer="onRenderProcessStatus">办理状态</div> 
									        <div field="taskLocalVariables.certUser" width="60" headerAlign="center" align="center" renderer="onRenderHandleUser">办理人员</div> 
									        <div field="endTime" width="65" headerAlign="center" align="center" renderer="onRenderHandleTime">办理时间</div>    
									    </div>
									</div>
								</div>
				    		</div>
				    		<div size="140" showCollapseButton="false" style="border: 0px;">
				    			<div class="mini-panel" title="过程文件" style="width:100%;height:100%;" >
				    				<div id="datagrid2" class="mini-datagrid" style="width:100%;height:100%;" 
									    url="" showpager="false" 
									>
									    <div property="columns">
									        <div field="bizSn" width="30%" headerAlign="center" align="center">流程节点</div>    
									        <div field="attOrigNm" width="50%" headerAlign="center" align="center" >文件名</div> 
									        <div field="action" width="20%" headerAlign="center" align="center" renderer="onRenderAction">操作</div> 
									    </div>
									</div>
				    			</div>
				    		</div>
				    	</div>
				        
				    </div>        
				</div>
		    </div>
		    <div showCollapseButton="false">
		        <div id="test12" class="mini-splitter" vertical="true" style="width:100%;height:100%;" handlerSize="1" allowResize="false">
		        	<div showCollapseButton="false" style="">
		        		<iframe id="license_frame" src="" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" height="100%" width="100%" ></iframe>
		        	</div>
		        	<div size="80" showCollapseButton="false" style="text-align: center;">
						<jsp:include page="<%=formKey%>" flush="true"/>
		        	</div>
		        </div>
		    </div>        
		</div>
	</div>
<script type="text/javascript" src="${webProperties['app.url.businessApproval']}/resources/js/commTool.js"></script>
<script type="text/javascript" src="${webProperties['app.url.businessApproval']}/resources/js/commActivitiUtils.js"></script>
<script type="text/javascript">
	mini.parse();
	<%UserInfo userinfo = ShiroUtils.getUserInfo(request);%>
	var businessApprovalUrl='${webProperties['app.url.businessApproval']}';
	var user = '<%=userinfo.getUsername()%>';
	var userId = '<%=userinfo.getUserid()%>';
	var orgName = '<%=userinfo.getOrgName()%>';
	var processInstanceId = '${processInstanceId}';
	var taskId = '${taskId}';
	var acceptNumber = '${acceptNumber}';
	var itemId = '${itemId}';
	var url = '${url}';
	var matterType= "";
	var type = '${type}';
	var businessObj;
	var itemObj={};
	var fieldAuditResult = "";
	var processStatus = '${processTaskData.name}';
	var processTaskData = '${processTaskData}';
	var api = '${api}';
	var key='${key}';
	//var processVariables='${processVariables}';
	var applicationClassName='${applicationClassName}';
	var createTime='${processVariables.createTime}';
	var createUser='${processVariables.createUser}';
	var contact='${processVariables.contact}';
	var contactTel='${processVariables.contact_tel}';
	var projectName='${processVariables.projectName}';
	
	$(document).ready(function(){
		var srcurl = "<c:url value='"+url+"'/>?model=view&acceptNumber="+acceptNumber+"&type="+type;
		
		$("#license_frame").attr("src",srcurl);
		queryBusinessLicense({instanceId:processInstanceId});
		getHistoryTasksByCondition({instanceId:processInstanceId});
		getFileInfo({bizCd:acceptNumber});
		
	});
	
	
	/**
     * 查询信息
     */
    function queryBusinessLicense(businessSearchObj) {
		$.ajax({
	       	url: "${webProperties['app.url.businessApproval']}/common/queryBusinessLicense.htm",
			type: 'post',
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data:{data:mini.encode(businessSearchObj)},
			success:function(data){
				//debugger;
				var dataObj = mini.decode(data);
				var result = dataObj.data;
				if(result.length>0){
					var acctTaskId="usertask1";
					if(key=="nightConstruction"){
						acctTaskId="usertask1";
					}else if(key=="parkLot"){
						acctTaskId="usertask1";
					}else if(key=="bulkCargo"){
						var  implement_type = result[0].processVariables.implement_type;
						if(implement_type=="1"||implement_type=="2")
						 acctTaskId="usertask1";
						else
						  acctTaskId="usertask2";
					}
					
					
					for(var i=0;i<result.length;i++){
						if(result[i].taskDefinitionKey==acctTaskId){
							var acceptTime = result[i].processVariables.permissionTime;
							$("#acceptTime").html(mini.formatDate(acceptTime, "yyyy-MM-dd"));
					        $("#acceptUser").html(result[i].taskLocalVariables.certUser);
					        $("#acceptNumber").html(acceptNumber);
					        
						}
					}
					$("#processStatus").html(processStatus);
					if(itemId==""){
						itemId=result[0].processVariables.applicationClass;
					}
					
				}
				queryItemInfo(itemId);
			},
			error:function(jqXHR, textStatus, errorThrown){
				mini.alert(jqXHR.responseText);
			}
	    });
    	//getHistoryTasksByCondition({instanceId: processInstanceId});
    	
    }

	/**
	* 查询事项部门信息
	*/
	function queryItemInfo(itemId) {
        $.ajax({
            url: "${webProperties['app.url.commProcess']}/entrance/commShiXiangInfo.htm",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            type: 'POST',
            data: {
                itemId: itemId
            },
            async: false,
            success: function (data) {
            	//console.log(data);
            	var dataObj = mini.decode(data);
            	itemObj = dataObj;
            	if(dataObj!=null){
            		if (dataObj.approvingAuth != null && typeof(dataObj.approvingAuth) != "undefined")
                		$("#approvingAuth").html(dataObj.approvingAuth);
            	}
            	
            },
            error: function (jqXHR, textStatus, errorThrown) {
                mini.alert(jqXHR.responseText);
            }
        });
    }
	
	/**
	* 查询历史任务集合
	*/
	var taskDefinitionKey;
	var auditTime;
	function getHistoryTasksByCondition(paramObj){
		var sortCondition = {};
		sortCondition.orderByTaskCreateTime = "desc";
		paramObj.sortCondition = sortCondition;
		$.ajax({
	       	url: "${webProperties['app.url.businessApproval']}/businessApproval/getHistoryTasksByCondition.htm",
			type: 'post',
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data:{data:mini.encode(paramObj)},
			success:function(data){
				var dataObj = mini.decode(data);
				var result = dataObj.data;
				taskDefinitionKey = result[0].taskDefinitionKey;
				
				
				var arr = [];
				for(var i=0;i<result.length;i++){
					if(result[i].endTime != "" && result[i].endTime != null){
						arr.push(result[i]);
					}
				}
				var datagrid1 = mini.get("datagrid1");
				datagrid1.setData(arr);
				
				
			},
			error:function(jqXHR, textStatus, errorThrown){
				mini.alert(jqXHR.responseText);
			}
	    });
	}
	
	/**
	* 调用制证接口
	*/
	function vehicleOperCert(){
		$.ajax({
	       	url: "${webProperties['app.url.approval']}/approvalProcess/vehicleOperCert.htm",
			type: 'post',
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data:{acceptNumber:acceptNumber,api:api},
			success:function(data){
				//mini.alert("流程推动成功");
				mini.hideMessageBox(messageid2);
			},
			error:function(jqXHR, textStatus, errorThrown){
				mini.hideMessageBox(messageid2);
				mini.alert(jqXHR.responseText);
			}
	    });
	}
	
	/**
	* 查询委托管理单位信息
	*/
	var trusteeObj = {};
	function queryTrustteeList(enterpriseId){
		$.ajax({
	       	url: "${webProperties['app.url.approval']}/taxiIndividualBusiness/queryTrusteeList.htm",
			type: 'get',
			async:false,
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data:{enterpriseId:enterpriseId},
			success:function(data){
				trusteeObj = mini.decode(data)[0];
				mini.get("enterpriseNumberNew").setValue(trusteeObj.trusteeCode);
				var maxCode = trusteeObj.maxCode;
				if(maxCode == null || maxCode == "null"){
					maxCode = "0";
				}
				maxCode = parseInt(maxCode);
				var messageTip = "请输入首字母为" + trusteeObj.trusteeCode + "，后三位数字大于" + PrefixInteger(maxCode, 3) + "的值";
				jQuery("#messageTip_span_id").text(messageTip);
			},
			error:function(jqXHR, textStatus, errorThrown){
				mini.alert(jqXHR.responseText);
			}
	    });
	}
	
	/**
	* 校验企业编号是否存在
	*/
	function checkCompanyNumber(companyNumber){
		var returnResult = false;
		$.ajax({
	       	url: "${webProperties['app.url.commProcess']}/entrance/commYeHuListForBase.htm",
			type: 'get',
			async:false,
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data:{baseNumber:companyNumber},
			success:function(data){
				var result = mini.decode(data);
				var arr = result.data;
				if(arr.length > 0){
					returnResult = true;
				}else{
					returnResult = false;
				}
				//mini.alert("流程推动成功");
			},
			error:function(jqXHR, textStatus, errorThrown){
				mini.alert(jqXHR.responseText);
			}
	    });
		return returnResult;
	}
	
	/**
	* 企业企业编号校验
	*/
	function onCheckCompanyNumber(){
		var result = true;
		var value = mini.get("enterpriseNumberNew").getValue();
		//企业编号正则
		var patt1=new RegExp("[0-9]{4}");
		var isCompNumberExist = false;
		if(businessObj.enterpriseNumber){
			isCompNumberExist = false;
		} else{
			isCompNumberExist = checkCompanyNumber(value);
		}
		if(value == "" || value == null){
			mini.alert("请填写企业编号");
			result = false;
		}else if(value.length != 4 ){
			mini.alert("企业编号必须4位");
			result = false;
		}else if(!patt1.test(value)){
			mini.alert("企业编号只能输入数字");
			result = false;
		}else if(isCompNumberExist){
			mini.alert("该企业编号已经存在");
			result = false;
		}
		
		return result;
	}
	
	/**
	* 有效年限、有效期校验
	*/
	function onCheckValidity(){
		var result = true;
		
		// 有效年限
		//var termValidityValue = mini.get("termValidity").getValue();
		//var patt = new RegExp("^[0-9]*[1-9][0-9]*$");
		// 有效期
		var validityPeriodValue = mini.get("validityPeriod").getValue();
		// 有效期
		if(validityPeriodValue == "" || validityPeriodValue == null) {
			mini.alert("请填写有效期");
			result = false;
		}
		
		return result;
	}
	/**
	* 流程状态字符转换
	*/
	function onRenderProcessStatus(e){
		console.log(e.record);
	    if ("appResult" in e.record.taskLocalVariables) {
			if ("1" == e.record.taskLocalVariables.appResult) {
				if ("usertask1" == e.record.taskDefinitionKey) {
					return "受理";
				}else {
					return "通过";
				}
			} else {
				if ("usertask1" == e.record.taskDefinitionKey) {
					return "不予受理";
				}else {
					return "不通过";
				}
			}
		} else {
			return "已办理";
		}
	}

	/**
	* 流程历史点击事件
	*/
	var messageId;
	function onRowClickProcessHis(e){
		mini.hideMessageBox(messageId);
		if("appOpinion" in e.record.taskLocalVariables){
			messageId = mini.showMessageBox({
	            showModal: false,
	            title: "审批意见",
	            iconCls: "",
	            message: e.record.taskLocalVariables.appOpinion,
	            html: "<div class=\"audit-opinion\">" + e.record.taskLocalVariables.appOpinion + "</div>",
	            width: 400,
	            height: 150
	        });
		}
	}
	
	/**
	 * 获取文件信息
	 */
	 var fileInfo = {};
	 function getFileInfo(paramObj){
		 $.ajax({
	       	url: "${webProperties['app.url.commProcess']}/commAttInfo/queryAttInfoListForTable.htm",
			type: 'post',
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data:paramObj,
			success:function(data){
				var fileArr = mini.decode(data);
				var arr = [];
				for(var i=0;i<fileArr.length;i++){
					if("99" == fileArr[i].attCl && fileArr[i].attCd != null){
						fileInfo = fileArr[i];
						var obj = {};
						obj.attCd = fileInfo.attCd;
						obj.attOrigNm = fileInfo.attOrigNm;
						obj.attVeh = fileInfo.attVeh;
						obj.bizCd = fileInfo.bizCd;
						obj.bizSn = fileInfo.bizSn;
						obj.attNm = fileInfo.attNm;
						arr.push(obj);
					}
				}
				var datagrid2 = mini.get("datagrid2");
				datagrid2.setData(arr);
				console.log(arr);
				
			},
			error:function(jqXHR, textStatus, errorThrown){
				mini.alert(jqXHR.responseText);
			}
	    });
	 }
	 
	 function preview(){
		 var datagrid2 = mini.get("datagrid2");
		 var row = datagrid2.getSelected();
		 if(row){
			 Comm_Tool.preview(row.attCd, row.attVeh);
		 }
	 }
	 
	 /**
	 * 有效年限改变事件
	 */
	 function onTermValidity(e) {
		 var patt = new RegExp("^[0-9]*[1-9][0-9]*$");
		 if(!patt.test(e.value)){
			 mini.alert("有效年限只能输入正整数");
			 return false;
		 }
		 
		 var value = parseInt(e.value);
		 setValidityPeriod(value);
	 }
	 
	 function setValidityPeriod(value){
		 var year = parseInt(value);
		 var t = new Date(parseInt(auditTime));
		 t.setFullYear(t.getFullYear () + year);
		 t.setMonth(11);
	     t.setDate(31);
		 mini.get("validityPeriod").setValue(t);
	 }
	 
	 function onRenderAction(){
		 return '<a href="javascript:preview()">预览</a>';
	 }
	
	function onRenderHandleTime(e){
		var endTime = new Date(parseInt(e.value));
		return mini.formatDate(endTime,'yyyy-MM-dd') + "<br/>" + mini.formatDate(endTime,'HH:mm:ss');
	}
	
	function onRenderHandleUser(e) {
		var userName = e.value;
		return "<div class=\"text-overflow-ellipsis\" title=\"" + userName + "\">" + userName + "</div>"
	}
	
	//获取url中的请求参数
	function getRequestString(key){
	    var reg = new RegExp("(^|&)"+key+"=([^&]*)(&|$)");
	    var result = window.location.search.substr(1).match(reg);
	    return result?decodeURIComponent(result[2]):null;
	}
	
	//数字前面补0
	function PrefixInteger(num, length) {  
 		return (Array(length).join('0') + num).slice(-length); 
	}
	
	function closeWindow(){
		if (window.CloseOwnerWindow)
			return window.CloseOwnerWindow();
		else
			window.close();
	}
</script>
</body>
</html>
