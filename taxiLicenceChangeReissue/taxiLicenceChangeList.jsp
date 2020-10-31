<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="cn.seisys.iti.pdd.auth.entity.UserInfo" %>
<%@ page import="cn.seisys.iti.pdd.auth.util.ShiroUtils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<title></title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<jsp:include  page="../include/meta.jsp"/>
		<style type="text/css">
			html,
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
		<!--撑满页面-->
		<div class="mini-fit">
			<div id="layout1" class="mini-layout" style="width: 100%; height: 100%;" borderStyle="border:solid 1px #aaa;">
				
				<div title="center" region="center">
					<div id="datagrid" class="mini-datagrid" style="width: 100%; height: 100%;" 
					url="<c:url value='queryTaxiLicenceChangeListPage.htm'/>" 
					onrowdblclick="celldblclick" allowSortColumn="true" sortField="bjsj" sortOrder="desc" sizeList="[10,20,30]" 
					pageSize="10" onloaderror="mini.alert(e.errorMsg);"  showHeader="true" >
						<div property="columns">
							<div type="indexcolumn" align="center" headerAlign="center" width="10%" allowSort="true">序号</div>
							<div field="qymc" align="center" headerAlign="center" width="35%"  allowSort="true">企业名称</div>
							<div field="jjlx" align="center" headerAlign="center" width="10%"  allowSort="true">经济类型</div>
							<div field="qybh" align="center" headerAlign="center" width="10%"  allowSort="true">企业编号</div>
							<div field="hy" align="center" headerAlign="center" width="10%"  allowSort="true">行业</div>
							  <div field="action" name="action" width="25%" headerAlign="center" align="center" allowSort="true">操作</div> 
						</div>
					</div>
		
					
					
				</div>
			</div>
		</div>

		

	</body>
<script type="text/javascript">
	mini.parse();
	$(document).ready(function () {
		execQuery();
		
	});
	function execQuery(){
   	    mini.parse();
   	    var grid = mini.get("datagrid");
   	    //grid.clearRows();
   	    grid.on("drawcell", function (e) {
   	    	 var record = e.record,
   		        column = e.column,
   		        field = e.field,
   		        value = e.value;
   	    	 var id=record.id;
   	        //action列，超连接操作按钮
   	        if (column.name =="action") {
   	            e.cellStyle = "text-align:center";
   		         e.cellHtml = '<div ><input type="button" onclick="yesLJ(\'' + id + '\',\'' + id + '\')" value="换证">&nbsp;<input type="button" value="补证" onclick="noLJ(\'' + id + '\',\'' + id + '\')"></div>';	
   		            	
   	        }
   	        
   	    });
	    grid.select(0);
   	    grid.load();

   }
	function changePer(){
		
	}
</script>
</html>