<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div title="业务信息" >
	<!-- START 过户企业信息 -->
	<div>
	   	<h3 class="font-16">过户企业信息</h3>
	   	<hr/>
	   	<form id="form_company">
	      	<table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
	      		<tr>
			        <td style="width:130px;" align="right">出让企业名称：</td>
			        <td style="width:50%" colspan="3">
<!-- 			            <input name="name10" class="mini-textbox" style="width:85%;" value="10"/> -->
						<input id="outEnterpriseName" name="outEnterpriseName" class="mini-buttonedit" onbuttonclick="onButtonEdit" mame="outEnterpriseName" value="${taxiBussinessEntity.outEnterpriseName }"
                       		allowInput="false" autocomplete="off"  data-provide="typeahead"  type="text"
                       		style="width:96%;"
                       	/>
<!-- 			            <a id="toggleBtn1" class="btn btn-info" iconCls="" onclick="execQuery()">选择</a> -->
			        </td>
			        <td style="width:130px;" align="right">出让企业编号：</td>
			        <td style="width:50%">
			            <input id="outEnterpriseNumber" name="outEnterpriseNumber" value="${taxiBussinessEntity.outEnterpriseNumber }" class="mini-textbox asLabel" style="width:100%;" readOnly="true"/>
			        </td>
			    </tr>
			    <tr>
			        <td style="width:130px;" align="right">注册地址：</td>
			        <td style="width:50%" colspan="3">
			            <input id="outRegisterAddress" name="outRegisterAddress" value="${taxiBussinessEntity.outRegisterAddress }" class="mini-textbox asLabel" style="width:96%;" readOnly="true"/>
			        </td>
			        <td style="width:130px;" align="right">法定代表人：</td>
			        <td style="width:50%">
			            <input id="outApplyLegal" name="outApplyLegal" value="${taxiBussinessEntity.outApplyLegal }" class="mini-textbox asLabel" style="width:100%;" readOnly="true"/>
			        </td>
			    </tr>
			    <tr id="companyCarQuota">
			        <td style="width:130px;" align="right">小型车额度：</td>
			        <td style="width:25%">
			            <input id="miniCarInfo" class="mini-textbox asLabel" style="width:100%;" readOnly="true"/>
			        </td>
			        <td style="width:130px;" align="right">中型车额度：</td>
			        <td style="width:25%">
			            <input id="mediumCarInfo" class="mini-textbox asLabel" style="width:100%;" readOnly="true"/>
			        </td>
			        <td style="width:130px;" align="right">大型车额度：</td>
			        <td style="width:50%">
			            <input id="largeCarInfo" class="mini-textbox asLabel" style="width:50%;" readOnly="true"/>
			        </td>
			    </tr>
			</table>
	   	</form>
   	</div>
   	<!-- END 过户企业信息 -->
	<!-- START 额度过户 -->
	<div id="quotaDiv">
		<div style="float: left;vertical-align: baseline;">
	   		<h3 class="font-16" style="display: inline-block;">额度过户</h3>
	   	</div>
	   	<div style="float: right;margin-top:25px">
		   	<div id="quotaInfoRdio" class="mini-radiobuttonlist" repeatItems="1" repeatLayout="table" repeatDirection="vertical"
				textField="text" valueField="id" onvaluechanged="quotaInfoChange()"
				data="[{id:'1',text:''}]"
				>
			</div>
		</div>
		<div style="width:100%;float: left">
			<hr/>
		</div>
	   	<form id="form_quota">
	      	<table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
			    <tr>
			        <td style="width:130px;" align="right"></td>
			        <td style="width:50%" colspan="3">
			        </td>
			        <td style="width:130px;" align="right"></td>
			        <td style="width:50%">
			        </td>
			    </tr>
			    <tr>
			        <td style="width:130px;" align="right">小型车额度：</td>
			        <td style="width:25%">
			            <input id="miniCarQuota" name="miniCarQuota" value="${taxiBussinessEntity.miniCarQuota }" onvalidation="onIntValidation" class="mini-textbox" style="width:100%;"/>
			        </td>
			        <td style="width:130px;" align="right">中型车额度：</td>
			        <td style="width:25%">
			            <input id="mediumCarQuota" name="mediumCarQuota" value="${taxiBussinessEntity.mediumCarQuota }" onvalidation="onIntValidation" class="mini-textbox" style="width:100%;"/>
			        </td>
			        <td style="width:130px;" align="right">大型车额度：</td>
			        <td style="width:50%">
			            <input id="largeCarQuota" name="largeCarQuota" value="${taxiBussinessEntity.largeCarQuota }" onvalidation="onIntValidation" class="mini-textbox" style="width:40%;"/>
			        </td>
			    </tr>
			</table>
	   	</form>
   	</div>
   	<!-- END 额度过户-->
   	<!-- START 车辆过户 -->
   	<div id="carDiv">
	   	<div style="float: left;vertical-align: baseline;">
	   		<h3 class="font-16" style="display: inline-block;">车辆过户
	   		<div id="carQuotaLimit" style="display: inline-block;">
	   			(<div id="ownQuota" style="display: inline-block;">0</div>+<div id="carCnt" style="display: inline-block;">0</div>/<div id="sumQuota" style="display: inline-block;">4</div>)
	   		</div>
	   		</h3>
	   	</div>
	   	<div style="float: right;margin-top:25px">
		   	<div id="carInfoRdio" class="mini-radiobuttonlist" repeatItems="1" repeatLayout="table" repeatDirection="vertical"
				textField="text" valueField="id" onvaluechanged= "carInfoChange()"
				data="[{id:'1',text:''}]"
				>
			</div>
		</div>
		<div style="width:100%;float: left">
			<hr/>
		</div>
		<form id="form_car">
			<div id="carSearchDiv" style="width: 100%;height: 100%;float: left">
				<div style="height: 40px">
					车牌照号：
					<input id="licensePlate1" class="mini-combobox" style="width:80px;" textField="typeNm" valueField="typeCd" width="10%" value="02"
						emptyText="请选择..." allowInput="false" showNullItem="true" nullItemText="请选择..." 
						url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=carFirstWord"
					/>
					<%-- <input id="licensePlate2" class="mini-combobox" style="width:80px;" textField="value" valueField="id" width="10%"
						emptyText="请选择..." allowInput="false" showNullItem="true" nullItemText="请选择..."
						url="${webProperties['app.url.approval']}/taxiBusinessOp/getCarPostComBobox.htm"
					/>
					<input id="licensePlate3" class="mini-combobox" style="width:80px;" textField="value" valueField="id" width="10%"
						emptyText="请选择..." allowInput="false" showNullItem="true" nullItemText="请选择..."
						url="${webProperties['app.url.approval']}/taxiBusinessOp/getCarPostComBobox.htm"
					/> --%>
					<input id="licensePlate4" class="mini-textbox" style="width:150px;"/> 
