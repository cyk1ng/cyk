<%--
  Created by IntelliJ IDEA.
  User: siwash
  Date: 2019/3/23
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>文件上传</title>
    <script type="text/javascript" src="${webProperties['app.url.businessApproval.netWeb']}/resources/js/fileUpload/fileUpload.js"></script>
</head>
<body>
<style type="text/css">
    .gridTable {
        width: 100%;
        font-family: verdana, arial, 微软雅黑;
        color: #333333;
        border-width: 1px;
        border-color: #EFEFFF;
        border-collapse: collapse;
    }

    .gridTable th {
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #e7ecf1;
        background-color: #f1f4f7;
        text-align: center;
    }

    .gridTable td {
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #e7ecf1;
        text-align: center;
    }

    .gridTable tr:hover td {
        background-color: #eef1f5
    }

    .gridTable tr.tr-inner:hover td {
        background-color: transparent
    }

    .gridTable tr.tr-inner .mini-panel-border {
        border: none;
    }

    .gridTable tr.tr-inner .mini-panel-border .mini-panel-header {
        display: none;
    }

    .gridTable tr.tr-inner td .mini-grid-table {
        width: 94%;
        border-collapse: collapse;
    }

    .gridTable tr.tr-inner td .mini-grid-table tr:nth-child(1) {
        display: none;
    }

    .gridTable tr.tr-inner td .mini-grid-table tr:nth-child(2) td {
        background-color: #eaf9fa;
        border-color: #cef1f4;
        color: #26a4af;
        padding: 4px;
    }

    .gridTable tr.tr-inner td .mini-grid-table tr th {
        background-color: #eaf9fa;
        border-color: #cef1f4;
        color: #26a4af;
        padding: 4px;
    }

    .gridTable tr.tr-inner td .mini-grid-table tr td {
        background-color: #fff;
        border-color: #cef1f4;
        color: #26a4af;
        padding: 4px;
        border-bottom-width: 0;
    }

    .gridTable tr.tr-inner td .mini-grid-table .mini-grid-rowstable tr td {
        background-color: #fff;
        border-color: #cef1f4;
        color: #26a4af;
        padding: 4px;
        border-bottom-width: 1px;
    }

    .gridTable tr.tr-inner:hover td .mini-grid-table tr td,
    .gridTable tr.tr-inner:hover td .mini-grid-table .mini-grid-rowstable tr td {
        background-color: #fff;
        border-color: #cef1f4;
        border-width: 1px;
    }

    .gridTable tr.tr-inner:hover td .mini-grid-table tr td.mini-grid-headerCell {
        background-color: #eaf9fa;
    }

    .gridTable tr.tr-inner:hover td .mini-grid-table .mini-grid-rowstable tr td {
        background-color: #fff;
        border-color: #cef1f4;
        border-width: 1px;
    }

    .gridTable tr.tr-inner td .mini-grid-table .mini-grid-rowstable tr:hover td {
        background-color: #f9fdfe;
    }
