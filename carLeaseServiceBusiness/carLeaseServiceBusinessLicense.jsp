<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>客运车辆租凭服务企业经营许可</title>
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
    <script src="${webProperties['app.url.approval']}/resources/js/taxi/commonUtil.js" type="text/javascript"></script>
</head>
<body>
<div class="mini-fit">
    <div id="tabs1" class="mini-tabs" activeIndex="0" style="width:100%;height:100%;" plain="false"
         buttons="#tabsButtons" buttonsAlign="right">
        <div title="申请信息">
            <%--隐藏域--%>
            <form id="hiddenDomainForm" method="post">
                <input id="applicationClass" name="applicationClass" style="display: none" class="mini-hidden"
                       value=""/>
                <input id="ownerId" name="ownerId" class="mini-hidden" style="display: none" value=""/>
                <input id="overTime" name="overTime" class="mini-hidden" style="display: none" value=""/>
                <input id="formType" name="formType" class="mini-hidden" style="display: none" value="${formType}"/>
                <input id="id" name="id" class="mini-hidden" style="display: none" value=""/>
                <input id="enterpriseNumber" name="enterpriseNumber" class="mini-hidden" style="display: none"
                       value=""/>
                <input id="projectnameSix" name="projectnameSix" class="mini-hidden" style="display: none"
                       value="${formType}"/>
            </form>
            <form id="applicationForm" method="post">
                <table border="0" cellpadding="1" cellspacing="2"
                       style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
                    <tr id="acceptNumber_tr_id" style="display:none;">
                        <td style="width:130px;" align="right">受理编号：</td>
                        <td style="width:100%" colspan="3">
                            <input id="acceptNumber" name="acceptNumber" class="mini-textbox asLabel" style="width:96%;"
                                   readOnly="true" value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">申请日期：</td>
                        <td style="width:50%">
                            <input name="applyDate" id="applyDate" class="mini-datepicker asLabel" style="width:96%;"
                                   readOnly="true" value=""/>
                        </td>
                        <td style="width:130px;" align="right">申请人：</td>
                        <td style="width:50%">
                            <input name="applyName" id="applyName" class="mini-textbox " style="width:96%;"
                                   value="" onblur="onBlurCompanyName" required="true"
                                   requiredErrorText="申请人不能为空"/><span style="color: red;">*</span>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">业户类型：</td>
                        <td style="width:50%">
                            <input id="companyEconomyType" name="companyEconomyType" class="mini-combobox asLabel"
                                   value="2" readOnly="true"
                                   valueField="typeCd" textField="typeNm" style="width:96%;" required="true"
                                   requiredErrorText="请选择经济类型"
                                   url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=taxiEcoType"/>
                        </td>
                        <td style="width:130px;" align="right">法定代表人：</td>
                        <td style="width:50%">
                            <input name="applyLegal" id="applyLegal" class="mini-textbox"
                                   onblur="onBlurCorporateRepresentative" style="width:96%;" maxLength="20"
                                   require="true" requiredErrorText="法定代表人不能为空" value=""/><span
                                style="color: red;">*</span>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">注册地址：</td>
                        <td style="width:100%" colspan="3">
                            <input name="registerAddress" id="registerAddress" class="mini-textbox"
                                   onblur="onBlurCompanyRegisterAddress" style="width:98%;" value="" required="true"
                                   requiredErrorText="注册地址不能为空"/><span style="color: red;">*</span>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">项目名称：</td>
                        <td style="width:100%" colspan="3">
                            <input name="projectname" id="projectname" class="mini-textbox asLabel" style="width:98%;"
                                   readOnly="true" value="客运车辆租凭服务企业经营许可"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">联系人：</td>
                        <td style="width:50%">
                            <input name="contact" id="contact" class="mini-textbox" maxLength="20" style="width:96%;">
                        </td>
                        <td style="width:130px;" align="right">联系电话：</td>
                        <td style="width:50%">
                            <input name="contactNumber" id="contactNumber" class="mini-textbox" style="width:96%;"
                                   onvalidation="onTelValidation" maxLength="15"/>
                        </td>
                    </tr>

                    <tr>
                        <td style="width:130px;" align="right">委托代理人：</td>
                        <td style="width:100%" colspan="3">
                            <input name="agent" id="agent" class="mini-textbox" style="width:98%;"
                                   vtype="maxLength:20" maxLength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">申请情况说明：</td>
                        <td style="width:100%" colspan="3">
                            <input name="applyDesc" id="applyDesc" class="mini-textarea"
                                   style="width: 98%;height:130px;"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div title="业务信息" style="display: none">
            <form id="businessForm" method="post">
                <h3 class="font-16">业户信息</h3>
                <hr/>
                <table border="0" cellpadding="1" cellspacing="2"
                       style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
                    <tr>
                        <td style="width:130px;" align="right">单位名称：</td>
                        <td style="width:50%">
                            <input name="companyName" id="companyName" class="mini-textbox asLabel" readonly="true"
                                   style="width:96%;"
                                   vtype="maxLength:20"/>
                        </td>
                        <td style="width:130px;" align="right">业户类型：</td>
                        <td style="width:50%">
                            <input name="companyEconomyType" class="mini-combobox asLabel" readonly="true"
                                   style="width:96%;"
                                   url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=taxiEcoType"
                                   textField="typeNm" valueField="typeCd" required="true" value="2"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">经营范围：</td>
                        <td style="width:50%">
                            <input id="businessScope" name="businessScope" multiSelect="true" emptyText="请选择经营范围..."
                                   allowInput="flase" showNullItem="true"
                                   nullItemText="请选择经营范围..." required="true" requiredErrorText="经营范围不能为空"
                                   textField="value" valueField="code" class="mini-combobox asLabel" readOnly="true"
                                   data="[{code:'22000',value:'租赁'}]" value="22000" style="width:96%;"/>
                        </td>
                        <td style="width:130px;" align="right">经济类型：</td>
                        <td style="width:50%">
                            <input id="companyEconomyType1" name="companyEconomyType1" class="mini-combobox"
                                   style="width:96%" value="150"
                                   textField="typeNm" valueField="typeCd" emptyText="请选择经济类型..."
                                   url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=economicType"
                                   allowInput="true" valueFromSelect="true" showNullItem="true"
                                   nullItemText="请选择经济类型..."/>
                        </td>

                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">法定代表人：</td>
                        <td style="width:50%">
                            <input id="corporateRepresentative" name="corporateRepresentative" readonly="true"
                                   class="mini-textbox asLabel" style="width:96%;"/>
                        </td>
                        <td style="width:130px;" align="right">法定代表人电话：</td>
                        <td style="width:50%">
                            <input id="representativeTel" name="representativeTel" class="mini-textbox"
                                   style="width:96%;" onvalidation="onTelValidation" maxLength="15"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">法人代表身份证：</td>
                        <td style="width:50%">
                            <input id="representativeIdCard" name="representativeIdCard" class="mini-textbox"
                                   style="width: 96%;" vtype="maxLength:18" onvalidation="onIDCardsValidation"/>
                        </td>
                        <td style="width:130px;" align="right">投诉电话：</td>
                        <td style="width:50%">
                            <input id="complaintsTel" name="complaintsTel" class="mini-textbox" style="width: 96%;"
                                   maxLength="15" onvalidation="onTelValidation"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">经营地所在区县：</td>
                        <td style="width:50%">
                            <input id="districtsCounties" name="districtsCounties" class="mini-combobox"
                                   style="width:96%" textField="districtName" valueField="districtId"
                                   emptyText="请选择所在区县..." allowInput="true" valueFromSelect="true" showNullItem="true"
                                   nullItemText="请选择所在区县..."
                                   url="${webProperties['app.url.ppm-cm-app']}/ppm/cm/district/getDistrictDvolList.data"/>
                        </td>
                        <td style="width:130px;" align="right">注册地所在区县：</td>
                        <td style="width:50%">
                            <input id="registrationLocation" name="registrationLocation" class="mini-combobox"
                                   style="width:96%"
                                   textField="districtName" valueField="districtId" emptyText="请选择注册地所在区县..."
                                   url="${webProperties['app.url.ppm-cm-app']}/ppm/cm/district/getDistrictDvolList.data"
                                   allowInput="true" valueFromSelect="true" showNullItem="true"
                                   nullItemText="请选择注册地所在区县..."/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">经营地址：</td>
                        <td style="width:50%">
                            <input name="operatingAddress" id="operatingAddress" class="mini-textbox"
                                   style="width:96%;"/>
                        </td>
                        <td style="width:130px;" align="right">注册地址：</td>
                        <td style="width:50%">
                            <input name="companyRegisterAddress" id="companyRegisterAddress"
                                   class="mini-textbox asLabel" style="width:96%;" readonly/>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">经营地址邮编：</td>
                        <td style="width:50%">
                            <input name="postcode" id="postcode" class="mini-textbox"
                                   style="width:96%;" onvalidation="onPostCodeValidation"/>
                        </td>
                        <td style="width:130px;" align="right">注册地邮编：</td>
                        <td style="width:50%">
                            <input name="registrationPostalcode" id="registrationPostalcode" class="mini-textbox"
                                   style="width:96%;" onvalidation="onPostCodeValidation"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">投资方：</td>
                        <td style="width:50%">
                            <input name="investor" id="investor" class="mini-textbox"
                                   style="width:96%;"/>
                        </td>
                        <td style="width:130px;" align="right">注册电话：</td>
                        <td style="width:50%">
                            <input name="registrationTel" id="registrationTel" class="mini-textbox"
                                   style="width:96%;" onvalidation="onTelValidation" maxLength="15"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">联系人：</td>
                        <td style="width:50%">
                            <input name="companyContact" id="companyContact" class="mini-textbox"
                                   style="width:96%;" maxLength="20"/>
                        </td>
                        <td style="width:130px;" align="right">联系电话：</td>
                        <td style="width:50%">
                            <input name="companyTel" id="companyTel" class="mini-textbox" style="width:96%;"
                                   onvalidation="onTelValidation" maxLength="15"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">运输性质：</td>
                        <td style="width:50%">
                            <input id="transportNature" name="transportNature" class="mini-combobox" style="width:96%;"
                                   url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=taxiTransNat"
                                   textField="typeNm" valueField="typeCd" showNullItem="false"
                                   onload="onLoadTransportName"/>
                        </td>
                    </tr>
                    <tr id="openingDate_tr_id" style="display: none;">
                        <td style="width:130px;" align="right">开业日期：</td>
                        <td style="width:50%">
                            <input name="openingDate" class="mini-datepicker" style="width:96%;" format="yyyy-MM-dd"/>
                        </td>
                    </tr>
                </table>
                <h3 class="font-16">工商税务信息</h3>
                <hr/>
                <table border="0" cellpadding="1" cellspacing="2"
                       style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
                    <tr>
                        <td style="width:130px;" align="right">工商登记号：</td>
                        <td style="width:50%">
                            <input name="registrationNumber" class="mini-textbox" style="width:96%;"
                                   vtype="int;minLength:13;" maxLength="15"/>
                        </td>
                        <td style="width:130px;" align="right">税务登记号：</td>
                        <td style="width:50%">
                            <input name="taxRegistrationNumber" class="mini-textbox" style="width:96%;"
                                   vtype="int;rangeLength:15,18;" maxLength="18"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">工商登记号核发日期：</td>
                        <td style="width:50%">
                            <input name="industrialIssuanceDate" id="industrialIssuanceDate" format="yyyy-MM-dd"
                                   class="mini-datepicker" style="width:96%;"/>
                        </td>
                        <td style="width:130px;" align="right">国税登记号核发日期：</td>
                        <td style="width:50%">
                            <input name="taxIssuanceDate" id="taxIssuanceDate" class="mini-datepicker"
                                   style="width:96%;" format="yyyy-MM-dd"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">注册资金人民币：</td>
                        <td style="width:50%">
                            <input name="registrationCapital" id="registrationCapital" class="mini-textbox"
                                   style="width:96%;" vtype="range:0,10000000"/> 万
                        </td>
                        <td style="width:130px;" align="right">注册资金美金：</td>
                        <td style="width:50%">
                            <input name="registrationUsCapital" id="registrationUsCapital" class="mini-textbox"
                                   style="width:96%;" vtype="range:0,10000000"/> 万
                        </td>

                    </tr>
                </table>
                <%--受理和初审时可编辑--%>
                <h3 class="font-16">额度信息</h3>
                <hr/>
                <table border="0" cellpadding="1" cellspacing="3"
                       style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
                    <tr>
                        <td style="width:100px;" align="right">总额度：</td>
                        <td style="width:25%;">
                            <input id="totalQuota" class="mini-spinner asLabel" readonly="true" style="width:96%;"
                                   maxValue="29997"/>
                        </td>
                        <td style="width:130px;" align="right">普通：</td>
                        <td style="width:25%">
                            <input name="miniCarQuota" id="miniCarQuota" class="mini-spinner"
                                   style="width:96%;" maxValue="9999" onvaluechanged="onQuotaValueChange"/>
                        </td>
                        <td style="width:130px;" align="right">新能源：</td>
                        <td style="width:25%">
                            <input name="mediumCarQuota" id="mediumCarQuota" class="mini-spinner" style="width:96%;"
                                   maxValue="9999" onvaluechanged="onQuotaValueChange"/>
                        </td>
                        <td style="width:130px;" align="right">房车：</td>
                        <td style="width:25%">
                            <input name="largeCarQuota" id="largeCarQuota" class="mini-spinner" style="width:96%;"
                                   maxValue="9999" onvaluechanged="onQuotaValueChange"/>
                        </td>
                    </tr>
                </table>
                <br/><br/><br/>
            </form>
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
    <div id="tabsButtons">
        <a id="toggleBtn1" class="mini-button" iconCls="" onclick="acceptBtn()">受理</a>
        <a id="toggleBtn2" class="mini-button" iconCls="" onclick="notAcceptedBtn()">不予受理</a>
        <a id="toggleBtn3" class="mini-button" iconCls="" onclick="saveBtn()">保存</a>
        <a id="toggleBtn4" class="mini-button" iconCls="" onclick="resetBtn()">重置</a>
    </div>
