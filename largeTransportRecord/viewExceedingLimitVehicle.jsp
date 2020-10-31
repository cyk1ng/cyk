<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>超限车辆公路备案</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<%@ include file="/WEB-INF/jsp/include/meta.jsp"%>
<body class="page-container-bg-solid page-content-white">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content subpage">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <!--BEGIN 基础信息-->
                <div class="portlet light bordered project-list" style="margin-bottom: 20px;">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-book-open font-green-sharp"></i> <span class="caption-subject font-green-sharp bold uppercase">超限车辆运营企业信息</span>
                        </div>
                    </div>
                    <form id="formEnData" method="post">
                    <div class="portlet-body form">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-body form-custom" style="padding-top: 0;">
                                    <div class="row">
                                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                            <label>备案证号：</label> <input class="mini-textbox" id="recordNumber" name="recordNumber" required="true" />
                                        </div>
                                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                            <label>备案证期限：</label> <input class="mini-textbox" id="recordTerm" name="recordTerm" required="true" />
                                        </div>
                                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                            <label>工商执照号：</label> <input class="mini-textbox" id="licenseNumber" name="licenseNumber" required="true" />
                                        </div>
                                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                            <label>单位名称：</label> <input class="mini-textbox" id="enterpriseName" name="enterpriseName" required="true" />
                                        </div>
                                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                            <label>注册地址：</label> <input class="mini-textbox" id="enterpriseAddress" name="enterpriseAddress" required="true" />
                                        </div>
                                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                            <label>企业经济性质：</label> <input class="mini-combobox" url="${webProperties['app.url.businessApproval']}/bulkCargo/getCommConfDatByClcd.htm?clcd=Enterprise_Nature"
                                            textField="typeNm" valueField="typeCd"
                                             id="enterpriseNature" name="enterpriseNature" required="true" />
                                        </div>
                                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                            <label>业户类型：</label> <input class="mini-combobox" url="${webProperties['app.url.businessApproval']}/bulkCargo/getCommConfDatByClcd.htm?clcd=Enterprise_type"
                                            textField="typeNm" valueField="typeCd"
                                             id="enterpriseType" name="enterpriseType" required="true" />
                                        </div>
                                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                            <label>法定代表人：</label> <input class="mini-textbox" id="legalRepresentative" name="legalRepresentative" required="true" />
                                        </div>
                                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                            <label>联系电话：</label> <input class="mini-textbox" id="TEL" name="tel" required="true" />
                                        </div>
                                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                            <label>邮编：</label> <input class="mini-textbox" id="postalCode" name="postalCode"  vtype="int" vtype="rangeLength:6,6" />
                                        </div>
                                        <div class="form-group col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                            <label>备注：</label> <input class="mini-textbox" id="remarks" name="remarks" />
                                        </div>
                                    </div>
                                 </div>
                              </div>
                         </div>
                    </div>
                    </form>
                
                <div class="portlet-title">
                     <div class="caption">
                         <i class="icon-book-open font-green-sharp"></i> <span class="caption-subject font-green-sharp bold uppercase">超限运输流程信息</span>
                     </div>
                 </div>
                 <form id="formOvData" method="post"> 
                 <div class="portlet-body form">
                     <div class="row">
                         <div class="col-lg-12">
                             <div class="form-body form-custom" style="padding-top: 0;">
                                 <div class="row">
                                    <!-- 
                                     <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                         <label style="color: #2ab4c0; font-size: 16px;">[ 申&nbsp;请&nbsp;人 ]</label>
                                     </div>
                                      -->
                                     <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                         <label>名称：</label> <input class="mini-textbox" id="name" name="name" required="true" />
                                     </div>
                                     <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                         <label>单位组织机构代码：</label> <input class="mini-textbox" id="orgCode" name="orgCode" required="true" />
                                     </div>
                                     <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                         <label>事项：</label> <input class="mini-textarea" id="matter" name="matter" required="true" />
                                     </div>
                                     <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                         <label>开始日期：</label> <input class="mini-datepicker" id="dateStart" name="dateStart" required="true" />
                                     </div>
                                     <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                         <label>结束日期：</label> <input class="mini-datepicker" id="dateEnd" name="dateEnd" required="true" />
                                     </div>
                                     <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                         <label>超限运输行驶路线：</label> <input class="mini-textarea" id="route" name="route" required="true" />
                                     </div>
                                     <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                         <label>车辆及装载情况：</label> <input class="mini-textarea" id="loadingCondition" name="loadingCondition" required="true"/>
                                     </div>
                                     <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                         <label>补充说明：</label> <input class="mini-textarea" id="additionalExplanation" name="additionalExplanation" required="true" />
                                     </div>
                                     <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                         <label>运输单位：</label> <input class="mini-textarea" id="transportUnit"  name="transportUnit" required="true" />
                                     </div>
                                     <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                         <label>联系人：</label> <input class="mini-textbox" id="contacts" name="contacts" required="true" />
                                     </div>
                                     <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                         <label>电话：</label> <input class="mini-textbox" id="contactsTel" name="contactsTel" required="true" />
                                     </div>
                                     <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                         <label>申请日期：</label> <input class="mini-datepicker" id="applicationDate" name="applicationDate" required="true" />
                                     </div>
                                     <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                         <label>备注：</label> <input class="mini-textbox" id="remarks" name="remarks" />
                                     </div>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
             </form>
             
             <div class="portlet-title">
                     <div class="caption">
                         <i class="icon-book-open font-green-sharp"></i> <span class="caption-subject font-green-sharp bold uppercase">超限车辆登记信息</span>
                     </div>
                 </div>
                 <form id="formVeData" method="post"> 
                 <div class="portlet-body form">
                     <div class="row">
                         <div class="col-lg-12">
                             <div class="form-body form-custom" style="padding-top: 0;">
                                 <div class="row">
                                     <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                         <label>车牌号码：</label> <input class="mini-textbox" id="vehiclelicense" name="vehiclelicense" required="true" />
                                     </div>
                                     <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                         <label>车牌颜色：</label> <input class="mini-combobox" url="${webProperties['app.url.businessApproval']}/bulkCargo/getCommConfDatByClcd.htm?clcd=LICENSESUBJECT"
                                            textField="typeNm" valueField="typeCd"
                                             id="licensesubject" name="licensesubject" required="true" />
                                     </div>
                                     <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                         <label>货物名称：</label> <input class="mini-textbox" id="goodsName" name="goodsName" required="true" />
                                     </div>
                                     <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                         <label>货物总重量：</label> <input class="mini-textbox" id="goodsWeight" name="goodsWeight" required="true" />
                                     </div>
                                     <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                         <label>载后长度：</label> <input class="mini-textbox" id="bodyLength" name="bodyLength" required="true" />
                                     </div>
                                     <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                         <label>载后宽度：</label> <input class="mini-textbox" id="bodyWidth" name="bodyWidth" required="true" />
                                     </div>
                                     <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                         <label>载后高度：</label> <input class="mini-textbox" id="bodyHeight" name="bodyHeight" required="true" />
                                     </div>
                                     <div class="form-group col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                         <label>备注：</label> <input class="mini-textbox" id="remarks" name="remarks" />
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
                 </form>
                <!--END 基础信息-->

                <!--BEGIN  操作按钮-->
                <div class="row padding-bottom-20" style="overflow: hidden; overflow-y: auto;">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <button type="button" class="btn btn-default" onclick="onCancel()">
                            <i class="fa fa-close"></i> 关闭
                        </button>
                    </div>
                </div>
                <!--END 操作按钮-->
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">

mini.parse();
new mini.Form("formOvData").setEnabled(false);
new mini.Form("formEnData").setEnabled(false);
new mini.Form("formVeData").setEnabled(false);

// 赋初值
setData(id);

function SetData(data) {
	data = mini.clone(data);
	setData(data.id);
}

// 赋初值
function setData(id) {
	$.ajax({
        url: "${webProperties['app.url.businessApproval']}/bulkCargo/getRecRoadOverrunById.htm?_=" + Math.random() + "&id=" + id,
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
}

function onCancel() {
	window.CloseOwnerWindow("edit")
}

</script>
</html>