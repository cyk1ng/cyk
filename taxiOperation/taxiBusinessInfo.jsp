<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--BEGIN 业务信息-->
<div >
<div id="panel1" class="mini-panel" title="额度信息" iconCls="icon-add" style="width:100%;height:100px;" 
    	showToolbar="true" showCollapseButton="true"  collapseOnTitleClick="true" expanded="true"
		>
    	<form id="form1">
	      <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
		    <tr>
	        <td style="width:130px;" align="right">总额度(小)：</td>
	        <td style="width:25%">
	            <input id="totalCarQuota"  readOnly="true" class="mini-textbox asLabel" style="width:40%;" value="0"/>
	        	<input id="spare1" style="display:none" class="mini-textbox asLabel" value="0"/>
	        	<input id="totalCarQuota_right" style="display:none" class="mini-textbox asLabel" value=""/>
	        </td>
	        <td style="width:130px;" align="right">剩余额度(小)：</td>
	        <td style="width:25%">
	            <input id="leftCarQuota" readOnly="true" class="mini-textbox asLabel" style="width:40%;" value="0"/>
	        	<input id="spare2" style="display:none" class="mini-textbox asLabel" value="0"/>
	        	<input id="leftCarQuota_right" style="display:none" class="mini-textbox asLabel" value=""/>
	        </td>
	    	</tr>
		</table>
       </form>
       </div>
       <div id="panel2" class="mini-panel" title="车辆信息" iconCls="icon-add" style="width:100%;height:500px;" 
    	showToolbar="true" showCollapseButton="true"  collapseOnTitleClick="true" expanded="true"
		>
	      <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
		    <tr>
		        <td style="width:100px;" align="right">车牌照号：</td>
		        <td style="width:40%">
		          <input name="licensePlate1" id="licensePlate1" class="mini-combobox" 
		             textField="typeNm" valueField="typeCd" emptyText="请选择..."  allowInput="false" showNullItem="true" value="02"
		             url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=carFirstWord"
		           style="width:45%;" />
		          <%-- <input name="licensePlate2" id="licensePlate2" class="mini-combobox" 
		            	textField="value" valueField="id" emptyText="请选择..."  allowInput="false" showNullItem="true"
		             	url="${webProperties['app.url.approval']}/taxiBusinessOp/getCarPostComBobox.htm" 
		            	style="width:20%;" />
		          <input name="licensePlate3" id="licensePlate3" class="mini-combobox" 
		            	textField="value" valueField="id" emptyText="请选择..."  allowInput="false" showNullItem="true"
		             	url="${webProperties['app.url.approval']}/taxiBusinessOp/getCarPostComBobox.htm" 
		            	 style="width:20%;" /> --%>
		           <input name="licensePlate4" id="licensePlate4" class="mini-textbox" style="width:45%;" />
		        </td>
		        <td style="width:70px;" align="left">车牌颜色：</td>
		        <td style="width:20%">
		            <input name="vehicleColour" id="vehicleColour" class="mini-combobox"  
		              textField="typeNm" valueField="typeCd" emptyText="请选择..."  allowInput="true" showNullItem="true"
		             url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=plantColor" 
		             style="width:96%;" />
		        </td>
		         <td style="width:80%">
		            <a id="toggleBtnSearch" class="mini-button" iconCls="" onclick="doSearch()">查询</a>
		            <a id="toggleBtnRest" class="mini-button" iconCls="" onclick="forReset()">重置</a>
		            <a id="toggleBtnAdd" class="mini-button" iconCls="" onclick="doAddTaxi()">新增</a>
		            <a id="toggleBtnEdit" class="mini-button" iconCls="" onclick="editTaxiInfo()">批量更新</a>
		        </td>
		    </tr>
		</table>
		<table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
<!-- 					<div class="mini-fit"> -->
		<form id="formDatagrid" method="post">
                         <div id="datagrid01" class="mini-datagrid"
<%--                                 url="${webProperties['app.url.construction']}/task/queryTaskYearTargetList.htm" --%>
                              idField="id" allowSortColumn="true" showPager="false"  pageSize="10" pager="pager1" style="width: 100%; height: 400px;"
                               allowRowSelect="true" multiSelect="true"
                              onloaderror="mini.alert(e.errorMsg);">
                             <div property="columns">
                             	 <div type="checkcolumn" field="checkcolumn" name ="cc" ></div>
                                 <div type="indexcolumn" align="center" width='50px' headerAlign="center">序号</div>
                                 <div field="licensePlate" align="center" width='100px' headerAlign="center">车牌照号</div>
                                 <div field="operationCertificateClass" align="center" width='100px' headerAlign="center">营运证类别</div>
                                 <div field="vehicleColour" align="center" width='100px' headerAlign="center">车牌颜色</div>
                                 <div field="carType" align="center" width='100px' headerAlign="center">车辆类型</div>
                                 <div field="brandModel" align="center" width='100px' headerAlign="center">车辆型号</div>
                                 <div field="commissioningDate" align="center" width='100px' headerAlign="center" renderer="ondayRendererYYYYMMDD">投运日期</div>
                                 <div field="enginePower" align="center" width='100px' headerAlign="center">发动机功率</div>
                                 <div field="freightRate" align="center" width='100px' headerAlign="center">运价/公里</div>
                                 <div field="passengerNo" align="center" width='100px' headerAlign="center">载客人数</div>
                                 <div field="cz" align="center" headerAlign="center" width='180px'>操作</div>
                                 <div field="id" id="id" visible="false"></div>
                                 <div field="selectCarId" id="selectCarId" visible="false"></div>
                             </div>
                         </div>
<!--                           </div> -->
			</form>
                </table>
              </div>
</div>
<!--END 业务信息-->