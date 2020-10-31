<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
    /* table.gridTable {
        width: 100%;
        font-family: verdana, arial, sans-serif;
        color: #333333;
        border-width: 1px;
        border-color: #EFEFFF;
        border-collapse: collapse;
    }

    table.gridTable th {
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #666666;
        background-color: #EFEFFF;
        text-align: center;
    }

    table.gridTable td {
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #666666;
        background-color: #ffffff;
        text-align: center;
    } */

	.gridTableContainer {
		overflow-y: auto!important
	}
</style>
<div class="mini-fit gridTableContainer">
    <table class="gridTable" id="gridTable">
        <tr>
            <th width="10">
                <input type="checkbox" id="applicationAll"
                       onclick="checkAll('applicationAll','applicationTb')"/>
            </th>
             <th>材料编号&nbsp; &nbsp;&nbsp;</th>
            <th>材料名称&nbsp; &nbsp;&nbsp;</th>
            <th>原件/份 &nbsp;&nbsp; &nbsp;</th>
            <th>复印件/份&nbsp;&nbsp;&nbsp;</th>
            <th>已收 &nbsp;&nbsp;&nbsp;</th>
            <%--<th>操作</th>--%>
        </tr>
        </thead>
        <tbody id="applicationTb">
        </tbody>
    </table>

</div>
<input id="fileuploadForMore" name="fileuploadForMore" type="file" style="display: none" multiple="multiple"/>

