<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--BEGIN 业务信息-->
<div  id="tuizheng">
   <%-- <div id="grid1" style="float:left;width:48%;height:800px">
	<div id="datagridCar" class="mini-datagrid" idField="eventId" url="${webProperties['app.url.approval']}/taxiBusinessOp/queryVehicleBasicTaxiList.htm"
		allowSortColumn="true" showPager="true" pageSize="10" 
		pager="pager1" style="width: 100%; height: 700px;"allowRowSelect="true" multiSelect="true" onloaderror="mini.alert(e.errorMsg);">
		<div property="columns">
		<div type="indexcolumn" align="center" width='50px'headerAlign="center">序号</div>
			<div field="vehiclelicense" align="center" width='100px' headerAlign="center">车牌照号</div>
			<div field="enterpriseName" align="center" width='100px'headerAlign="center">企业名称</div>
			<div field="isIllegal" align="center" width='100px'headerAlign="center">是否违法</div>
			<div field="id" id="id" visible="false"></div>
		</div>
	</div>
	</div> --%>
	<div id="grid2" style="float:right;width:100%;height:800px">
	<div id="datagridCarYes" class="mini-datagrid" idField="eventId"
		allowSortColumn="true" showPager="false" pageSize="10000"
		 style="width: 100%; height: 700px;"allowRowSelect="true" multiSelect="true" onloaderror="mini.alert(e.errorMsg);">
		<div property="columns">
		<div type="indexcolumn" align="center" width='50px'headerAlign="center">序号</div>
			<div field="licensePlate" align="center" width='100px' headerAlign="center">车牌照号</div>
			<div field="enterpriseName" align="center" width='100px'headerAlign="center">企业名称</div>
			<div field="isIllegal" align="center" width='100px'headerAlign="center">是否违章</div>
			<div field="id" id="id" visible="false"></div>
			<div field="selectCarId" id="selectCarId" visible="false"></div>
		</div>
	</div>
	</div>
</div>
<!--END 业务信息-->