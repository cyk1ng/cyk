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

<%--<table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">--%>

    <%--<tr id="applyNmTr">--%>
        <%--<td style="width:130px;" align="right" >备案证号：</td>--%>
        <%--<td style="width:50%">--%>
            <%--<input  name="recordNumber" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>--%>
        <%--</td>--%>
        <%--<td style="width:130px;" align="right" >备案经营期限：</td>--%>
        <%--<td style="width:50%">--%>
            <%--<input  name="recordTerm" class="mini-textbox asLabel" style="width:98%;" readOnly="true" value=""/>--%>
        <%--</td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
        <%--<td style="width:130px;" align="right">工商执政号：</td>--%>
        <%--<td style="width:50%">--%>
            <%--<input id="applyDate" name="licenseNumber" class="mini-datepicker asLabel" style="width:96%;" readOnly="true" format="yyyy-MM-dd" value="2019-03-27 00:00:00"/>--%>
        <%--</td>--%>
        <%--<td style="width:130px;" align="right">单位名称：</td>--%>
        <%--<td style="width:50%">--%>
            <%--<input id="applyName" name="enterpriseName" class="mini-textbox  asLabel" style="width:98%;" readOnly="true" value="上海申联出租汽车发展有限公司"/>--%>
        <%--</td>--%>
    <%--</tr>--%>

    <%--<tr id = "comInfoTr1">--%>
        <%--<td style="width:130px;" align="right">邮编：</td>--%>
        <%--<td style="width:50%">--%>
            <%--<input name="enterprisePostalCode" class="mini-textbox asLabel" style="width:96%;" vtype="int" />--%>
        <%--</td>--%>
        <%--<td style="width:130px;" align="right">业户类型：</td>--%>
        <%--<td style="width:50%" >--%>
            <%--<input  name="enterpriseType" class="mini-combobox asLabel" url="${webProperties['app.url.ppm-cm-app']}/ppm/cm/configData/getConfigDataDvolList.data?configDataCategoryId=Enterprise_type" style="width:98%;"  textField="configDataName" valueField="configDataName" emptyText="请选择..." allowInput="false" showNullItem="true" nullItemText="请选择..." vtype="maxLength:10" />--%>
        <%--</td>--%>

    <%--</tr>--%>
    <%--<tr id = "comInfoTr2">--%>
        <%--<td style="width:130px;" align="right">企业经济性质：</td>--%>
        <%--<td style="width:50%">--%>
            <%--<input name="enterpriseNature" class="mini-combobox  asLabel" style="width:96%;" readOnly="true" url="http://122.144.195.126:18001/ppm-cm-app/ppm/cm/configData/getConfigDataDvolList.data?configDataCategoryId=Enterprise_Nature"  textField="configDataName" valueField="configDataName" emptyText="请选择..." allowInput="false" showNullItem="true" nullItemText="请选择..." vtype="maxLength:10"/>--%>
        <%--</td>--%>
        <%--<td style="width:130px;" align="right">法定代表人：</td>--%>
        <%--<td style="width:100%" >--%>
            <%--<input  name="legalRepresentative" class="mini-textbox  asLabel" style="width:98%;" readOnly="true" value="56302921"/>--%>
        <%--</td>--%>
    <%--</tr>--%>
    <%--<tr id = "comInfoTr3">--%>
        <%--<td style="width:130px;" align="right">注册地址：：</td>--%>
        <%--<td style="width:50%">--%>
            <%--<input name="enterpriseAddressArea" class="mini-combobox  asLabel" style="width:96%;" readOnly="true"url="http://122.144.195.126:18001/ppm-cm-app/ppm/cm/district/getDistrictDvolList.data" textField="districtName"  valueField="districtName" emptyText="黄浦区..." allowInput="false" showNullItem="true" nullItemText="请选择..." vtype="maxLength:10" />--%>
        <%--</td>--%>
        <%--<td style="width:130px;" align="right">区（县）：</td>--%>
        <%--<td style="width:100%" colspan="3">--%>
            <%--<input name="enterpriseAddress" class="mini-textbox asLabel" style="width:98%;" readOnly="true" value="网络预约出租汽车运输换证"/>--%>
        <%--</td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
        <%--<td style="width:130px;" align="right">联系电话：</td>--%>
        <%--<td style="width:100%" >--%>
            <%--<input name="enterpriseTel" class="mini-textbox  asLabel" style="width:96%;" readOnly="true" value="200070"/>--%>
        <%--</td>--%>
    <%--</tr>--%>
