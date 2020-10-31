<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>经营许可</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

    <!DOCTYPE html>
    <html>
    <head>
        <%@ include file="/WEB-INF/jsp/include/meta.jsp" %>
        <!-- END THEME LAYOUT STYLES -->
        <link href="${webProperties['app.url.businessApproval']}/resources/css/window.css" rel="stylesheet" type="text/css" />


        <style type="text/css">
            body {
                visibility: hidden;
            }
            .mini-fit {
                overflow-y: hidden;
            }
            #tabs1 {
                height: 102%!important;
            }
            .mini-tabs-bodys {
                width: 100%!important
            }
            .mini-tabs-body {
                height: 100%!important;
            }
            .mini-panel-body, .mini-grid-rows-view {
                overflow-x: hidden;
            }
            .text-overflow-ellipsis {
                text-overflow: ellipsis;
                overflow: hidden;
                white-space:nowrap;
            }
        </style>



        <script type="text/javascript">
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            });
            var commProcessUrl = "http://122.144.195.126:18001/commProcess-app";
            var approvalUrl = "http://122.144.195.126:18001/approval-app";
            window.onload = function() {
                document.getElementsByTagName('body')[0].style.visibility = "visible";
                //$("body").css("visibility", "visible");
            }
        </script>
    </head>
<body></body>
</html>
<style type="text/css">
    html, body {
        padding: 0;
        margin: 0;
        border: 0;
        height: 100%;
        overflow: hidden;
        background-color: white;
    }
    .mini-tabs-buttons{
        padding-right: 30px;
    }
