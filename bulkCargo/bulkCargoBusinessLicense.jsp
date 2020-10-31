<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>超限车速公路备案信息</title>
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
    <div id="tabs1" class="mini-tabs" activeIndex="0" style="width:100%;height:100%;" plain="false" buttons="#tabsButtons" buttonsAlign="right">
        <div title="申请信息" >
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
                         <i class="icon-book-open font-green-sharp"></i> <span class="caption-subject font-green-sharp bold uppercase">超限车辆运营企业信息</span>
                     </div>
                 </div>
                <form id="formEnData" method="post">
	                <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
	                    <tr>
	                        <td style="width:130px;" align="right">备案证号：</td>
	                        <td style="width:50%">
	                            <input id="recordNumber" name="recordNumber" class="mini-textbox asLabel" style="width:96%;" readOnly="true" />
	                        </td>
	                        <td style="width:130px;" align="right">备案证期限：</td>
	                        <td style="width:50%">
	                            <input id="recordTerm" name="recordTerm" class="mini-textbox  asLabel" style="width:98%;" readOnly="true" />
	                        </td>
	                    <tr>
	                    <tr>
	                        <td style="width:130px;" align="right">工商执照号：</td>
	                        <td style="width:50%">
	                            <input id="licenseNumber" name="licenseNumber" class="mini-textbox asLabel" style="width:96%;" readOnly="true" valueField="typeCd" />
	                        </td>
	                        <td style="width:130px;" align="right">单位名称：</td>
	                        <td style="width:100%" >
	                            <input id="enterpriseName" name="enterpriseName" class="mini-textbox  asLabel" style="width:98%;" readOnly="true" />
	                        </td>
	                    <tr>
	                    <tr>
	                        <td style="width:130px;" align="right">注册地址：</td>
	                        <td style="width:50%">
	                            <input id="enterpriseAddress" name="enterpriseAddress" class="mini-textbox  asLabel" style="width:96%;" readOnly="true" />
	                        </td>
	                        <td style="width:130px;" align="right">企业经济性质：</td>
	                        <td style="width:50%">
	                            <input class="mini-combobox asLabel" url="${webProperties['app.url.businessApproval']}/bulkCargo/getCommConfDatByClcd.htm?clcd=Enterprise_Nature"
	                                        textField="typeNm" valueField="typeCd"
	                                         id="enterpriseNature" name="enterpriseNature" style="width:98%;" readOnly="true" />
	                        </td>
	                    </tr>
	                    <tr>
	                        <td style="width:130px;" align="right">业户类型：</td>
	                        <td style="width:100%" colspan="3">
	                            <label></label> <input class="mini-combobox asLabel" url="${webProperties['app.url.businessApproval']}/bulkCargo/getCommConfDatByClcd.htm?clcd=Enterprise_type"
	                                        textField="typeNm" valueField="typeCd"
	                                         id="enterpriseType" name="enterpriseType" style="width:99%;" readOnly="true" />
	                        </td>
	                    </tr>
	                    <tr>
	                        <td style="width:130px;" align="right">法定代表人：</td>
	                        <td style="width:50%" >
	                            <input id="legalRepresentative" name="legalRepresentative" class="mini-textbox asLabel" style="width:96%;" readOnly="true" vtype="maxLength:20" readOnly="true" />
	                        </td>
	                        <td style="width:130px;" align="right">联系电话：</td>
	                        <td style="width:50%" >
	                            <input id="tel" name="tel" class="mini-textbox asLabel" readOnly="true" style="width:98%;" />
	                        </td>
	                    <tr>
	                    <tr>
	                        <td style="width:130px;" align="right">邮编：</td>
	                        <td style="width:50%" colspan="3">
	                            <input id="postalCode" name="postalCode" class="mini-textbox asLabel" style="width:99%;" readOnly="true" />
	                        </td>
	                    </tr>
	                    <tr>
	                        <td style="width:130px;" align="right">备注：</td>
	                        <td style="width:100%" colspan="3">
	                            <input id="remarks" name="remarks" class="mini-textarea asLabel" style="width: 99%;height:60px;" readOnly="true" />
	                        </td>
	                    </tr>
	                </table>
	           </form>
                <div class="portlet-title">
                     <div class="caption">
                         <i class="icon-book-open font-green-sharp"></i> <span class="caption-subject font-green-sharp bold uppercase">超限运输流程信息</span>
                     </div>
                 </div>
	            <form id="formOvData" method="post">
	                <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
	                    <tr>
	                        <td style="width:130px;" align="right">名称：</td>
	                        <td style="width:50%">
	                            <input id="name" name="name" class="mini-textbox asLabel" style="width:96%;" readOnly="true" />
	                        </td>
	                        <td style="width:130px;" align="right">单位组织机构代码：</td>
	                        <td style="width:50%">
	                            <input id="orgCode" name="orgCode" class="mini-textbox  asLabel" style="width:98%;" readOnly="true" />
	                        </td>
	                    <tr>
	                    <tr>
	                        <td style="width:130px;" align="right">事项：</td>
	                        <td style="width:50%">
	                            <input id="matter" name="matter" class="mini-textbox asLabel" style="width:96%;" readOnly="true" />
	                        </td>
	                        <td style="width:130px;" align="right">开始日期：</td>
	                        <td style="width:100%" >
	                             <input class="mini-datepicker asLabel" id="dateStart" name="dateStart" style="width:98%;" readOnly="true" />
	                        </td>
	                    <tr>
	                    <tr>
	                        <td style="width:130px;" align="right">结束日期：</td>
	                        <td style="width:50%">
	                            <input class="mini-datepicker asLabel" id="dateEnd" name="dateEnd" required="true" style="width:96%;" readOnly="true" />
	                        </td>
	                        <td style="width:130px;" align="right">超限运输行驶路线：</td>
	                        <td style="width:100%" >
	                            <input class="mini-textarea asLabel" id="route" name="route" style="width:98%;" readOnly="true" />
	                        </td>
	                    <tr>
	                    <tr>
	                        <td style="width:130px;" align="right">车辆及装载情况：</td>
	                        <td style="width:100%" >
	                            <input class="mini-textarea asLabel" id="loadingCondition" name="loadingCondition" style="width:96%;" readOnly="true" />
	                        </td>
	                        <td style="width:130px;" align="right">补充说明：</td>
	                        <td style="width:50%">
	                            <input class="mini-textarea asLabel" id="additionalExplanation" name="additionalExplanation" style="width:98%;" readOnly="true" />
	                        </td>
	                    <tr>
	                    <tr>
	                        <td style="width:130px;" align="right">运输单位：</td>
	                        <td style="width:100%" >
	                            <input class="mini-textarea asLabel" id="transportUnit" name="transportUnit" style="width:96%;" readOnly="true" />
	                        </td>
	                        <td style="width:130px;" align="right">联系人：</td>
	                        <td style="width:50%">
	                            <input id="contacts" name="contacts" class="mini-textbox  asLabel" style="width:98%;" readOnly="true" />
	                        </td>
	                    <tr>
	                    <tr>
	                        <td style="width:130px;" align="right">电话：</td>
	                        <td style="width:100%" >
	                            <input id="contactsTel" name="contactsTel" class="mini-textbox  asLabel" style="width:96%;" readOnly="true" />
	                        </td>
	                        <td style="width:130px;" align="right">申请日期：</td>
	                        <td style="width:50%">
	                            <input class="mini-datepicker asLabel" id=applicationDate name="applicationDate" style="width:98%;" readOnly="true" />
	                        </td>
	                    <tr>
	                    <tr>
	                        <td style="width:130px;" align="right">备注：</td>
	                        <td style="width:100%" colspan="3">
	                            <input id="remarks" name="remarks" class="mini-textarea asLabel" style="width: 99%;height:60px;" readOnly="true" />
	                        </td>
	                    </tr>
	                </table>
	           </form>
	           <div class="portlet-title">
                   <div class="caption">
                       <i class="icon-book-open font-green-sharp"></i> <span class="caption-subject font-green-sharp bold uppercase">超限车辆登记信息</span>
                   </div>
               </div>
	           <form id="formVeData" method="post">
                    <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
                        <tr>
                            <td style="width:130px;" align="right">车牌号码：</td>
                            <td style="width:50%">
                                <input id="vehiclelicense" name="vehiclelicense" class="mini-textbox asLabel" style="width:96%;" readOnly="true" />
                            </td>
                            <td style="width:130px;" align="right">车牌颜色：</td>
                            <td style="width:50%">
                                <input class="mini-combobox asLabel" url="${webProperties['app.url.businessApproval']}/bulkCargo/getCommConfDatByClcd.htm?clcd=LICENSESUBJECT"
                                            textField="typeNm" valueField="typeCd"
                                             id="licensesubject" name="licensesubject" style="width:98%;" readOnly="true" />
                            </td>
                        <tr>
                        <tr>
                            <td style="width:130px;" align="right">货物名称：</td>
                            <td style="width:100%" colspan="3">
                                <input id="goodsName" name="goodsName" class="mini-textbox asLabel" style="width:99%;" readOnly="true" />
                            </td>
                        <tr>
                        <tr>
                            <td style="width:130px;" align="right">货物总重量(吨)：</td>
                            <td style="width:100%" >
                                <input class="mini-textbox asLabel" id="goodsWeight" name="goodsWeight" style="width:96%;" readOnly="true" />
                            </td>
                            <td style="width:130px;" align="right">载后长度(毫米)：</td>
                            <td style="width:50%">
                                <input id="bodyLength" name="bodyLength" class="mini-textbox asLabel" style="width:98%;" readOnly="true" />
                            </td>
                        <tr>
                        <tr>
                            <td style="width:130px;" align="right">载后宽度(毫米)：</td>
                            <td style="width:100%" >
                                <input class="mini-textbox asLabel" id="bodyWidth" name="bodyWidth" style="width:96%;" readOnly="true" />
                            </td>
                            <td style="width:130px;" align="right">载后高度(毫米)：</td>
                            <td style="width:100%" >
                                <input class="mini-textbox asLabel" id="bodyHeight" name="bodyHeight" style="width:98%;" readOnly="true" />
                            </td>
                        <tr>
                        <tr>
                            <td style="width:130px;" align="right">备注：</td>
                            <td style="width:100%" colspan="3">
                                <input id="remarks" name="remarks" class="mini-textarea asLabel" style="width: 99%;height:60px;" readOnly="true" />
                            </td>
                        </tr>
                    </table>
               </form>
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
    new mini.Form("formOvData").setEnabled(false);
    new mini.Form("formEnData").setEnabled(false);
    new mini.Form("formVeData").setEnabled(false);

    /********************lg********************/
    var mainId = parent.acceptNumber;
    $.ajax({
        url: "${webProperties['app.url.businessApproval']}/bulkCargo/getRecRoadOverrunByMainId.htm?_=" + Math.random() + "&mainId=" + mainId,
        contentType: "application/json;charset=utf-8",
        type: "GET",
        success: function(result) {
            var o = mini.decode(result);
            o[0].dateStart = mini.parseDate(new Date(o[0].dateStart));
            o[0].dateEnd = mini.parseDate(new Date(o[0].dateEnd));
            o[0].applicationDate = mini.parseDate(new Date(o[0].applicationDate));
            var ovForm = new mini.Form("formOvData");
            ovForm.setData(o[0]);
            $.ajax({
                url: "${webProperties['app.url.businessApproval']}/bulkCargo/getRecRoadOverrunEnterpriseByEnterpriseId.htm?_=" + Math.random() + "&enterpriseId=" + o[0].enterpriseId,
                contentType: "application/json;charset=utf-8",
                type: "GET",
                success: function(result) {
                    var o = mini.decode(result);
                    var enForm = new mini.Form("formEnData");
                    enForm.setData(o[0]);
                }
            });
            $.ajax({
                url: "${webProperties['app.url.businessApproval']}/bulkCargo/getRecRoadOverruVehicleByRoadOverruId.htm?_=" + Math.random() + "&roadOverruId=" + o[0].id,
                contentType: "application/json;charset=utf-8",
                type: "GET",
                success: function(result) {
                    var o = mini.decode(result);
                    var veForm = new mini.Form("formVeData");
                    veForm.setData(o[0]);
                }
            });
        }
    });
    /********************lg********************/
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
</script>
</body>
</html>
