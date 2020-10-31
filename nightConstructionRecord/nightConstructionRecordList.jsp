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
        span.required
        {
            color: red;
            font-size: 150%;
        }

        .mini-grid-rows-view
        {
            overflow-x: hidden;
        }


    </style>
</head>
<body class="page-container-bg-solid page-content-white mini-grid-rows-view" style="height:100%;overflow-y:auto">
<div class="page-content subpage">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="page-title">
                <i class="fa fa-flag"></i>
                我的工作----待办工作
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
                        <span class="caption-subject font-green-sharp bold uppercase"
                              style="padding-left: 20px;">申请时间：</span>
                        <input id="fromTime" class="mini-datepicker" emptyText="开始时间" style="width:200px;"
                               dateFormat="yyyy-MM-dd"
                               showTime="true"/>
                        <span class="caption-subject font-green-sharp bold uppercase">~</span>
                        <input id="toTime" class="mini-datepicker" emptyText="结束时间" style="width:200px;"
                               dateFormat="yyyy-MM-dd"
                               showTime="true"/>
                        <button onclick="onSearch()" type="button" class="btn btn-info">
                            <i class="fa fa-search"></i>
                            查询
                        </button>
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
                    <!-- 列表查询Begin -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="datagridMyReport" class="mini-datagrid"
                                 url="${webProperties['app.url.businessApproval']}/nightConstructionRecord/getNightConstructionRecordList.htm"
                                 idField="id" allowSortColumn="true"
                                 sizeList="[10,20,30]" pageSize="10"
                                 onloaderror="mini.alert(e.errorMsg);">
                                <div property="columns">
                                    <div field="acceptNumber" width="85px" headerAlign="center" align="left"
                                         allowSort="false">受理号
                                    </div>
                                    <div field="codeName" width="105" headerAlign="center" align="left"
                                         allowSort="false">申请(许可)事项
                                    </div>
                                    <div field="userTaskName" width="70" headerAlign="center" align="left"
                                         allowSort="false">当前进程
                                    </div>
                                    <div field="projectName" width="90" headerAlign="center" align="left"
                                         allowSort="false">项目名称
                                    </div>
                                    <div field="name" headerAlign="center" align="left" allowSort="false" width="60">
                                        申请人名称
                                    </div>
                                    <div field="contact" headerAlign="center" align="left" allowSort="false" width="40">
                                        法人名称
                                    </div>
                                    <div field="contact_tel" headerAlign="center" align="left" allowSort="false"
                                         width="60">法人联系电话
                                    </div>
                                    <div field="acceptTime" headerAlign="center" renderer="formatDate" align="left"
                                         allowSort="false" width="83px">申请时间
                                    </div>
                                    <div field="bell" headerAlign="center" align="center" allowSort="false" width="40">
                                        超时提醒
                                    </div>
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
    var datagridMyReport = mini.get("datagridMyReport");

    $(function ()
    {
        datagridMyReport.on("drawcell", function (e)
        {
            var record = e.record;
            var field = e.field;

            if (field == 'cz')
            {
                var gridHtml = "";
                if (record.suspended == "true")
                {
                    gridHtml = '<a href="javascript:void(0)" onclick="activeInstance(' + "'" + record.processInstanceId + "'" + ');" class="btn btn-sm  green"><i class="fa fa-eye"></i> 激活 </a>';
                } else
                {
                    gridHtml = '<a href="javascript:void(0)" onclick="banLi(' + "'" + record.processInstanceId + "'" + ',' + "'" + record.acceptNumber + "'" + ',' + "'" + record.taskId + "'" + ',' + "'" + record.url + "'" + ',' + "'" + record.type + "'" + ',' + "'" + record.userTaskName + "'" + ',' + "'" + record.businessKey + "'" + ',' + "'" + record.taskDefinitionKey + "'" + ',' + "'" + record.userId + "'" + ',' + "'" + record.applicationClass + "'" + ');" class="btn btn-sm  green"><i class="fa fa-eye"></i> 办理 </a>';
                }
                e.cellHtml = gridHtml;
            }

            if (field == 'bell')
            {
                var gridHtml = "";
                var timeLevel = record.timeLevel;
                var startTime = record.startTime;
                var warnTime = record.warnTime;
                var outTime = record.outTime;
                var supervisor = record.supervisor;
                if (timeLevel != null && timeLevel != "")
                {
                    if (timeLevel == 2)
                    {
                        gridHtml = '<a class="tooltip-test" data-toggle="tooltip"  style="color:#FF4500;cursor:pointer;" title=""><i class="icon-bell "  ></i></a>';
                    } else if (timeLevel == 1)
                    {
                        gridHtml = '<i class="icon-bell" style="color:#8B2500;cursor:pointer;" title=""></i>';
                    } else
                    {
                        gridHtml = '<i class="icon-bell" style="cursor:pointer;" title=""></i>';
                    }
                } else
                {
                    gridHtml = '<i class="icon-bell" style="cursor:pointer;" title=""></i>';
                }
                e.cellHtml = gridHtml;
            }
        });
        //datagridMyReport.load();

        //var arr = [];

        //初始化查询条件
        /*Comm_confInfo.setQueryArea({
            areaId: "jmf", url: "${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm", autoArr: [{type: 'input', field: 'acceptNumber', fieldText: '预受理号'}, {type: 'input', field: 'projectName', fieldText: '项目名称'}, {type: 'input', field: 'name', fieldText: '申请人名称'}, {type: 'input', field: 'contact', fieldText: '联系人'}, {type: 'input', field: 'contactTel', fieldText: '联系电话'}, // {type: 'select', field: 'projectType', fieldText: '申请(许可)事项',items:arr}
            ], fnCallback: function (data)
            {   //回调
                paramsData = {};
                paramsData = data;
                datagridMyReport.load(data);
            }
        });*/
    });

    var paramsData = {};

    function getSupervisor(supervisor)
    {
        var db = "";
        if (supervisor != null && supervisor != "")
        {
            db += (",&#10督办信息:" + supervisor);
        }
        return db;
    }


    function timestampToTime(obj)
    {
        var date = new Date(obj);
        var y = 1900 + date.getYear();
        var m = "0" + (date.getMonth() + 1);
        var d = "0" + date.getDate();
        return y + "-" + m.substring(m.length - 2, m.length) + "-" + d.substring(d.length - 2, d.length);
    }


    function banLi(processInstanceId, acceptNumber, taskId, url, type, userTaskName, businessKey, taskDefinitionKey, userId, applicationClass)
    {
        var width = document.body.clientWidth;
        var height = document.body.clientHeight;
        mini.open({
            url: url + '&processInstanceId=' + processInstanceId + '&acceptNumber=' + acceptNumber + '&taskId=' + taskId + '&type=' + type + '&userTaskName=' + userTaskName + '&bKey=' + businessKey + '&taskDefinitionKey=' + taskDefinitionKey + '&userId=' + userId + '&itemId=' + applicationClass, title: "事项审批", width: width, height: height, showMaxButton: true, ondestroy: function (action)
            {
                var fromTime = mini.get("fromTime").getFormValue();
                var toTime = mini.get("toTime").getFormValue();
                eval("paramsData.fromTime=fromTime");
                eval("paramsData.toTime=toTime");
                datagridMyReport.load(paramsData);
            }
        });
    }

    function activeInstance(process_instance_id)
    {
        window.location.href = "${webProperties['app.url.commProcess']}/activeInstance.do?process_instance_id=" + process_instance_id;
    }

    function onSearch()
    {
        var param = {};
        var fromTime = mini.get("fromTime").getFormValue();
        var toTime = mini.get("toTime").getFormValue();
        var staT = new Date(Date.parse(fromTime));
        var endT = new Date(Date.parse(toTime));
        if (staT > endT)
        {
            mini.alert("开始时间不能大于结束时间");
        } else
        {
            eval("param.fromTime=fromTime");
            eval("param.toTime=toTime");
            datagridMyReport.load(param);
        }
    }

    function formatDate(e)
    {
        var date = new Date(e.value);
        return mini.formatDate(date, 'yyyy-MM-dd HH:mm:ss');
    }
</script>
</body>
</html>