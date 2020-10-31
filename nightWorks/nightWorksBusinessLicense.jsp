<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>夜间施工备案</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
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
        .asLabel .mini-textboxlist-border {
            border: 0;
            background: #f3f0f0;
            cursor: default;
        }

        .asLabel .mini-buttonedit-button,
        .asLabel .mini-textboxlist-close {
            display: none;
        }

        .asLabel .mini-textboxlist-item {
            padding-right: 8px;
        }

        .mini-tabs-buttons {
            padding-right: 30px;
        }

    </style>
</head>
<body>
<div class="mini-fit">
    <div id="tabs1" class="mini-tabs" activeIndex="0" style="width:100%;height:100%;" plain="false"
         buttons="#tabsButtons" buttonsAlign="right">
        <div title="申请信息">
            <%--隐藏域--%>
        <form id="applyDataForm" method="post">
            <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
		    <tr>
				<td style="width:130px;" align="right" >受理编号：</td>
				<td style="width:100%" colspan="2">
					<input id="acceptNumber"  name="acceptNumber" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>
				</td>
			</tr>
			<tr>
				
				<td style="width:130px;" align="right" >项目名称：</td>
				<td style="width:100%" colspan="2">
					<input id="projectName"  name="projectName" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>
				</td>
			</tr>
			 <tr>
				<td style="width:130px;" align="right" >办理事项：</td>
				<td style="width:100%" colspan="2">
					<input id="applicationClassName"  name="applicationClassName" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>
				</td>
			</tr>
		    <tr>
		        <td style="width:130px;" align="right">申请人：</td>
		        <td style="width:50%" colspan="2">
		            <input id=createUser name="createUser" class="mini-textbox asLabel" style="width:96%;" readOnly="true" />
		        </td>
		       
		    </tr>
		    <tr>
		        <td style="width:130px;" align="right">申请时间：</td>
		        <td style="width:50%" colspan="2">
		            <input id=createTime name="createTime" class="mini-textbox asLabel" style="width:96%;" readOnly="true" />
		        </td>
		       
		    </tr>
		    <tr>
		        <td style="width:130px;" align="right">联系人：</td>
		        <td style="width:50%" colspan="2">
		            <input id="contact" name="contact" class="mini-textbox asLabel" style="width:96%;" readOnly="true" />
		        </td>
		       
		    </tr>
		    <tr>
		        <td style="width:130px;" align="right">联系电话：</td>
		        <td style="width:50%" colspan="2">
		            <input id="contactTel" name="contactTel" class="mini-textbox  asLabel" style="width:96%;" readOnly="true" value=""/>
		        </td>
		    </tr>
		     <tr>
		        <td >&nbsp;</td>
		        <td >&nbsp;</td>
		        <td >&nbsp;</td>
		    </tr>
		  </table>
		  </form>
        </div>
        <div title="业务信息" style="display: none">
                  <div class="portlet light bordered project-list" style="margin-bottom: 20px;">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-book-open font-green-sharp"></i> <span class="caption-subject font-green-sharp bold uppercase">夜间施工备案信息</span>
                        </div>
                    </div>
           <form id="formEnData" method="post">
            <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
		    <tr>
				<td style="width:130px;" align="right" >工程名称：</td>
				<td style="width:100%">
					<input id="projectName"  name="projectName" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>
				</td>
				<td style="width:130px;" align="right" >工程地址：</td>
				<td style="width:100%">
					<input id="projectAddr" name="projectAddr" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>
				</td>
			</tr>
		    <tr>
		        <td style="width:130px;" align="right">施工道路：</td>
		        <td style="width:50%">
		            <input id="projectRoad" name="projectRoad" class="mini-textbox asLabel" style="width:96%;" readOnly="true" />
		        </td>
		        <td style="width:130px;" align="right">施工方名称：</td>
		        <td style="width:50%">
		            <input id="workerName" name="workerName" class="mini-textbox  asLabel" style="width:96%;" readOnly="true" value=""/>
		        </td>
		    </tr>
		    
		    <tr id = "comInfoTr1">
		        <td style="width:130px;" align="right">工程审批单位：</td>
				<td style="width:100%" colspan="6">
					<!-- <input id="companyEconomyType1" name="companyEconomyType1" class="mini-combobox asLabel" readOnly="true" valueField="typeCd" textField="typeNm" style="width:96%;" value="2"
					 url="http://122.144.195.126:18001/commProcess-app/commConfInfo/getListByClCd.htm?clCd=taxiEcoType"/>
				 -->
				 <input id="dispatch" name="dispatch" class="mini-textbox  asLabel" style="width:96%;" readOnly="true" value=""/>
				 </td>
				 
		    </tr>
		    <tr>
		    <td style="width:130px;" align="right">工程所处路段(起止点)：</td>
		        <td style="width:50%" colspan="6">
		            <input id="projectRoadStart" name="projectRoadStart" class="mini-textbox asLabel" style="width:47%;"  value=""  readOnly="true"/>
		            <lable>&nbsp;到</lable>
		            <input id="projectRoadEnd" name="projectRoadEnd" class="mini-textbox  asLabel" style="width:47%;" readOnly="true" value=""/>
		        </td>
		    </tr>
		     <tr id = "comInfoTr2">
		     	<td style="width:130px;" align="right">施工方联系人：</td>
		        <td style="width:50%">
		            <input id="workerLinkMan" name="workerLinkMan" class="mini-textbox  asLabel" style="width:96%;" readOnly="true" value=""/>
		        </td>
		    	<td style="width:130px;" align="right">施工方联系人电话：</td>
		    	<td style="width:50%" >
		            <input id="workerTel" name="workerTel" class="mini-textbox  asLabel" style="width:96%;" readOnly="true" value=""/>
		        </td>
		    </tr>
		    <tr id = "comInfoTr3">
		     	<td style="width:130px;" align="right">施工方联系人手机：</td>
		        <td style="width:50%">
		            <input id="workerMobile" name="workerMobile" class="mini-textbox  asLabel" style="width:96%;" readOnly="true" value=""/>
		        </td>
		    	<td style="width:130px;" align="right">施工设备名称型号：</td>
		    	<td style="width:5s0%" >
		            <input id="equipmentDesc" name="equipmentDesc" class="mini-textbox  asLabel" style="width:96%;" readOnly="true" value=""/>
		        </td>
		    </tr>
		    <tr>
		    	<td style="width:130px;" align="right">拟采取防噪降噪措施：</td>
		    	<td style="width:100%" colspan="6">
		            <input id="measuresDesc" name="measuresDesc" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>
		        </td>
		        
		        
		    </tr>
		    <tr>
		        <td style="width:50px;" align="right">施工开始时间：</td>
		    	<td style="width:100%" >
		            <input id="startdate" name="startdate" class="mini-datepicker  asLabel" style="width:96%;" readOnly="true" value=""/>
		        </td>
		        <td style="width:50px;" align="right">施工结束时间：</td>
		    	<td style="width:100%" >
		            <input id="enddate" name="enddate" class="mini-datepicker  asLabel" style="width:96%;" readOnly="true" value=""/>
		        </td>
		    </tr>
		    <tr>
		    <td style="width:130px;" align="right">施工时间段：</td>
		        <td style="width:100%" colspan="6">
		            <lable>&nbsp;每晚夜间&nbsp;</lable>
		            <input id="beginTime" name="beginTime" class="mini-textbox asLabel" style="width:30%;"  value=""  readOnly="true"/>
		            <lable>&nbsp;点至次日凌晨</lable>
		            <input id="endTime" name="endTime" class="mini-textbox  asLabel" style="width:30%;" readOnly="true" value=""/>
		            <lable>&nbsp;止</lable>
		        </td>
		    </tr>
		   
		        </table>
               </form>
            </div>
            <div class="portlet light bordered project-list">
                <div class="portlet-title">
                     <div class="caption">
                         <i class="icon-book-open font-green-sharp"></i> <span class="caption-subject font-green-sharp bold uppercase">夜间施工业务信息</span>
                     </div>
                 </div>
                 <form id="formOvData" method="post"> 
             <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
		    <tr>
				<td style="width:130px;" align="right" >建设单位名称：</td>
				<td style="width:50%">
					<input id="companyName"  name="companyName" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>
				</td>
				<td style="width:130px;" align="right" >建设单位联系人：</td>
				<td style="width:50%">
					<input id="linkMan" name="linkMan" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>
				</td>
			</tr>
		    <tr>
		        <td style="width:130px;" align="right">建设单位联系人电话：</td>
		        <td style="width:50%">
		            <input id="linkTel" name="linkTel" class="mini-textbox asLabel" style="width:96%;" readOnly="true" />
		        </td>
		        <td style="width:130px;" align="right">建设单位联系人手机：</td>
		        <td style="width:50%">
		            <input id="linkMobile" name="linkMobile" class="mini-textbox  asLabel" style="width:96%;" readOnly="true" value=""/>
		        </td>
		    </tr>
		        </table>
             </form>
             <div class="portlet-title">
                     <div class="caption">
                         <i class="icon-book-open font-green-sharp"></i> <span class="caption-subject font-green-sharp bold uppercase">夜间施工详细信息</span>
                     </div>
                     <form id="formVeData" method="post"> 
                 <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
		    <tr>
				<td style="width:130px;" align="right" >细项类型：</td>
				<td style="width:50%">
					<input id="detailType"  name="detailType" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>
				</td>
				<td style="width:130px;" align="right" >细项名称：</td>
				<td style="width:50%">
					<input id="detailName" name="detailName" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>
				</td>
			</tr>
		    <tr>
		        <td style="width:130px;" align="right">工作量：</td>
		        
		        <td style="width:100%" colspan="3">
		            <input id="quantity" name="quantity" class="mini-textbox asLabel" style="width:60%;" readOnly="true" />
		            <lable>&nbsp;(万元/平方量m2)</lable>
		        </td>
		    </tr>
		        </table>
                 </form>
                 </div>
                <!--END 基础信息-->
            </div>
        </div>
        <div title="申请材料" style="display: none">
            <iframe id="fileupload" src="${webProperties['app.url.commProcess']}/entrance/commFileListPage.htm"
                    frameborder="0" scrolling="no" marginheight="0" marginwidth="0" height="100%" width="100%"></iframe>
        </div>
        <div name="book" title="法律文书" visible="false">
            <div id="datagrid" class="mini-datagrid"
                 url="${webProperties['app.url.approval']}/commCertificate/getCommCertificateList.htm"
                 style="width:auto;height:auto;" idField="id" allowSortColumn="true" sizeList="[10,20,30]"
                 pageSize="10" onloaderror="mini.alert(e.errorMsg);" showPager='false'>
                <div property="columns">
                    <div type="indexcolumn" align="center" headerAlign="center">序号</div>
                    <div field="wsbh" align="center" visible='false' width='80' headerAlign="center">文书编号</div>
                    <div field="wsname" align="center" width='80' headerAlign="center">文书名称</div>
                    <div field="printstatus" align="center" visible='false' width='80' headerAlign="center">打印状态</div>
                    <div field="printstatusmc" align="center" width='80' headerAlign="center">打印状态</div>
                    <div field="cz" align="center" width="80" headerAlign="center">操作</div>
                </div>
            </div>
        </div>

        <%@ include file="/WEB-INF/jsp/include/tab.jsp" %>
    </div>
