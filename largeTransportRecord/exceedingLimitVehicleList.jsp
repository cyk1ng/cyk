<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp" %>
<%@ include file="/WEB-INF/jsp/include/meta.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <title>上海市交通委综合交通（规划）业务平台</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <style>
        span.required {
            color: red;
            font-size: 150%;
        }

        .mini-grid-rows-view {
            overflow-x: hidden;
        }
    </style>
</head>
<body class="page-container-bg-solid page-content-white mini-grid-rows-view" style="height:100%;overflow-y:auto">
<div class="page-content subpage">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="page-title">
                <i class="fa fa-flag"></i> 超限车辆公路备案----备案列表
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <!--BEGIN 查询条件-->
            <div class="portlet light bordered">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-share font-green-sharp"></i>
                        <span class="caption-subject font-green-sharp bold uppercase">查询条件</span>
                        <!-- <span class="caption-subject font-green-sharp bold uppercase"
                              style="padding-left: 20px;">申请时间：</span>
                        <input id="fromTime" class="mini-datepicker" emptyText="开始时间" style="width:200px;"
                               dateFormat="yyyy-MM-dd"
                               showTime="true"/>
                        <span class="caption-subject font-green-sharp bold uppercase">~</span>
                        <input id="toTime" class="mini-datepicker" emptyText="结束时间" style="width:200px;"
                               dateFormat="yyyy-MM-dd"
                               showTime="true"/>
                        <button onclick="onSearch()" type="button" class="btn btn-info"><i class="fa fa-search"></i>查询
                        </button> -->
                    </div>
                </div>
                <div class="portlet-body" style="padding-top:0;">
                    <div class="row">
                        <div class="col-sm-12">
                            <!--查询条件放这里-->
                            <div class="row">
                                <div class="col-sm-12">
                                    <div id="jmf" class="jmf-container">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 列表查询Begin  -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="datagridPageList" class="mini-datagrid"  
                                 url="${webProperties['app.url.businessApproval']}/bulkCargo/getRecRoadOverrunPageList.htm"
                                 idField="id" allowSortColumn="true"
                                 sizeList="[10,20,30]" pageSize="10"
                                 onloaderror="mini.alert(e.errorMsg);">
                                <div property="columns">
                                    <div field="name" width="60" headerAlign="center" align="left"
                                         allowSort="false"> 单位名称
                                    </div>
                                    <div field="matter" width="40" headerAlign="center" align="left"
                                         allowSort="false"> 事项
                                    </div>
                                    <div field="route" width="80" headerAlign="center" align="left"
                                         allowSort="false"> 超限运输行驶路线
                                    </div>
                                    <div field="loadingCondition" width="80" headerAlign="center" align="left"
                                         allowSort="false"> 车辆及装载情况
                                    </div>
                                    <div field="transportUnit" width="80" headerAlign="center" align="left" 
                                        allowSort="false"> 运输单位
                                    </div>
                                    <!-- <div field="remark" width="50" headerAlign="center" align="left"
                                         allowSort="false"> 备注
                                    </div> -->
                                    <div field="createPeration" width="50" headerAlign="center" align="center" allowSort="false"> 申请人
                                    </div>
                                    <div field="applicationDate" width="50" headerAlign="center" align="center" renderer="onApplicationDate"
                                         allowSort="false"> 申请日期
                                    </div>
                                     <!-- <div field="updateTime" width="60" headerAlign="center" align="left"  renderer="formatDate"
                                         allowSort="false"> 修改时间
                                    </div> -->
                                    <div field="cz" align="center" width="70px" headerAlign="center">操作</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 列表查询END -->
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    mini.parse();
    var datagridPageList = mini.get("datagridPageList");
    $(function () {
        datagridPageList.on("drawcell", function (e) {
            var record = e.record;
            var field = e.field;

            if (field == 'cz') {
                var gridHtml = "";
                gridHtml += '<a href="javascript:void(0)" onclick="view(' + "'" + record.id + "'" + ');" class="btn btn-sm  green"><i class="fa fa-eye"></i> 查看 </a>&nbsp&nbsp';
                gridHtml += '<a href="javascript:void(0)" onclick="claim(' + "'" + record + "'" + ');" class="btn btn-sm  red"><i class="fa fa-times"></i>任务认领 </a>';
                e.cellHtml = gridHtml;
            }
            //自定义查看
            /* if (field == 'projectRoad') {
                var codeName = record.codeName;
                if (codeName == null || codeName == undefined)
                    codeName = '';
                var gridHtml = "";
                gridHtml = '<a style="color:black;" onclick="chakan(' + "'" + record.processInstanceId + "'" + ',' + "'" + record.acceptNumber + "'" + ',' + "'" + record.taskId + "'" + ',' + "'" + record.url + "'" + ',' + "'" + record.type + "'" + ',' + "'" + record.userTaskName + "'" + ',' + "'" + record.businessKey + "'" + ');">' + codeName + '</a>'
                e.cellHtml = gridHtml;
            } */

        });
        datagridPageList.load();

        //初始化查询条件
        Comm_confInfo.setQueryArea({
            areaId: "jmf",
            url: "${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm",
            autoArr: [
                {type: 'input', field: 'name', fieldText: '单位名称'},
                {type: 'input', field: 'transportUnit', fieldText: '运输单位'}
            ],
            fnCallback: function (data) {   //回调
                paramsData = data;
                datagridPageList.load(data);
            }
        });
    });
    
    function claim(record) {
    	var load = mini.loading("正在认领,请稍后...", "认领");
        //mainId = "751900000414000";
        /*
        // 施工方联系人
        map.put("contact", entity.getContacts());
        // 施工方联系电话
        map.put("contact_tel", entity.getContactsTel());
        */
        $.ajax({
            url: "${webProperties['app.url.commProcess']}/entrance/getAcceptNumber.htm?itemId=037202001&type=02",
            type: 'POST',
            contentType: "application/json;charset=utf-8",
            success: function(data) {
                acceptNumber = data.replace(/\"/g,"");
                var recRoadOverrun = {};
                recRoadOverrun.id = record.id;
                recRoadOverrun.contacts = record.contacts;
                recRoadOverrun.contactsTel = record.contactsTel;
                recRoadOverrun.mainId = acceptNumber;
                recRoadOverrun.createPeration = record.createPeration;
                $.ajax({
                    url: "${webProperties['app.url.businessApproval']}/bulkCargo/claimTask.htm",
                    data: JSON.stringify(recRoadOverrun),
                    type:'POST',
                    contentType: "application/json;charset=utf-8",
                    success:function(reslut) {
                    	if (reslut) {
                            datagridPageList.load();
                            mini.hideMessageBox(load);
                            mini.alert("认领成功!");
                        } else {
                            mini.hideMessageBox(load);
                            mini.alert("认领失败!");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                    }
              });
            },
            error: function (jqXHR, textStatus, errorThrown) {
            }
        });
    }

    function view(id) {
        mini.open({
            url: "${webProperties['app.url.businessApproval']}/bulkCargo/viewExceedingLimitVehicle.htm",
            title: "超限车辆公路备案----查看", width: "100%", height: "100%",
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = { action: "edit", id: id };
                iframe.contentWindow.SetData(data);
            }
        });
    }
    
    function onApplicationDate(e) {
        var value = e.value;
        if (value) {
        	return mini.formatDate(mini.parseDate(new Date(value)), 'yyyy-MM-dd');
        }
        return "";
    }
    
    /* function chakan(processInstanceId, acceptNumber, taskId, url, type,userTaskName,businessKey) {
        var width = document.body.clientWidth;
        var height =  document.body.clientHeight;
        mini.open({
            url: url + '&processInstanceId=' + processInstanceId + '&acceptNumber=' + acceptNumber + '&taskId=' + taskId + '&type=' + type+ '&userTaskName=' + userTaskName+ '&bKey=' + businessKey+'&printFlag=1',
            title: "事项审批",
            width: width,
            height: height,
            showMaxButton:true,
            ondestroy: function (action) {
                // datagridPageList.load();
            }
        });
    } */
    /* function onSearch() {
        var param = {};
        var fromTime = mini.get("fromTime").getFormValue();
        var toTime = mini.get("toTime").getFormValue();
        var staT = new Date(Date.parse(fromTime));
        var endT = new Date(Date.parse(toTime));
        if (staT > endT) {
            mini.alert("开始时间不能大于结束时间");
        } else {
            eval("param.fromTime=fromTime");
            eval("param.toTime=toTime");
            datagridPageList.load(param);
        }
    } */

    function formatDate(e) {
        var date = new Date(e.value);
        return mini.formatDate(date, 'yyyy-MM-dd HH:mm:ss');
    }
</script>
</body>
</html>