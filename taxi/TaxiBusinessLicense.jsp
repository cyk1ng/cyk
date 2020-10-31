<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="cn.seisys.iti.pdd.auth.entity.UserInfo" %>
<%@ page import="cn.seisys.iti.pdd.auth.util.ShiroUtils" %>
<%@ page isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>巡游出租汽车客运服务企业经营许可</title>
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
.mini-grid-rows-view{
	overflow-x:hidden;
}
</style>
</head>
<body>
	<div class="mini-fit">
		<div id="tabs1" class="mini-tabs" activeIndex="0" style="width:100%;height:102%;" plain="false" buttons="#tabsButtons" buttonsAlign="right">
		    <div title="申请信息" >
		    	<form id="form" method="post">
		    		<input id="applicationClass" name="applicationClass" class="mini-hidden" value=""/>
		    		<input id="ownerId" name="ownerId" class="mini-hidden" value=""/>
		    		<input id="id" name="id" class="mini-hidden" value=""/>
		    		<input id="enterpriseNumber" name="enterpriseNumber" class="mini-hidden" value=""/>
		    		<table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
					    <tr style="height: 1px;">
					        <td style="width:90px;" align="right"></td>
					        <td style="width:50%;">
					        </td>
					        <td style="width:90px;" align="right"></td>
					        <td style="width:50%;">
					        </td>
					    </tr>
					    <tr id="acceptNumber_tr_id" style="display:none;">
					        <td style="width:90px;" align="right">受理编号：</td>
					        <td style="width:100%;" colspan="3">
					            <input id="acceptNumber" name="acceptNumber" class="mini-textbox asLabel" style="width:98%;" readOnly="true" value=""/>
					        </td>
					    </tr>
					    <tr>
					        <td style="width:90px;" align="right">申请日期：</td>
					        <td style="width:50%;">
					            <input id="applyDate" name="applyDate" class="mini-datepicker asLabel" style="width:96%;" readOnly="true" value="" format="yyyy-MM-dd" />
					        </td>
					        <td style="width:90px;" align="right">申请人：</td>
					        <td style="width:50%;">
					            <input id="applyName"  name="applyName" class="mini-textbox" style="width:96%;"  value=""  onvalidation="onNotEmptyValidation" onblur="onBlurCompanyName" required="true"/><span style="color: red;">*</span>
					        </td>
					    </tr>
					    <tr>
					        <td style="width:90px;" align="right">业户类型：</td>
					        <td style="width:50%;">
					        	<input id="companyEconomyType" name="companyEconomyType" class="mini-combobox  asLabel" readonly="true" url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=taxiEcoType"
					        	textField="typeNm" valueField="typeCd" require="true"  style="width:96%;" value="2" onitemclick="onItemClickCompanyEconomyType1"/><span style="color: red;">*</span>
					        </td>
					        <td style="width:90px;" align="right">法定代表人：</td>
					        <td style="width:50%;">
					            <input id="applyLegal" name="applyLegal" class="mini-textbox" style="width:96%;"  value="" onblur="onBlurCorporateRepresentative" require="true"/>
					        </td>
					    </tr>
					    <tr>
					    	<td style="width:90px;" align="right">注册地址：</td>
					    	<td style="width:100%;" colspan="3">
					            <input id="registerAddress" name="registerAddress" class="mini-textbox" required="true" style="width:98%;" value="" onblur="onBlurCompanyRegisterAddress"/><span style="color: red;">*</span>
					        </td>
					    </tr>
					    <tr>
					    	<td style="width:90px;" align="right">项目名称：</td>
					    	<td style="width:100%;" colspan="3">
					            <input id="projectname" name="projectname" class="mini-textbox asLabel" style="width:98%;" readOnly="true" value=""/>
					        </td>
					    </tr>
					    <tr>
					        <td style="width:90px;" align="right">联系人：</td>
					        <td style="width:50%;">
					            <input id="contact" name="contact" class="mini-textbox" style="width:96%;" vtype="maxLength:20"/>
					        </td>
					        <td style="width:90px;" align="right">联系电话：</td>
					        <td style="width:50%;">
					            <input name="contactNumber" id="contactNumber" class="mini-textbox" style="width:96%;" onvalidation="onTelValidation" maxLength="15"/>
					        </td>
					    </tr>

					    <tr>
					    	<td style="width:90px;" align="right">委托代理人：</td>
					    	<td style="width:100%;" colspan="3">
					            <input name="agent" class="mini-textbox" style="width:98%;" vtype="maxLength:20"/>
					        </td>
					    </tr>

					    <tr>
					       	<td style="width:90px;" align="right">申请情况说明：</td>
					       	<td style="width:100%;" colspan="3">
								<input name="applyDesc" class="mini-textarea" style="width: 98%;height:130px;" />
							</td>
				       	</tr>

					</table>
		       </form>
		    </div>
		    <div title="业务信息" >
		    	<h3 class="font-16">业户信息</h3>
		    	<hr/>
		    	<form id="form1">
			      <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
				    <tr>
				        <td style="width:130px;" align="right">单位名称：</td>
				        <td style="width:50%">
				            <input id="companyName" name="companyName" class="mini-textbox asLabel" readonly="true" style="width:96%;" required="true" />
				        </td>
				        <td style="width:130px;" align="right">业户类型：</td>
				        <td style="width:50%">
				            <input  name="companyEconomyType" class="mini-combobox asLabel" readonly="true" style="width:96%;" url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=taxiEcoType"
					        	textField="typeNm" valueField="typeCd" required="true"   value="2"/>
				        </td>
				    </tr>
				    <tr>
				        <td style="width:130px;" align="right">经营范围：</td>
                         <td style="width:50%">
                             <input id="businessScope" name="businessScope" multiSelect="true"  class="mini-combobox asLabel" readOnly="true" valueField="code" textField="value" data="[{code:'21000',value:'出租'}]" value="21000" style="width:96%;" />
                         </td>
				    	<td style="width:130px;" align="right">经济类型：</td>
				        <td style="width:50%">
				            <input id="companyEconomyType1" name="companyEconomyType1" class="mini-combobox" style="width:96%;" url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?pclCd=taxiEcoType&ptypeCd=2"
					        	textField="typeNm" valueField="typeCd" required="true" value="150"/>
				        </td>
				    </tr>
					<tr>
						<td style="width:130px;" align="right">法定代表人：</td>
						<td style="width:50%">
							<input id="corporateRepresentative" name="corporateRepresentative" readonly="true" class="mini-textbox asLabel"  style="width:96%;" />
						</td>
						<td style="width:130px;" align="right">法定代表人电话：</td>
						<td style="width:50%">
							<input id="representativeTel" name="representativeTel" class="mini-textbox" style="width:96%;" onvalidation="onTelValidation" maxLength="15" />
						</td>
					</tr>
					<tr>
						<td style="width:130px;" align="right">法人代表身份证：</td>
						<td style="width:50%">
							<input id="representativeIdCard" name="representativeIdCard"  class="mini-textbox" style="width: 96%;"  vtype="maxLength:18"   onvalidation="onIDCardsValidation" />
						</td>
						<td style="width:130px;" align="right">投诉电话：</td>
						<td style="width:50%">
							<input id="complaintsTel" name="complaintsTel"  class="mini-textbox" style="width: 96%;"  maxLength="15"   onvalidation="onTelValidation" />
						</td>
					</tr>
				    <tr>
						<td style="width:130px;" align="right">经营地所在区县：</td>
						<td style="width:50%">
							<input id="districtsCounties" name="districtsCounties" class="mini-combobox" style="width:96%;" url="${webProperties['app.url.ppm-cm-app']}/ppm/cm/district/getDistrictDvolList.data"
								   textField="districtName" valueField="districtId" emptyText="请选择..."/>
						</td>
				        <td style="width:130px;" align="right">注册地所在区县：</td>
				        <td style="width:50%">
				            <input id="registrationLocation" name="registrationLocation" class="mini-combobox" style="width:96%;" url="${webProperties['app.url.ppm-cm-app']}/ppm/cm/district/getDistrictDvolList.data"
					        	textField="districtName" valueField="districtId" emptyText="请选择..." />
				        </td>
				    </tr>
				    <tr>
				        <td style="width:130px;" align="right">经营地址：</td>
				        <td style="width:50%">
				            <input id="operatingAddress" name="operatingAddress" class="mini-textbox" style="width:96%;" />
				        </td>
				        <td style="width:130px;" align="right">注册地址：</td>
				        <td style="width:50%" >
				            <input id="companyRegisterAddress" name="companyRegisterAddress" class="mini-textbox asLabel" readonly="true" style="width:96%;" required="true" />
				        </td>
				        
				    </tr>
				    <tr>
				        <td style="width:130px;" align="right">经营地址邮编：</td>
				        <td style="width:50%">
				            <input id="postcode" name="postcode" class="mini-textbox" onvalidation="onPostCodeValidation" style="width:96%;" />
				        </td>
				        <td style="width:130px;" align="right">注册地邮编：</td>
				        <td style="width:50%">
				            <input id="registrationPostalcode" name="registrationPostalcode" class="mini-textbox" onvalidation="onPostCodeValidation" style="width:96%;" />
				        </td>
				        
				    </tr>
				    <tr>
                        <td style="width:130px;" align="right">投资方：</td>
				        <td style="width:50%">
				            <input name="investor" class="mini-textbox" style="width:96%;" />
				        </td>
                        <td style="width:130px;" align="right">注册电话：</td>
				        <td style="width:50%">
				            <input id="registrationTel" name="registrationTel" class="mini-textbox" style="width:96%;" onvalidation="onTelValidation" maxLength="15" />
				        </td>
                     </tr>
				    <tr>
				        <td style="width:130px;" align="right">联系人：</td>
				        <td style="width:50%">
				            <input name="companyContact" class="mini-textbox" style="width:96%;" />
				        </td>
				        <td style="width:130px;" align="right">联系电话：</td>
				        <td style="width:50%">
				            <input id="companyTel" name="companyTel" class="mini-textbox" style="width:96%;" onvalidation="onTelValidation" maxLength="15"/>
				        </td>
				    </tr>
				    <tr>
				        <td style="width:130px;" align="right">运输性质：</td>
				        <td style="width:50%">
				            <input id="transportNature" name="transportNature" class="mini-combobox" style="width:96%;" url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=taxiTransNat"
				            textField="typeNm" valueField="typeCd" showNullItem="false" onload="onLoadTransportName"/>
				        </td>
				    </tr>
				    <tr id="openingDate_tr_id" style="display: none;">
				        <td style="width:130px;" align="right">开业日期：</td>
				        <td style="width:50%">
				            <input name="openingDate" class="mini-datepicker" style="width:96%;" format="yyyy-MM-dd" />
				        </td>
				    </tr>
				    
				</table>
		       <h3 class="font-16">工商税务信息</h3>
		    	<hr/>
			      <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
				    <tr>
				        <td style="width:130px;" align="right">工商登记号：</td>
				        <td style="width:50%">
				            <input name="registrationNumber" class="mini-textbox" style="width:96%;" vtype="int;minLength:13;" maxLength="15"/>
				        </td>
				        <td style="width:130px;" align="right">税务登记号：</td>
				        <td style="width:50%">
				            <input name="taxRegistrationNumber" class="mini-textbox" style="width:96%;" vtype="int;rangeLength:15,18;" maxLength="18"/>
				        </td>
				    </tr>
				    <tr>
						<td style="width:130px;" align="right">工商登记号核发日期：</td>
						<td style="width:50%">
							<input name="industrialIssuanceDate" class="mini-datepicker" style="width:96%;" format="yyyy-MM-dd" />
						</td>
						<td style="width:130px;" align="right">国税登记号核发日期：</td>
						<td style="width:50%">
							<input name="taxIssuanceDate" class="mini-datepicker" style="width:96%;" format="yyyy-MM-dd"/>
						</td>
				    </tr>
					<tr>
						 <td style="width:130px;" align="right">注册资金人民币：</td>
						 <td style="width:50%">
							<input name="registrationCapital" class="mini-textbox" style="width:90%;" vtype="range:0,10000000"/> 万
						 </td>
						 <td style="width:130px;" align="right">注册资金美金：</td>
						 <td style="width:50%">
							<input name="registrationUsCapital" class="mini-textbox" style="width:90%;" vtype="range:0,10000000"/> 万
						 </td>
					  </tr>
				</table>

		       <h3 class="font-16">额度信息</h3>
                <hr/>
                <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
                    <tr>
                    	<td style="width:100px;" align="right">总额度：</td>
                        <td style="width:25%;">
                            <input id="totalQuota" class="mini-spinner asLabel" readonly="true" style="width:96%;" maxValue="99999" />
                        </td>
                        <td style="width:100px;" align="right">小型车：</td>
                        <td style="width:25%;">
                            <input id="miniCarQuota" name="miniCarQuota" class="mini-spinner" style="width:96%;" maxValue="9999" onvaluechanged="onQuotaValueChange"/>
                        </td>
                        <td style="width:100px;" align="right">中型车：</td>
                        <td style="width:25%;">
                            <input id="mediumCarQuota" name="mediumCarQuota" class="mini-spinner" style="width:96%;" maxValue="9999" onvaluechanged="onQuotaValueChange"/>
                        </td>
                        <td style="width:100px;" align="right">大型车：</td>
                        <td style="width:25%;">
                            <input id="largeCarQuota" name="largeCarQuota" class="mini-spinner" style="width:96%;" maxValue="9999" onvaluechanged="onQuotaValueChange"/>
                        </td>
                    </tr>
                </table>
                </form>
		    </div>
		    <div title="申请材料">
                <iframe id="fileupload" src="${webProperties['app.url.commProcess']}/entrance/commFileListPage.htm" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" height="100%" width="100%" ></iframe>
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
			<!-- <a id="toggleBtn1" class="mini-button" iconCls="" onclick="javascript:void(0)">补正</a> -->
			<a id="toggleBtn1" class="mini-button" iconCls="" onclick="acceptTaxiBusiness()">受理</a>
			<a id="toggleBtn2" class="mini-button" iconCls="" onclick="noacceptTaxiBusiness()">不予受理</a>
		    <a id="toggleBtn3" class="mini-button" iconCls="" onclick="saveTaxiBusiness()">保存</a>
		    <a id="toggleBtn4" class="mini-button" iconCls="" onclick="reset()">重置</a>
		</div>
	</div>
