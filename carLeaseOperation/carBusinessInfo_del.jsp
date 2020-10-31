<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--BEGIN 业务信息-->
<div  id="tuizheng">
	<div id="grid1" style="float:left;width:48%;height:800px">
	<div id="searchDiv" style="height: 40px">
		车牌照号： <input name="licensePlate1" id="licensePlate1" class="mini-combobox"
	             textField="typeNm" valueField="typeCd" emptyText="请选择..."  allowInput="false" showNullItem="true" value="02"
	             url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=carFirstWord"
	           style="width:13%;" />
	          <%-- <input name="licensePlate2" id="licensePlate2" class="mini-combobox" 
	            	textField="value" valueField="id" emptyText="请选择..."  allowInput="false" showNullItem="true"
	             	url="${webProperties['app.url.approval']}/taxiBusinessOp/getCarPostComBobox.htm"
	            	style="width:10%;" />
	          <input name="licensePlate3" id="licensePlate3" class="mini-combobox" 
	            	textField="value" valueField="id" emptyText="请选择..."  allowInput="false" showNullItem="true"
	             	url="${webProperties['app.url.approval']}/taxiBusinessOp/getCarPostComBobox.htm"
	            	 style="width:10%;" /> --%>
	          <input name="licensePlate4" id="licensePlate4" class="mini-textbox" style="width:18%;" />
		 车辆颜色： <input name="vehicleColour" id="vehicleColour" class="mini-combobox"
	              textField="typeNm" valueField="typeCd" emptyText="请选择..."  allowInput="true" showNullItem="true"
	             url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=plantColor" 
	             style="width:20%;" />
		  <a id="toggleBtn1"class="btn btn-info" iconCls="" onclick="doSearch()">查询</a>
		  <a id="toggleBtn2"class="btn btn-info" iconCls="" onclick="forReset()">重置</a>
	</div>
	<div id="datagridCar" class="mini-datagrid" idField="eventId" url="${webProperties['app.url.approval']}/carLeaseOp/queryVehicleBasicTaxiList.htm"
		allowSortColumn="true" showPager="true" pageSize="10"
		pager="pager1" style="width: 100%; height: 700px;"allowRowSelect="true" allowUnselect="true" multiSelect="true" sizeList="[10,20,30]" onloaderror="mini.alert(e.errorMsg);">
		<div property="columns">
		<div type="checkcolumn" field="checkcolumn"></div>
		<!-- <div type="indexcolumn" align="center" width='50px'headerAlign="center">序号</div> -->
			<div field="vehiclelicense" align="center" width='100px' headerAlign="center">车牌照号</div>
			<div field="enterpriseName" align="center" width='100px'headerAlign="center">企业名称</div>
			<div field="isIllegal" align="center" width='100px'headerAlign="center">是否违章</div>
			<div field="id" id="id" visible="false"></div>
		</div>
	</div>
	</div>
	<div id="add" style="float:left;width:4%;height:800px">
		
		 <div id="addRight" class="btn green-soft btn-sm" style="margin:300px 0 0 10px;width:30px;" data-toggle="tooltip"
                                 data-placement="right" title="移入" onclick="addRigthCar()"><i
                                 class="fa fa-step-forward"></i>
                   </div>
		 <div id="addLeft" class="btn green-soft btn-sm" style="margin:20px 0 0 10px;width:30px;" data-toggle="tooltip"
                                 data-placement="left" title="移出" onclick="addLeftCar()"><i
                                 class="fa fa-step-backward"></i>
                   </div>
	</div>
	<div id="grid2" style="float:right;width:48%;height:800px">
	<div id="topFill" style="height: 40px">
	</div>
	<div id="datagridCarYes" class="mini-datagrid" idField="eventId"
		allowSortColumn="true" showPager="false" pageSize="10000"
		 style="width: 100%; height: 700px;"allowRowSelect="true" multiSelect="true" allowUnselect="true" onloaderror="mini.alert(e.errorMsg);">
		<div property="columns">
		<div type="checkcolumn"></div>
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