</div>
<script type="text/javascript">

    mini.parse();


    //获取url中的请求参数
    function getRequestString(key) {
        var reg = new RegExp("(^|&)" + key + "=([^&]*)(&|$)");
        var result = window.location.search.substr(1).match(reg);
        return result ? decodeURIComponent(result[2]) : null;
    }

    var userTaskId = "usertask26";

    var userId = "${userId}";
    var model = getRequestString("model");
    var type = getRequestString("type");
    var applyNumber;
    $(document).ready(function () {

        if (type == "1") {
            //创建申请 号
            getSq();
        }

        //只读模式
        if ("view" == model) {
            labelModel("applicationForm");
            labelModel("businessForm");
            $("#acceptNumber_tr_id").show();
            $("#tabsButtons").hide();
        } else {
            window.parent.setHangYe("", "", "1", "2");
        }
        var id = getRequestString("id");
        if (id != "" && id != null) {
            mini.get("id").setValue(id);
            $("#fileupload").load(function () {
                queryTaxiBusinessLicense({id: id});
            })
        } else {
            mini.get("#applyDate").setValue(new Date());
        }

        var acceptNumber = getRequestString("acceptNumber");
        if ("" != acceptNumber && null != acceptNumber) {
            $("#fileupload").load(function () {
                queryTaxiBusinessLicense({acceptNumber: acceptNumber});
            })
        } else {
            //客运车辆租凭服务企业经营许可
            mini.get("projectname").setValue(window.parent.itemObj.name);
            //
            mini.get("applicationClass").setValue(window.parent.itemId);
            //超时时间
            mini.get("overTime").setValue(window.parent.itemObj.approveTime);
            $("#fileupload").load(function () {
                $("#fileupload")[0].contentWindow.getList(window.parent.itemId);
            })
        }
        //客运车辆租凭服务企业经营许可
        mini.get("projectname").setValue(window.parent.itemObj.name);
        //089201
        mini.get("applicationClass").setValue(window.parent.itemId);

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

    /**
     * 受理
     * 受理时为空且不可编辑
     * 初审时可编辑且不可为空
     */
    function acceptBtn() {
        var url = "${webProperties['app.url.approval']}/carLeaseServiceBusiness/acceptCarLeaseServiceBusiness.htm";
        operating(url, true, 1, "确定受理吗？")
    }

    /**
     * 不予受理
     */
    function notAcceptedBtn() {
        var url = "${webProperties['app.url.approval']}/carLeaseServiceBusiness/noAcceptCarLeaseServiceBusiness.htm";
        operating(url, true, 3, "确定不予受理吗？")
    }

    /**
     * 保存
     */
    function saveBtn() {
        var url = "${webProperties['app.url.approval']}/carLeaseServiceBusiness/saveCarLeaseServiceBusiness.htm";
        operating(url, true, 2, "")
    }

    /**
     *调用更新接口将页面所有信息更新
     */
    function updateBusinessInfo() {
        var url = "${webProperties['app.url.approval']}/carLeaseServiceBusiness/updateTaxiNumInfo.htm";
        return operating(url, true, 4, "")
    }

    /**
     * 操作
     * @param url 请求地址
     * @param flag true ：开启验证
     * @param type 1:受理 2：保存 3 ：不予受理 4：更新
     * @param confirmMsg 确认信息 为空不验证
     * */
    function operating(url, flag, type, confirmMsg) {
        //申请信息表
        var applicationForm = new mini.Form("applicationForm");
        //业务信息表
        var businessForm = new mini.Form("businessForm");
        //隐藏域信息
        var hiddenDomainForm = new mini.Form("hiddenDomainForm");
        if (flag) {
            applicationForm.validate();
            if (applicationForm.isValid() == false) {
                //切换tab
                loading(false);
                mini.get('tabs1').setActiveIndex(0);
                mini.alert("输入数据不符合规范，请重新填写");
                return;
            }
            businessForm.validate();
            if (businessForm.isValid() == false) {
                loading(false);
                //切换tab
                mini.get('tabs1').setActiveIndex(1);
                mini.alert("输入数据不符合规范，请重新填写");
                return;
            }
        }
        if (confirmMsg != "") {
            mini.confirm(confirmMsg, "确定？",
                function (action) {
                    if (action == "ok") {
                        return submitData(url, type, applicationForm, businessForm, hiddenDomainForm)
                    } else {

                    }
                }
            );
        } else {
            var submitResult = submitData(url, type, applicationForm, businessForm, hiddenDomainForm)
            return submitResult;
        }
    }

    /**
     * 提交数据
     * */
    function submitData(url, type, applicationForm, businessForm, hiddenDomainForm) {
        try {
            var baseReslut = false;
            if (type == 1) {
                var obj = {};
                //是否完成
                obj.isFinished = "0";

                var arr1 = [];
                var obj1 = {};
                obj1.conditionKey = "name";
                obj1.conditionValue = mini.get("applyName").value;
                arr1.push(obj1);
                //事项类型
                var obj2 = {};
                obj2.conditionKey = "form_type";
                obj2.conditionValue = mini.get("projectnameSix").value;
                arr1.push(obj2);

                //根据企业名称和事项类型来查询是否有流程未完成
                var filterCondition = {variableValueEquals: arr1};

                obj.filterCondition = filterCondition;
                $.ajax({
                    url: "${webProperties['app.url.approval']}/common/getProcessInstanceByCondition.htm",
                    type: 'post',
                    async: false, //同步请求
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    data: {data: mini.encode(obj)},
                    success: function (data) {
                        var dataObj = mini.decode(data);
                        if (dataObj.data.length > 0) {
                            mini.alert("该企业正在受理中,请勿重复受理")
                        } else {
                            baseReslut = true;
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        mini.alert(jqXHR.responseText);
                    }
                });

                if (!baseReslut) {
                    return false;
                }
            }
            loading(true);
            // 获取页面数据
            var Obj = {};
            var applicationData = applicationForm.getData(true);
            var businessData = businessForm.getData(true);
            var hiddenDomainData = hiddenDomainForm.getData(true);
            jQuery.extend(Obj, applicationData, businessData, hiddenDomainData);
            //审批判断
            var approvingAuth = window.parent.itemObj.approvingAuth;
            Obj.applyType = approvalMap[approvingAuth];
            //申请号码
            Obj.applyNumber = applyNumber;
            //申请材料
            Obj.applyMaterials = getApplicationMaterials();
            //type为4的场合发送同步请求
            var isAsync = (type != 4);
            var updateResult = false;
            $.ajax({
                url: url,
                data: {data: mini.encode(Obj)},
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                type: 'POST',
                async: isAsync,
                success: function (data) {
                    loading(false);
                    if (type == 1) {
                        var dataObj = mini.decode(data);
                        if (dataObj) {
                            mini.get("acceptNumber").setValue(dataObj.acceptNumber);
                            $("#acceptNumber_tr_id").show();
                            $("#tabsButtons").hide();
                            getCurrentImg({instanceId: dataObj.processInstanceId});


                            acceptNumber = dataObj.acceptNumber;
                            processInstanceId = dataObj.processInstanceId;

                            //调用查询法律文书方法
                            var paramObj = {};
                            paramObj.subitemid = Obj.projectnameSix;
                            paramObj.nodeTaskid = userTaskId;
                            paramObj.acceptNumber = Obj.acceptNumber;
                            getLayerBook(paramObj);
                        }

                        labelModel("applicationForm");
                        labelModel("businessForm");

                        //切换至法律文书tab
                        mini.get('tabs1').setActiveIndex(3);

                        $("#fileupload")[0].contentWindow.setCeckDis();
                        $("#fileupload")[0].contentWindow.setUploadDis();
                        $("#fileupload")[0].contentWindow.shouJianBuZhen();

                        mini.alert("受理成功");
                    } else if (type == 2) {
                        mini.alert("保存成功");
                    } else if (type == 3) {
                        var dataObj = mini.decode(data);
                        if (dataObj) {
                            mini.get("acceptNumber").setValue(dataObj.acceptNumber);

                            $("#acceptNumber_tr_id").show();
                            $("#tabsButtons").hide();
                            getCurrentImg({instanceId: dataObj.processInstanceId});

                            acceptNumber = dataObj.acceptNumber;
                            processInstanceId = dataObj.processInstanceId;

                            var paramObj = {};
                            paramObj.subitemid = Obj.projectnameSix;
                            paramObj.nodeTaskid = userTaskId;
                            paramObj.acceptNumber = Obj.acceptNumber;
                            getLayerBook(paramObj);
                        }
                        labelModel("applicationForm");
                        labelModel("businessForm");

                        $("#fileupload")[0].contentWindow.setCeckDis();
                        $("#fileupload")[0].contentWindow.setUploadDis();
                        $("#fileupload")[0].contentWindow.shouJianBuZhen();

                        mini.alert("不予受理成功");
                    } else if (type == 4) {
                        updateResult = true;
                    }

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    loading(false);
                    if (type == 1) {
                        mini.alert("受理失败");
                    } else if (type == 2) {
                        mini.alert("保存失败");
                    } else if (type == 3) {
                        mini.alert("不予受理失败");
                    } else if (type == 4) {
                        mini.alert("更新失败");
                        updateResult = false;
                    }

                }
            });

            if (type == 4) {
                return updateResult;
            }
        } catch (e) {
            console.log(e);
            loading(false);
            mini.alert("系统异常，请联系管理员");
            if (type == 4) {
                return false;
            }
        }
    }

    /**
     * 重置
     */
    function resetBtn() {
        mini.confirm("确定重置吗？", "确定？",
            function (action) {
                if (action == "ok") {
                    loading(true);
                    var hiddenDomainForm = new mini.Form("hiddenDomainForm");
                    var applicationForm = new mini.Form("applicationForm");
                    var businessForm = new mini.Form("businessForm");
                    hiddenDomainForm.reset();
                    applicationForm.reset();
                    businessForm.reset();
                    mini.get("#applyDate").setValue(new Date());

                    var transportNatureData = mini.get("transportNature").getData();
                    if (transportNatureData.length > 0) {
                        mini.get("transportNature").select(0);
                    }

                    //申请信息恢复
                    mini.get("applyName").setReadOnly(false);
                    mini.get("applyName").removeCls("asLabel");

                    mini.get("applyLegal").setReadOnly(false);
                    mini.get("applyLegal").removeCls("asLabel");

                    mini.get("registerAddress").setReadOnly(false);
                    mini.get("registerAddress").removeCls("asLabel");

                    //重置企业信息
                    window.parent.setNone();
                    //重置材料列表
                    $("#fileupload")[0].contentWindow.setCeckNoChe();

                    $("#fileupload")[0].contentWindow.getList(window.parent.itemId);
                    loading(false);
                } else {

                }
            }
        );

    }

    /**
     * 额度信息改变事件
     */
    function onQuotaValueChange(e) {
        var miniCarQuota = parseInt(mini.get("miniCarQuota").getValue());
        var mediumCarQuota = parseInt(mini.get("mediumCarQuota").getValue());
        var largeCarQuota = parseInt(mini.get("largeCarQuota").getValue());

        mini.get("totalQuota").setValue(miniCarQuota + mediumCarQuota + largeCarQuota);
    }

    /**
     * 更改业务信息编辑模式
     */
    function updateBusinessModel() {
        var form = new mini.Form("businessForm");
        var names = "companyName,companyEconomyType1,companyRegisterAddress,"
            + "companyContact,companyTel,businessScope,miniCarQuota,mediumCarQuota,largeCarQuota";
        var fields = form.getFields();
        for (var i = 0, l = fields.length; i < l; i++) {
            var c = fields[i];
            if (names.indexOf(c.getName()) < 0) {
                if (c.setReadOnly) c.setReadOnly(false);
                if (c.removeCls) c.removeCls("asLabel");
            }
        }
    }

    /**
     * 更改额度编辑模式
     */
    function updateCarQuotaModel() {
        var idArr = ["miniCarQuota", "mediumCarQuota", "largeCarQuota"];
        for (var i = 0; i < idArr.length; i++) {
            if (mini.get(idArr[i]).setReadOnly) mini.get(idArr[i]).setReadOnly(false);
            if (mini.get(idArr[i]).removeCls) mini.get(idArr[i]).removeCls("asLabel");
        }

    }

    /**
     * 加载。。。
     * @param flag true:开始加载 false:停止加载
     * */
    function loading(flag) {
        if (flag) {
            mini.mask({
                el: document.body,
                cls: 'mini-mask-loading',
                html: '加载中...'
            });
        } else {
            mini.unmask(document.body);
        }
    }

    /**
     * 只读模式
     * */
    function labelModel(formId) {
        var form = new mini.Form(formId);
        var fields = form.getFields();
        for (var i = 0, l = fields.length; i < l; i++) {
            var c = fields[i];
            if (c.getValue() == "") {
                c.setValue("");
            }
            if (c.setReadOnly) c.setReadOnly(true);     //只读
            if (c.setIsValid) c.setIsValid(true);      //去除错误提示
            if (c.addCls) c.addCls("asLabel");          //增加asLabel外观
        }
    }


    //联系方式校验
    function onTelValidation(e) {
        if (e.isValid) {
            if (isTel(e.value) == false) {
                e.errorText = "联系方式格式不对";
                e.isValid = false;
            }
        }
    }

    function isTel(value) {
        if (value) {
            if (/^\d+-?\d+$/.test(value)) return true;
            return false;
        } else {
            return true;
        }

    }

    /**
     * 身份证校验
     */
    function onIDCardsValidation(e) {
        if (e.isValid) {
            // 1 "验证通过!", 0 //校验不通过
            var format = /^(([1][1-5])|([2][1-3])|([3][1-7])|([4][1-6])|([5][0-4])|([6][1-5])|([7][1])|([8][1-2]))\d{4}(([1][9]\d{2})|([2]\d{3}))(([0][1-9])|([1][0-2]))(([0][1-9])|([1-2][0-9])|([3][0-1]))\d{3}[0-9xX]$/;

            if (e.value != "" && e.value != null) {
                if (e.value.length < 18) {
                    e.errorText = "身份证号码不合规";
                    e.isValid = false;
                    return;
                }
                //号码规则校验
                if (!format.test(e.value)) {
                    e.errorText = "身份证号码不合规";
                    e.isValid = false;
                    return;
                }
                //区位码校验
                //出生年月日校验   前正则限制起始年份为1900;
                var year = e.value.substr(6, 4),//身份证年
                    month = e.value.substr(10, 2),//身份证月
                    date = e.value.substr(12, 2),//身份证日
                    time = Date.parse(month + '-' + date + '-' + year),//身份证日期时间戳date
                    now_time = Date.parse(new Date()),//当前时间戳
                    dates = (new Date(year, month, 0)).getDate();//身份证当月天数
                if (time > now_time || date > dates) {
                    e.errorText = "出生日期不合规";
                    e.isValid = false;
                    return;
                }
                //校验码判断
                var c = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);   //系数
                var b = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');  //校验码对照表
                var id_array = e.value.split("");
                var sum = 0;
                for (var k = 0; k < 17; k++) {
                    sum += parseInt(id_array[k]) * parseInt(c[k]);
                }
                if (id_array[17].toUpperCase() != b[sum % 11].toUpperCase()) {
                    e.errorText = "身份证校验码不合规";
                    e.isValid = false;
                    return;
                }
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
                    e.isValid = false;
                    e.errorText = "邮政编码格式有误，请重输";
                }
            }
        }

    }

    /**
     * 工商登记号校验
     */
    function onIcRegistration(e) {
        if (e.isValid) {
            if (e.value) {
                var reg = /\d{13,15}/;
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
     * 税务登记号校验
     */
    function onTaxRegistration(e) {
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
     * 查询信息
     */
    function queryTaxiBusinessLicense(businessSearchObj) {
        loading(true);
        $.ajax({
            url: "${webProperties['app.url.approval']}/carLeaseServiceBusiness/queryCarLeaseServiceBusiness.htm",
            type: 'post',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: {data: mini.encode(businessSearchObj)},
            success: function (data) {
                loading(false);
                var result = mini.decode(data);
                var dataObj = result.data[0];

                applyNumber = dataObj.applyNumber;

                setTaxiBusinessData(dataObj);

                var totalQuota = parseInt(dataObj.miniCarQuota) + parseInt(dataObj.mediumCarQuota) + parseInt(dataObj.largeCarQuota);
                mini.get("totalQuota").setValue(totalQuota);

                if (type == "4" && model == "edit") {
                    window.parent.setComInfo(dataObj.applyName);
                }

                if ("1" != type && "4" != type) {
                    getHistoryTasksByCondition({instanceId: window.parent.processInstanceId}, dataObj);
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                loading(false);
                mini.alert(jqXHR.responseText);
            }
        });
    }

    function setTaxiBusinessData(obj) {
        var hiddenDomainForm = new mini.Form("hiddenDomainForm");
        var applicationForm = new mini.Form("applicationForm");
        var businessForm = new mini.Form("businessForm");
        hiddenDomainForm.setData(obj);
        applicationForm.setData(obj);
        businessForm.setData(obj);

        $("#fileupload")[0].contentWindow.getList(obj.projectnameSix);

        var key = obj.applicationClass + "_" + obj.projectnameSix;
        var applyMaterials = obj.applyMaterials[key];

        var fileArr = [];
        for (var i = 0; i < applyMaterials.length; i++) {
            var params = {};
            params.id = applyMaterials[i].materialCode;
            params.fileName = applyMaterials[i].materialName;
            params.shoudao = applyMaterials[i].getFileCount;
            fileArr.push(params);
        }
        var number = "";
        //草稿箱
        if (type == "4") {
            number = obj.applyNumber
        } else {
            number = obj.acceptNumber
        }

        $("#fileupload")[0].contentWindow.setFileInfo(fileArr, number);

    }


    //获取申请材料数据
    function getApplicationMaterials() {
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
        var formType = mini.get("formType").getValue();
        var key = formType + "_" + formType;
        var obj = {};
        obj[key] = fileArr;
        return obj;
    }

    var approvalMap = {};

    function getApprovalType(obj) {
        $.ajax({
            url: "${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm",
            type: 'get',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: {clCd: "approve"},
            success: function (data) {
                var dataArr = mini.decode(data);
                for (var i = 0; i < dataArr.length; i++) {
                    approvalMap[dataArr[i].typeCd] = dataArr[i].typeNm;
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                mini.alert(jqXHR.responseText);
            }
        });
    }

    /**
     * 查询流程历史任务集合
     */
    var reloadParams = {};

    function getHistoryTasksByCondition(paramObj, businessObj) {
        var sortCondition = {};
        sortCondition.orderByTaskCreateTime = "asc";
        paramObj.sortCondition = sortCondition;
        $.ajax({
            url: "${webProperties['app.url.approval']}/approvalProcess/getHistoryTasksByCondition.htm",
            type: 'post',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: {data: mini.encode(paramObj)},
            success: function (data) {
                var dataObj = mini.decode(data);
                var result = dataObj.data;

                acceptNumber = businessObj.acceptNumber;
                processInstanceId = paramObj.instanceId;

                var type = getRequestString("type");//这是前台传参数方法，通过modelview跳转页面通过别打的方法获取
                var param = {};
                param.subitemid = businessObj.projectnameSix;
                if ("2" == type) {
                    var curTask = result[result.length - 1].taskDefinitionKey;
                    param.nodeTaskid = curTask;
                    if ("usertask3" == curTask || "usertask11" == curTask) {
                        updateBusinessModel();
                    }
                    if ("usertask16" == curTask) {
                        updateCarQuotaModel();
                    }
                    //如果是复核节点可以上传，否则全部隐藏
                    if ("usertask3" == curTask) {
                        //隐藏上传和收件补正按钮
                        $("#fileupload")[0].contentWindow.shouJianBuZhen();
                    } else {
                        $("#fileupload")[0].contentWindow.setUploadDis();
                        $("#fileupload")[0].contentWindow.shouJianBuZhen();
                        $("#fileupload")[0].contentWindow.setCeckDis();
                    }
                }
                if ("3" == type) {
                    $("#fileupload")[0].contentWindow.setUploadDis();
                    $("#fileupload")[0].contentWindow.shouJianBuZhen();
                    $("#fileupload")[0].contentWindow.setCeckDis();
                    var arr = [];
                    for (var i = 0; i < result.length; i++) {
                        if (userId == result[i].assignee) {
                            arr.push(result[i].taskDefinitionKey);
                        }
                    }
                    param.nodeTaskid = arr.join(",");
                }
                param.acceptNumber = businessObj.acceptNumber;
                reloadParams = param;
                getLayerBook(param);
                //var curTaskObj = result[result.length-1];

            },
            error: function (jqXHR, textStatus, errorThrown) {
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
                    '<a href="javascript:;" target="sub-right-frame" class="btn btn-sm green" style="width:50px;" onclick="toPrint(&quot;' + record.attcd + '&quot;,&quot;' + record.wsbh + '&quot;,&quot;' + paramObj.nodeTaskid + '&quot;,&quot;' + paramObj.subitemid + '&quot;);"><i class="fa fa-pencil"></i> 打印 </a>';
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
    function toPrint(attcd, wsbh, nodeTaskid, subitemid) {
        var param = {};
        var url = "${webProperties['app.url.approval']}/commCertificate/openPdfFileView.htm";
        mini.open({
            url: url,
            title: "文书预览",
            width: 950,
            height: 600,
            allowResize: false,
            onload: function () {
                //debugger;
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

    //单位名称
    function onBlurCompanyName(e) {
        mini.get("companyName").setValue(e.sender.value);
    }

    //注册地址
    function onBlurCompanyRegisterAddress(e) {
        mini.get("companyRegisterAddress").setValue(e.sender.value);
    }

    //法人代表
    function onBlurCorporateRepresentative(e) {
        mini.get("corporateRepresentative").setValue(e.sender.value);
    }

    /**
     * 营运性质加载完成回调函数
     */
    function onLoadTransportName(param) {
        if (param.data != null && param.data.length > 0) {
            mini.get("transportNature").select(0);
        }
    }

    /**
     * 设置企业信息
     */
    function setCompanyData(comInfo) {
        var result = false;
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
                if (obj.length > 0) {
                    for (var i = 0; i < obj.length; i++) {
                        var scopecode = obj[i].scopecode;
                        if (scopecode == "22000") {
                            window.parent.setNone();
                            mini.alert("该企业不能办理该业务，请重新选择企业");
                            result = true;
                        }
                    }
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                mini.alert(jqXHR.responseText);
                result = true;
            }
        });

        if (result) {
            return;
        }
        loading(true);
        if (comInfo.b_enterpriseId != null && comInfo.b_enterpriseId != "") {
            //企业id
            mini.get("#ownerId").setValue(comInfo.b_enterpriseId);
        }
        if (comInfo.b_cnname != null && comInfo.b_cnname != "") {
            //申请人
            mini.get("#applyName").setValue(comInfo.b_cnname);
            mini.get("#companyName").setValue(comInfo.b_cnname);
        }
        if (comInfo.taxiBaseNumber != null && comInfo.taxiBaseNumber != "") {
            //企业编号
            mini.get("enterpriseNumber").setValue(comInfo.taxiBaseNumber);
        }
        if (comInfo.b_economictype != null && comInfo.b_economictype != "") {
            //经济类型
            mini.get("#companyEconomyType1").setValue(comInfo.b_economictype);
        }
        if (comInfo.b_manageclass != null && comInfo.b_manageclass != "") {
            //业户类型
            mini.get("#companyEconomyType").setValue(comInfo.b_manageclass);
        }
        if (comInfo.b_registeredaddress != null && comInfo.b_registeredaddress != "") {
            //注册地址
            mini.get("#registerAddress").setValue(comInfo.b_registeredaddress);
            mini.get("#companyRegisterAddress").setValue(comInfo.b_registeredaddress);
        }
        if (comInfo.b_legalperson != null && comInfo.b_legalperson != "") {
            //法定代表人
            mini.get("#applyLegal").setValue(comInfo.b_legalperson);
            mini.get("#corporateRepresentative").setValue(comInfo.b_legalperson);
        }
        if (window.parent.itemId != null && window.parent.itemId != "") {
            //申请类型
            mini.get("#applicationClass").setValue(window.parent.itemId);
        }
        if (window.parent.itemObj.name != null && window.parent.itemObj.name != "") {
            //项目名称
            mini.get("#projectname").setValue(window.parent.itemObj.name);
        }
        if (comInfo.operateaddress != null && comInfo.operateaddress != "") {
            //经营地址
            mini.get("#operatingAddress").setValue(comInfo.operateaddress);
        }
        if (comInfo.b_registereddistrict != null && comInfo.b_registereddistrict != "") {
            //注册地所在区县
            mini.get("registrationLocation").setValue(comInfo.b_registereddistrict);
        }
        if (comInfo.operatedistrict != null && comInfo.operatedistrict != "") {
            //经营地所在区县
            mini.get("districtsCounties").setValue(comInfo.operatedistrict);
        }
        if (comInfo.b_registeredpostalcode != null && comInfo.b_registeredpostalcode != "") {
            //注册地邮编
            mini.get("#registrationPostalcode").setValue(comInfo.b_registeredpostalcode);
        }
        if (comInfo.operatepostalcode != null && comInfo.operatepostalcode != "") {
            //经营地址邮编
            mini.get("#postcode").setValue(comInfo.operatepostalcode);
        }
        if (comInfo.b_legalpersonphone != null && comInfo.b_legalpersonphone != "") {
            //法人联系电话
            mini.get("#representativeTel").setValue(comInfo.b_legalpersonphone);
        }
        //申请信息变只读
        mini.get("applyName").setReadOnly(true);
        mini.get("applyName").addCls("asLabel");
        mini.get("applyName").setIsValid(true);

        mini.get("companyEconomyType").setReadOnly(true);
        mini.get("companyEconomyType").addCls("asLabel");
        mini.get("companyEconomyType").setIsValid(true);

        mini.get("applyLegal").setReadOnly(true);
        mini.get("applyLegal").addCls("asLabel");
        mini.get("applyLegal").setIsValid(true);

        mini.get("registerAddress").setReadOnly(true);
        mini.get("registerAddress").addCls("asLabel");
        mini.get("registerAddress").setIsValid(true);
        loading(false);
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
</script>
</body>
</html>
