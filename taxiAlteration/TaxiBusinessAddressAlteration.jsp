<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="cn.seisys.iti.pdd.auth.entity.UserInfo" %>
<%@ page import="cn.seisys.iti.pdd.auth.util.ShiroUtils" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>巡游出租汽车客运服务经营地址变更</title>
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

        .asLabel1 .mini-textbox-border,
        .asLabel1 .mini-textbox-input,
        .asLabel1 .mini-buttonedit-border,
        .asLabel1 .mini-buttonedit-input,
        .asLabel1 .mini-textboxlist-border {
            border: 0;
            background: none;
            cursor: default;
        }

        .asLabel1 .mini-buttonedit-button,
        .asLabel1 .mini-textboxlist-close {
            display: none;
        }

        .asLabel1 .mini-textboxlist-item {
            padding-right: 8px;
        }

        .mini-checkboxlist-item label {
            color: #333333;
        }

    </style>
</head>
<body>
<div class="mini-fit">
    <div id="tabs1" class="mini-tabs" activeIndex="0" style="width:100%;height:100%;" plain="false" buttons="#tabsButtons" buttonsAlign="right">
        <div title="申请信息">
            <form id="form" method="post">
                <input id="ownerId" name="ownerId" class="mini-hidden" value=""/>
                <input id="applicationClass" name="applicationClass" class="mini-hidden" value=""/>
                <input id="overTime" name="overTime" class="mini-hidden" value=""/>
                <input id="id" name="id" class="mini-hidden" value=""/>
                <input id="companyName" name="companyName" class="mini-hidden" value=""/>
                <input id="companyEconomyType" name="companyEconomyType" class="mini-hidden" value=""/>
                <input id="projectnameSix" name="projectnameSix" class="mini-hidden" value="089103001002"/><%--业务事项--%>
                <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
                    <tr id="acceptNumber_tr_id" style="display:none;">
                        <td style="width:130px;" align="right">受理编号：</td>
                        <td style="width:100%" colspan="3">
                            <input id="acceptNumber" name="acceptNumber" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">申请日期：</td>
                        <td style="width:50%">
                            <input name="applyDate" id="applyDate" class="mini-datepicker asLabel" style="width:96%;" readOnly="true"
                                   value=""/>
                        </td>
                        <td style="width:130px;" align="right">申请人：</td>
                        <td style="width:50%">
                            <input name="applyName" id="applyName" class="mini-textbox  asLabel" style="width:96%;" readOnly="true" value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">业户类型：</td>
                        <td style="width:50%">
                            <input name="companyEconomyType1" id="companyEconomyType1" class="mini-combobox asLabel"
                                   url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=taxiEcoType"
                                   readOnly="true" textField="typeNm" valueField="typeCd" value="" style="width:96%;"
                            />
                        </td>
                        <td style="width:130px;" align="right">法定代表人：</td>
                        <td style="width:50%">
                            <input name="applyLegal" id="applyLegal" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">注册地址：</td>
                        <td style="width:100%" colspan="3">
                            <input name="registerAddress" id="registerAddress" class="mini-textbox  asLabel" style="width:98%;" readOnly="true"
                                   value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">法定代表人电话：</td>
                        <td style="width:100%" colspan="3">
                            <input name="representativeTel" id="representativeTel" class="mini-textbox asLabel" style="width:98%;" readOnly="true"
                                   value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">经营地址：</td>
                        <td style="width:100%" colspan="3">
                            <input name="operatingAddress" id="operatingAddress" class="mini-textbox asLabel" style="width:98%;" readOnly="true"
                                   value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">经营地址邮编：</td>
                        <td style="width:100%" colspan="3">
                            <input name="postcode" id="postcode" class="mini-textbox asLabel" style="width:98%;" readOnly="true" value=""
                            />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">项目名称：</td>
                        <td style="width:100%" colspan="3">
                            <input name="projectname" id="projectname" class="mini-textbox asLabel" style="width:98%;" readOnly="true"
                                   value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">联系人：</td>
                        <td style="width:50%">
                            <input id="contact" name="contact" class="mini-textbox" style="width:96%;" maxlength="20" value=""/>
                        </td>
                        <td style="width:130px;" align="right">联系电话：</td>
                        <td style="width:50%">
                            <input id="contactNumber" name="contactNumber" class="mini-textbox" style="width:96%;" value="" maxlength="15"
                                   onvalidation="onTelValidation"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">委托代理人：</td>
                        <td style="width:100%" colspan="3">
                            &nbsp;<input id="agent" name="agent" class="mini-textbox" style="width:98%;" value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">申请情况说明：</td>
                        <td style="width:100%" colspan="3">
                            &nbsp;<input id="applyDesc" name="applyDesc" class="mini-textarea" style="width: 98%;height:130px;" maxlength="200"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div title="业务信息">
            <h3 class="font-16">业户信息</h3>
            <hr/>
            <form id="form1">
                <table id="gridTable" class="gridTable">
                    <tr>
                        <th>变更类型</th>
                        <th>原信息</th>
                        <th>变更信息</th>
                    </tr>
                    <tr id="089103001002" name="089103001002">
                        <td>
                            <input name="" class="mini-textbox asLabel1" style="width:98%;" readOnly="true" value="经营地址"/>
                        </td>
                        <td>
                            <input name="operatingAddress" id="operatingAddress2" class="mini-textbox asLabel1" style="width:98%;" readOnly="true"
                                   value=""/>
                        </td>
                        <td>
                            &nbsp;<input name="changedOperatingAddress" id="changedOperatingAddress" class="mini-textbox" style="width:98%;"
                                         value=""/>
                        </td>
                    </tr>
                </table>
            </form>
            </table>
            </form>
        </div>
        <div title="申请材料">
            <iframe id="fileupload" src="${webProperties['app.url.commProcess']}/entrance/commFileListPage.htm" frameborder="0" scrolling="no"
                    marginheight="0" marginwidth="0" height="100%" width="100%"></iframe>
            <%--<%@ include file="/WEB-INF/jsp/include/commFileUploadPage.jsp" %>--%>
        </div>
        <div name="book" title="法律文书" visible="false">
            <div id="datagrid" class="mini-datagrid" url="${webProperties['app.url.approval']}/commCertificate/getCommCertificateList.htm"
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
        <a id="toggleBtn1" class="mini-button" iconCls="" onclick="acceptTaxiBusinessAddressAlteration()">受理</a>
        <a id="toggleBtn2" class="mini-button" iconCls="" onclick="noacceptTaxiBusinessAddressAlteration()">不予受理</a>
        <a id="toggleBtn3" class="mini-button" iconCls="" onclick="saveTaxiBusinessAddressAlteration()">保存</a>
        <a id="toggleBtn4" class="mini-button" iconCls="" onclick="reset()">重置</a>
    </div>
