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
                我的工作----已办工作
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
                                 url="${webProperties['app.url.businessApproval']}/parkRecord/getParkRecordList.htm"
                                 idField="id" allowSortColumn="true"
                                 sizeList="[10,20,30]" pageSize="10"
                                 onloaderror="mini.alert(e.errorMsg);">
                                <div property="columns">
                                    <div field="acceptNumber" width="75px" headerAlign="center" align="left"
                                         allowSort="false">
                                        受理号
                                    </div>
                                    <div field="codeName" width="110" headerAlign="center" align="left"
                                         allowSort="false">申请(许可)事项
                                    </div>
                                    <div field="userTaskName" width="70" headerAlign="center" align="left"
                                         allowSort="false">当前进程
                                    </div>
                                    <div field="projectName" width="90" headerAlign="center" align="left"
                                         allowSort="false">项目名称
                                    </div>
                                    <div field="name" width="100" headerAlign="center" align="left" allowSort="false">
                                        申请人名称
                                    </div>
                                    <div field="acceptTime" width="80px" headerAlign="center" renderer="formatDate"
                                         align="left"
                                         allowSort="false">申请时间
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
        datagridMyReport.load();
    });

    function chakan()
    {

    }

    function onSearch()
    {
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