<%--</table>--%>
<div class="portlet light bordered project-list">
    <div class="portlet-title">
        <div class="caption">
            <i class="icon-book-open font-green-sharp"></i> <span class="caption-subject font-green-sharp bold uppercase">企业信息</span>
        </div>
    </div>
    <div class="portlet-body form">
        <div class="row">
            <div class="col-lg-12">
                <div id="projectPortForm">
                    <div class="form-body form-custom" style="padding-top: 0;">


                        <div class="row">
                            <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                <label>备案证号：</label>
                                <div class="mt-checkbox-inline">
                                    <input required="true"name="recordNumber"  class="mini-textbox asLabel" vtype="rangeChar:0,50" />
                                </div>
                            </div>
                            <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                <label>备案经营期限：</label>
                                <div class="mt-checkbox-inline">
                                    <input required="true"name="recordTerm" class="mini-textbox asLabel" vtype="rangeChar:0,50" />
                                </div>
                            </div>
                            <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                <label>工商执政号：</label>
                                <div class="mt-checkbox-inline">
                                    <input required="true"name="licenseNumber" class="mini-textbox asLabel" vtype="rangeChar:0,50" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                <label>单位名称：</label>
                                <div class="mt-checkbox-inline">
                                    <input required="true"name="enterpriseName" class="mini-textbox asLabel" vtype="rangeChar:0,50" />
                                </div>
                            </div>
                            <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                <label>邮编：</label>
                                <div class="mt-checkbox-inline">
                                    <input required="true"name="enterprisePostalCode" class="mini-textbox asLabel" vtype="int" />
                                </div>
                            </div>
                            <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                <label>业户类型：</label>
                                <div class="mt-checkbox-inline">
                                    <input required="true" name="enterpriseType" class="mini-combobox asLabel" url="${webProperties['app.url.ppm-cm-app']}/ppm/cm/configData/getConfigDataDvolList.data?configDataCategoryId=Enterprise_type" textField="configDataName" valueField="configDataName" emptyText="请选择..." allowInput="false" showNullItem="true" nullItemText="请选择..." vtype="maxLength:10" />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                <label>企业经济性质：</label>
                                <div class="mt-checkbox-inline">
                                    <input required="true" name="enterpriseNature" class="mini-combobox asLabel" url="${webProperties['app.url.ppm-cm-app']}/ppm/cm/configData/getConfigDataDvolList.data?configDataCategoryId=Enterprise_Nature"  textField="configDataName" valueField="configDataName" emptyText="请选择..." allowInput="false" showNullItem="true" nullItemText="请选择..." vtype="maxLength:10" />
                                </div>
                            </div>
                            <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                <label>法定代表人：</label>
                                <div class="mt-checkbox-inline">
                                    <input required="true"name="legalRepresentative" class="mini-textbox asLabel" vtype="rangeChar:0,50" />
                                </div>
                            </div>
                            <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                <div class="mt-checkbox-inline">
                                    <label>联系电话：</label>
                                    <input required="true"name="enterpriseTel" class="mini-textbox asLabel" vtype="int" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                <label>注册地址：</label>
                                <div class="mt-checkbox-inline">
                                    <input required="true" name="enterpriseAddressArea" class="mini-combobox asLabel" url="${webProperties['app.url.ppm-cm-app']}/ppm/cm/district/getDistrictDvolList.data" textField="districtName"  valueField="districtName" emptyText="黄浦区..." allowInput="false" showNullItem="true" nullItemText="请选择..." vtype="maxLength:10" />
                                </div>
                            </div>

                            <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                <label>区（县）</label>
                                <div class="mt-checkbox-inline">
                                    <input required="true" name="enterpriseAddress" emptyText="详细注册地址" class="mini-textbox asLabel" vtype="rangeChar:0,50" />
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
