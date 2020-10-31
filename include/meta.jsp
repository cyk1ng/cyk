<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="${webProperties['app.url.webres']}/assets/global/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${webProperties['app.url.webres']}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="${webProperties['app.url.webres']}/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <%-- <link href="${webProperties['app.url.webres']}/scripts/FontAwesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" /> --%>
    <%-- <link href="${webProperties['app.url.webres']}/scripts/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css" /> --%>

    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <link href="${webProperties['app.url.webres']}/assets/global/plugins/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" />
    <link href="${webProperties['app.url.webres']}/assets/global/plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" type="text/css" />
    <link href="${webProperties['app.url.webres']}/assets/global/plugins/filter/css/animate.css" rel="stylesheet" type="text/css" />
    <link href="${webProperties['app.url.webres']}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />

    <link href="${webProperties['app.url.webres']}//assets/global/plugins/filter/css/jquery-multiple-filter.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN THEME GLOBAL STYLES -->
    <link href="${webProperties['app.url.webres']}/assets/global/css/components.css" rel="stylesheet" id="style_components" type="text/css" />
    <link href="${webProperties['app.url.webres']}/assets/global/css/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END THEME GLOBAL STYLES -->

    <!-- BEGIN MiniUi STYLES -->
    <link href="${webProperties['app.url.webres']}/assets/global/plugins/miniui/themes/custom/miniui.css" rel="stylesheet" id="style_components" type="text/css" />
    <link href="${webProperties['app.url.webres']}/assets/global/plugins/miniui/themes/custom/medium-mode.css" rel="stylesheet" id="style_components" type="text/css" />
    <link href="${webProperties['app.url.webres']}/assets/global/plugins/miniui/themes/custom/skin.css" rel="stylesheet" id="style_components" type="text/css" />
    <!-- END MiniUi STYLES -->
    <!-- BEGIN THEME LAYOUT STYLES -->
    <link href="${webProperties['app.url.webres']}/assets/layouts/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="${webProperties['app.url.webres']}/assets/layouts/css/search.css" rel="stylesheet" type="text/css" />
    <link href="${webProperties['app.url.webres']}/assets/layouts/css/themes/darkblue.css" rel="stylesheet" type="text/css" id="style_color" />
    <link href="${webProperties['app.url.webres']}/assets/layouts/css/custom.css" rel="stylesheet" type="text/css" />
    <!-- END THEME LAYOUT STYLES -->




    <!--[if lt IE 9]>
    <script src="${webProperties['app.url.webres']}/assets/global/plugins/respond.min.js"></script>
    <script src="${webProperties['app.url.webres']}/assets/global/plugins/excanvas.min.js"></script>
    <![endif]-->
    <script src="${webProperties['app.url.webres']}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="${webProperties['app.url.webres']}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${webProperties['app.url.webres']}/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <script src="${webProperties['app.url.webres']}/assets/global/plugins/moment.min.js" type="text/javascript"></script>
    <script src="${webProperties['app.url.webres']}/assets/global/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
    <script src="${webProperties['app.url.webres']}/assets/global/plugins/bootstrap-select/js/bootstrap-select.js" type="text/javascript"></script>
    <script src="${webProperties['app.url.webres']}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN miniUI SCRIPTS -->
    <script src="${webProperties['app.url.webres']}/assets/global/plugins/miniui/miniui.js" type="text/javascript"></script>
    <!-- END miniUI SCRIPTS -->
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="${webProperties['app.url.webres']}/assets/global/js/app.js" type="text/javascript"></script>
    <script src="${webProperties['app.url.webres']}/assets/global/js/custom.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->
    <!-- BEGIN THEME LAYOUT SCRIPTS -->
    <script src="${webProperties['app.url.webres']}/assets/layouts/js/layout.min.js" type="text/javascript"></script>
    <script src="${webProperties['app.url.webres']}/assets/layouts/js/demo.min.js" type="text/javascript"></script>
    <script src="${webProperties['app.url.webres']}/assets/global/plugins/filter/Filter.js" type="text/javascript"></script>
    <link href="${webProperties['app.url.webres']}/assets/global/plugins/filter/Fliter.css" rel="stylesheet" type="text/css" />
    <script src="${webProperties['app.url.webres']}/assets/global/plugins/filter/js/jquery-multiple-filter.js" type="text/javascript"></script>
    <%-- <script src="${webProperties['app.url.webres']}/assets/global/plugins/filter/js/defind-filter.js" type="text/javascript"></script> --%>
    <script src="${webProperties['app.url.webres']}/javascript/common/MyAjaxForm.js" type="text/javascript"></script>
    <%-- <script src="${webProperties['app.url.webres']}/scripts/boot.js" type="text/javascript"></script> --%>
    <script src="${webProperties['app.url.webres']}/scripts/jqueryFileupload/vendor/jquery.ui.widget.js" type="text/javascript"></script>
    <script src="${webProperties['app.url.webres']}/scripts/jqueryFileupload/jquery.iframe-transport.js" type="text/javascript"></script>
    <script src="${webProperties['app.url.webres']}/scripts/jqueryFileupload/jquery.fileupload.js" type="text/javascript"></script>
    <script src="${webProperties['app.url.webres']}/scripts/jqueryFileupload/cors/jquery.xdr-transport.js" type="text/javascript"></script>
    <script src="${webProperties['app.url.webres']}/scripts/layer/layer.js" type="text/javascript"></script>
    <script src="${webProperties['app.url.commProcess']}/resources/js/commConfInfo.js" type="text/javascript"></script>
    <script src="${webProperties['app.url.commProcess']}/resources/js/commFileupload.js" type="text/javascript"></script>
    <script src="${webProperties['app.url.commProcess']}/resources/js/commTool.js" type="text/javascript"></script>
    <script src="${webProperties['app.url.webres']}/resources/project/filter/utils.js" type="text/javascript"></script>

    <script src="${webProperties['app.url.webres']}/charts/echart/echarts.min.js"></script>
    <%--<script src="src="<c:url value='/resources/js/commonUtil.js'/>"" type="text/javascript"></script>--%>
    <link href="${webProperties['app.url.webres']}/assets/layouts/css/layout.css" rev="stylesheet" type="text/css" rel="stylesheet" />
        <style>
    .no_padding {
        padding:0;
        margin:0px;
    }
    </style>
    <script type="text/javascript">
        $(function () {
            if(!$.isEmptyObject($('[data-toggle="tooltip"]'))){
                $('[data-toggle="tooltip"]').tooltip();
            }
        });
    var commProcessUrl = "${webProperties['app.url.commProcess']}";

    // 当前工程地址
    var constructionUrl = "${webProperties['app.url.construction']}";

    </script>
</head>
<body></body>
</html>