<!-- 					&nbsp;&nbsp;车牌颜色： -->
<!-- 					<input id="licenseColor" class="mini-combobox" style="width:120px;" -->
<!-- 						textField="typeNm" valueField="typeCd" emptyText="请选择..."  allowInput="false" showNullItem="false" -->
<%-- 			            url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=vehicleColor" --%>
<!-- 					/> -->
					&nbsp;&nbsp;车辆类型：
					<input id="licenseTypeCd" class="mini-combobox" style="width:90px;"
						textField="typeNm" valueField="typeCd" emptyText="请选择..."  allowInput="false" showNullItem="true" nullItemText="请选择..."
						url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=taxiSize"
					/>
					<a id="searchBtn" class="btn btn-info" iconCls="" onclick="execQuery()">查询</a>
					<a id="resetBtn" class="btn btn-info" iconCls="" onclick="restQuery()">重置</a>
				</div>
			</div>
			<div style="width: 48%;height: 100%;float: left;">
				<div id="datagrid01" class="mini-datagrid" style="width:100%;height:500px;" allowResize="false" url="${webProperties['app.url.approval']}/taxiTransfer/queryVehicleBasicTaxiList.htm"
				    showPager="true" idField="id" multiSelect="true" selectOnLoad="false" allowUnselect="true"
				    pageSize="10" sizeList="[10,20,30]">
					<div property="columns">
						<div type="checkcolumn" field="checkcolumn"></div>
						<!-- <div type="indexcolumn" align="center" width='50px'headerAlign="center">序号</div>       -->
						<div field="vehiclelicense" width="40%" headerAlign="center" align="center" allowSort="false">车牌照号</div>
						<div field="color" width="30%" headerAlign="center" align="center" allowSort="false">车辆颜色</div>
						<div field="vehicleclass" width="30%" headerAlign="center" align="center" allowSort="false">车辆类型</div>
						<div field="ifPeccancy" width="60%" headerAlign="center" align="center" allowSort="false">是否违章</div>
						<div field="id" id="id" visible="false"></div>
					</div>
				</div>
			</div>
			<div style="width: 4%;height: 100%;float: left;text-align:center;">
				<div style="padding: 150px 0px 0 0">
					<div><a id="addCarBtn" class="btn green-soft btn-sm" iconCls="" onclick="addRigthCar()"><i class="fa fa-step-forward"></i></a><br></br></div>
    				<div><a id="delCarBtn" class="btn green-soft btn-sm" iconCls="" onclick="addLeftCar()"><i class="fa fa-step-backward"></i></a></div>
				</div>
			</div>
			<div style="width: 48%;height: 100%;float: right;">
				<div id="datagrid02" class="mini-datagrid" style="width:100%;height:500px;" allowResize="false" allowUnselect="true" url="" idField="id" multiSelect="true"
				    showPager="false">
					<div property="columns">
						<div type="checkcolumn"></div>
						<div type="indexcolumn" align="center" width='50px'headerAlign="center">序号</div> 
						<div field="licensePlate" width="40%" headerAlign="center" align="center" allowSort="false">车牌照号</div>
						<div field="licenseColor" width="30%" headerAlign="center" align="center" allowSort="false">车辆颜色</div>
						<div field="carType" width="30%" headerAlign="center" align="center" allowSort="false">车辆类型</div>
						<div field="ifPeccancy" width="60%" headerAlign="center" align="center" allowSort="false">是否违章</div>
						<div field="id" id="id" visible="false"></div>
						<div field="selectCarId" id="selectCarId" visible="false"></div>
					</div>
				</div>
			</div>
		</form>
		<!-- 受理、不予受理成功后、或查看模式时，显示的车辆数据 -->
		<div id="datagridReadOnly" class="mini-datagrid" style="width:96%;height:500px;display:none;" allowResize="false" url="" idField="id" multiSelect="true"
		    showPager="false">
			<div property="columns">
				<div type="indexcolumn" align="center" width='50px'headerAlign="center">序号</div> 
				<div field="licensePlate" width="40%" headerAlign="center" align="center" allowSort="false">车牌照号</div>
				<div field="licenseColor" width="30%" headerAlign="center" align="center" allowSort="false">车辆颜色</div>
				<div field="carType" width="30%" headerAlign="center" align="center" allowSort="false">车辆类型</div>
				<div field="ifPeccancy" width="60%" headerAlign="center" align="center" allowSort="false">是否违法</div>

			</div>
		</div>
	</div>
	<!-- END 车辆过户 -->
</div>