</div>
<script type="text/javascript">
    mini.parse();
    <%UserInfo userinfo = ShiroUtils.getUserInfo(request);%>
    var userId = '<%=userinfo.getUserid()%>';
    var userTaskId = "usertask26";

    var applyNumber;

    //获取url中的请求参数
    function getRequestString(key) {
        var reg = new RegExp("(^|&)" + key + "=([^&]*)(&|$)");
        var result = window.location.search.substr(1).match(reg);
        return result ? decodeURIComponent(result[2]) : null;
    }


    var model = "";

    $(document).ready(function () {
        var type = getRequestString("type");

        if (type == "1") {
            //创建申请 号
            getSq();
        }


        model = getRequestString("model");
        if ("view" == model) {

            labelModel("form");
            labelModel("form1");
            $("#acceptNumber_tr_id").show();
            $("#tabsButtons").hide();
        } else {
            window.parent.setHangYe("出租", "2011", "", "2");
        }

        var id = getRequestString("id");
        if (id != "" && id != null) {
            $("#fileupload").load(function () {
                queryTaxiBusinessLicense({id: id});
            })
        } else {
            var curDate = new Date();
            var strCurDate = mini.formatDate(curDate, 'yyyy-MM-dd HH:mm:ss');
            mini.get("applyDate").setValue(curDate);
        }

        var acceptNumber = getRequestString("acceptNumber");
        if ("" != acceptNumber && null != acceptNumber) {
            $("#fileupload").load(function () {

                queryTaxiBusinessLicense({acceptNumber: acceptNumber});
            })
        } else {
            mini.get("projectname").setValue(window.parent.itemObj.name);
            mini.get("applicationClass").setValue(window.parent.itemId);
            $("#fileupload").load(function () {
                $("#fileupload")[0].contentWindow.getList(mini.get("projectnameSix").getValue());
            })
        }

        //设置事项超时时间
        mini.get("overTime").setValue(window.parent.itemObj.approveTime);

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
     * 查询流程历史任务集合
     */
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
                        $("#fileupload")[0].contentWindow.setCeckDis();
                        $("#fileupload")[0].contentWindow.setUploadDis();
                        $("#fileupload")[0].contentWindow.shouJianBuZhen();
                    var arr = [];
                    for (var i = 0; i < result.length; i++) {
                        if (userId == result[i].assignee) {
                            arr.push(result[i].taskDefinitionKey);
                        }
                    }
                    param.nodeTaskid = arr.join(",");

                    //许可之后显示许可日期
                    if ("usertask22" == curTask) {
                        $(".openingD").show();
                    }
                }

                param.acceptNumber = acceptNumber,//业务编号
                    getLayerBook(param);

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
     * 保存巡游出租车
     */
    function saveTaxiBusinessAddressAlteration() {

        var businessObj = {};
        var form = new mini.Form("form");
        var obj = form.getData();

        form.validate();
        if (form.isValid() == false) {
            mini.alert("输入数据不符合规范，请重新填写");
            return;
        }

        //判断企业信息是否为空
        if (obj.applyName == "") {
            mini.alert("企业申请信息不能为空！");
            return;
        }

        //添加业务信息数据
        businessObj.changedOperatingAddress = mini.get("changedOperatingAddress").getValue();


        //传入formType
        businessObj.formType = mini.get("projectnameSix").getValue();

        //判断业务事项是否为空
        if (businessObj.formType == "") {
            mini.alert("业务事项不能为空！");
            return;
        }


        jQuery.extend(businessObj, obj);

        //申请号码
        businessObj.applyNumber = applyNumber;

        //日期格式化
        businessObj.applyDate = mini.formatDate(businessObj.applyDate, 'yyyy-MM-dd');

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

        loading(true);

        $.ajax({
            url: "${webProperties['app.url.approval']}/taxiAlteration/saveTaxiBusinessAddressAlteration.htm",
            type: 'post',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: {data: mini.encode(businessObj)},
            success: function (data) {
                loading(false);

                mini.alert("保存成功！");
            },
            error: function () {
                loading(false);
                mini.alert(jqXHR.responseText);
            }
        });
    }


    /**
     * 设置企业信息
     */
    function setCompanyData(comInfo) {
        mini.get("applyName").setValue(comInfo.b_cnname);
        mini.get("companyEconomyType").setValue(comInfo.b_economictype);
        mini.get("companyEconomyType1").setValue(comInfo.b_manageclass);
        mini.get("registerAddress").setValue(comInfo.b_registeredaddress);
        mini.get("applyLegal").setValue(comInfo.b_legalperson);
        mini.get("representativeTel").setValue(comInfo.b_legalpersonphone);
        mini.get("operatingAddress").setValue(comInfo.operateaddress);
        mini.get("postcode").setValue(comInfo.operatepostalcode);
        mini.get("operatingAddress2").setValue(comInfo.operateaddress);
        mini.get("ownerId").setValue(comInfo.b_enterpriseId);

        mini.get("companyName").setValue(comInfo.b_cnname);
    }


    /**
     * 受理巡游出租车
     */
    function acceptTaxiBusinessAddressAlteration() {
        mini.confirm("确定受理？", "确定？",
            function (action) {
                if (action == "ok") {

                    var businessObj = {};
                    var form = new mini.Form("form");
                    var obj = form.getData();

                    form.validate();
                    if (form.isValid() == false) {
                        mini.alert("输入数据不符合规范，请重新填写");
                        return;
                    }

                    //判断企业信息是否为空
                    if (obj.applyName == "") {
                        mini.alert("企业申请信息不能为空！");
                        return;
                    }

                    //添加业务信息数据
                    businessObj.changedOperatingAddress = mini.get("changedOperatingAddress").getValue();

                    //原经营地址信息
                    var operatingAddress = mini.get("operatingAddress").getValue();
                    //判断单位名称是否为空
                    if (businessObj.changedOperatingAddress == "") {
                        mini.alert("变更的业户信息不能为空！");
                        return;
                    }

                    //判断单位名称是否与原信息相同
                    if (businessObj.changedOperatingAddress == operatingAddress) {
                        mini.alert("变更的业户信息不能与原信息一致！");
                        return;
                    }

                    //传入formType
                    businessObj.formType = mini.get("projectnameSix").getValue();

                    //判断业务事项是否为空
                    if (businessObj.formType == "") {
                        mini.alert("业务事项不能为空！");
                        return;
                    }


                    jQuery.extend(businessObj, obj);
                    var approvingAuth = window.parent.itemObj.approvingAuth;
                    businessObj.applyType = approvalMap[approvingAuth];

                    //申请号码
                    businessObj.applyNumber = applyNumber;

                    //日期格式化
                    businessObj.applyDate = mini.formatDate(businessObj.applyDate, 'yyyy-MM-dd');

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
                    //加载中
                    loading(true);

                    $.ajax({
                        url: "${webProperties['app.url.approval']}/taxiAlteration/acceptTaxiBusinessAddressAlteration.htm",
                        type: 'post',
                        contentType: "application/x-www-form-urlencoded; charset=utf-8",
                        data: {data: mini.encode(businessObj)},
                        success: function (data) {
                            //解除加载
                            loading(false);

                            mini.alert("受理成功！");

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
                                paramObj.subitemid = businessObj.projectnameSix;
                                paramObj.nodeTaskid = userTaskId;
                                paramObj.acceptNumber = dataObj.acceptNumber;
                                getLayerBook(paramObj);
                            }
                            //设置申请材料只读
                            $("#fileupload")[0].contentWindow.setCeckDis();

                            //隐藏上传按钮
                            $("#fileupload")[0].contentWindow.setUploadDis();

                            //隐藏补证时间收件补证
                            $("#fileupload")[0].contentWindow.shouJianBuZhen();

                            labelModel("form");
                            labelModel("form1");

                            //切换至法律文书
                            mini.get("tabs1").setActiveIndex(3);
                        },
                        error: function () {
                            loading(false);
                            mini.alert(jqXHR.responseText);
                        }
                    });

                } else {
                    return;
                }
            }
        );
    }


    /**
     * 不予受理
     */
    function noacceptTaxiBusinessAddressAlteration() {
        mini.confirm("确定不予受理？", "确定？",
            function (action) {
                if (action == "ok") {
                    var businessObj = {};
                    var form = new mini.Form("form");
                    var obj = form.getData();

                    form.validate();
                    if (form.isValid() == false) {
                        mini.alert("输入数据不符合规范，请重新填写");
                        return;
                    }

                    //判断企业信息是否为空
                    if (obj.applyName == "") {
                        mini.alert("企业申请信息不能为空！");
                        return;
                    }

                    //添加业务信息数据
                    businessObj.changedOperatingAddress = mini.get("changedOperatingAddress").getValue();

                    //原经营地址信息
                    var operatingAddress = mini.get("operatingAddress").getValue();
                    //判断单位名称是否为空
                    if (businessObj.changedOperatingAddress == "") {
                        mini.alert("变更的业户信息不能为空！");
                        return;
                    }

                    //判断单位名称是否与原信息相同
                    if (businessObj.changedOperatingAddress == operatingAddress) {
                        mini.alert("变更的业户信息不能与原信息一致！");
                        return;
                    }

                    //传入formType
                    businessObj.formType = mini.get("projectnameSix").getValue();

                    //判断业务事项是否为空
                    if (businessObj.formType == "") {
                        mini.alert("业务事项不能为空！");
                        return;
                    }


                    jQuery.extend(businessObj, obj);

                    //传入formType
                    businessObj.formType = mini.get("projectnameSix").getValue();

                    //判断业务事项是否为空
                    if (businessObj.formType == "") {
                        mini.alert("业务事项不能为空！");
                        return;
                    }

                    var approvingAuth = window.parent.itemObj.approvingAuth;
                    businessObj.applyType = approvalMap[approvingAuth];

                    //申请号码
                    businessObj.applyNumber = applyNumber;

                    //日期格式化
                    businessObj.applyDate = mini.formatDate(businessObj.applyDate, 'yyyy-MM-dd');

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

                    //加载中
                    loading(true);
                    $.ajax({
                        url: "${webProperties['app.url.approval']}/taxiAlteration/noacceptTaxiBusinessAddressAlteration.htm",
                        type: 'post',
                        contentType: "application/x-www-form-urlencoded; charset=utf-8",
                        data: {data: mini.encode(businessObj)},
                        success: function (data) {
                            //解除加载
                            loading(false);
                            mini.alert("不予受理成功！");

                            var dataObj = mini.decode(data);
                            if (dataObj) {
                                mini.get("acceptNumber").setValue(dataObj.acceptNumber);
                                $("#acceptNumber_tr_id").show();
                                $("#tabsButtons").hide();
                                getCurrentImg({instanceId: dataObj.processInstanceId});

                                acceptNumber = dataObj.acceptNumber;
                                processInstanceId = dataObj.processInstanceId;

                                var paramObj = {};
                                paramObj.subitemid = businessObj.projectnameSix;
                                paramObj.nodeTaskid = userTaskId;
                                paramObj.acceptNumber = dataObj.acceptNumber;
                                getLayerBook(paramObj);
                            }

                            //设置申请材料只读
                            $("#fileupload")[0].contentWindow.setCeckDis();

                            //隐藏上传按钮
                            $("#fileupload")[0].contentWindow.setUploadDis();

                            //隐藏补证时间收件补证
                            $("#fileupload")[0].contentWindow.shouJianBuZhen();

                            labelModel("form");
                            labelModel("form1");
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            loading(false);
                            mini.alert(jqXHR.responseText);
                        }
                    });
                } else {
                    return;
                }
            }
        );
    }

    //业务信息更改后的信息
    var changedData = {};

    /**
     * 查询信息
     */
    function queryTaxiBusinessLicense(businessSearchObj) {
        $.ajax({
            url: "${webProperties['app.url.approval']}/taxiAlteration/queryTaxiBusinessAddressAlteration.htm",
            type: 'post',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: {data: mini.encode(businessSearchObj)},
            success: function (data) {
                var result = mini.decode(data);
                var dataObj = result.data[0];
                setTaxiBusinessData(dataObj);

                //申请号
                applyNumber = dataObj.applyNumber;
                //设置业务信息更改后的信息
                changedData = dataObj;

                //调用材料列表，得到信息
                var nameSixData = mini.get("projectnameSix");

                    $("#fileupload")[0].contentWindow.getList(nameSixData.getValue());

                var fileInfo = [];
                //展示材料信息
                var applyMaterials = dataObj.applyMaterials;
                var applyMaterialArr = [];

                for (var key in applyMaterials) {
                    applyMaterialArr = applyMaterials[key];
                }
                for (var i = 0; i < applyMaterialArr.length; i++) {
                    var params = {};
                    params.id = applyMaterialArr[i].materialCode;
                    params.fileName = applyMaterialArr[i].materialName;
                    params.shoudao = applyMaterialArr[i].getFileCount;
                    fileInfo.push(params);
                }


                var type = getRequestString("type");
                //1是申请受理的页面，4是草稿箱
                if ("1" != type && "4" != type) {
                    getHistoryTasksByCondition({instanceId: window.parent.processInstanceId}, dataObj);
                }


                //4是草稿箱，设置材料信息
                if (type == "4") {
                    $("#fileupload")[0].contentWindow.setFileInfo(fileInfo, dataObj.applyNumber);
                } else {
                        $("#fileupload")[0].contentWindow.setFileInfo(fileInfo, dataObj.acceptNumber);
                }

                //进入草稿箱，并且是编辑状态
                //草稿箱进入时，需要把企业信息查询并插入到上方公共区域
                if (type == "4" && model == "edit") {
                    window.parent.setComInfo(dataObj.applyName);
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                mini.alert(jqXHR.responseText);
            }
        });
    }

    function setTaxiBusinessData(obj) {
        var form1 = new mini.Form("form1");
        var form = new mini.Form("form");
        form1.setData(obj);
        form.setData(obj);

    }


    //重置
    function reset() {
        mini.confirm("确定重置记录？", "确定？",
            function (action) {
                if (action == "ok") {
                    mini.get("applyName").setValue("");
                    mini.get("companyEconomyType").setValue("");
                    mini.get("companyEconomyType1").setValue("");
                    mini.get("registerAddress").setValue("");
                    mini.get("applyLegal").setValue("");
                    mini.get("representativeTel").setValue("");
                    mini.get("operatingAddress").setValue("");
                    mini.get("postcode").setValue("");

                    mini.get("contact").setValue("");
                    mini.get("contactNumber").setValue("");
                    mini.get("agent").setValue("");
                    mini.get("applyDesc").setValue("");

                    mini.get("operatingAddress2").setValue("");
                    mini.get("changedOperatingAddress").setValue("");

                    mini.get("companyName").setValue("");

                    mini.get("projectnameSix").setValue("089103001002");

                    //重置复选框
                    $("#fileupload")[0].contentWindow.setCeckNoChe();

                    //清空公共区企业信息
                    window.parent.setNone();

                    var data = mini.get("projectnameSix");
                    //调用材料列表，得到信息
                    $("#fileupload")[0].contentWindow.getList(data.getValue());

                } else {
                    return;
                }
            }
        );
    }


    //方法体里将业务信息里所有非申请信息的内容变为可编辑模式
    function updateBusinessModel() {
        var changedOperatingAddress = mini.get("changedOperatingAddress");
        if (changedOperatingAddress.setReadOnly) changedOperatingAddress.setReadOnly(false);
        if (changedOperatingAddress.removeCls) changedOperatingAddress.removeCls("asLabel");
    }


    /**
     * 更新业务信息
     */
    function updateBusinessInfo() {

        changedData.changedOperatingAddress = mini.get("changedOperatingAddress").getValue();

        //原经营地址信息
        var operatingAddress = mini.get("operatingAddress").getValue();
        //判断单位名称是否为空
        if (changedData.changedOperatingAddress == "") {
            mini.alert("输入数据不符合规范，请重新填写");
            return false;
        }

        //判断单位名称是否与原信息相同
        if (changedData.changedOperatingAddress == operatingAddress) {
            mini.alert("输入数据不符合规范，请重新填写");
            return false;
        }

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
        changedData.applyMaterials = {
            copyCode: arr
        }


        // 更新业务数据
        var updateResult = false;
        $.ajax({
            url: "${webProperties['app.url.approval']}/taxiAlteration/updateTaxiBusinessAddressAlteration.htm",
            type: 'post',
            async: false,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: {data: mini.encode(changedData)},
            success: function (data) {
                // 更新成功，通知父页面
                updateResult = true;

            },
            error: function (jqXHR, textStatus, errorThrown) {
                // 发生异常，弹出警告框
                mini.alert(jqXHR.responseText);
                updateResult = false;
            }
        });
        return updateResult;
    }


    /**
     * 获取法人信息
     * @param id
     */
    function getFr(id) {
        mini.open({
            url: "${webProperties['app.url.approval']}/taxiIndividual/selectLegal.htm",
            title: "法人选择", width: 750, height: 600,
            onload: function () {

            },
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = mini.clone(data);
                    if (data) {
                        mini.get(id).setValue(data.b_legalperson);
                    }
                }
            }
        });
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

</script>
</body>
</html>