</style>
</head>
<body>
<div style="height: 100%">
    <div id="panel1" class="mini-panel" title="" iconCls="icon-add" style="width:100%;height:170px;"
         showToolbar="true" showCollapseButton="true"  collapseOnTitleClick="true" expanded="false"
    >

        <div class="mini-fit">
            <form action="" id="formSx">
                <table border="0" cellpadding="1" cellspacing="2"
                       style="height:auto;width:100%;table-layout:fixed;line-height: 40px;padding-right:40px">
                    <tr>
                        <td style="width:130px;" align="right"></td>
                        <td style="width:50%"></td>
                        <td style="width:130px;" align="right"></td>
                        <td style="width:50%"></td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">事项名称：</td>
                        <td style="width:50%">
                            <input allowInput="false" readonly="true"  id="itemName" class="mini-textbox " value="" style="width:96%;"/>
                        </td>
                        <td style="width:130px;" align="right">办事指南：</td>
                        <td style="width:50%"><a href="#">查看</a></td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">事项类型：</td>
                        <td style="width:50%">
                            <input allowInput="false"readonly="true" id="itemType" class="mini-textbox " value="" style="width:96%;"/>
                        </td>
                        <td style="width:130px;" align="right">办理方式：</td>
                        <td style="width:50%">
                            <input allowInput="false" readonly="true" class="mini-textbox " value="" id="processAMenTo" style="width:96%;"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">审批机构：</td>
                        <td style="width:50%">
                            <input id="approvingAuth" readonly="true" allowInput="false" class="mini-textbox " value="" style="width:96%;"/>
                        </td>
                        <td style="width:130px;" align="right">审批期限：</td>
                        <td style="width:50%">
                            <input allowInput="false" readonly="true" class="mini-textbox " value="" id="approveTime" style="width:96%;"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <script type="text/javascript">

            var itemObj={};
            function queryItemInfo(itemId) {
                $.ajax({
                    url: "http://122.144.195.126:18001/commProcess-app/entrance/commShiXiangInfo.htm",
                    contentType: "application/x-www-form-urlencoded;charset=utf-8",
                    type: 'POST',
                    data: {
                        itemId: itemId
                    },
                    async: false,
                    success: function (data) {
                        console.log(data);
                        var dataObj = mini.decode(data);
                        jQuery.extend(itemObj,dataObj);
                        //itemObj = dataObj;
                        if(data != null) {
                            if(dataObj.approveTime == null || dataObj.approveTime =="" || dataObj.approveTime == "null"|| dataObj.approveTime == 0 || dataObj.approveTime =="0"){
                                dataObj.approveTime = "当场办结";
                            }else{
                                dataObj.approveTime = dataObj.approveTime + "个工作日";
                            }
                            var form = new mini.Form("formSx");
                            form.setData(dataObj);
                            mini.get("itemName").setValue(dataObj.name);
                            mini.get("itemType").setValue(dataObj.itemType);
                            mini.get("approvingAuth").setValue(dataObj.approvingAuth);
                            mini.get("processAMenTo").setValue(dataObj.processAMenTo);
                            mini.get("approveTime").setValue(dataObj.approveTime);
                            //mini.get("projectname").setValue(dataObj.name);
                        }
                        var panel1 = mini.get("panel1");
                        if(panel1){
                            panel1.setTitle("申请事项："+dataObj.name);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        mini.alert(jqXHR.responseText);
                    }
                });
            }

        </script>

    </div>
    <div id="panel2" class="mini-panel" title="企业信息" iconCls="icon-add" style="width:100%;height:135px;"
         showToolbar="true" showCollapseButton="true"  collapseOnTitleClick="true" expanded="true"

    >


        <div class="mini-fit" style="height: 85px;">
            <table border="0" cellpadding="1" cellspacing="2"
                   style="height:auto;width:100%;table-layout:fixed;line-height: 40px;padding-right:40px">
                <tr>
                    <td style="width:130px;" align="right">企业名称：</td>
                    <td style="width:50%">
                        <input id="b_cnname" class="mini-buttonedit" allowInput="false" onbuttonclick="onButtonEdit"
                               placeholder="请输入关键字进行查询..."  autocomplete="off"  data-provide="typeahead"  type="text"
                               style="width:96%;"/>
                    </td>
                    <td style="width:130px;" align="right">经济类型：</td>
                    <td style="width:50%">
                        <input id="b_economictypemc" allowInput="false" readonly="true" class="mini-textbox"
                               style="width:96%;"/>
                    </td>
                </tr>
                <tr>
                    <td style="width:130px;" align="right">企业编号：</td>
                    <td style="width:50%">
                        <input id="baseNumber" allowInput="false" readonly="true" class="mini-textbox" style="width:96%;"/>
                    </td>
                    <td style="width:130px;" align="right">行业：</td>
                    <td style="width:50%">
                        <input allowInput="false" class="mini-textbox" readonly="true" value="" id="tradeName"
                               style="width:96%;"/>
                        <input allowInput="false" class="mini-textbox" value="" id="tradeId" style="display: none"/>
                        <input allowInput="false" class="mini-textbox" value="" id="type" style="display: none"/>
                        <input allowInput="false" class="mini-textbox" value="" id="manageClass" style="display: none"/>
                        <input allowInput="false" class="mini-textbox" value="" id="scopeId" style="display: none"/>
                    </td>
                </tr>
            </table>
        </div>
        <script type="text/javascript">
            var comInfo;
            mini.parse();
            //设置行业
            function setHangYe(tradeName, tradeId, type, manageClass, scopeId) {
                mini.get("tradeName").setValue(tradeName);
                //除了新增 为"201"
                mini.get("tradeId").setValue(tradeId);
                //新增标识 新增type 1
                mini.get("type").setValue(type);
                mini.get("manageClass").setValue(manageClass);
                //经营范围ID
                mini.get("scopeId").setValue(scopeId);
            }

            function setReadOnly(flag) {
                mini.get("b_cnname").setReadOnly(flag);
            }

            //草稿箱进入时，设置企业信息
            function setComInfo(b_cnname) {
                var type = mini.get("type").getValue();
                $.ajax({
                    url: "http://122.144.195.126:18001/commProcess-app/entrance/commYeHuListForBase.htm",
                    contentType: "application/x-www-form-urlencoded;charset=utf-8",
                    type: 'POST',
                    data: {
                        comName: b_cnname,
                        type: type
                    },
                    async: false,
                    success: function (data) {
                        console.log(data);
                        var dataObj = mini.decode(data);
                        if (dataObj != null && dataObj.data != null && dataObj.data.length > 0) {
                            var obj = dataObj.data[0];
                            mini.get("b_cnname").setText(obj.b_cnname);
                            mini.get("b_economictypemc").setValue(obj.b_economictypemc);
                            mini.get("baseNumber").setValue(obj.taxiBaseNumber);
                            mini.get("tradeName").setValue(obj.tradeName);
                        } else {
                            mini.alert("调取企业信息出错，请重试或联系管理员");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        mini.alert(jqXHR.responseText);
                    }
                });
            }

            //设置企业为空
            function setNone() {
                mini.get("b_cnname").setValue("");
                mini.get("b_cnname").setText("");
                mini.get("b_economictypemc").setValue("");
                mini.get("baseNumber").setValue("");
                mini.get("tradeName").setValue("");
                mini.get("scopeId").setValue("");
            }

            function onButtonEdit(e) {
                var btnEdit = this;
                var tradeId = mini.get("tradeId").getValue();
                var type = mini.get("type").getValue();
                var manageClass = mini.get("manageClass").getValue();
                var scopeId = mini.get("scopeId").getValue();
               //debugger
                mini.open({
                    url: "${webProperties['app.url.businessApproval']}/parkLot/parkLotApprovalList.htm",
                    title: "选择企业",
                    width: 900,
                    height: 600,
                    ondestroy: function (action) {
                        if (action == "ok") {
                            var iframe = this.getIFrameEl();
                            var data = iframe.contentWindow.GetData();
                            data = mini.clone(data);    //必须
                            if (data) {
                                comInfo = data;
                                var res = $("#license_frame")[0].contentWindow.setCompanyData(comInfo);
                                if (res != -1) {
                                    btnEdit.setText(data.b_cnname);
                                    mini.get("b_economictypemc").setValue(data.b_economictypemc);
                                    mini.get("baseNumber").setValue(data.taxiBaseNumber);
                                    mini.get("tradeName").setValue(data.tradeName);
                                }
                            }
                        }

                    }
                });
            }
        </script>
    </div>

    <div id="bussinessFrameId"  class="mini-fit">
        <iframe id="license_frame" src="" frameborder="0" scrolling="no" scroll="no" marginheight="0" marginwidth="0" height="100%" width="100%" ></iframe>
    </div>
</div>
<script type="text/javascript">
    var itemId;
    var isPanel1Display = false;
    var isPanel2Display = true;
    $(document).ready(function(){
        itemId = getRequestString("itemId");
        // queryItemInfo(itemId);
        // var panelResizeListener = setInterval(function(){
        //     var isPanel1DisplayCurrent = $("#panel1 .mini-panel-viewport").css("display") == "block";
        //     var isPanel2DisplayCurrent = $("#panel2 .mini-panel-viewport").css("display") == "block";
        //     if (isPanel1Display != isPanel1DisplayCurrent || isPanel2Display != isPanel2DisplayCurrent) {
        //         mini.layout();
        //         isPanel1Display = isPanel1DisplayCurrent;
        //         isPanel2Display = isPanel2DisplayCurrent;
        //     }
        // }, 100);
    });
    //获取url中的请求参数
    function getRequestString(key){
        var reg = new RegExp("(^|&)"+key+"=([^&]*)(&|$)");
        var result = window.location.search.substr(1).match(reg);
        return result?decodeURIComponent(result[2]):null;
    }
    var url = getRequestString("url");
    var id = getRequestString("id");
    var type = getRequestString("type");
    //var srcurl = ""+url+"?model=edit&id="+id+"&type="+type;
    var srcurl = ""+url;
    //if(hid == '12'){
    $("#license_frame").attr("src",srcurl);
    //}
    // 设置企业信息收缩，网约个人功能用
    function setPanelExpanded(flag) {
        mini.get("panel2").setExpanded(flag);
    }
</script>
</body>
</html>

