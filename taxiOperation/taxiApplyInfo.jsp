<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--BEGIN 申请信息-->
<form id="form" method="post">
<input id="applicationClass" name="applicationClass" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.applicationClass}"/>
<input id="id" name="id" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.id}"/>
<input id="companyName" name="companyName" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.companyName}"/>
<input id="enterpriseNumber" name="enterpriseNumber" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.enterpriseNumber}"/>
<input id="ownerId" name="ownerId" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.ownerId}"/>
<input id="overTime" name="overTime" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.overTime}"/>
<input id="formType" name="formType" style="display:none" class="mini-textbox asLabel" value="${formType}"/>
<input id="projectnameSix" name="projectnameSix" style="display:none" class="mini-textbox asLabel" value="${projectnameSix}"/>
<input id="type" style="display:none" class="mini-textbox asLabel" value="${type}"/>
<input id="miniCarQuota" name="miniCarQuota" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.miniCarQuota}"/>
<input id="largeCarQuota" name="largeCarQuota" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.largeCarQuota}"/>
<input id="mediumCarQuota" name="mediumCarQuota" name="mediumCarQuota" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.mediumCarQuota}"/>
<input id="applyNumber" name="applyNumber" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.applyNumber }"/>
<input id="companyEconomyType" name="companyEconomyType" style="display:none" class="mini-textbox asLabel" value="${taxiBussinessEntity.companyEconomyType }"/>
  		<table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
		<tr id="applyNmTr" style="display: none">
			<td style="width: 130px;" align="right">受理编号：</td>
			<td style="width: 100%"><input id="acceptNumber" class="mini-textbox asLabel" style="width: 96%;" readOnly="true" value="" /></td>
			<td style="width: 130px;" align="right">处理结果：</td>
			<td style="width: 100%"><input id="result"  class="mini-textbox asLabel" style="width: 96%;" readOnly="true"value="" /></td>
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
	    	<td style="width:130px;" align="right">项目名称：</td>
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
	            <input id="contactNumber" name="contactNumber" class="mini-textbox" style="width:96%;" onvalidation="onTelValidation" value="${taxiBussinessEntity.contactNumber}"  maxlength="12"/>
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
	    
	</table>
 </form>
<!--END 申请信息-->