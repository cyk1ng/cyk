<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
 <div class="page-container-bg-solid page-content-white" style="background: #f4f6f8;">
     <div class="page-content subpage">
         <div class="row">
              <!--BEGIN 查询条件-->
              <div class="portlet light bordered">
                      <!-- 列表查询Begin -->
                   <div class="row">
                       <div class="col-lg-12">
                           <div id="datagrid" class="mini-datagrid" url="${webProperties['app.url.approval']}/commCertificate/getCommCertificateList.htm"
                               style="width:99%;height:430px;" idField="id" allowSortColumn="true" sizeList="[10,20,30]" 
                               pageSize="10" onloaderror="mini.alert(e.errorMsg);" showPager='false'>
                               <div property="columns">
									<div type="flws"  align="left"  headerAlign="left">法律文书
										<div property="columns">  
											<div type="indexcolumn"  align="center"  headerAlign="center">序号</div>  
	                                        <div field="wsbh" align="center" visible='false' width='80' headerAlign="center">文书编号</div>
	                                        <div field="wsname" align="center" width='80' headerAlign="center">文书名称</div>
	                                        <div field="printstatus"  align="center" visible='false' width='80' headerAlign="center">打印状态</div>
	                                        <div field="printstatusmc" align="center" width='80' headerAlign="center">打印状态</div>
	                                        <div field="cz" align="center" width="80" headerAlign="center">操作</div>
										</div>
									</div>
                               </div>
                           </div>
                       </div>
                   </div>
                      <!-- 列表查询END -->
              </div>
         </div>
     </div>
<script type="text/javascript">
     //mini.parse();
     var  datagrid;
     var date = new Date();
     $(document).ready(function () {
         datagrid = mini.get("datagrid");
         datagrid.on("drawcell", function (e) {
             var record = e.record;
             var field = e.field;
             if (field == 'cz') {
             	//debugger;
                 var gridHtml = "";
                 gridHtml +=
                     '<a href="javascript:;" target="sub-right-frame" class="btn btn-sm green" style="width:50px;" onclick="toPrint(&quot;' +
                     record.wsbh + '&quot;);"><i class="fa fa-pencil"></i> 打印 </a>';
                 e.cellHtml = gridHtml;
             }
         });
         onSearch();
     });

     function onSearch() {
         var grid = mini.get("datagrid");
         var param = {};
         var subitemid = '1';
         var nodeTaskid = '1';
         param.subitemid=subitemid;
         param.nodeTaskid=nodeTaskid;
         grid.load(param);
     }
     function loadGrid(array) {
         var params = {};
         if (!$.isEmptyObject(array) && array.length > 0) {
             params.jsonArray = JSON.stringify(array);
         }
         datagrid.load(params);
     }
     function toPrint(wsbh) {
     	var param={};
         var url ="${webProperties['app.url.approval']}/commCertificate/openPdfFileView.htm";
         mini.open({
             url: url,
             title: "文书预览",
             width: 950,
             height: 600,
             allowResize: false,
             onload: function () {
             	var iframe = this.getIFrameEl();
             	var param={};
             	param.acceptNumber=acceptNumber,//业务编号
             	param.processInstanceId=processInstanceId,//流程实例ID
             	param.fileName=wsbh;//文书编号
                 iframe.contentWindow.SetData(param);
             },
             ondestroy: function (action) {
                 onSearch();
             }
         });
     }
</script>
</div>

