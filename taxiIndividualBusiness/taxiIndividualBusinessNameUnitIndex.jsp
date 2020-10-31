<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>巡游出租汽车个体工商户名称托管单位变更管理</title>
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
            <form id="hiddenDomainForm" method="post">
                <input id="applicationClass" name="applicationClass" style="display: none" class="mini-hidden" value=""/>
                <input id="ownerId" name="ownerId" class="mini-hidden" style="display: none" value=""/>
                <input id="overTime" name="overTime" class="mini-hidden" style="display: none" value=""/>
                <input id="formType" name="formType" class="mini-hidden" style="display: none" value="${formType}"/>
                <input id="id" name="id" class="mini-hidden" style="display: none" value=""/>
                <input id="companyEconomyType" name="companyEconomyType" class="mini-hidden" style="display: none" value=""/>
                <input id="enterpriseNumber" name="enterpriseNumber" class="mini-hidden" style="display: none" value=""/>
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
                                   readOnly="true" format="yyyy-MM-dd"
                                   value=""/>
                        </td>
                        <td style="width:130px;" align="right">申请人：</td>
                        <td style="width:50%">
                            <input name="applyName" id="applyName" class="mini-textbox  asLabel" style="width:96%;"
                                   readOnly="true"
                                   value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">业户类型：</td>
                        <td style="width:50%">
                            <input id="companyEconomyType1" name="companyEconomyType1" class="mini-combobox asLabel"
                                   readOnly="true" valueField="typeCd" textField="typeNm" style="width:96%;"
                                   value=""
                                   url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=taxiEcoType"/>
                        </td>
                        <td style="width:130px;" align="right">注册地址：</td>
                        <td style="width:100%">
                            <input id="registerAddress" name="registerAddress" class="mini-textbox  asLabel"
                                   style="width:96%;" readOnly="true"/>
                        </td>

                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">法定代表人：</td>
                        <td style="width:50%">
                            <input id="applyLegal" name="applyLegal" class="mini-textbox  asLabel" style="width:96%;"
                                   readOnly="true"/>
                        </td>
                        <td style="width:130px;" align="right">法定代表人电话：</td>
                        <td style="width:100%">
                            <input name="representativeTel" id="representativeTel" class="mini-textbox  asLabel"
                                   style="width:96%;" readOnly="true"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">经营地址：</td>
                        <td style="width:50%">
                            <input id="operatingAddress" name="operatingAddress" class="mini-textbox  asLabel"
                                   style="width:96%;" readOnly="true" value=""/>
                        </td>
                        <td style="width:130px;" align="right">经营地址邮编：</td>
                        <td style="width:100%">
                            <input id="postcode" name="postcode" class="mini-textbox  asLabel" style="width:96%;"
                                   readOnly="true" value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">项目名称：</td>
                        <td style="width:100%" colspan="3">
                            <input name="projectname" id="projectname" class="mini-textbox asLabel" style="width:96%;"
                                   readOnly="true"
                                   value="巡游个体工商户名称、托管单位变更"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">联系人：</td>
                        <td style="width:50%">
                            <input name="contact" id="contact" class="mini-textbox" style="width:96%;"
                                   maxLength="20"
                                   vtype="maxLength:20" <%--required="true" requiredErrorText="联系人不能为空"--%>/>
                        </td>
                        <td style="width:130px;" align="right">联系电话：</td>
                        <td style="width:50%">
                            <input name="contactNumber" id="contactNumber" class="mini-textbox" style="width:96%;"
                                   <%--required="true" requiredErrorText="联系电话不能为空"--%>maxLength="15"
                                   vtype="maxLength:15" onvalidation="onTelValidation"/>
                        </td>
                    </tr>

                    <tr>
                        <td style="width:130px;" align="right">委托代理人：</td>
                        <td style="width:100%" colspan="3">
                            <input name="agent" id="agent" class="mini-textbox" style="width:98%;"
                                   <%-- required="true" requiredErrorText="委托代理人不能为空"--%>maxLength="20"
                                   vtype="maxLength:20"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">申请情况说明：</td>
                        <td style="width:100%" colspan="3">
                            <input name="applyDesc" id="applyDesc" class="mini-textarea" <%--required="true"
                                   requiredErrorText="申请情况说明不能为空"--%>
                                   style="width: 98%;height:130px;"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">业务事项：</td>
                        <td style="width:30%" colspan="3">
                            <div id="projectnameSix" name="projectnameSix" class="mini-radiobuttonlist" repeatItems="2"
                                 repeatLayout="table"
                                 repeatDirection="vertical" onValuechanged="changeBusinessMatters"
                                 textField="text" valueField="id" value="089104003">
                            </div>
                            <input id="businessMatters" name="businessMatters" style="width:96%;display: none"
                                   readOnly="true" class="mini-textbox asLabel" value=""/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div title="业务信息" style="display: none">
            <h3 class="font-16">企业变更信息</h3>
            <hr/>
            <form id="businessForm" method="post">
                <%--固定两个列 变更信息--%>
                <table class="gridTable">
                    <tr>
                        <th>变更类型</th>
                        <th>原信息</th>
                        <th>变更信息</th>
                    </tr>
                    <tr id="businessName">
                        <td>业户名称</td>
                        <td><input name="beforeMerchantName" id="beforeMerchantName" class="mini-textbox  asLabel"
                                   style="width:100%;text-align: center"
                                   readOnly="true" value=""/></td>
                        <td><input id="changedMerchantName" name="changedMerchantName" onblur="onBlurMerchantName"
                                   onvalidation="onMerchantNameValidation" class="mini-textbox"/></td>
                    </tr>
                    <tr id="hostingUnit">
                        <td>托管单位</td>
                        <td>
                            <input id="beforeDepositName" name="beforeDepositName" class="mini-combobox asLabel"
                                   style="width:100%;text-align: center"
                                   url="${webProperties['app.url.approval']}/taxiIndividualBusiness/queryTrusteeList.htm?enterpriseId="
                                   textField="cnname" valueField="enterpriseId" readOnly="true"/>
                        </td>
                        <td><%--托管id 暂不需要传值 托管单位与之前单位不能相等--%>
                            <input id="changedDepositName" name="changedDepositName" class="mini-combobox"
                                   style="width:100%" onValuechanged="changedDepName"
                                   onvalidation="onDepositNameValidation"
                                   url="${webProperties['app.url.approval']}/taxiIndividualBusiness/queryTrusteeList.htm?enterpriseId="
                                   textField="cnname" valueField="enterpriseId" emptyText="请选择..."
                                   allowInput="true" valueFromSelect="true" showNullItem="true" nullItemText="请选择..."/>
                        </td>
                    </tr>
                </table>
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

    var userTaskId = "usertask26";

    var userId = "${userId}";

    var model = "";

    var applyNumber;

    //获取url中的请求参数
    function getRequestString(key) {
        var reg = new RegExp("(^|&)" + key + "=([^&]*)(&|$)");
        var result = window.location.search.substr(1).match(reg);
        return result ? decodeURIComponent(result[2]) : null;
    }

    var businessItemType = [
        {"id": "089104003", "text": "变更业户名称（工商执照已变更）及托管单位"},
        {"id": "089104001", "text": "仅变更业户名称（工商执照已变更）"},
        {"id": "089104004", "text": "变更业户名称（工商执照未变更）及托管单位"},
        {"id": "089104002", "text": "仅变更业户名称（工商执照未变更）"},
        {"id": "089104005", "text": "仅变更托管单位"}
    ];

    $(document).ready(function () {

        //设置业务事项类型值
        var cmb = mini.get("projectnameSix");
        cmb.setData(businessItemType);

        model = getRequestString("model");
        var type = getRequestString("type");

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

        if ("view" == model) {
            labelModel("applicationForm");
            labelModel("businessForm");
            // var obj = mini.get("projectnameSix");
            // obj.disable();
            $("#acceptNumber_tr_id").show();
            $("#tabsButtons").hide();
            //隐藏checkbox
            mini.get("#projectnameSix").set({visible: false});
            $("#businessMatters").css("display", "block");
            //
        } else {
            mini.get("#applyDate").setValue(new Date());
            /**
             * scopename  新增为空，别的都是“出租”
             * tradeId 新增为空 别的为“2011”
             * type 新增为1，别的为空
             * managerClass:个体工商填 2，企业填 1
             * */
            window.parent.setHangYe("出租", '2011', '', '1');
        }
        var id = getRequestString("id");
        //草稿箱查询
        if (id != "" && id != null&& type == "4") {
            mini.get("id").setValue(id);
            $("#fileupload").load(function () {
                queryTaxiBusinessLicense({id: id});
            })
        } else {
            mini.get("#applyDate").setValue(new Date());
        }
        //受理中 和已办结查询
        var acceptNumber = getRequestString("acceptNumber");
        if ("" != acceptNumber && null != acceptNumber) {
        	$("#fileupload").load(function () {
            	queryTaxiBusinessLicense({acceptNumber: acceptNumber});
        	})
        } else {
            mini.get("#applyDate").setValue(new Date());
            //巡游个体工商户名称、托管单位变更
            mini.get("projectname").setValue(window.parent.itemObj.name);
            //089104
            mini.get("applicationClass").setValue(window.parent.itemId);
            //超时时间
            mini.get("overTime").setValue(window.parent.itemObj.approveTime);
            //通过业务事项查询申请材料 默认值：变更业户名称（工商执照已变更）及托管单位
            $("#fileupload").load(function () {
                $("#fileupload")[0].contentWindow.getList("089104003");
            })
            // getList("089104003");
        }
        getApprovalType({});
    });

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
     * 业务事项切换
     */
    function changeBusinessMatters(e) {
        loading(true);
        var data = mini.get("projectnameSix");
        var val = data.getValue();
        $("#businessName").hide();
        $("#hostingUnit").hide();
        //变更业户名称
        if (val == "089104001" || val == "089104002") {
            $("#businessName").show();
            //清空托管
            // mini.get("changedDepositName").setValue("");
        }
        //变更 名称 和 托管
        if (val == "089104003" || val == "089104004") {
            $("#businessName").show();
            $("#hostingUnit").show();
        }
        //变更托管
        if (val == "089104005") {
            $("#hostingUnit").show();
            //清空业户名称
            //mini.get("changedMerchantName").setValue("");
        }

        //清空托管
        mini.get("changedDepositName").setValue("");
        //清空业户名称
        mini.get("changedMerchantName").setValue("");

        mini.get("#applyDate").setValue(new Date());

        $("#fileupload")[0].contentWindow.setCeckNoChe();

        //通过业务事项查询申请材料
        $("#fileupload")[0].contentWindow.getList(val);

        loading(false);
    }

    /**
     * 托管单位改变值触发事件
     * 值改变时发生
     * */
    function changedDepName() {
        loading(true);
        // 原托管单位
        var beforeData = mini.get("beforeDepositName");
        var beforeValue = beforeData.getValue();
        //改变之后的数据
        var changeData = mini.get("changedDepositName");
        var changeValue = changeData.getValue();

        //两个不能一样
        // if (beforeValue != '' && changeValue != '') {
        //     if (beforeValue == changeValue) {
        //         mini.alert("变更托管单位不能与之前单位相等");
        //     }
        // }
        loading(false);
    }

    function onBlurMerchantName(e) {
        // 原托管单位
        var beforeData = mini.get("beforeMerchantName");
        var beforeValue = beforeData.getValue();
        //改变之后的数据
        var changeData = mini.get("changedMerchantName");
        var changeValue = changeData.getValue();
        // if (beforeValue != '' && changeValue != '') {
        //     if (beforeValue == changeValue) {
        //         mini.alert("业户名称未发生改变");
        //     }
        // }
    }


    /**
     * 受理
     */
    function acceptBtn() {
        var url = "${webProperties['app.url.approval']}/taxiIndividualBusiness/acceptTaxiIndividualBusiness.htm";
        operating(url, true, 1, "确定受理吗？")
    }

    /**
     * 不予受理
     */
    function notAcceptedBtn() {
        var url = "${webProperties['app.url.approval']}/taxiIndividualBusiness/noAcceptTaxiIndividualBusiness.htm";
        operating(url, true, 3, "确定不予受理吗？")
    }

    /**
     * 保存
     */
    function saveBtn() {
        var url = "${webProperties['app.url.approval']}/taxiIndividualBusiness/saveTaxiIndividualBusiness.htm";
        operating(url, true, 2, '')
    }

    /**
     * 操作
     * @param url 请求地址
     * @param flag true ：开启验证
     * @param type 1:受理 2：保存 3 ：不予受理,4：更新
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
            if (mini.get("#ownerId").value == null || mini.get("#ownerId").value == '') {
                loading(false);
                mini.alert("请选择企业");
                return false;
            }
            if (type != 2) {
                applicationForm.validate();
                if (applicationForm.isValid() == false) {
                    loading(false);
                    //切换tab
                    mini.get('tabs1').setActiveIndex(0);
                    mini.alert("有输入数据不符合规范，请重新填写");
                    return false;
                }
                businessForm.validate();
                if (businessForm.isValid() == false) {
                    loading(false);
                    //切换tab
                    mini.get('tabs1').setActiveIndex(1);
                    mini.alert("有输入数据不符合规范，请重新填写");
                    return false;
                }
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
            loading(true);

            if (window.parent.itemObj) {
                if (window.parent.itemObj.approveTime) {
                    mini.get("overTime").setValue(window.parent.itemObj.approveTime);
                }
            }

            // 获取页面数据
            var Obj = {};
            var applicationData = applicationForm.getData(true);
            var businessData = businessForm.getData(true);
            var hiddenDomainData = hiddenDomainForm.getData(true);

            jQuery.extend(Obj, applicationData, businessData, hiddenDomainData);
            //审批判断
            var approvingAuth = window.parent.itemObj.approvingAuth;
            //删除元素
            delete Obj.businessMatters;
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
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: {data: mini.encode(Obj)},
                type: 'POST',
                async: isAsync,
                success: function (data) {
                    loading(false);
                    //受理
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
                        $("#fileupload")[0].contentWindow.setCeckDis();
                        $("#fileupload")[0].contentWindow.setUploadDis();
                        $("#fileupload")[0].contentWindow.shouJianBuZhen();

                        //切换至法律文书tab
                        mini.get('tabs1').setActiveIndex(3);

                        //隐藏radio box
                        mini.get("#projectnameSix").set({visible: false});
                        $("#businessMatters").css("display", "block");

                        for (var i = 0; i < businessItemType.length; i++) {
                            var id = businessItemType[i].id;
                            if (id == Obj.projectnameSix) {
                                mini.get("#businessMatters").setValue(businessItemType[i].text);
                                break
                            }
                        }
                        // var obj = mini.get("projectnameSix");
                        // obj.disable();
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
                        // var obj = mini.get("projectnameSix");
                        // obj.disable();
                        //隐藏checkbox
                        mini.get("#projectnameSix").set({visible: false});
                        $("#businessMatters").css("display", "block");

                        for (var i = 0; i < businessItemType.length; i++) {
                            var id = businessItemType[i].id;
                            if (id == Obj.projectnameSix) {
                                mini.get("#businessMatters").setValue(businessItemType[i].text);
                                break
                            }
                        }
                        mini.alert("不予受理成功");
                    } else if (type == 4) {
                        // mini.alert("更新成功");
                        updateResult = true;
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    loading(false);
                    mini.alert(jqXHR.responseText);
                    if (type==4){
                        updateResult = false;
                    }
                }
            });
            if (type == 4) {
                return updateResult;
            }
        } catch (e) {
            loading(false);
            mini.alert("系统异常，请联系管理员");
            if (type == 4) {
                return false;
            }
        }
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

                    $("#businessName").show();
                    $("#hostingUnit").show();

                    //重置企业信息
                    window.parent.setNone();
                    //重置材料列表
                    $("#fileupload")[0].contentWindow.setCeckNoChe();

                    $("#fileupload")[0].contentWindow.getList("089104003");

                    loading(false);
                } else {

                }
            }
        );
    }

    /**
     * 查询信息
     */
    function queryTaxiBusinessLicense(businessSearchObj) {
        loading(true);
        $.ajax({
            url: "${webProperties['app.url.approval']}/taxiIndividualBusiness/queryTaxiBusinessLicense.htm",
            type: 'post',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: {data: mini.encode(businessSearchObj)},
            success: function (data) {
                loading(false);
                var result = mini.decode(data);
                var dataObj = result.data[0];

                applyNumber = dataObj.applyNumber;

                setTaxiBusinessData(dataObj);
                //这是前台传参数方法，通过modelview跳转页面通过别打的方法获取（1：申请页面，4：草稿箱）这两个类型没法律文书
                var type = getRequestString("type");

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

    /**
     * 赋值
     * */
    function setTaxiBusinessData(obj) {
        var hiddenDomainForm = new mini.Form("hiddenDomainForm");
        var applicationForm = new mini.Form("applicationForm");
        var businessForm = new mini.Form("businessForm");
        hiddenDomainForm.setData(obj);
        applicationForm.setData(obj);
        businessForm.setData(obj);

        //判断业务事项
        $("#businessName").hide();
        $("#hostingUnit").hide();
        var applicationData = applicationForm.getData(true);
        //仅更换业户名称
        if (applicationData.projectnameSix == "089104001" || applicationData.projectnameSix == "089104002") {
            $("#businessName").show();
        }
        //更改业户名称 和 托管单位
        if (applicationData.projectnameSix == "089104003" || applicationData.projectnameSix == "089104004") {
            $("#businessName").show();
            $("#hostingUnit").show();
        }
        //仅托管单位
        if (applicationData.projectnameSix == "089104005") {
            $("#hostingUnit").show();
        }

        for (var i = 0; i < businessItemType.length; i++) {
            var id = businessItemType[i].id;
            if (id == applicationData.projectnameSix) {
                mini.get("#businessMatters").setValue(businessItemType[i].text);
                break
            }
        }

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
        var type = getRequestString("type");
        if (type == "4") {
            number = obj.applyNumber
        } else {
            number = obj.acceptNumber
        }

        if ("view" == model) {
                $("#fileupload")[0].contentWindow.setFileInfo(fileArr, number);
                $("#fileupload")[0].contentWindow.shouJianBuZhen();
        } else {
            $("#fileupload")[0].contentWindow.setFileInfo(fileArr, number);
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
        var formType=mini.get("formType").getValue();
        var data = mini.get("projectnameSix");
        var val = data.getValue();
        var key = formType + "_" + val;
        var obj = {};
        obj[key] = fileArr;
        return obj;
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
                  //如果是复核节点可以上传，否则全部隐藏
					if("usertask3" == curTask){
						//隐藏上传和收件补正按钮
                        updateBusinessModel();
	    				$("#fileupload")[0].contentWindow.shouJianBuZhen();
					}else{
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


    /***
     *
     * 业户名称验证
     * */
    function onMerchantNameValidation(e) {
        var reg = /\s/;
        var data = mini.get("projectnameSix");
        var val = data.getValue();
        if (val == "089104001" || val == "089104002" || val == '089104003' || val == '089104004') {
            if (e.isValid) {
                if (reg.test(e.value)) {
                    e.errorText = "字符间不能包含空格";
                    e.isValid = false;
                }
                if (e.value == '') {
                    e.isValid = false;
                    e.errorText = "变更业户名称不能为空";
                } else {
                    // 原业户名称
                    var beforeData = mini.get("beforeMerchantName");
                    var beforeValue = beforeData.getValue();
                    if (beforeValue == e.value) {
                        e.isValid = false;
                        e.errorText = "业户名称未发生改变";
                    }
                }
            }
        }
    }

    /**
     * 托管单位验证
     * */
    function onDepositNameValidation(e) {
        var data = mini.get("projectnameSix");
        var val = data.getValue();
        if (val == "089104003" || val == "089104004" || val == '089104005') {
            if (e.isValid) {
                if (e.value == '') {
                    e.isValid = false;
                    e.errorText = "请选择托管单位";
                } else {
                    // 原托管单位
                    var beforeData = mini.get("beforeDepositName");
                    var beforeValue = beforeData.getValue();
                    if (beforeValue == e.value) {
                        e.isValid = false;
                        e.errorText = "变更托管单位不能与之前单位相等";
                    }
                }
            }
        }
    }

    /**
     *将业务信息里所有非申请信息的内容变为可编辑模式
     */
    function updateBusinessModel() {
        // mini.get("#contact").setReadOnly(false);
        // mini.get("#contact").removeCls("asLabel");
        //
        // mini.get("#contactNumber").setReadOnly(false);
        // mini.get("#contactNumber").removeCls("asLabel");
        //
        // mini.get("#agent").setReadOnly(false);
        // mini.get("#agent").removeCls("asLabel");
        //
        // mini.get("#description").setReadOnly(false);
        // mini.get("#description").removeCls("asLabel");
        //
        // mini.get("#projectnameSix").setReadOnly(false);
        // mini.get("#projectnameSix").removeCls("asLabel");

        mini.get("#changedMerchantName").setReadOnly(false);
        mini.get("#changedMerchantName").removeCls("asLabel");

        mini.get("#changedDepositName").setReadOnly(false);
        mini.get("#changedDepositName").removeCls("asLabel");
    }

    /**
     *调用更新接口将页面所有信息更新
     */
    function updateBusinessInfo() {
        var url = "${webProperties['app.url.approval']}/taxiIndividualBusiness/changeTaxiIndividualBusiness.htm";
        return operating(url, true, 4, "")
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
     * 设置企业信息
     */
    function setCompanyData(comInfo) {
        loading(true);
        if (comInfo.b_enterpriseId != null && comInfo.b_enterpriseId != "") {
            //拥有者id 企业id
            mini.get("#ownerId").setValue(comInfo.b_enterpriseId);
            //企业名称
            // enterpriseNumber-----comInfo.taxiBaseNumber

        }
        if (comInfo.b_cnname != null && comInfo.b_cnname != "") {
            //申请人
            mini.get("#applyName").setValue(comInfo.b_cnname);
        }
        if (comInfo.b_manageclass != null && comInfo.b_manageclass != "") {
            //业户经济类型
            mini.get("#companyEconomyType1").setValue(comInfo.b_manageclass);
        }
        if (comInfo.b_economictype != null && comInfo.b_economictype != "") {
            //经济类型
            mini.get("#companyEconomyType").setValue(comInfo.b_economictype);
        }
        if (comInfo.taxiBaseNumber != null && comInfo.taxiBaseNumber != "") {
            //企业编号
            mini.get("#enterpriseNumber").setValue(comInfo.taxiBaseNumber);
        }
        if (comInfo.b_registeredaddress != null && comInfo.b_registeredaddress != "") {
            //注册地址
            mini.get("#registerAddress").setValue(comInfo.b_registeredaddress);
        }
        if (comInfo.b_legalperson != null && comInfo.b_legalperson != "") {
            //法定代表人
            mini.get("#applyLegal").setValue(comInfo.b_legalperson);
        }
        if (comInfo.operateaddress != null && comInfo.operateaddress != "") {
            //经营地址
            mini.get("#operatingAddress").setValue(comInfo.operateaddress);
        }
        if (comInfo.operatepostalcode != null && comInfo.operatepostalcode != "") {
            //经营地址邮编
            mini.get("#postcode").setValue(comInfo.operatepostalcode);
        }
        if (window.parent.itemId != null && window.parent.itemId != "") {
            //申请类型
            mini.get("#applicationClass").setValue(window.parent.itemId);
        }
        if (window.parent.itemObj.name != null && window.parent.itemObj.name != "") {
            //项目名称
            mini.get("#projectname").setValue(window.parent.itemObj.name);
        }
        if (comInfo.b_cnname != null && comInfo.b_cnname != "") {
            //业户名称
            mini.get("beforeMerchantName").setValue(comInfo.b_cnname);
        }
        //法人联系电话
        if (comInfo.b_legalpersonphone != null && comInfo.b_legalpersonphone != "") {
            mini.get("#representativeTel").setValue(comInfo.b_legalpersonphone);
        }
        if (comInfo.trustee_id != null && comInfo.trustee_id != "") {
            //托管单位
            mini.get("beforeDepositName").setValue(comInfo.trustee_id);
        }
        loading(false);
    }
</script>
</body>
</html>
