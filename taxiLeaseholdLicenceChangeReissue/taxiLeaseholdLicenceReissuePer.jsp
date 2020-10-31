<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title></title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <jsp:include page="../include/meta.jsp"/>
    <style type="text/css">
        html,
        body {
            margin: 0;
            padding: 0;
            border: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
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

        .row-background-color1 {
            background-color: #FFDAB9 !important;
        }
    </style>
</head>

<body style="background:white">
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
                <input id="enterpriseNumber" name="enterpriseNumber" style="display:none" class="mini-hidden" value=""/>
                <input id="companyEconomyType" name="companyEconomyType" style="display:none" class="mini-hidden" value=""/>
                <input id="projectnameSix" name="projectnameSix" style="display:none" class="mini-hidden" value=""/>
            </form>
            <form id="applicationForm" method="post">
                <table border="0" cellpadding="1" cellspacing="2"
                       style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
                    <tr id="applyNmTr" style="display:none">
                        <td style="width:130px;" align="right">受理编号：</td>
                        <td style="width:100%" colspan="3">
                            <input id="acceptNumber" name="acceptNumber" class="mini-textbox asLabel" style="width:30%;"
                                   readOnly="true" value="" value=""
                            />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">申请日期：</td>
                        <td style="width:50%">
                            <input id="applyDate" name="applyDate" class="mini-datepicker asLabel" style="width:90%;"
                                   readOnly="true" value="" format="yyyy-MM-dd"
                                   value=""/>
                        </td>
                        <td style="width:130px;" align="right">申请人：</td>
                        <td style="width:50%">
                            <input id="applyName" name="applyName" class="mini-textbox  asLabel" style="width:90%;"
                                   readOnly="true" value=""
                            />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">业户类型：</td>
                        <td style="width:50%">
                            <input id="companyEconomyType1" name="companyEconomyType1" class="mini-combobox asLabel"
                                   readOnly="true" valueField="typeCd"
                                   textField="typeNm" style="width:90%;" value=""
                                   url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=taxiEcoType"
                            />
                        </td>
                        <td style="width:130px;" align="right">注册地址：</td>
                        <td style="width:50%">
                            <input id="registerAddress" name="registerAddress" class="mini-textbox  asLabel"
                                   style="width:90%;" readOnly="true" value=""
                            />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">法定代表人：</td>
                        <td style="width:50%">
                            <input id="applyLegal" name="applyLegal" class="mini-textbox  asLabel" style="width:90%;"
                                   readOnly="true" value=""
                            />
                        </td>
                        <td style="width:130px;" align="right">法定代表人电话 :</td>
                        <td style="width:50%">
                            <input id="representativeTel" name="representativeTel" class="mini-textbox  asLabel"
                                   style="width:90%;" readOnly="true" value=""
                            />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">经营地址：</td>
                        <td style="width:50%">
                            <input id="operatingAddress" name="operatingAddress" class="mini-textbox  asLabel"
                                   style="width:90%;" readOnly="true" value=""
                            />
                        </td>
                        <td style="width:130px;" align="right">经营地址邮编：</td>
                        <td style="width:50%">
                            <input id="postcode" name="postcode" class="mini-textbox  asLabel" style="width:90%;"
                                   readOnly="true" value=""
                            />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">项目名称：</td>
                        <td style="width:100%" colspan="3">
                            <input id="projectname" name="projectname" class="mini-textbox asLabel" style="width:96%;"
                                   readOnly="true" value=""
                            />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">联系人：</td>
                        <td style="width:50%">
                            <input id="contact" name="contact" class="mini-textbox" style="width:90%;"
                                   vtype="maxLength:20" value=""
                            />
                        </td>
                        <td style="width:130px;" align="right">联系电话：</td>
                        <td style="width:50%">
                            <input id="contactNumber" name="contactNumber" class="mini-textbox" style="width:90%;"
                                   onvalidation="onTelValidation" value=""
                                   vtype="maxLength:15"/>
                        </td>
                    </tr>
                    <tr>
                    <tr>
                        <td style="width:130px;" align="right">委托代理人：</td>
                        <td style="width:50%">
                            <input id="agent" name="agent" class="mini-textbox" style="width:90%;" vtype="maxLength:20"
                                   value=""
                            />
                        </td>
                    </tr>

                    <tr>
                        <td style="width:130px;" align="right">申请情况说明：</td>
                        <td style="width:100%" colspan="3">
                            <input id="applyDesc" name="applyDesc" class="mini-textarea"
                                   style="width: 96%;height:130px;" value=""
                            />
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div title="业务信息">
            <div>
                <!-- 开始 -->
                <form id="businessForm">
                    <div id="searchDiv" style="height: 40px;width: 48%;">
                        车牌照号：
                        <input id="licensePlate1" class="mini-combobox" style="width:10%;" value="02" textField="typeNm"
                               valueField="typeCd" width="10%" emptyText="请选择..."
                               allowInput="false" showNullItem="true"
                               url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=carFirstWord"
                        />
                        <input id="licensePlate4" class="mini-textbox" style="width:22%;"/>
                        &nbsp;&nbsp;车牌颜色：
                        <input id="licenseColor" class="mini-combobox" style="width:16%;" textField="typeNm"
                               valueField="typeCd" emptyText="请选择..." nullItemText="请选择..."
                               allowInput="false" showNullItem="true"
                               url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=plantColor"
                        />
                        <a id="execQuery" class="btn btn-info" iconCls="" onclick="execQuery()">查询</a>
                        <a id="forReset" class="btn btn-info" iconCls="" onclick="forReset()">重置</a>
                    </div>
                    <div style="width: 48%;height: 100%;float: left;">
                        <div id="datagridCar" class="mini-datagrid" idField="id"
                             url="${webProperties['app.url.approval']}/taxi/queryLeaseReissueCarList.htm"
                             allowSortColumn="true" showPager="true" pageSize="10"
                             pager="pager1" style="width: 98%; height: 500px;" allowRowSelect="true" multiSelect="true"
                             sizeList="[10,20,30]" onloaderror="mini.alert(e.errorMsg);">
                            <div property="columns">
                                <div type="checkcolumn" field="checkcolumn"></div>
                                <div field="id" visible='false'></div>
                                <div field="selectCarId" visible='false'></div>
                                <div field="licensePlate" width="20%" headerAlign="center" align="center"
                                     allowSort="false">车牌照号
                                </div>
                                <div field="enterpriseName" width="60%" headerAlign="center" align="center"
                                     allowSort="false">企业名称
                                </div>
                                <div field="isIllegal" width="20%" headerAlign="center" align="center"
                                     allowSort="false">是否违章
                                </div>
                                <div field="licenseColor" width="20%" headerAlign="center" align="center"
                                     allowSort="false" visible="false">车牌颜色
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="width: 3%;height: 100%;float: left;text-align:center;">
                        <div style="padding: 150px 0 0 0">
                            <div>
                                <a id="addRight" class="btn green-soft btn-sm" iconCls="" onclick="addRigthCar()">
                                    <i class="fa fa-step-forward"></i>
                                </a>
                            </div>
                            <div style="margin-top: 10px">
                                <a id="addLeft" class="btn green-soft btn-sm" iconCls="" onclick="addLeftCar()">
                                    <i class="fa fa-step-backward"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div style="width: 48%;height: 100%;float: right;">
                        <div id="datagridCarYes" class="mini-datagrid" style="width:98%;height:500px;"
                             allowResize="false" url="" idField="id" multiSelect="true"
                             showPager="false">
                            <div property="columns">
                                <div type="checkcolumn"></div>
                                <div type="indexcolumn" align="center" width='50px' headerAlign="center">序号</div>
                                <div field="id" visible='false'></div>
                                <div field="selectCarId" visible='false'></div>
                                <div field="licensePlate" width="20%" headerAlign="center" align="center"
                                     allowSort="false">车牌照号
                                </div>
                                <div field="enterpriseName" width="60%" headerAlign="center" align="center"
                                     allowSort="false">企业名称
                                </div>
                                <div field="isIllegal" width="20%" headerAlign="center" align="center"
                                     allowSort="false">是否违章
                                </div>
                                <div field="licenseColor" width="20%" headerAlign="center" align="center"
                                     allowSort="false" visible="false">车牌颜色
                                </div>

                            </div>
                        </div>
                    </div>
                </form>
                <!-- 结束 -->
                <div id="datagridCarReadOnly" class="mini-datagrid" style="width:96%;height:500px;display:none;"
                     allowResize="false" url=""
                     idField="id" showPager="false">
                    <div property="columns">
                        <div field="id" visible='false'></div>
                        <div field="selectCarId" visible='false'></div>
                        <div field="licensePlate" width="20%" headerAlign="center" align="center" allowSort="false">
                            车牌照号
                        </div>
                        <div field="enterpriseName" width="60%" headerAlign="center" align="center" allowSort="false">
                            企业名称
                        </div>
                        <div field="isIllegal" width="20%" headerAlign="center" align="center" allowSort="false">是否违章
                        </div>
                        <div field="licenseColor" width="20%" headerAlign="center" align="center" allowSort="false"
                             visible="false">车牌颜色
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div title="申请材料">
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
        <a id="toggleBtn1" class="mini-button" iconCls="" onclick="submitSL()">当场办结</a>
        <a id="toggleBtn2" class="mini-button" iconCls="" onclick="submitNoSL()">不予受理</a>
        <a id="toggleBtn3" class="mini-button" iconCls="" onclick="submitSave()">保存</a>
        <a id="toggleBtn4" class="mini-button" iconCls="" onclick="cleanInput()">重置</a>
    </div>
</div>
</body>

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

    //这两个全局变量必须定义，打印需要用到
    var acceptNumber;
    var processInstanceId;

    var illegalCarInfoList = []; // 汽车违法信息
    var illegalCarInfoMap = Map; // 汽车违法信息

    var gridCarList = mini.get("datagridCar"); //左侧
    var gridNewCarList = mini.get("datagridCarYes"); //右侧
    var datagridCarReadOnly = mini.get("datagridCarReadOnly");//只读

    $(document).ready(function () {

        $("#fileupload").load(function () {
            $("#fileupload")[0].contentWindow.getList(window.parent.itemId);
        });

        if (type == "1") {
            //创建申请 号
            getSq();
        }

        var enterpriseNumber = mini.get("enterpriseNumber").getValue();
        if (enterpriseNumber != "" && enterpriseNumber != null) {
            getIllegalCarInfo(enterpriseNumber);//获取违法信息
        }

        if ("view" == model) {
            labelModel("applicationForm");
            labelModel("businessForm");
            //隐藏业务信息
            $('#businessForm').hide();
            //显示选中车辆信息
            $('#datagridCarReadOnly').show();
            $("#applyNmTr").show();
            $("#tabsButtons").hide();

            if (type == "2") {
                var tabs = mini.get("tabs1");
                tabs.on("activechanged", function (e) {
                    var tab = e.tab;
                    if (tab.title == "申请材料" && model == "view" && type == "2") {
                        $("#tabsButtons").show();
                        $("#toggleBtn1").hide();
                        $("#toggleBtn2").hide();
                        $("#toggleBtn3").show();
                        $("#toggleBtn4").hide();
                    } else {
                        $("#tabsButtons").hide();
                    }
                })
            }
        } else {
            mini.get("#applyDate").setValue(new Date());
            /**
             * scopename
             * tradeId 新增为空  出租2011 租赁：2012
             * type 新增为1，别的为空
             * managerClass:个体工商填 2，企业填 1
             * */
            window.parent.setHangYe("租赁", '2012', '', '');
        }
        var id = getRequestString("id");
        if (id != "" && id != null && type == "4") {
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
            mini.get("#applyDate").setValue(new Date());
            //巡游个体工商户名称、托管单位变更
            mini.get("projectname").setValue(window.parent.itemObj.name);
            //089104
            mini.get("applicationClass").setValue(window.parent.itemId);
            //超时时间
            mini.get("overTime").setValue(window.parent.itemObj.approveTime);
            $("#fileupload").load(function () {
                $("#fileupload")[0].contentWindow.getList(window.parent.itemId);
            })
        }
        getApprovalType({});

        gridCarList.on("drawcell", function (e) {
            var record = e.record;
            var field = e.field;
            if (field == 'enterpriseName') {
                var gridHtml = mini.get("applyName").getValue();
                e.cellHtml = gridHtml;
                e.record.enterpriseName = gridHtml;
            }

            // 车辆违章信息:isIllegal
            if (field == "isIllegal") {
                var gridHtml = "";
                var vehiclelicense = (record.vehiclelicense != null && record.vehiclelicense != "") ? record.vehiclelicense : "";
                vehiclelicense = vehiclelicense.replace("-", "");

                if (illegalCarInfoMap[vehiclelicense] != null && illegalCarInfoMap[vehiclelicense] != "") {
                    gridHtml += illegalCarInfoMap[vehiclelicense];

                    // 如果存在违章，则显示其他颜色
                    if (illegalCarInfoMap[vehiclelicense] != "无违章信息") {
                        e.rowStyle = "background:#DEB887";
                    }
                } else {
                    gridHtml += "无违章信息";
                }
                e.cellHtml = gridHtml;
            }
            if (field == "checkcolumn") {
                var rightGridData = gridNewCarList.getData();
                if (rightGridData != null && rightGridData.length > 0) {
                    for (var i = 0; i < rightGridData.length; i++) {
                        if (e.record.licensePlate == rightGridData[i].licensePlate) {
                            e.rowStyle = "background:#FFDAB9";
                        }

                    }
                }
            }
        });
        gridNewCarList.on("drawcell", function (e) {
            var record = e.record;
            var field = e.field;
            if (field == 'enterpriseName') {
                var gridHtml = mini.get("applyName").getValue();
                e.cellHtml = gridHtml;
            }
            // 车辆违章信息:isIllegal
            if (field == "isIllegal") {
                var gridHtml = "";
                var licensePlate = (record.licensePlate != null && record.licensePlate != "") ? record.licensePlate : "";
                licensePlate = licensePlate.replace("-", "");

                if (illegalCarInfoMap[licensePlate] != null && illegalCarInfoMap[licensePlate] != "") {
                    gridHtml += illegalCarInfoMap[licensePlate];

                    // 如果存在违章，则显示其他颜色
                    if (illegalCarInfoMap[licensePlate] != "无违章信息") {
                        e.rowStyle = "background:#DEB887";
                    }
                } else {
                    gridHtml += "无违章信息";
                }
                e.record.isIllegal = gridHtml;
                e.cellHtml = gridHtml;
            }
        });
        datagridCarReadOnly.on("drawcell", function (e) {
            var record = e.record;
            var field = e.field;
            if (field == 'enterpriseName') {
                var gridHtml = mini.get("applyName").getValue();
                e.cellHtml = gridHtml;
            }
            // 车辆违章信息:isIllegal
            if (field == "isIllegal") {
                var gridHtml = "";
                var licensePlate = (record.licensePlate != null && record.licensePlate != "") ? record.licensePlate : "";
                licensePlate = licensePlate.replace("-", "");

                if (illegalCarInfoMap[licensePlate] != null && illegalCarInfoMap[licensePlate] != "") {
                    gridHtml += illegalCarInfoMap[licensePlate];

                    // 如果存在违章，则显示其他颜色
                    if (illegalCarInfoMap[licensePlate] != "无违章信息") {
                        e.rowStyle = "background:#DEB887";
                    }
                } else {
                    gridHtml += "无违章信息";
                }
                e.record.isIllegal = gridHtml;
                e.cellHtml = gridHtml;
            }
        });
        // 表格渲染完毕事件
        gridCarList.on("update", function (e) {
            var data = gridCarList.getData();
            if (data == null || data == '' || data.length == 0) {
                //表数据为空时，去掉全选框的勾选
                $("#datagridCar .mini-grid-checkbox").removeClass("mini-grid-checkbox-checked");
            }
        });
        // 表格渲染完毕事件
        gridNewCarList.on("update", function (e) {
            var data = gridNewCarList.getData();
            if (data == null || data == '' || data.length == 0) {
                //表数据为空时，去掉全选框的勾选
                $("#datagridCarYes .mini-grid-checkbox").removeClass("mini-grid-checkbox-checked");
            }
        });
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
     * 受理
     */
    function submitSL() {
        var url = "${webProperties['app.url.approval']}/taxi/taxiLeaseholdLicenceReissueSL.htm";
        operating(url, true, 1, "确定受理吗？")
    }

    /**
     * 不予受理
     */
    function submitNoSL() {
        var url = "${webProperties['app.url.approval']}/taxi/taxiLeaseholdLicenceReissueNoSL.htm";
        operating(url, true, 3, "确定不予受理吗？")
    }

    /**
     * 保存
     */
    function submitSave() {
        if (type == "2" && model == "view") {
            loading(true);
            var jsonData = {};
            // 获取附件信息
            $("#fileupload")[0].contentWindow.getFileInfo(mini.get("#acceptNumber").getValue());
            var fileInfo = $("#fileupload")[0].contentWindow.fileInfo;
            var arr = [];
            for (var i = 0; i < fileInfo.length; i++) {
                var GetFileEntity = {};
                GetFileEntity.materialCode = fileInfo[i].id;
                GetFileEntity.materialName = fileInfo[i].fileName;
                GetFileEntity.getFileCount = fileInfo[i].shoudao;
                arr.push(GetFileEntity);
            }
            jsonData.applyMaterials = {
                'copyCode': arr
            };
            var acceptNumber = mini.get("acceptNumber").getValue();
            var applicationClass = mini.get("applicationClass").getValue();
            var projectnameSix = mini.get("projectnameSix").getValue();
            jsonData.acceptNumber = acceptNumber;
            jsonData.applicationClass = applicationClass;
            jsonData.projectnameSix = projectnameSix;
            //保存附件
            /*var result=$("#fileupload")[0].contentWindow.uploadSave(acceptNumber);*/
            //保存附件信息
            $.ajax({
                url: "${webProperties['app.url.approval']}/taxi/leaseSaveFileInfo.htm",
                data: {
                    data: mini.encode(jsonData)
                },
                type: 'POST',
                dataType: "json",
                async: false,//同步请求
                success: function (data) {
                    loading(false);
                    mini.alert("保存成功");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    loading(false);
                    mini.alert("保存失败");
                }
            });
        } else {
            var url = "${webProperties['app.url.approval']}/taxi/taxiLeaseholdLicenceReissueSave.htm";
            operating(url, true, 2, '')
        }

    }

    /**
     * 操作
     * @param url 请求地址
     * @param flag true ：开启验证
     * @param type 1:受理 2：保存 3 ：不予受理
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
            return submitData(url, type, applicationForm, businessForm, hiddenDomainForm);
        }
    }

    /**
     * 提交数据
     * */
    function submitData(url, type, applicationForm, businessForm, hiddenDomainForm) {
        try {
            var gridNewCarList = mini.get("datagridCarYes");
            var newCarList = gridNewCarList.getData();
            if (type == "1" || type == "3") {
                if (newCarList.length <= 0) {
                    //切换tab
                    mini.get('tabs1').setActiveIndex(1);
                    mini.alert("请选择车辆！");
                    return;
                }
                if (type == "1") {
                    for (var i = 0; i < newCarList.length; i++) {
                        if (newCarList[i].isIllegal == "有违章信息") {
                            mini.confirm("有违章车辆记录？", "确定继续？", function () {
                                if (action == "ok") {
                                } else {
                                    e.cancel = true;
                                    return;
                                }
                            });
                        }
                    }
                }
            }
            loading(true);
            // 获取页面数据
            var Obj = {};

            var enterType = getRequestString("type");

            var applicationData = applicationForm.getData(true);
            var hiddenDomainData = hiddenDomainForm.getData(true);

            jQuery.extend(Obj, applicationData, hiddenDomainData);
            //审批判断
            var approvingAuth = window.parent.itemObj.approvingAuth;
            //删除元素
            delete Obj.businessMatters;
            Obj.applyType = approvalMap[approvingAuth];
            //事项类型
            Obj.projectnameSix = window.parent.itemId;
            //申请号码
            Obj.applyNumber = applyNumber;
            //判断从哪个页面进入的1：直接办结的 4：草稿箱办结的
            Obj.enterType = enterType;
            //申请材料
            Obj.applyMaterials = getApplicationMaterials();
            //业务数据
            //获取右侧已选车牌数据 转成json
            var carJson = JSON.stringify(newCarList);
            $.ajax({
                url: url,
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: {
                    data: mini.encode(Obj),
                    carJson: carJson
                },
                type: 'POST',
                success: function (data) {
                    loading(false);
                    //受理
                    if (type == 1) {
                        var dataObj = mini.decode(data);
                        if (dataObj) {
                            mini.get("acceptNumber").setValue(dataObj.acceptNumber);
                            $("#applyNmTr").show();
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

                        //隐藏业务信息
                        $('#businessForm').hide();
                        //显示选中车辆信息
                        $('#datagridCarReadOnly').show();

                        mini.get('datagridCarReadOnly').setData(mini.get('datagridCarYes').getData());
                        $("#fileupload")[0].contentWindow.setCeckDis();
                        $("#fileupload")[0].contentWindow.setUploadDis();
                        $("#fileupload")[0].contentWindow.shouJianBuZhen();

                        //切换至法律文书tab
                        mini.get('tabs1').setActiveIndex(3);

                        createVehicleOperCert(dataObj.acceptNumber, "lease");
                    } else if (type == 2) {
                        mini.alert("保存成功");
                    } else if (type == 3) {
                        var dataObj = mini.decode(data);
                        if (dataObj) {
                            mini.get("acceptNumber").setValue(dataObj.acceptNumber);

                            $("#applyNmTr").show();
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
                        //隐藏业务信息
                        $('#businessForm').hide();
                        //显示选中车辆信息
                        $('#datagridCarReadOnly').show();
                        mini.get('datagridCarReadOnly').setData(mini.get('datagridCarYes').getData());

                        labelModel("applicationForm");
                        labelModel("businessForm");
                        $("#fileupload")[0].contentWindow.setCeckDis();
                        $("#fileupload")[0].contentWindow.setUploadDis();
                        $("#fileupload")[0].contentWindow.shouJianBuZhen();
                        mini.alert("不予受理成功");
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    loading(false)
                    mini.alert(jqXHR.responseText);
                }
            });
        } catch (e) {
            loading(false);
            mini.alert("服务调用异常，请联系管理员");
        }
    }


    /**
     * 制证
     * */
    function createVehicleOperCert(acceptNumber,type) {
        loading(true)
        $.ajax({
            url: "${webProperties['app.url.approval']}/taxi/createVehicleOperCert.htm",
            type: 'get',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: {
                acceptNumber: acceptNumber,
                type:type
            },
            async: false, //  默认为true  异步请求
            success: function (data) {
                loading(false)
                mini.alert("当场办结成功");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                loading(false)
                mini.alert(jqXHR.responseText);
            }
        });
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
    function cleanInput() {
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
                    mini.get("projectname").setValue(window.parent.itemObj.name);

                    gridCarList.load();
                    gridNewCarList.clearRows();

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
     * 查询信息
     */
    function queryTaxiBusinessLicense(businessSearchObj) {
        loading(true);
        $.ajax({
            url: "${webProperties['app.url.approval']}/taxi/queryLeaseReissueInfo.htm",
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

                if (type == "4" && model == "edit") {
                    window.parent.setComInfo(dataObj.applyName);

                    initLeftGridData();

                    initGridData(dataObj.vehicles);
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

        if (obj.vehicles.length > 0) {
            mini.get('datagridCarReadOnly').setData(obj.vehicles)
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

        $("#fileupload")[0].contentWindow.setFileInfo(fileArr, number);
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
        var formType = mini.get("formType").getValue();
        var key = formType + "_" + formType;
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
                //补件
                if ("2" == type) {
                    var curTask = result[result.length - 1].taskDefinitionKey;
                    param.nodeTaskid = curTask;
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

    // 通过企业Id，获取汽车违法信息
    function getIllegalCarInfo(enterpriseNumber) {
        $.ajax({
            url: "${webProperties['app.url.approval']}/taxi/queryIllegalCarInfoAllByComId.htm",
            data: {
                'enterpriseId': enterpriseNumber
            },
            type: 'POST',
            dataType: "json",
            async: true, //  默认为true  异步请求
            success: function (data) {
                illegalCarInfoList = data;
                // 转换成MAP
                if (illegalCarInfoList != null && illegalCarInfoList.length > 0) {
                    for (var i = 0; i < illegalCarInfoList.length; i++) {
                        illegalCarInfoMap[illegalCarInfoList[i].wzclph] = illegalCarInfoList[i].clzt;
                    }


                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
            }
        });
    }

    //初始化左表数据
    function initLeftGridData() {
        var param = {};
        var enterpriseName = mini.get("enterpriseNumber").getValue;
        var enterpriseId = mini.get("#ownerId").getValue();
        if ((enterpriseName != "" && enterpriseName != null) && (enterpriseId != "" && enterpriseId != null)) {
            //车辆颜色
            var licenseColor = mini.get("licenseColor").getValue();
            // 省份
            var licensePlate1 = mini.get("licensePlate1").getText();
            //
            var licensePlate4 = mini.get("licensePlate4").getValue();
            param.licensesubject = licenseColor;
            param.locations = licensePlate1;
            param.vehiclelicense = licensePlate4;
            param.enterpriseId = enterpriseId;
            param.enterpriseName = enterpriseName;
            gridCarList.load(param, function () {
                var data = gridCarList.getData();
                if (data == null || data == '' || data.length == 0) {
                    $("#datagridCar .mini-grid-checkbox").removeClass("mini-grid-checkbox-checked");
                }
            });

        }
    }

    // 刷新右表数据
    function initGridData(vehList) {
        gridNewCarList.clearRows();
        if (vehList != null && vehList != "") {
            mini.get('datagridCarYes').setData(eval(vehList));

            gridNewCarList.on("drawcell", function (e) {
                var record = e.record;
                var field = e.field;
                if (field == 'enterpriseName') {
                    var gridHtml = mini.get("applyName").getValue();
                    e.cellHtml = gridHtml;
                }
                // 车辆违章信息:isIllegal
                if (field == "isIllegal") {
                    var gridHtml = "";
                    var licensePlate = (record.licensePlate != null && record.licensePlate != "") ? record.licensePlate : "";
                    licensePlate = licensePlate.replace("-", "");

                    if (illegalCarInfoMap[licensePlate] != null && illegalCarInfoMap[licensePlate] != "") {
                        gridHtml += illegalCarInfoMap[licensePlate];

                        // 如果存在违章，则显示其他颜色
                        if (illegalCarInfoMap[licensePlate] != "无违章信息") {
                            e.rowStyle = "background:#DEB887";
                        }
                    } else {
                        gridHtml += "无违章信息";
                    }
                    e.record.isIllegal = gridHtml;
                    e.cellHtml = gridHtml;
                }
            });
        }
    }


    //加入右侧
    function addRigthCar() {
        var rowsCar = gridCarList.getSelecteds();
        if (rowsCar.length > 0) {
            for (var i = 0; i < rowsCar.length; i++) {
                //验证右侧是否已经存在号牌 已存在 不进行添加
                if (checkRightCarIFYes(rowsCar[i].licensePlate) == true) {
                    var newRow = {
                        selectCarId: rowsCar[i].selectCarId,
                        id: rowsCar[i].id,
                        licensePlate: rowsCar[i].licensePlate,
                        enterpriseName: rowsCar[i].enterpriseName,
                        isIllegal: rowsCar[i].isIllegal
                    };
                    var gridNew = mini.get("datagridCarYes");
                    var listSize = gridNew.getData();
                    gridNewCarList.addRow(newRow, listSize.length);
                    addPlateNm();
                }
            }
            checkOnLeftCar("removeRight");
        }

    }

    //加入左侧
    function addLeftCar() {
        var rowsCar = gridNewCarList.getSelecteds();
        if (rowsCar.length > 0) {
            for (var i = 0; i < rowsCar.length; i++) {
                checkOnLeftCar("removeLeft", rowsCar[i].licensePlate);
            }
            //删除右侧
            deleteRightCar();
        }
    }

    //验证右侧是否已经存在号牌
    function checkRightCarIFYes(val) {
        var rebool = true;
        var listcar = gridNewCarList.getData();
        for (var i = 0; i < listcar.length; i++) {
            if (listcar[i].licensePlate == val) {
                rebool = false;
            }
        }
        return rebool;
    }

    //控制左侧列表的选中状态
    function checkOnLeftCar(status, text) {
        if (status == "removeRight") {
            $("#datagridCar").find("tr[class*='mini-grid-row-selected']").addClass("row-background-color1");
        } else if (status == "removeLeft") {
            gridCarList.deselectAll(false);
            $(getJqObjByText(text)).parent("td").parent("tr").removeClass("row-background-color1").attr("style", "");

        }
    }

    function getJqObjByText(text) {
        var ele;
        $("#datagridCar").find("div:contains('" + text + "')").each(function () {
            if (this.innerHTML == text) {
                ele = this; //此处，如果希望直接返回jquery对象，那就给 $(this) 的值
                return false; //加上这句，在找到第一个符合的元素时跳出$.each。
            }
        });
        return ele;
    }

    //删除右侧车辆数据
    function deleteRightCar() {
        var rows = gridNewCarList.getSelecteds();
        if (rows.length > 0) {
            gridNewCarList.removeRows(rows, false);
            for (var i = 0; i < rows.length; i++) {
                delPlateNm(rows[i].licensePlate);
            }
        }
        var data = gridNewCarList.getData();
        if (data == null || data == '' || data.length == 0) {
            //表数据为空时，去掉全选框的勾选
            $("#datagridCarYes .mini-grid-checkbox").removeClass("mini-grid-checkbox-checked");
        }
    }

    //申请信息自动输入车牌号
    function addPlateNm() {
        var applyDescVl = mini.get("applyDesc").getValue();
        var vehicles = gridNewCarList.getChanges();
        var plateNm = "";
        for (var i = 0; i < vehicles.length; i++) {
            if (applyDescVl.indexOf(vehicles[i].licensePlate) == -1) {
                if (vehicles[i]._state == "added") {
                    plateNm += vehicles[i].licensePlate + ";"
                }
            }
        }
        mini.get("applyDesc").setValue(applyDescVl + plateNm);
    }

    //申请信息删除车牌号
    function delPlateNm(licensePlate) {
        var applyDescVl = mini.get("applyDesc").getValue();
        applyDescVl = applyDescVl.replace(licensePlate + ";", "");
        mini.get("applyDesc").setValue(applyDescVl);
    }

    function execQuery() {
        var param = {};
        var enterpriseName = mini.get("enterpriseNumber").getValue;
        var enterpriseId = mini.get("#ownerId").getValue();
        //车辆颜色
        var licenseColor = mini.get("licenseColor").getValue();
        // 省份
        var licensePlate1 = mini.get("licensePlate1").getText();
        //
        var licensePlate4 = mini.get("licensePlate4").getValue();
        param.licensesubject = licenseColor;
        param.locations = licensePlate1;
        param.vehiclelicense = licensePlate4;
        param.enterpriseId = enterpriseId;
        param.enterpriseName = enterpriseName;
        gridCarList.load(param, function () {
            var data = gridCarList.getData();
            if (data == null || data == '' || data.length == 0) {
                $("#datagridCar .mini-grid-checkbox").removeClass("mini-grid-checkbox-checked");
            }
        });
    }

    //重置查询条件
    function forReset() {
        mini.get("licenseColor").setValue("");
        mini.get("licensePlate1").setValue("02");
        mini.get("licensePlate4").setValue("");
        //初始化左表数据
        initLeftGridData();
        //清空右侧
        var gridNewCarList = mini.get("datagridCarYes");
        gridNewCarList.clearRows();
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

    function setCompanyData(comInfo) {
        mini.get('datagridCar').setData("");
        mini.get('datagridCarReadOnly').setData("");
        mini.get('datagridCarYes').setData("");

        mini.get("applyDate").setValue(new Date());
        mini.get("applyName").setValue(comInfo.b_cnname);
        mini.get("companyEconomyType").setValue(comInfo.b_economictype);
        mini.get("companyEconomyType1").setValue(comInfo.b_manageclass);
        mini.get("registerAddress").setValue(comInfo.b_registeredaddress);
        mini.get("applyLegal").setValue(comInfo.b_legalperson);
        mini.get("projectname").setValue(window.parent.itemObj.name);
        mini.get("applicationClass").setValue(window.parent.itemId);
        mini.get("ownerId").setValue(comInfo.b_enterpriseId);

        mini.get("representativeTel").setValue(comInfo.b_legalpersonphone);
        mini.get("operatingAddress").setValue(comInfo.operateaddress);
        mini.get("postcode").setValue(comInfo.operatepostalcode);
        mini.get("overTime").setValue(window.parent.itemObj.approveTime);

        mini.get("enterpriseNumber").setValue(comInfo.taxiBaseNumber);

        getIllegalCarInfo(comInfo.taxiBaseNumber);
        //初始化左表数据
        initLeftGridData();
    }

</script>

</html>