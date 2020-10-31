<%--
  Created by IntelliJ IDEA.
  User: siwash
  Date: 2019/3/23
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>企业基础信息</title>
</head>
<body>

<table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">

    <tr id="applyNmTr">
        <td style="width:130px;" align="right" >备案证号：</td>
        <td style="width:50%">
            <input  name="recordNumber" class="mini-textbox asLabel" readOnly="true" style="width:96%;"  value=""/>
        </td>
        <td style="width:130px;" align="right" >备案经营期限：</td>
        <td style="width:50%">
            <input  name="recordTerm" class="mini-textbox asLabel" readOnly="true" style="width:98%;"  value=""/>
        </td>
    </tr>
    <tr>
        <td style="width:130px;" align="right">工商执政号：</td>
        <td style="width:50%">
            <input id="applyDate" name="licenseNumber" readOnly="true" class="mini-datepicker asLabel" style="width:96%;"  format="yyyy-MM-dd" value="2019-03-27 00:00:00"/>
        </td>
        <td style="width:130px;" align="right">单位名称：</td>
        <td style="width:50%">
            <input id="applyName" name="enterpriseName" class="mini-textbox" style="width:98%;"  value="上海申联出租汽车发展有限公司"/>
        </td>
    </tr>

    <tr id = "comInfoTr1">
        <td style="width:130px;" align="right">邮编：</td>
        <td style="width:50%">
            <input name="enterprisePostalCode" class="mini-textbox" style="width:96%;" vtype="int" />
        </td>
        <td style="width:130px;" align="right">业户类型：</td>
        <td style="width:50%" >
            <input  name="enterpriseType" class="mini-combobox" url="${webProperties['app.url.ppm-cm-app.select']}Enterprise_type" style="width:98%;"  textField="configDataName" valueField="configDataName" emptyText="请选择..." allowInput="false" showNullItem="true" nullItemText="请选择..." vtype="maxLength:10" />
        </td>

    </tr>
    <tr id = "comInfoTr2">
        <td style="width:130px;" align="right">企业经济性质：</td>
        <td style="width:50%">
            <input name="enterpriseNature" class="mini-combobox" style="width:96%;"  url="http://122.144.195.126:18001/ppm-cm-app/ppm/cm/configData/getConfigDataDvolList.data?configDataCategoryId=Enterprise_Nature"  textField="configDataName" valueField="configDataName" emptyText="请选择..." allowInput="false" showNullItem="true" nullItemText="请选择..." vtype="maxLength:10"/>
        </td>
        <td style="width:130px;" align="right">法定代表人：</td>
        <td style="width:100%" >
            <input  name="legalRepresentative" class="mini-textbox" style="width:98%;"  value="56302921"/>
        </td>
    </tr>
    <tr id = "comInfoTr3">
        <td style="width:130px;" align="right">注册地址：：</td>
        <td style="width:50%">
            <input name="enterpriseAddressArea" class="mini-combobox" style="width:96%;" url="http://122.144.195.126:18001/ppm-cm-app/ppm/cm/district/getDistrictDvolList.data" textField="districtName"  valueField="districtName" emptyText="黄浦区..." allowInput="false" showNullItem="true" nullItemText="请选择..." vtype="maxLength:10" />
        </td>
        <td style="width:130px;" align="right">区（县）：</td>
        <td style="width:100%" colspan="3">
            <input name="enterpriseAddress" class="mini-textbox" style="width:98%;"  value="网络预约出租汽车运输换证"/>
        </td>
    </tr>
    <tr>
        <td style="width:130px;" align="right">联系电话：</td>
        <td style="width:100%" >
            <input name="enterpriseTel" class="mini-textbox" style="width:96%;"  value="200070"/>
        </td>
    </tr>
</table>

</body>
</html>
