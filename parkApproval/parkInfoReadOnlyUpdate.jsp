<%--
  Created by IntelliJ IDEA.
  User: siwash
  Date: 2019/3/23
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>仓库信息</title>
    <script src="${webProperties['app.url.webres']}/assets/global/plugins/miniui/miniui.js" type="text/javascript"></script>
</head>
<body>
<div class="portlet light bordered project-list">
    <div class="portlet-title">
        <div class="caption">
            <i class="icon-book-open font-green-sharp"></i> <span class="caption-subject font-green-sharp bold uppercase">场库信息</span>
        </div>
        <div class="actions">
            <a href="javascript:;" class="btn btn-circle btn-icon-only btn-default fullscreen" data-original-title="" title="全屏"> </a>
        </div>
        <div class="tools">
            <a href="javascript:;" class="btn btn-circle btn-icon-only btn-default collapse" data-original-title="" title="收缩"> </a>
        </div>
    </div>
    <div class="portlet-body form">
        <div class="row">
            <div class="col-lg-12">
                <div class="form-body form-custom" style="padding-top:0;">

                    <div class="row">
                        <div class="form-group col-xs-4">
                            <label>场（库）名称：</label>
                            <div class="mt-checkbox-inline">
                            <input name="ckName" class="mini-textbox " id="siteNm" vtype="rangeChar:1,132" />
                            <input name="ckId" value="${ckId}" style="display: none;" />
                            </div>
                        </div>
                        <div class="form-group col-xs-4">
                            <label>场库产权性质：</label>
                            <div class="mt-checkbox-inline">
                                <input  name="ckPropertyRight" class="mini-combobox " url="${webProperties['app.url.ppm-cm-app.select']}ck_property right" textField="configDataName" valueField="configDataName" emptyText="请选择..." allowInput="false" showNullItem="true" nullItemText="请选择..." vtype="maxLength:10" />
                            </div>
                        </div>
                        <div id="pkTypeId" class="form-group col-xs-4">
                            <label>停车场类型：</label>
                            <div class="mt-checkbox-inline">
                            <input  name="ckType" class="mini-combobox " data="[{approvalParkTypeName:'公共停车场（库）经营备案（含等级审核）',approvalParkTypeId:'136401001'},{approvalParkTypeName:'临时停车场经营备案登记',approvalParkTypeId:'136401002'}]" textField="approvalParkTypeName" valueField="approvalParkTypeId" emptyText="请选择..." allowInput="false" showNullItem="true" nullItemText="请选择..." vtype="maxLength:10" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <label>场库负责人：</label>
                            <input name="personLiableName" class="mini-textbox "  vtype="rangeChar:1,132" />
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <label>负责人电话：</label>
                            <input  name="personLiablePhone" class="mini-textbox "  vtype="int" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-xs-10">
                            <label>场库地址：</label>
                            <div class="mt-checkbox-inline">
                                <input   width="20%" name="ckAddressArea" class="mini-combobox " url="${webProperties['app.url.ppm-cm-app']}/ppm/cm/district/getDistrictDvolList.data" textField="districtName" valueField="districtName" emptyText="请选择..." allowInput="false" showNullItem="true" nullItemText="请选择..." vtype="maxLength:10" />
                                <span>区（县）</span>
                                <input  name="ckAddressStreet" width="20%" class="mini-textbox "  vtype="rangeChar:1,132" />
                                <span>街道</span>
                                <input  width="40%" name="ckAddressNumber" emptyText="门牌号" class="mini-textbox " vtype="rangeChar:0,50" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                            <label>邮编：</label>
                            <div class="mt-checkbox-inline">
                                <input name="ckPostalCode" class="mini-textbox " vtype="int" />
                            </div>
                        </div>
                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                            <label>租赁有效期：</label>
                            <div class="mt-checkbox-inline">
                                <input name="ckTermEnd" class="mini-datepicker " id="planEndDate" />
                            </div>
                        </div>
                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                            <div class="mt-checkbox-inline">
                                <label>从业人员数：</label>
                                <input name="employeesNumber" type="number" class="mini-textbox " vtype="int" />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <label>对外服务电话：</label>
                            <input  name="ckTel" class="mini-textbox "  vtype="int" />
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <label>投诉受理电话：</label>
                            <input  name="complaintTel" class="mini-textbox "  vtype="int" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <label>产权方名称：</label>
                            <input class="mini-textbox " name="ckPropertyOwner" vtype="rangeChar:1,132" />
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <label>电子收费供应商：</label>
                            <input class="mini-textbox "  name="feeSystemSupplierName" vtype="rangeChar:1,132" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <label>场（库）位置<span style="color:red"></span>：</label>
                            <div class="mt-checkbox-inline">
                                <input  id="ckPosition"  name="ckPosition" class="mini-combobox " style="width:100%" textField="configDataName" valueField="configDataName" emptyText="请选择..." allowInput="false" showNullItem="false" url="${webProperties['app.url.ppm-cm-app.select']}ck_position" required="false" />
                            </div>
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <label>停放车种（多可选）<span style="color:red"></span>：</label>
                            <div class="input-group">
                                <%--<input class="mini-checkbox"  name="parkingType"  /><span class="check-text">大型客车&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>--%>
                                <%--<input class="mini-checkbox"  name="parkingType"  /><span class="check-text">大型货车&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>--%>
                                <%--<input class="mini-checkbox"  name="parkingType"  /><span class="check-text">小型客车&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>--%>
                                <%--<input class="mini-checkbox"  name="parkingType"  /><span class="check-text">小型货车</span>--%>
                                <div repeatItems="10"  repeatLayout="table" id="checkboxList1" class="mini-checkboxlist"
                                     textField="configDataName" valueField="configDataName"  onload="onLoad"
                                     data="[{configDataName:'大型客车'},{configDataName:'大型货车'},{configDataName:'小型客车'},{configDataName:'小型货车'}]" >
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <label>经营性质<span style="color:red"></span>：</label>
                            <div class="mt-checkbox-inline">
                                <input  id="bnsNature" onvaluechanged="onDeptChange" name="natureOfManagementI" class="mini-combobox " url="${webProperties['app.url.ppm-cm-app.select']}Nature_management_I" textField="configDataName" valueField="configDataName" emptyText="请选择..." allowInput="false" showNullItem="true" nullItemText="请选择..." vtype="maxLength:10" />
                            </div>
                        </div>
                        <div  class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <label>经营性质(小类)<span style="color:red"></span>：</label>
                            <div class="mt-checkbox-inline">
                                <input  id="bnsNature2"  name="natureOfManagementIi" class="mini-combobox "  textField="configDataName" url="${webProperties['app.url.ppm-cm-app.select']}Nature_management_II" valueField="configDataName" emptyText="请选择..." allowInput="false" showNullItem="true" nullItemText="请选择..." vtype="maxLength:10" />
                            </div>
                        </div>
                    </div>
                    <script type="text/javascript">

                    </script>
                    <div class="row">
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <label>总面积m²：</label>
                            <input class="mini-textbox " name="ckArea" vtype="float" />
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <label>总泊位：</label>
                            <input class="mini-textbox " name="parkingNumberForeign" vtype="int" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                            <label>换乘泊位数：</label>
                            <input class="mini-textbox " name="berthsNumberPr" vtype="int" />
                        </div>
                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                            <label>充电泊位数：</label>
                            <input class="mini-textbox " name="berthsNumberChargingPile" vtype="int" />
                        </div>
                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                            <label>无障碍泊位数：</label>
                            <input class="mini-textbox "   name="berthsNumberBarrierFree" vtype="int" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-lg-10 col-md-10 col-sm-10 col-xs-10">
                            <label>场（库）性质：</label>
                            <div class="mt-checkbox-inline">
                                <input  id="nature"  name="nature"  onvaluechanged="onNatureChange" class="mini-combobox " nullItemText="请选择..." textField="configDataName" valueField="configDataName" emptyText="请选择..." allowInput="false" showNullItem="false"  required="false" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <label>停车场（库）级别：</label>
                            <div class="mt-checkbox-inline">
                                <input  class="mini-combobox " data="[{configDataName:'级别Ⅰ'},{configDataName:'级别Ⅱ'},{configDataName:'级别Ⅲ'}]" name="zLevel" textField="configDataName" valueField="configDataName" emptyText="请选择..." allowInput="false" showNullItem="false" url="" required="false" />
                            </div>
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <label>停车场（库）等别：</label>
                            <div class="mt-checkbox-inline">
                                <input  class="mini-combobox "  data="[{configDataName:'级别Ⅰ'},{configDataName:'级别Ⅱ'},{configDataName:'级别Ⅲ'}]" name="grade" textField="configDataName" valueField="configDataName" emptyText="请选择..." allowInput="false" showNullItem="false" url="" required="false" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <label>停车场（库）面积m²：</label>
                            <input class="mini-textbox " name="area" vtype="rangeChar:1,132" />
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <label>停车场（库）总泊位：</label>
                            <input class="mini-textbox " name="berthsNumber" vtype="rangeChar:1,132" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                            <label>大型车泊位：</label>
                            <input class="mini-textbox " name="parkingNumberLarge" vtype="int" />
                        </div>
                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                            <label>小型车泊位：</label>
                            <input class="mini-textbox " name="parkingNumberSmall" vtype="int" />
                        </div>
                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                            <label>计费标准：</label>
                            <input class="mini-textbox " name="freightBasis"  vtype="rangeChar:1,132" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label>停放定位分类：</label><br>
                            <span>自行式:</span> <input name="zSelfPropelled" width="15%" class="mini-textbox "  vtype="int" />
                            <span>字母式:</span><input width="15%" name="offspringType" class="mini-textbox "  vtype="int" />
                            <span>机械式:</span><input width="15%" name="mechanical" class="mini-textbox "  vtype="int" />
                            <span>机械架有效期:</span><input width="15%" name="shelfValidityPeriod" class="mini-textbox "  vtype="rangeChar:1,132" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <label>计费方式：</label>
                            <div class="mt-checkbox-inline">
                                <input  name="billingMode" class="mini-combobox " style="width:100%" textField="configDataName" valueField="configDataName" emptyText="请选择..." allowInput="false" showNullItem="false" url="${webProperties['app.url.ppm-cm-app.select']}Billing_mode" required="false" />
                            </div>
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <label>服务时间：</label>
                            <div class="mt-checkbox-inline">
                                <input class="mini-textbox " name="parkingNumberTime" vtype="rangeChar:1,132" />
                            </div>
                        </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <label>对外开放泊位：</label>
                            <input class="mini-textbox " name="parkingNumber"  vtype="int" />
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <label>长包泊位：</label>
                            <input class="mini-textbox "  name="parkingNumbeLongTerm" vtype="int" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <label>付费方式（可多选）<span style="color:red"></span>：</label>
                            <div class="input-group">
                                <div repeatItems="10" repeatLayout="table" id="checkboxList2" class="mini-checkboxlist"
                                     textField="configDataName" valueField="configDataName" onload="onLoad"
                                     data="[{configDataName:'现金'},{configDataName:'公共交通卡'},{configDataName:'银行卡'},{configDataName:'其他'}]" >
                            </div>
                        </div>

                    </div>
                        <div class="row">

                            <div id="InAddress" style="margin-left: 10px" class="form-group col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                <span >进口地址：</span>
                                <input   name="entranceName" class="mini-textbox "  vtype="rangeChar:1,132" />
                            </div>
                        </div>
                        <div class="row">
                            <div id="OutAddress"  style="margin-left: 10px" class="form-group col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                <label>出口地址：</label>
                                <input   name="exitName" class="mini-textbox "  vtype="rangeChar:1,132" />
                            </div>
                        </div>
                        <script type="text/javascript">
                            var id=1;
                            function addIN() {
                                id++;
                                $("#InAddress").append("<div id='inAddress_"+id+"'><br/><span class=\"mini-textbox\" style=\"border-width: 0px;width: 96%\"><span class=\"mini-textbox-border\"><input name=\"entranceName\" type=\"text\" class=\"mini-textbox-input\" autocomplete=\"off\" placeholder=\"\"></span><input type=\"hidden\"></span> &nbsp;<button onclick=\"delThis('inAddress_"+id+"')\" class=\"btn btn-info\"  >删除</button></div>");
                            }
                            function delThis(id) {
                                $("#"+id).remove();
                            }
                            var outId=1
                            function addOut() {
                                outId++;
                                $("#OutAddress").append("<div id='OutAddress_"+outId+"'><br/><span class=\"mini-textbox\" style=\"border-width: 0px;width: 96%\"><span class=\"mini-textbox-border\"><input name=\"exitName\" type=\"text\" class=\"mini-textbox-input\" autocomplete=\"off\" placeholder=\"\"></span><input type=\"hidden\"></span> &nbsp;<button onclick=\"delThis('OutAddress_"+outId+"')\" class=\"btn btn-info\"  >删除</button></div>");
                            }
                        </script>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
