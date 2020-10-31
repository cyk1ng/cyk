<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <%@ include file="/WEB-INF/jsp/include/meta.jsp" %>
    <script type="text/javascript">
        $(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
        var commProcessUrl = "http://122.144.195.126:18001/commProcess-app";
        var webresUrl = "http://122.144.195.126:18001/web-res";
    </script>
</head>
<body></body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>企业选择</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            border: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        .mini-grid-rows-view {
            overflow-x: hidden;
            overflow-y: hidden;
        }

        .mini-tree-folder {
            background-image: url(http://122.144.195.126:18001/web-res/assets/global/plugins/miniui/themes/custom/images/tree/folder.gif) !important;
        }

        .mini-tree-leaf {
            background-image: url(http://122.144.195.126:18001/web-res/assets/global/plugins/miniui/themes/custom/images/tree/file.gif) !important;
    </style>
</head>
<body class="mini-grid-rows-view">
<div class="mini-toolbar " style="text-align:center;line-height:30px;" borderStyle="border:0;">
    <label style="font-family:Verdana;">请选择行业: </label>
    <input name="hangye" id="hangye" class="mini-treeselect input-normal"
           url="http://122.144.195.126:18001/commProcess-app/scopeBasic/getScopeHangYeList.htm"
           textField="fullname" emptyText="请选择..." showTreeLines="true" showTreeIcon="true"
           valueField="id" parentField="parentId" expandOnLoad="true" showClose="true" oncloseclick="onCloseClick"
           value="" onvaluechanged="onDeptChanged" multiselect="false"
           allowInput="false" multiselect="false" showNullItem="true"
           nullItemText="请选择..." style="width: 20%;"/>

    <label>自定义查询：</label>
    <input id="baseNumber" emptyText="企业编号" class="mini-textbox" style="width:70px;" onenter="onKeyEnter"/>
    <input id="scopeId" name="scopeId"   class="mini-textbox" style="display: none">
    <input id="comName" emptyText="企业名称" class="mini-textbox" style="width:150px;" onenter="onKeyEnter"/>
    <a class="mini-button" style="width:60px;" onclick="search()">查询</a>
</div>
<div class="mini-fit">
    <div id="datagrid" class="mini-datagrid" style="width:100%;height:100%;"
         url="http://122.144.195.126:18001/commProcess-app/entrance/commYeHuList.htm?type=&manageClass="
         idField="id" allowSortColumn="false"
         sizeList="[5,10,15,20,30]" pageSize="10" allowResize="false" autoLoad="false"
         borderStyle="border-left:0;border-right:0;border-bottom:0;" onrowdblclick="onRowDblClick">
        <div property="columns">
            <div field="b_cnname" headerAlign="center" width="100" align="left" allowSort="true">企业名称</div>
            <div field="taxiBaseNumber" headerAlign="center" width="80" align="left" allowSort="true">企业编号</div>
            <div field="b_organizationcode" headerAlign="center" width="80" align="left" allowSort="true">组织机构代码</div>
            <div field="tradeName" headerAlign="center" width="80" align="left" allowSort="false">行业</div>
            <div field="scopename" headerAlign="center" width="80" align="left" allowSort="false">经营范围</div>
            <div field="b_economictypemc" headerAlign="center" width="80" align="left" allowSort="true">经济类型</div>
        </div>
    </div>
</div>
<div class="mini-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;margin-bottom: -20px;"
     borderStyle="border:0;">
    <a class="mini-button" style="width:60px;" onclick="onOk()">确定</a>
    <span style="display:inline-block;width:25px;"></span>
    <a class="mini-button" style="width:60px;" onclick="onCancel()">取消</a>
</div>

</body>
</html>
<script type="text/javascript">
    mini.parse();
    var grid = mini.get("datagrid");

    /**
     初期处理
     **/
    $(document).ready(function () {
        var param = {};
        if ('2011' != 'null' && '2011' != '') {
            mini.get("hangye").setValue(2011);
            mini.get("hangye").disable();
            var tradeId = mini.get("hangye").getValue();
            eval("param.tradeId=tradeId");
        }
        if ('21000' != 'null' && '21000' != '') {
            mini.get("scopeId").setValue(21000);
            var scopeId = mini.get("scopeId").getValue();
            eval("param.scopeId=scopeId");
        }
        grid.load(param);
    });


    function onCloseClick(e) {
        var obj = e.sender;
        obj.setText("");
        obj.setValue("");
        var tradeId = e.value;
        var baseNumber = mini.get("baseNumber").getValue();
        var comName = mini.get("comName").getValue();
        var param = {};
        eval("param.baseNumber=baseNumber");
        eval("param.comName=comName");
        grid.load(param);

    }

    function GetData() {
        var row = grid.getSelected();
        return row;
    }

    //组织切换
    function onDeptChanged(e) {
        var tradeId = e.value;
        var baseNumber = mini.get("baseNumber").getValue();
        var comName = mini.get("comName").getValue();
        var param = {};
        if (tradeId != null) {
            eval("param.tradeId=tradeId");
        }
        eval("param.baseNumber=baseNumber");
        eval("param.comName=comName");
        grid.load(param);
    }

    function search() {
        console.log(grid.getData());
        var tradeId = mini.get("hangye").getValue();
        var baseNumber = mini.get("baseNumber").getValue();
        var comName = mini.get("comName").getValue();
        var param = {};
        eval("param.tradeId=tradeId");
        eval("param.baseNumber=baseNumber");
        eval("param.comName=comName");
        grid.load(param, null, function (e) {
            mini.alert("网络连接错误，请重试或联系管理员");
        });
    }

    function onKeyEnter(e) {
        search();
    }

    function onRowDblClick(e) {
        onOk();
    }

    function CloseWindow(action) {
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();
    }

    function onOk() {
        var row = grid.getSelected();
        if (row == null) {
            mini.alert("请选择一家企业");
            return;
        }
        CloseWindow("ok");
    }

    function onCancel() {
        CloseWindow("cancel");
    }

</script>

