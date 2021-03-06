<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/jsp/include/meta.jsp" %>
<%@ page import="cn.seisys.iti.pdd.auth.util.ShiroUtils" %>
<%@ page import="cn.seisys.iti.pdd.auth.util.UserUtils" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page import="cn.seisys.iti.pdd.auth.entity.UserInfo" %>
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
    </style>
</head>
<body>
<div class="mini-toolbar" style="text-align:center;line-height:30px;" borderStyle="border:0;">
    <label>企业名称：</label>
    <input id="key" class="mini-textbox" style="width:150px;" onenter="onKeyEnter"/>
    <a class="mini-button" style="width:60px;" onclick="search()">查询</a>
</div>
<div class="mini-fit">
    <div id="datagrid" class="mini-datagrid" style="width:100%;height:100%;" onrowdblclick="onRowDblClick"
         url="${webProperties['app.url.commProcess']}/entrance/commYeHuList.htm?industry=${industry}" idField="id"
         sizeList="[5,10,15,20,30]" pageSize="10" allowResize="false" autoLoad="true"
         borderStyle="border-left:0;border-right:0;border-bottom:0;" onrowdblclick="onRowDblClick">

        <div property="columns">
            <div field="b_cnname" headerAlign="center" width="80" align="left" allowSort="true">企业名称</div>
            <div field="b_organizationcode" headerAlign="center" width="80" align="left" allowSort="true">企业编号</div>
            <div field="scopename" headerAlign="center" width="80" align="left" allowSort="false">行业</div>
            <div field="b_economictypemc" headerAlign="center" width="80" align="left" allowSort="true">经济类型</div>
        </div>
    </div>
</div>
<div class="mini-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;margin-bottom: -20px;" borderStyle="border:0;">
    <a class="mini-button" style="width:60px;" onclick="onOk()">确定</a>
    <span style="display:inline-block;width:25px;"></span>
    <a class="mini-button" style="width:60px;" onclick="onCancel()">取消</a>
</div>

</body>
</html>
<script type="text/javascript">
    mini.parse();
    var grid = mini.get("datagrid");

    function GetData() {
        var row = grid.getSelected();
        return row;
    }

    function search() {
        var key = mini.get("key").getValue();
        grid.load({comName: key});
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
            mini.alert("请选择一家企业！！！");
            return;
        }
        CloseWindow("ok");
    }

    function onCancel() {
        CloseWindow("cancel");
    }

</script>