<script type="text/javascript">
	mini.parse();
	<%UserInfo userinfo = ShiroUtils.getUserInfo(request);%>
	var user = '<%=userinfo.getUsername()%>';
	var userId = '<%=userinfo.getUserid()%>';
	var userGroupName = '<%=userinfo.getOrgName()%>';
	var userTaskId = "usertask26";
	var model = getRequestString("model");
	//var formType = ${formType};
	//获取url中的请求参数
	function getRequestString(key){
	    var reg = new RegExp("(^|&)"+key+"=([^&]*)(&|$)");
	    var result = window.location.search.substr(1).match(reg);
	    return result?decodeURIComponent(result[2]):null;
	}
    var type = getRequestString("type");
    var applyNumber;
	$(document).ready(function(){
		//mini.parse();
		if("view" == model){
			labelModel("form");
			labelModel("form1");
			$("#acceptNumber_tr_id").show();
			$("#tabsButtons").hide();
		}else{
			window.parent.setHangYe("","","1","2");
		}

        if (type == "1") {
            //创建申请 号
            getSq();
        }

        //判断隐藏上传和收证补证
//         if (type != "1" && type != "4") {
//             $("#fileupload").load(function () {
//                 $("#fileupload")[0].contentWindow.setUploadDis();
//                 $("#fileupload")[0].contentWindow.shouJianBuZhen();
//             })
//         }

		var id = getRequestString("id");
		if(id != "" && id != null){
			mini.get("id").setValue(id);
			$("#fileupload").load(function(){
				queryTaxiBusinessLicense({id:id});
            })
		}else{
			var curDate = new Date();
			var strCurDate = mini.formatDate(curDate,'yyyy-MM-dd HH:mm:ss');
			mini.get("applyDate").setValue(curDate);
		}

		var acceptNumber = getRequestString("acceptNumber");
		if("" != acceptNumber && null != acceptNumber){
			$("#fileupload").load(function(){
				queryTaxiBusinessLicense({acceptNumber:acceptNumber});
            })
		}else{
            $("#fileupload").load(function(){
                $("#fileupload")[0].contentWindow.getList(window.parent.itemId);
            })
			// getList(window.parent.itemId);
			mini.get("projectname").setValue(window.parent.itemObj.name);
			mini.get("applicationClass").setValue(window.parent.itemId);
		}

		getApprovalType({});
	});


    //获取申请号
    //type    01 :窗口  02:网申
    function getSq() {
        $.ajax({
            url: "${webProperties['app.url.commProcess']}/entrance/getAcceptNumber.htm",
            type: 'get',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: {itemId: window.parent.itemId, type: '01'},
            async: false,
            success: function (data) {
                //截取字符串
                applyNumber = data.substring(1, (data.length - 1));
            },
            error: function (jqXHR, textStatus, errorThrown) {
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
	* 保存
	*/
	function saveTaxiBusiness(){
		var businessObj = {};
		var form = new mini.Form("form");
		var form1 = new mini.Form("form1");
		var obj = form.getData();
		var obj1 = form1.getData();

		jQuery.extend(businessObj,obj,obj1);

		businessObj.formType = window.parent.itemId;
		businessObj.projectnameSix = window.parent.itemId;
		businessObj.applyMaterials = getApplicationMaterials();

		form.validate();
		if(form.isValid() == false){
			mini.alert("有输入数据不符合规范，请重新填写");
			return;
		}

		form1.validate();
		if(form1.isValid() == false){
			mini.alert("有输入数据不符合规范，请重新填写");
			return;
		}
        //申请号码
        businessObj.applyNumber = applyNumber;
		if(businessObj.applyDate){
			businessObj.applyDate = mini.formatDate(businessObj.applyDate,"yyyy-MM-dd HH:mm:ss");
		}
		if(businessObj.industrialIssuanceDate){
			businessObj.industrialIssuanceDate = mini.formatDate(businessObj.industrialIssuanceDate,"yyyy-MM-dd HH:mm:ss");
		}
		if(businessObj.openingDate){
			businessObj.openingDate = mini.formatDate(businessObj.openingDate,"yyyy-MM-dd HH:mm:ss");
		}
		if(businessObj.taxIssuanceDate){
			businessObj.taxIssuanceDate = mini.formatDate(businessObj.taxIssuanceDate,"yyyy-MM-dd HH:mm:ss");
		}
		businessObj.overTime = window.parent.itemObj.approveTime;
		mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: '保存中...'
        });
		$.ajax({
	       	url: "${webProperties['app.url.approval']}/taxi/saveTaxiBusinessLicense.htm",
			type: 'post',
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data:{data:mini.encode(businessObj)},
			success:function(data){
				mini.unmask(document.body);
				mini.alert("保存成功！");
			},
			error:function(jqXHR, textStatus, errorThrown){
				mini.unmask(document.body);
				mini.alert(jqXHR.responseText);
			}
	    });
	}

	/**
	* 更改业务信息编辑模式
	*/
	function updateBusinessModel(){
		var form = new mini.Form("form1");
		var names = "companyName,enterpriseNumber,companyEconomyType1,corporateRepresentative,companyRegisterAddress,"
					+"businessScope,miniCarQuota,mediumCarQuota,largeCarQuota";
		var fields = form.getFields();
        for (var i = 0, l = fields.length; i < l; i++) {
            var c = fields[i];
            if(names.indexOf(c.getName()) < 0){
            	if (c.setReadOnly) c.setReadOnly(false);
            	if (c.removeCls) c.removeCls("asLabel");
            }
        }
	}

	/**
	* 更改额度编辑模式
	*/
	function updateCarQuotaModel(){
		var idArr = ["miniCarQuota","mediumCarQuota","largeCarQuota"];
		for(var i=0;i<idArr.length;i++){
			if (mini.get(idArr[i]).setReadOnly) mini.get(idArr[i]).setReadOnly(false);
        	if (mini.get(idArr[i]).removeCls) mini.get(idArr[i]).removeCls("asLabel");
		}

	}

	/**
	* 更新业务信息
	*/
	function updateBusinessInfo(){
		var form1 = new mini.Form("form1");
		// 校验输入值
		form1.validate();
		if (!form1.isValid()) {
			// 输入值有误，弹出警告框
			mini.alert("输入数据不符合规范，请重新填写");
			return false;
		}
		var form1Data = form1.getData();
		jQuery.extend(businessObj,form1Data);
		
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
        
		var updateResult = false;
		// 更新业务数据
		$.ajax({
	       	url: "${webProperties['app.url.approval']}/taxi/updateBusinessInfo.htm",
			type: 'post',
			async: false,
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data:{data:mini.encode(businessObj)},
			success:function(data){
				// 更新成功，通知父页面
				updateResult = true;
			},
			error:function(jqXHR, textStatus, errorThrown){
				// 发生异常，弹出警告框
				mini.alert(jqXHR.responseText);
				updateResult = false;
			}
	    });
		return updateResult;
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
				if("2" == type){
					var curTask = result[result.length-1].taskDefinitionKey;
					param.nodeTaskid = curTask;
					if("usertask3" == curTask || "usertask11" == curTask){
						updateBusinessModel();
					}
					if("usertask16" == curTask){
						updateCarQuotaModel();
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
				param.acceptNumber = businessObj.acceptNumber;
				getLayerBook(param);
				//var curTaskObj = result[result.length-1];

			},
			error:function(jqXHR, textStatus, errorThrown){
				mini.alert(jqXHR.responseText);
			}
	    });
	}

	function acceptTaxi(){
		var form = new mini.Form("form");
		var obj = form.getData();
		var form1 = new mini.Form("form1");
		var obj1 = form1.getData();

		var searchObj = {};
		searchObj.isFinished = "0"
		var arr = [];
		var param1 = {};
		//param1.conditionKey = "name";
		//param1.conditionValue =
		//searchObj.variableValueEquals
	}

	//获取申请材料数据
	function getApplicationMaterials(){
        $("#fileupload")[0].contentWindow.getFileInfo(applyNumber);
        var fileInfo = $("#fileupload")[0].contentWindow.fileInfo;

        var fileArr = [];
        for (var i = 0; i < fileInfo.length; i++) {
            var fileObj = {};
            fileObj.materialCode = fileInfo[i].id;
            fileObj.materialName = fileInfo[i].fileName;
            fileObj.getFileCount = fileInfo[i].shoudao;
            fileArr.push(fileObj);
        }
        var key = window.parent.itemId + "_" + window.parent.itemId;
        var obj = {};
        obj[key] = fileArr;

        return obj;
	}

	/**
	* 获取法律文书
	*/
	function getLayerBook(paramObj){
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


	//这两个全局变量必须定义，打印需要用到
	var acceptNumber;
	var processInstanceId;
	/**
	* 打印预览
	*/
	function toPrint(attcd,wsbh,nodeTaskid,subitemid) {
        var param={};
        var url ="${webProperties['app.url.approval']}/commCertificate/openPdfFileView.htm";
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
	* 受理
	*/
	function acceptTaxiBusiness(){

		var form = new mini.Form("form");
		var obj = form.getData();
		var form1 = new mini.Form("form1");
		var obj1 = form1.getData();
		form.validate();
		if(form.isValid() == false){
			mini.alert("输入数据不符合规范，请重新填写");
			return;
		}

		form1.validate();
		if(form1.isValid() == false){
			mini.alert("输入数据不符合规范，请重新填写");
			return;
		}
		 mini.confirm("是否确定受理？", "提示",function(action){
			 if(action == "ok"){
				 	var businessObj = {};

					jQuery.extend(businessObj,obj,obj1);
					businessObj.certUser = user;
					businessObj.certId = userId;
					businessObj.formType = window.parent.itemId;
					businessObj.projectnameSix = window.parent.itemId;
					businessObj.certOrgName = userGroupName;
					var approvingAuth = window.parent.itemObj.approvingAuth;
					businessObj.applyType = approvalMap[approvingAuth];
                     //申请号码
                    businessObj.applyNumber = applyNumber;
					businessObj.applyMaterials = getApplicationMaterials();
					businessObj.overTime = window.parent.itemObj.approveTime;
					if(businessObj.applyDate){
						businessObj.applyDate = mini.formatDate(businessObj.applyDate,"yyyy-MM-dd HH:mm:ss");
					}
					if(businessObj.industrialIssuanceDate){
						businessObj.industrialIssuanceDate = mini.formatDate(businessObj.industrialIssuanceDate,"yyyy-MM-dd HH:mm:ss");
					}
					if(businessObj.openingDate){
						businessObj.openingDate = mini.formatDate(businessObj.openingDate,"yyyy-MM-dd HH:mm:ss");
					}
					if(businessObj.taxIssuanceDate){
						businessObj.taxIssuanceDate = mini.formatDate(businessObj.taxIssuanceDate,"yyyy-MM-dd HH:mm:ss");
					}
					//businessObj.applyType = "1";
                    //查询是否有重复受理情况
                    getProcessInstanceByCondition(businessObj);

			 }else{
				 return;
			 }
		 })

	}

	function noacceptTaxiBusiness(){

		var form = new mini.Form("form");
		var obj = form.getData();
		var form1 = new mini.Form("form1");
		var obj1 = form1.getData();

		form.validate();
		if(form.isValid() == false){
			mini.alert("有输入数据不符合规范，请重新填写");
			return;
		}

		form1.validate();
		if(form1.isValid() == false){
			mini.alert("有输入数据不符合规范，请重新填写");
			return;
		}

		mini.confirm("是否确定不予受理？", "提示",function(action){
			if(action == "ok"){
				var businessObj = {};

				jQuery.extend(businessObj,obj,obj1);
				businessObj.certUser = user;
				businessObj.certId = userId;
				businessObj.formType = window.parent.itemId;
				businessObj.projectnameSix = window.parent.itemId;
				businessObj.certOrgName = userGroupName;
                //申请号码
                businessObj.applyNumber = applyNumber;
				businessObj.applyMaterials = getApplicationMaterials();
				var approvingAuth = window.parent.itemObj.approvingAuth;
				if(businessObj.applyDate){
					businessObj.applyDate = mini.formatDate(businessObj.applyDate,"yyyy-MM-dd HH:mm:ss");
				}
				if(businessObj.industrialIssuanceDate){
					businessObj.industrialIssuanceDate = mini.formatDate(businessObj.industrialIssuanceDate,"yyyy-MM-dd HH:mm:ss");
				}
				if(businessObj.openingDate){
					businessObj.openingDate = mini.formatDate(businessObj.openingDate,"yyyy-MM-dd HH:mm:ss");
				}
				if(businessObj.taxIssuanceDate){
					businessObj.taxIssuanceDate = mini.formatDate(businessObj.taxIssuanceDate,"yyyy-MM-dd HH:mm:ss");
				}
				//businessObj.applyType = approvalMap[approvingAuth];
				//businessObj.applyType = "1";
				mini.mask({
		            el: document.body,
		            cls: 'mini-mask-loading',
		            html: '处理中...'
		        });
				$.ajax({
			       	url: "${webProperties['app.url.approval']}/taxi/noacceptTaxiBusinessLicense.htm",
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
							getCurrentImg({instanceId:dataObj.processInstanceId});

							acceptNumber = dataObj.acceptNumber;
							processInstanceId = dataObj.processInstanceId;

							var paramObj = {};
							paramObj.subitemid = businessObj.projectnameSix;
							paramObj.nodeTaskid = userTaskId;
							paramObj.acceptNumber = dataObj.acceptNumber;
							getLayerBook(paramObj);

                            $("#fileupload")[0].contentWindow.setCeckDis();
                            $("#fileupload")[0].contentWindow.setUploadDis();
                            $("#fileupload")[0].contentWindow.shouJianBuZhen();
							//queryTaxiBusinessLicense(dataObj.acceptNumber);
						}
						labelModel("form");
						labelModel("form1");
						mini.alert("不予受理成功!");
						mini.get("tabs1").activeTab(mini.get("tabs1").getTab(3));
					},
					error:function(jqXHR, textStatus, errorThrown){
						mini.unmask(document.body);
						mini.alert(jqXHR.responseText);
					}
			    });
			}else{
				return;
			}
		});
	}

	/**
	 *
	 * 提交受理
	 * */
	function submitData(businessObj) {
		mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: '受理中...'
        });
        $.ajax({
            url: "${webProperties['app.url.approval']}/taxi/acceptTaxiBusinessLicense.htm",
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
                    getCurrentImg({instanceId:dataObj.processInstanceId});

                    acceptNumber = dataObj.acceptNumber;
                    processInstanceId = dataObj.processInstanceId;
                    //queryTaxiBusinessLicense(dataObj.acceptNumber);

                    //getHistoryTasksByCondition({instanceId:dataObj.processInstanceId});

                    var paramObj = {};
                    paramObj.subitemid = businessObj.projectnameSix;
                    paramObj.nodeTaskid = userTaskId;
                    paramObj.acceptNumber = dataObj.acceptNumber;
                    getLayerBook(paramObj);
                }
                labelModel("form");
                labelModel("form1");
                mini.alert("受理成功!");
                mini.get("tabs1").activeTab(mini.get("tabs1").getTab(3));
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

	/**
	* 查询信息
	*/
	var businessObj = {};
	function queryTaxiBusinessLicense(businessSearchObj){

		$.ajax({
	       	url: "${webProperties['app.url.approval']}/taxi/queryTaxiBusinessLicense.htm",
			type: 'post',
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data:{data:mini.encode(businessSearchObj)},
			success:function(data){
				var result = mini.decode(data);
				var dataObj = result.data[0];
				businessObj = dataObj;

                applyNumber = dataObj.applyNumber;

				setTaxiBusinessData(dataObj);
				
				var totalQuota = parseInt(dataObj.miniCarQuota) + parseInt(dataObj.mediumCarQuota) + parseInt(dataObj.largeCarQuota);
				mini.get("totalQuota").setValue(totalQuota);
				
				var type = getRequestString("type");

                if (type == "4" && model == "edit") {
                    window.parent.setComInfo(dataObj.applyName);
                }
				if("1" != type && "4" != type){
					getHistoryTasksByCondition({instanceId:window.parent.processInstanceId},dataObj);
				}
				if(businessObj.openingDate){
					$("#openingDate_tr_id").show();
				}

			},
			error:function(jqXHR, textStatus, errorThrown){
				mini.alert(jqXHR.responseText);
			}
	    });
	}

	/**
	* 查询企业是否有未完成申请
     *
	*/
	function getProcessInstanceByCondition(businessObj){
		var obj = {};
		//是否完成
		obj.isFinished = "0";

		var arr1 = [];
		var obj1 = {};
		obj1.conditionKey = "name";
        obj1.conditionValue = businessObj.applyName;
        arr1.push(obj1);

		//事项类型
        var obj2 = {};
        obj2.conditionKey = "form_type";
        obj2.conditionValue = businessObj.projectnameSix;
        arr1.push(obj2);

        //根据企业id和事项类型来查询是否有流程未完成
		var filterCondition = {variableValueEquals:arr1};

		obj.filterCondition = filterCondition;
		//map1.variableValueEquals
		$.ajax({
	       	url: "${webProperties['app.url.approval']}/common/getProcessInstanceByCondition.htm",
			type: 'post',
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data:{data:mini.encode(obj)},
			success:function(data){
                var dataObj = mini.decode(data);
                if (dataObj.data.length>0) {
                    mini.alert("该企业正在受理中,请勿重复受理")
                }else {
                    submitData(businessObj)
				}
            },
			error:function(jqXHR, textStatus, errorThrown){
				mini.alert(jqXHR.responseText);
			}
	    });
	}

	function setTaxiBusinessData(obj){

		var form1 = new mini.Form("form1");
		var form = new mini.Form("form");
		form1.setData(obj);
		form.setData(obj);

            $("#fileupload")[0].contentWindow.getList(obj.projectnameSix);

		var key = obj.applicationClass + "_" + obj.projectnameSix;
		var applyMaterials = obj.applyMaterials[key];

		if (applyMaterials != null && typeof(applyMaterials) != "undefined") {
			var fileArr = [];
			for (var i = 0; i < applyMaterials.length; i++) {
	            var params = {};
	            params.id = applyMaterials[i].materialCode;
	            params.fileName = applyMaterials[i].materialName;
	            params.shoudao = applyMaterials[i].getFileCount;
	            fileArr.push(params);
	        }

	        var number = "";
	        if (type == "4") {
	            number = obj.applyNumber
	        } else {
	            number = obj.acceptNumber
	        }

	            $("#fileupload")[0].contentWindow.setFileInfo(fileArr,number);
		}

	}

	function test(){
		var form = new mini.Form("form");
		form.validate();
	}

	 function reset() {
		 mini.confirm("是否确定重置？", "提示",function(action){
			 if(action == "ok"){
				 new mini.Form("form").reset();
			     new mini.Form("form1").reset();
			     mini.get("projectname").setValue(window.parent.itemObj.name);
				 mini.get("applicationClass").setValue(window.parent.itemId);
				 mini.get("applyDate").setValue(new Date());

				//申请信息恢复
				mini.get("applyName").setReadOnly(false);
				mini.get("applyName").removeCls("asLabel");

				// mini.get("companyEconomyType").setReadOnly(false);
				// mini.get("companyEconomyType").removeCls("asLabel");

				mini.get("applyLegal").setReadOnly(false);
				mini.get("applyLegal").removeCls("asLabel");

				mini.get("registerAddress").setReadOnly(false);
				mini.get("registerAddress").removeCls("asLabel");

                var transportNatureData=mini.get("transportNature").getData();
                if(transportNatureData.length>0){
                    mini.get("transportNature").select(0);
                }
				//重置企业信息
                 window.parent.setNone();
                //重置材料列表
                 $("#fileupload")[0].contentWindow.setCeckNoChe();
			     $("#fileupload")[0].contentWindow.getList(window.parent.itemId);
			 }else{
				 return;
			 }
		 });


       // mini.get("projectname").setValue(window.parent.itemObj.name);
        //mini.get("applyDate").setValue(new Date());
     }

	/**
	* 设置企业信息
	*/
	function setCompanyData(comInfo){
	    var result=false;
        $.ajax({
            url: "${webProperties['app.url.commProcess']}/entrance/commYeHuListForBase.htm",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            type: 'POST',
            data: {
                comName: comInfo.b_cnname,
                type: type
            },
            async: false,
            success: function (data) {
                var dataObj = mini.decode(data);
                var obj = dataObj.data;
                if (obj.length>0){
                    for (var i=0;i<obj.length;i++){
                        var scopecode=obj[i].scopecode;
                        if (scopecode=="21000"){
                            window.parent.setNone();
                            mini.alert("该企业不能办理该业务，请重新选择企业");
                            result=true;
                        }
                    }
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                mini.alert(jqXHR.responseText);
                result=true;
            }
        });

        if (result){
            return ;
        }

		// if("21000" == comInfo.scopecode){
		// 	mini.alert("该企业不能办理该业务，请重新选择企业");
		// 	return -1;
		// }
		mini.get("applyName").setValue(comInfo.b_cnname);
		mini.get("companyEconomyType").setValue(comInfo.b_manageclass);
		mini.get("applyLegal").setValue(comInfo.b_legalperson);
		mini.get("registerAddress").setValue(comInfo.b_registeredaddress);
		mini.get("ownerId").setValue(comInfo.b_enterpriseId);

		mini.get("companyName").setValue(comInfo.b_cnname);
		mini.get("corporateRepresentative").setValue(comInfo.b_legalperson);
		mini.get("representativeTel").setValue(comInfo.b_legalpersonphone);
		mini.get("registrationLocation").setValue(comInfo.b_registereddistrict);
		mini.get("companyRegisterAddress").setValue(comInfo.b_registeredaddress);
		mini.get("registrationPostalcode").setValue(comInfo.b_registeredpostalcode);
		mini.get("companyEconomyType1").setValue(comInfo.b_economictype);
		mini.get("operatingAddress").setValue(comInfo.operateaddress);
		mini.get("postcode").setValue(comInfo.operatepostalcode);
		mini.get("enterpriseNumber").setValue(comInfo.taxiBaseNumber);
        //经营地所在区县
        mini.get("districtsCounties").setValue(comInfo.operatedistrict);
		//申请信息变只读
		mini.get("applyName").setReadOnly(true);
		mini.get("applyName").addCls("asLabel");

		mini.get("companyEconomyType").setReadOnly(true);
		mini.get("companyEconomyType").addCls("asLabel");

		mini.get("applyLegal").setReadOnly(true);
		mini.get("applyLegal").addCls("asLabel");

		mini.get("registerAddress").setReadOnly(true);
		mini.get("registerAddress").addCls("asLabel");

	}
    //获取企业名称
    function getApplyName() {
        var contact = mini.get("contact").getValue();
        var contactNumber = mini.get("contactNumber").getValue();
        var projectname = mini.get("projectname").getValue();
        var applyName = mini.get("applyName").getValue();
        var itemId = window.parent.itemId;

        var param = {};
        param["contact"] = contact;
        param["contactTel"] = contactNumber;
        param["projectname"] = projectname;
        param["applyName"] = applyName;
        param["itemId"] = itemId;

        return param;
    }
    
    /**
    * 额度信息改变事件
    */
    function onQuotaValueChange(e){
    	var miniCarQuota = parseInt(mini.get("miniCarQuota").getValue());
    	var mediumCarQuota = parseInt(mini.get("mediumCarQuota").getValue());
    	var largeCarQuota = parseInt(mini.get("largeCarQuota").getValue());
    	
    	mini.get("totalQuota").setValue(miniCarQuota + mediumCarQuota + largeCarQuota);
    }

	function onButtonEdit(e) {
	    //alert("弹出选择");
	}

	//单位名称
	function onBlurCompanyName(e){
		mini.get("companyName").setValue(e.sender.value);
	}

	//注册地址
	function onBlurCompanyRegisterAddress(e){
		mini.get("companyRegisterAddress").setValue(e.sender.value);
	}

	//法人代表
	function onBlurCorporateRepresentative(e){
		mini.get("corporateRepresentative").setValue(e.sender.value);
	}

	function onItemClickCompanyEconomyType1(e){
		mini.get("companyEconomyType1").setValue(e.sender.value);
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
    function onNotEmptyValidation(e) {
        var reg =/\s/;
        if (e.isValid) {
           if (reg.test(e.value)){
               e.errorText = "字符间不能包含空格";
               e.isValid = false;
           }
        }
    }
	/**
	* 身份证校验
	*/
	function onIDCardsValidation(e) {
        // 1 "验证通过!", 0 //校验不通过
        var format = /^(([1][1-5])|([2][1-3])|([3][1-7])|([4][1-6])|([5][0-4])|([6][1-5])|([7][1])|([8][1-2]))\d{4}(([1][9]\d{2})|([2]\d{3}))(([0][1-9])|([1][0-2]))(([0][1-9])|([1-2][0-9])|([3][0-1]))\d{3}[0-9xX]$/;

        if(e.value != "" && e.value != null){
	        if(e.value.length < 18){
	        	e.errorText = "身份证号码不合规";
	            e.isValid = false;
	            return;
	        }
	        //号码规则校验
	        if(!format.test(e.value)){
	            e.errorText = "身份证号码不合规";
	            e.isValid = false;
	            return;
	        }
	        //区位码校验
	        //出生年月日校验   前正则限制起始年份为1900;
	        var year = e.value.substr(6,4),//身份证年
	            month = e.value.substr(10,2),//身份证月
	            date = e.value.substr(12,2),//身份证日
	            time = Date.parse(month+'-'+date+'-'+year),//身份证日期时间戳date
	            now_time = Date.parse(new Date()),//当前时间戳
	            dates = (new Date(year,month,0)).getDate();//身份证当月天数
	        if(time>now_time||date>dates){
	            e.errorText = "出生日期不合规";
	            e.isValid = false;
	            return;
	        }
	        //校验码判断
	        var c = new Array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2);   //系数
	        var b = new Array('1','0','X','9','8','7','6','5','4','3','2');  //校验码对照表
	        var id_array = e.value.split("");
	        var sum = 0;
	        for(var k=0;k<17;k++){
	            sum+=parseInt(id_array[k])*parseInt(c[k]);
	        }
	        if(id_array[17].toUpperCase() != b[sum%11].toUpperCase()){
	            e.errorText = "身份证校验码不合规";
	            e.isValid = false;
	            return;
	        }
        }
    }

	/**
	* 邮编校验
	*/
    function onPostCodeValidation(e) {
        if (e.isValid) {
            if (e.value) {
                var reg = /^[0-9]{6}$/;
                if (reg.test(e.value)) {
                    e.isValid = true;
                } else {
                    e.errorText = "邮政编码格式有误，请重输";
                    e.isValid = false;
                }
            }
        }
    }

	/**
	* 工商登记号校验
	*/
	function onIcRegistration(e){
        if (e.isValid) {
            if(e.value){
                var reg = /\d{13,15}/;
                if(reg.test(e.value)){
                    e.isValid = true;
                }else{
                    e.errorText = "工商登记号格式有误，请重输";
                    e.isValid = false;
                }
            }
        }
	}

	/**
	* 税务登记号校验
	*/
	function onTaxRegistration(e){
        if (e.isValid) {
            if (e.value) {
                var reg = /\d{15,18}/;
                if (reg.test(e.value)) {
                    e.isValid = true;
                } else {
                    e.errorText = "工商登记号格式有误，请重输";
                    e.isValid = false;
                }
            }
        }
	}

	/**
	* 营运性质加载完成回调函数
	*/
	function onLoadTransportName(param) {
		if (param.data != null && param.data.length > 0) {
			mini.get("transportNature").select(0);
		}
	}

</script>
</body>
</html>