</div>
<script type="text/javascript">
    mini.parse();
    var mainId = parent.acceptNumber;
    //var mainId="138202190327140072";
    
    $.ajax({
        url: "${webProperties['app.url.businessApproval']}/nightWorks/getRecNightWorksProcessList.htm?_=" + Math.random() + "&mainId=" + mainId,
        contentType: "application/json;charset=utf-8",
        type: "GET",
        success: function(result) {
            var o = mini.decode(result);
            var enForm = new mini.Form("formEnData");
            o[0].startdate = mini.parseDate(new Date(o[0].startdate));
            o[0].enddate = mini.parseDate(new Date(o[0].enddate));
            enForm.setData(o[0]);
            enForm.setEnabled(false);
            
            $.ajax({
                url: "${webProperties['app.url.businessApproval']}/nightWorks/getRecNightWorksCompanyList.htm?_=" + Math.random() + "&id=" + o[0].enterPriseId,
                contentType: "application/json;charset=utf-8",
                type: "GET",
                success: function(result) {
                    var o = mini.decode(result);
                    console.log(o);
                    var ovForm = new mini.Form("formOvData");
                    ovForm.setData(o[0]);
                    ovForm.setEnabled(false);
                }
            });
            
            $.ajax({
                url: "${webProperties['app.url.businessApproval']}/nightWorks/getRecNightWorksDetailList.htm?_=" + Math.random() + "&projectId=" + o[0].projectId,
                contentType: "application/json;charset=utf-8",
                type: "GET",
                success: function(result) {
                    var o = mini.decode(result);
                    if(o[0]["detailType"]="1"){
                    	o[0]["detailType"]="市政高架及轨道交通 ";
                    }else if(o[0]["detailType"]="2"){
                    	o[0]["detailType"]="城市道路  ";
                    }else if(o[0]["detailType"]=="3"){
                    	o[0]["detailType"]="管线工程";
                    }
                    var veForm = new mini.Form("formVeData");
                    console.log(o);
                    veForm.setData(o[0]);
                    veForm.setEnabled(false);
                }
            });
            
            
        }
    });
    /********************121********************/
    $(document).ready(function(){
    	getApply();
	});
    
	function getApply(){
		 var applyForm = new mini.Form("applyDataForm");
		 //debugger;
		 
		 var applyData={};

		 applyData.acceptNumber=parent.acceptNumber;
		 applyData.applicationClassName=parent.applicationClassName;
		 applyData.createTime =parent.createTime;
		 applyData.createUser=parent.createUser;
		 applyData.contact=parent.contact;
		 applyData.contactTel=parent.contactTel;
		 applyData.projectName=parent.projectName;
		 
		 applyForm.setData(applyData);
    }
	function getLocalTime(nS) {     
		   return new Date(parseInt(nS) * 1000).toLocaleString().replace(/:\d{1,2}$/,' ');     
	}
</script>
</body>
</html>