<script type="text/javascript">

    var attDatagrid = [];

    function getList(itemId) {
        $.ajax({
            url: "${webProperties['app.url.commProcess']}/entrance/commFileList.htm",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            type: 'POST',
            data: {itemId: itemId},
            async: false,
            success: function (data) {
                if (data != null) {
                    var json = $.parseJSON(data);
                    $("#applicationTb").empty();
                    var fileHtm = '';
                    for (var i = 0; i < json.length; i++) {
                    	 fileHtm += '<tr><td width="10"><input name="materialId" onclick="singleCheck(this,\'applicationAll\',\'materialId\')" type="checkbox"/></td><td name="id">' + json[i].id + '</td>';
                         fileHtm += '<td name="fileName">' + json[i].fileName + '</td><td name="yuanjian">' + json[i].originalCopies + '</td>' +
                             '<td name="copy">' + json[i].copyCopies + '</td><td name="shoudao"><input type="checkbox" name="yiShou" style="width: 30px"/></td>';
                             
                        // fileHtm += '<td><button style="display: none" type="button" onclick="uploadFileClick(' + i + ')"  ' +
                        //     'class="btn btn-success dropdown-toggle uploadHide"><i class="fa fa-file-archive-o"></i> 上传附件</button> ' +
                        //     '<button id="leibiao_' + i + '" type="button" onclick="leibiao(' + i + ')" style="display: none;" ' +
                        //     'class="btn btn-success dropdown-toggle" ><i class="fa fa-file-archive-o"></i>显示文件列表</button></td>';

                        fileHtm += '<tr id="col_' + i + '" style="display: none;width: 60%"><td colspan="6">' +
                            '<div id="datagrid_' + i + '" class="mini-datagrid" style="width: 60%"  ' +
                            'allowSortColumn="true" allowPage="false" showPager="false" onloaderror="mini.alert(e.errorMsg);">';

                        fileHtm += '<div property="columns">' +
                            '<div type="checkbox" field="attOrigNm" align="center" headerAlign="center">附件原名称</div>' +
                            '<div field="cz" align="center" headerAlign="center" width="50px">操作</div>';

                        fileHtm += '<div field="attAddr" visible="false">附件地址</div>' +
                            ' <div field="attCl" visible="false">附件类型</div>' +
                            '<div field="attNm" visible="false">附件名称</div>' +
                            '<div field="attVeh" visible="false">版本号</div>' +
                            '<div field="layParam1" visible="false">url</div>' +
                            '</div></div></td></tr>';

                        attDatagrid.push("datagrid_" + i + "");
                    }
                    $("#applicationTb").html(fileHtm);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                mini.alert(jqXHR.responseText);
            }
        });
    }

    function setCeckDis() {
        $("table input[id=applicationAll]").prop("disabled", true);
        $("table input[name=yiShou]").prop("disabled", true);
        $("table input[name=materialId]").prop("disabled", true);
    }

    function setCeckNoChe() {
        $("table input[id=applicationAll]").prop("checked", false);
        $("table input[name=yiShou]").prop("checked", false);
        $("table input[name=materialId]").prop("checked", false);
    }


    function uploadSave() {
        for (var i = 0; i < attDatagrid.length; i++) {
            var attDatagrid = mini.get("attDatagrid");
            var gridData = attDatagrid.getData();
            var jsonArray = [];
            for (var i = 0; i < gridData.length; i++) {
                if (gridData[i]._state == 'added') {
                    var rowData = $('[id="del' + gridData[i].rowFlag + '"]');
                    if (!rowData.attr("hidFileName")) {
                        continue;
                    }
                    var jsonObject = {};
                    if ($.isEmptyObject(rowData.attr("hidAttAddr"))) {
                        jsonObject.saveRelativePath = "test/0d2";//上传git的地址
                    } else {
                        jsonObject.saveRelativePath = rowData.attr("hidAttAddr");//上传git的地址
                    }
                    jsonObject.saveFileName = rowData.attr("hidFileName");//文件名
                    jsonObject.commitMessage = "注释" + i;//注释

                    jsonObject.attCl = rowData.attr("hidAttCl");//附件分类
                    jsonObject.attOrigNm = gridData[i].attOrigNm;
                    //附件原名称
                    jsonObject.attNm = rowData.attr("hidFileName");//文件名
                    if ($.isEmptyObject(rowData.attr("hidAttCd"))) {
                        jsonObject.attCd = "";
                    } else {
                        jsonObject.attCd = rowData.attr("hidAttCd");//附件编号
                    }
                    jsonObject.attSize = rowData.attr("hidSize");//文件名
                    if ($.isEmptyObject(rowData.attr("hidAttAddr"))) {
                        jsonObject.attAddr = "test/0d2";//附件地址 也就是 上面的git地址
                    } else {
                        jsonObject.attAddr = rowData.attr("hidAttAddr");//上传git的地址
                    }
                    jsonObject.bizCd = bizCd;//业务编号
                    jsonObject.bizSn = bizSn;//业务流水号
                    jsonObject.bizCl = "testDemo";//业务分类 ??
                    jsonArray.push(jsonObject);
                }
            }
            if (jsonArray.length > 0) {
                $.ajax({
                    url: url,
                    contentType: "application/x-www-form-urlencoded;charset=utf-8",
                    type: 'POST',
                    data: {
                        json: JSON.stringify(jsonArray)
                    },
                    success: function (data) {
                        delFileArray = [];
                        Comm_Tool.loadGridTable("attDatagrid", bizCd, bizSn, true, 'construction', 'indusNat_road', 'pjtSch_workers_can');
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        mini.alert(jqXHR.responseText);
                    }
                });
            }
        }
    }

    //初始加载的时候查询是否从查询的时候过来

    function delRow(obj) {
        var gridId = $(obj).attr("gridId");
        Comm_Tool.delRow(gridId);
        var attDatagrid = mini.get(gridId);
        var gridData = attDatagrid.getData();
        if (gridData.length == 0) {
            var i = gridId.substr(gridId.lastIndexOf('_') + 1, 1);
            $("#leibiao_" + i + "").hide();
            $("#col_" + i + "").hide();
        }
    }

    function leibiao(i) {
        if ($("#col_" + i + "").css("display") === 'none')
            $("#col_" + i + "").show();
        else
            $("#col_" + i + "").hide();
    }

    function uploadFileClick(i) {
        var datagrid = 'datagrid_' + i;
        Comm_File.commUploadFileForMore({
            fileType: "99",
            fileupload: "fileuploadForMore",
            gridId: datagrid,
            fnCallback: function () {
                $('#fileuploadForMore').click();
            },
            callbackFunction: function () {
                $("#leibiao_" + i + "").show();
            }
        });
    }

    var buZhenName = [];

    //补证
    function buZhen() {
        var Tabobj = $("#applicationTb");
        var Check = $("table input[name=materialId]");
        Check.each(function () {//遍历
            if (!$(this).prop("checked")) {
                var row = $(this).parent("td").parent("tr");
                var fileName = row.find("[name='fileName']").text();
                var yuanjian = row.find("[name='yuanjian']").text();
                var copy = row.find("[name='copy']").text();
                buZhenName.push(fileName);
            }
        })
    }


    var fileInfo = [];

    //获取文件列表信息
    function getFileInfo() {
        //获取上传文件信息
        // uploadSave();
        var Tabobj = $("#applicationTb");
        var Check = $("table input[name=materialId]");
        Check.each(function () {//遍历
            var row = $(this).parent("td").parent("tr");
            var fileName = row.find("[name='fileName']").text();
            if (fileName != "" && fileName != undefined && fileName != null) {
                var params = {};
                params.fileName = fileName;
                params.id = row.find("[name='id']").text();
                params.yuanjian = row.find("[name='yuanjian']").text();
                params.copy = row.find("[name='copy']").text();
                if (row.find("[name='shoudao']").find("input").prop("checked")) {
                    params.shoudao = 1;
                } else {
                    params.shoudao = 0;
                }
                fileInfo.push(params);
            }
        })
    }

    //插入信息
    function setFileInfo(fileInfo) {
        var Tabobj = $("#applicationTb");
        var Check = $("table input[name=materialId]");
        Check.each(function () {//遍历
            var row = $(this).parent("td").parent("tr");
            var id = row.find("[name='id']").text();
            if (fileInfo != null) {
                for (var i = 0; i < fileInfo.length; i++) {
                    if (fileInfo[i].id == id) {
                        if(fileInfo[i].shoudao == 1){
                            row.find("[name='shoudao']").find("input").prop("checked", true);
                        }
                    }
                }
            }
        })
    }


    /**
     * 无分页table全选
     * @param allId 全选的checkBox的id
     * @param tbId  tbody的id
     */
     function checkAll(allId, tbId) {
         // var tbc = "#" + tbId + " :checkbox";
         var tbc = "input[name=materialId]:checkbox";
         var allId = "input[id=" + allId + "]:checkbox";
         var flag = $(allId).is(":checked");
         if (flag) {
             $(tbc).prop("checked", true);
         } else {
             $(tbc).prop("checked", false);
         }
     }

    /**
     * table单个选择
     * @param ths
     * @param allId 全选按钮的id
     * @param checkName 每列checkBox的name
     */
    function singleCheck(ths, allId, checkName) {
        var allIdBox = "input[id=" + allId + "]:checkbox";
        var ckName = "input[name=" + checkName + "]:checkbox";
        if (ths.checked == false) {
            $(allIdBox).prop('checked', false);
        } else {
            var count = $(ckName + ":checked").length;
            if (count == $(ckName).length) {
                $(allIdBox).prop("checked", true);
            }
        }
    }
</script>