</style>
<input id="fileuploadForMore" name="fileuploadForMore" type="file" style="display: none" multiple="multiple"/>
<div class="portlet light bordered project-list">
    <div class="portlet-title">
        <div class="caption">
            <i class="icon-book-open font-green-sharp"></i> <span class="caption-subject font-green-sharp bold uppercase">附件信息</span>
        </div>
        <div class="actions">
            <a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title="全屏"> </a>
        </div>
        <div class="tools">
            <a href="javascript:;" class="btn btn-circle btn-icon-only btn-default collapse" data-original-title="" title="收缩"> </a>
        </div>
    </div>
    <div class="portlet-body form">
        <div class="row">
            <div class="col-lg-12">
                <div id="projectPortForm">
                    <div class="form-body form-custom" style="padding-top: 0;">
                        <div class="row">
                            <table class="gridTable" id="gridTable">
                                <tbody>
                                <tr>
                                    <th style="text-align: center;width:88px">序号&nbsp; &nbsp;&nbsp;</th>
                                    <th style="text-align: center;">材料名称&nbsp; &nbsp;&nbsp;</th>
                                    <th style="text-align: center;width:140px">操作</th>
                                </tr>

                                </tbody>
                                <tbody id="applicationTb">
                                <tr>
                                    <td>1</td>
                                    <td name="id" style="display: none">1</td>
                                    <td name="fileName" style="text-align: left;">工商营业执照</td>
                                    <td style=""><button style="float:left;display: block" type="button" onclick="uploadFileClick(1)" class="btn btn-success dropdown-toggle uploadHide shangchuanHide" title="上传附件"><i class="fa fa-upload"></i></button> <button id="leibiao_1" type="button" onclick="leibiao(1)" style="display: none;float:left;margin-left: 10px;" class="btn btn-success dropdown-toggle" title="显示文件列表"><i class="fa fa-file-archive-o"></i></button></td>
                                <tr id="col_1" style="display: none;width: 85%">
                                    <td colspan="6">
                                        <div id="datagrid_1" class="mini-datagrid" style="width: 60%;overflow-y: hidden;" allowSortColumn="true" allowPage="false" showPager="false" onloaderror="mini.alert(e.errorMsg);">
                                            <div property="columns">
                                                <div type="checkbox" field="attOrigNm" align="center" headerAlign="center">附件原名称</div>
                                                <div field="cz" align="center" headerAlign="center" width="50px">操作</div>
                                                <div field="attAddr" visible="false">附件地址</div>
                                                <div field="attCl" visible="false">附件类型</div>
                                                <div field="attNm" visible="false">附件名称</div>
                                                <div field="attVeh" visible="false">版本号</div>
                                                <div field="layParam1" visible="false">url</div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td name="id" style="display: none">2</td>
                                    <td name="fileName" style="text-align: left;">停车场(库)土地使用权或建筑物产权证明</td>
                                    <td style=""><button style="float:left;display: block" type="button" onclick="uploadFileClick(2)" class="btn btn-success dropdown-toggle uploadHide shangchuanHide" title="上传附件"><i class="fa fa-upload"></i></button> <button id="leibiao_2" type="button" onclick="leibiao(2)" style="display: none;float:left;margin-left: 10px;" class="btn btn-success dropdown-toggle" title="显示文件列表"><i class="fa fa-file-archive-o"></i></button></td>
                                <tr id="col_2" style="display: none;width: 85%">
                                    <td colspan="6">
                                        <div id="datagrid_2" class="mini-datagrid" style="width: 60%;overflow-y: hidden;" allowSortColumn="true" allowPage="false" showPager="false" onloaderror="mini.alert(e.errorMsg);">
                                            <div property="columns">
                                                <div type="checkbox" field="attOrigNm" align="center" headerAlign="center">附件原名称</div>
                                                <div field="cz" align="center" headerAlign="center" width="50px">操作</div>
                                                <div field="attAddr" visible="false">附件地址</div>
                                                <div field="attCl" visible="false">附件类型</div>
                                                <div field="attNm" visible="false">附件名称</div>
                                                <div field="attVeh" visible="false">版本号</div>
                                                <div field="layParam1" visible="false">url</div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td name="id" style="display: none">3</td>
                                    <td name="fileName" style="text-align: left;">泊位平面图</td>
                                    <td style=""><button style="float:left;display: block" type="button" onclick="uploadFileClick(3)" class="btn btn-success dropdown-toggle uploadHide shangchuanHide" title="上传附件"><i class="fa fa-upload"></i></button> <button id="leibiao_3" type="button" onclick="leibiao(3)" style="display: none;float:left;margin-left: 10px;" class="btn btn-success dropdown-toggle" title="显示文件列表"><i class="fa fa-file-archive-o"></i></button></td>
                                <tr id="col_3" style="display: none;width: 85%">
                                    <td colspan="6">
                                        <div id="datagrid_3" class="mini-datagrid" style="width: 60%;overflow-y: hidden;" allowSortColumn="true" allowPage="false" showPager="false" onloaderror="mini.alert(e.errorMsg);">
                                            <div property="columns">
                                                <div type="checkbox" field="attOrigNm" align="center" headerAlign="center">附件原名称</div>
                                                <div field="cz" align="center" headerAlign="center" width="50px">操作</div>
                                                <div field="attAddr" visible="false">附件地址</div>
                                                <div field="attCl" visible="false">附件类型</div>
                                                <div field="attNm" visible="false">附件名称</div>
                                                <div field="attVeh" visible="false">版本号</div>
                                                <div field="layParam1" visible="false">url</div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td name="id" style="display: none">4</td>
                                    <td name="fileName" style="text-align: left;">交通行政主管部门出具的停车场(库)竣工验收证明材料</td>
                                    <td style=""><button style="float:left;display: block" type="button" onclick="uploadFileClick(4)" class="btn btn-success dropdown-toggle uploadHide shangchuanHide" title="上传附件"><i class="fa fa-upload"></i></button> <button id="leibiao_4" type="button" onclick="leibiao(4)" style="display: none;float:left;margin-left: 10px;" class="btn btn-success dropdown-toggle" title="显示文件列表"><i class="fa fa-file-archive-o"></i></button></td>
                                <tr id="col_4" style="display: none;width: 85%">
                                    <td colspan="6">
                                        <div id="datagrid_4" class="mini-datagrid" style="width: 60%;overflow-y: hidden;" allowSortColumn="true" allowPage="false" showPager="false" onloaderror="mini.alert(e.errorMsg);">
                                            <div property="columns">
                                                <div type="checkbox" field="attOrigNm" align="center" headerAlign="center">附件原名称</div>
                                                <div field="cz" align="center" headerAlign="center" width="50px">操作</div>
                                                <div field="attAddr" visible="false">附件地址</div>
                                                <div field="attCl" visible="false">附件类型</div>
                                                <div field="attNm" visible="false">附件名称</div>
                                                <div field="attVeh" visible="false">版本号</div>
                                                <div field="layParam1" visible="false">url</div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td name="id" style="display: none">5</td>
                                    <td name="fileName" style="text-align: left;">停车场(库)充电设施建设材料</td>
                                    <td style=""><button style="float:left;display: block" type="button" onclick="uploadFileClick(5)" class="btn btn-success dropdown-toggle uploadHide shangchuanHide" title="上传附件"><i class="fa fa-upload"></i></button> <button id="leibiao_5" type="button" onclick="leibiao(5)" style="display: none;float:left;margin-left: 10px;" class="btn btn-success dropdown-toggle" title="显示文件列表"><i class="fa fa-file-archive-o"></i></button></td>
                                <tr id="col_5" style="display: none;width: 85%">
                                    <td colspan="6">
                                        <div id="datagrid_5" class="mini-datagrid" style="width: 60%;overflow-y: hidden;" allowSortColumn="true" allowPage="false" showPager="false" onloaderror="mini.alert(e.errorMsg);">
                                            <div property="columns">
                                                <div type="checkbox" field="attOrigNm" align="center" headerAlign="center">附件原名称</div>
                                                <div field="cz" align="center" headerAlign="center" width="50px">操作</div>
                                                <div field="attAddr" visible="false">附件地址</div>
                                                <div field="attCl" visible="false">附件类型</div>
                                                <div field="attNm" visible="false">附件名称</div>
                                                <div field="attVeh" visible="false">版本号</div>
                                                <div field="layParam1" visible="false">url</div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td name="id" style="display: none">6</td>
                                    <td name="fileName" style="text-align: left;">《上海市公共停车场（库）电子收费系统检测合格证明》</td>
                                    <td style=""><button style="float:left;display: block" type="button" onclick="uploadFileClick(6)" class="btn btn-success dropdown-toggle uploadHide shangchuanHide" title="上传附件"><i class="fa fa-upload"></i></button> <button id="leibiao_6" type="button" onclick="leibiao(6)" style="display: none;float:left;margin-left: 10px;" class="btn btn-success dropdown-toggle" title="显示文件列表"><i class="fa fa-file-archive-o"></i></button></td>
                                <tr id="col_6" style="display: none;width: 85%">
                                    <td colspan="6">
                                        <div id="datagrid_6" class="mini-datagrid" style="width: 60%;overflow-y: hidden;" allowSortColumn="true" allowPage="false" showPager="false" onloaderror="mini.alert(e.errorMsg);">
                                            <div property="columns">
                                                <div type="checkbox" field="attOrigNm" align="center" headerAlign="center">附件原名称</div>
                                                <div field="cz" align="center" headerAlign="center" width="50px">操作</div>
                                                <div field="attAddr" visible="false">附件地址</div>
                                                <div field="attCl" visible="false">附件类型</div>
                                                <div field="attNm" visible="false">附件名称</div>
                                                <div field="attVeh" visible="false">版本号</div>
                                                <div field="layParam1" visible="false">url</div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>7</td>
                                    <td name="id" style="display: none">7</td>
                                    <td name="fileName" style="text-align: left;">经办人身份证</td>
                                    <td style=""><button style="float:left;display: block" type="button" onclick="uploadFileClick(7)" class="btn btn-success dropdown-toggle uploadHide shangchuanHide" title="上传附件"><i class="fa fa-upload"></i></button> <button id="leibiao_7" type="button" onclick="leibiao(7)" style="display: none;float:left;margin-left: 10px;" class="btn btn-success dropdown-toggle" title="显示文件列表"><i class="fa fa-file-archive-o"></i></button></td>
                                <tr id="col_7" style="display: none;width: 85%">
                                    <td colspan="6">
                                        <div id="datagrid_7" class="mini-datagrid" style="width: 60%;overflow-y: hidden;" allowSortColumn="true" allowPage="false" showPager="false" onloaderror="mini.alert(e.errorMsg);">
                                            <div property="columns">
                                                <div type="checkbox" field="attOrigNm" align="center" headerAlign="center">附件原名称</div>
                                                <div field="cz" align="center" headerAlign="center" width="50px">操作</div>
                                                <div field="attAddr" visible="false">附件地址</div>
                                                <div field="attCl" visible="false">附件类型</div>
                                                <div field="attNm" visible="false">附件名称</div>
                                                <div field="attVeh" visible="false">版本号</div>
                                                <div field="layParam1" visible="false">url</div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
