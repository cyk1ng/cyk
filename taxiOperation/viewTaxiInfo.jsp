<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>巡游出租汽车客运服务企业经营许可</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@ include file="/WEB-INF/jsp/include/meta.jsp" %>
<style type="text/css">
html, body {
	padding: 0;
	margin: 0;
	border: 0;
	height: 100%;
	overflow: hidden;
	background-color: white;
}
.asLabel .mini-textbox-border,
.asLabel .mini-textbox-input,
.asLabel .mini-buttonedit-border,
.asLabel .mini-buttonedit-input,
.asLabel .mini-textboxlist-border
{
    border:0;background:#f3f0f0;cursor:default;
}
.asLabel .mini-buttonedit-button,
.asLabel .mini-textboxlist-close
{
    display:none;
}
.asLabel .mini-textboxlist-item
{
    padding-right:8px;
}    

.mini-tabs-buttons{
	padding-right: 30px;
}
</style>
    <script src="${webProperties['app.url.approval']}/resources/js/taxi/commonUtil.js" type="text/javascript"></script>
</head>
<body>
	<div class="mini-fit">
		<div id="tabs1"  activeIndex="1" style="width:100%;height:100%;" plain="false" buttons="#tabsButtons" buttonsAlign="center">
		    	<h3 class="font-16">&nbsp;&nbsp;&nbsp;&nbsp;车辆信息</h3>
		    	<hr/>
		    	<form id="formVehicle">
			      <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
				    <tr>
				       <td style="width:130px;" align="right">车牌照号：</td>
				        <td style="width:50%">
<!-- 				            <input name="licensePlate1" id="licensePlate1" class="mini-combobox asLabel" required="true" -->
<!-- 				             textField="typeNm" valueField="typeCd" emptyText="请选择..."  allowInput="false" showNullItem="false" -->
<%-- 				             url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=carFirstWord" value="02" --%>
<!-- 				            style="width:20%;" />  -->
<!-- 				            <input name="licensePlate2" id="licensePlate2" class="mini-combobox asLabel" required="true" -->
<!-- 				             textField="value" valueField="id" emptyText="请选择..."  allowInput="false" showNullItem="false" -->
<%-- 				             url="${webProperties['app.url.approval']}/taxiBusinessOp/getCarPostComBobox.htm" value="D" --%>
<!-- 				             style="width:20%;" /> -->
<!-- 				            <input name="licensePlate3" id="licensePlate3" class="mini-combobox asLabel" required="true" -->
<!-- 				             textField="value" valueField="id" emptyText="请选择..."  allowInput="false" showNullItem="false" -->
<%-- 				             url="${webProperties['app.url.approval']}/taxiBusinessOp/getCarPostComBobox.htm" value="X" --%>
<!-- 				             style="width:20%;" /> -->
<!-- 				            <input name="licensePlate4" id="licensePlate4" class="mini-textbox asLabel" required="true" style="width:33%;" /><span style="color: red;">*</span> -->
				            <input name="licensePlate" id="licensePlate" class="mini-textbox asLabel" readOnly="true" style="width:96%;"/>
				        </td>
				        <td style="width:130px;" align="right"></td>
				        <td style="width:50%">
				            <input name="" id=" " readOnly="true" class="mini-textbox asLabel"
				            style="width:96%;"/>
				        </td>
				    </tr>
				     <tr>
				    	 <td style="width:130px;" align="right">车辆型号：</td>
				        <td style="width:50%">
<!-- 				            <input name="brandModel" id="brandModel" class="mini-textbox" style="width:96%;" vtype="rangeChar:1,50"/> -->
				            <input id="brandModel" name="brandModel" class="mini-textbox asLabel" readOnly="true"  style="width:96%;" /> 
<%-- 				           			url="${webProperties['app.url.commProcess']}/basicData/queryTobjVehicleModel.htm"/> --%>
<!-- 									<a class="mini-button" iconCls="" onclick="selectTaxiType()"style="background-color: blue; color: white" >选择</a> -->
				        </td>
				        <td style="width:130px;" align="right">营运证类别：</td>
				        <td style="width:50%">
				            <input name="operationCertificateClass" id="operationCertificateClass" class="mini-combobox asLabel"
				            textField="typeNm" valueField="typeCd" emptyText="请选择..."  allowInput="false" showNullItem="false"  readOnly="true"
				             url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=taxiCardType"  value="1"
				            style="width:96%;"/>
				        </td>
				    </tr>
				    <tr>
				        <td style="width:130px;" align="right">车辆颜色：</td>
				        <td style="width:50%">
				            <input name="licenseColor" id="licenseColor" class="mini-combobox asLabel" required="true" value="216"
				             textField="typeNm" valueField="typeCd" emptyText=""  allowInput="false" showNullItem="false" readOnly="true"
				             url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=vehicleColor"
				            style="width:96%;"/>
				        </td>
				        <td style="width:130px;" align="right">牌照类型：</td>
				        <td style="width:50%">
				            <input name="vehicleColour" id="vehicleColour" class="mini-combobox asLabel" required="true" value="B"
				              textField="typeNm" valueField="typeCd" emptyText=""  allowInput="true" showNullItem="false" readOnly="true"
				             url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=plantColor"
				            style="width:96%;"/>
				        </td>
				    </tr>
				    <tr>
				        <td style="width:130px;" align="right">车架号：</td>
				        <td style="width:50%">
				            <input name="frameNumber" id="frameNumber" class="mini-textbox asLabel" required="true" readOnly="true" style="width:96%;"/>
				        </td>
				        <td style="width:130px;" align="right">发动机号：</td>
				        <td style="width:50%">
				            <input name="engineNumber" id="engineNumber" class="mini-textbox asLabel" required="true" readOnly="true" style="width:96%;"/>
				        </td>
				    </tr>
				    <tr>
				        <td style="width:130px;" align="right">投运日期：</td>
				        <td style="width:50%">
				            <input name="commissioningDate" id="commissioningDate" required="true" class="mini-datepicker asLabel" 
				            valueType="date" allowInput="false" format="yyyy-MM-dd" timeFormat="H:mm:ss" showTime="false" readOnly="true"
						    showOkButton="false" showClearButton="true" 
				            style="width:96%;" />
				        </td>
				         <td style="width:130px;" align="right">车辆类型：</td>
				        <td style="width:50%">
				            <input name="carType" id="carType" class="mini-combobox asLabel"  required="true" value="3" readOnly="true"
				             textField="typeNm" valueField="typeCd" emptyText=""  allowInput="false" showNullItem="false"
				             url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=taxiSize"
				            style="width:96%;" />
				        </td>
				    </tr>
				    <tr>
				     	<td style="width:130px;" align="right">发动机功率：</td>
				        <td style="width:50%">
				            <input name="enginePower" id="enginePower" class="mini-textbox asLabel" required="true" readOnly="true" style="width:90%;" /><span>KW</span>
				        </td>
				         <td style="width:130px;" align="right">厂牌标志：</td>
				        <td style="width:50%">
				            <input name="label" id="label" class="mini-textbox asLabel" style="width:96%;" readOnly="true"/>
				        </td>
				       
				    </tr>
				    <tr>
				     	<td style="width:130px;" align="right">运价/公里：</td>
				        <td style="width:50%">
				            <input name="freightRate" id="freightRate" class="mini-textbox asLabel" required="true" readOnly="true" style="width:96%;" vtype="float;range:0,99.99"/>
				        </td>
				        <td style="width:130px;" align="right">载客人数：</td>
				        <td style="width:50%">
				            <input name="passengerNo" id="passengerNo" class="mini-textbox asLabel" required="true" readOnly="true" style="width:96%;" vtype="int;range:0,1000"/>
				        </td>
				    </tr>
				    <tr>
				        <td style="width:130px;" align="right">企业名称：</td>
				        <td style="width:50%">
				            <input name="enterpriseName" id="enterpriseName" class="mini-textbox asLabel"  readOnly="true" style="width:96%;" />
				        </td>
				        <td style="width:130px;" align="right">企业编号：</td>
				        <td style="width:50%">
				            <input name="enterpriseNumber" id="enterpriseNumber" class="mini-textbox asLabel"  readOnly="true"  style="width:96%;" />
				        </td>
				    </tr>
				    <tr>
				        <td style="width:130px;" align="right">自动门安装：</td>
				        <td style="width:50%">
				            <input name="autoDoorInstall" id="autoDoorInstall" class="mini-combobox asLabel" emptyText="" data="[{id:'1',text:'是'},{id:'0',text:'否'}]" style="width:96%;" readOnly="true" />
				        </td>
				        <td style="width:130px;" align="right">LPG安装：</td>
				        <td style="width:50%">
				            <input name="lpgInstall" id="lpgInstall" class="mini-combobox asLabel" emptyText="" data="[{id:'1',text:'是'},{id:'0',text:'否'}]" style="width:96%;"  readOnly="true"/>
				        </td>
				    </tr>
				    <tr>
				        <td style="width:130px;" align="right">GPS安装：</td>
				        <td style="width:50%">
				            <input name="gpsInstall" id="gpsInstall" class="mini-combobox asLabel" emptyText="" data="[{id:'1',text:'是'},{id:'0',text:'否'}]" style="width:96%;" readOnly="true"/>
				        </td>
<!-- 				        <td style="width:130px;" align="right">车辆代号：</td> -->
<!-- 				        <td style="width:50%"> -->
<!-- 				            <input name="vehicleCode" id="vehicleCode"class="mini-textbox asLabel" style="width:96%;" /> -->
<!-- 				        </td> -->
 						<td style="width:130px;" align="right">车辆品牌：</td>
				        <td style="width:50%">
				            <input name="vehicleBrand" id="vehicleBrand" class="mini-textbox asLabel" style="width:96%;" readOnly="true" />
				        </td>
				    </tr>
				    <tr>
				        <td style="width:130px;" align="right">购车日期：</td>
				        <td style="width:50%">
				            <input name="purchaseDate" id="purchaseDate" class="mini-datepicker asLabel" 
				            valueType="date" allowInput="false" format="yyyy-MM-dd" timeFormat="H:mm:ss" showTime="false" readOnly="true"
						    showOkButton="false" showClearButton="true" 
				            style="width:96%;" />
				        </td>
				        <td style="width:130px;" align="right">出厂日期：</td>
				        <td style="width:50%">
				            <input name="productionDate" id="productionDate" class="mini-datepicker asLabel" 
				            valueType="date" allowInput="false" format="yyyy-MM-dd" timeFormat="H:mm:ss" showTime="false" readOnly="true"
						    showOkButton="false" showClearButton="true" 
				            style="width:96%;" />
				        </td>
				    </tr>
				    <tr>
				        <td style="width:130px;" align="right">燃料类型：</td>
				        <td style="width:50%">
				            <input name="fuelType" id="fuelType" 
				             textField="typeNm" valueField="typeCd" emptyText="请选择..."  allowInput="false" showNullItem="false" readOnly="true"
				             url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=vehicleFuel"
				            class="mini-combobox asLabel" value="1" style="width:96%;" />
				        </td>
				       
<!-- 				       <td style="width:130px;" align="right">批量插入：</td> -->
<!-- 				        <td style="width:50%"> -->
<!-- 				            <input name="batchInsertion" id="batchInsertion" class="mini-textbox" style="width:96%;"/> -->
<!-- 				        </td> -->
						
				    </tr>
				     <tr>
				     <td style="width:100%" colspan="6" align="center">
				     	<a class="mini-button" iconCls="" onclick="doClose()">关闭</a>
				     </td>
				    </tr>
				</table>
				<input name="_id" id="_id" class="mini-hidden"/>
				<input name="_uid" id="_uid" class="mini-hidden"/>
				<input name="_state" id="_state" class="mini-hidden"/>
		       </form>
		</div>
	</div>
	
<script type="text/javascript">
	mini.parse();
	$(document).ready(function(){
		
		var model = getRequestString("model");
		if("view" == model){
			labelModel("formVehicle");
		}
		
		// 编辑
		var data = getRequestString("row");
		if (data != null && data != "") {
			debugger;
			data = JSON.parse(data)
			Object.keys(data).forEach(function(key){
				if (mini.get(key) != "undefined" && typeof(mini.get(key)) != "undefined") {
					/* if(key == "brandModel"){
						mini.get(key).setText(data[key]);
					} */
					mini.get(key).setValue(data[key]);
				}
			});
		}

		var enterpriseNumber = getRequestString("enterpriseNumber");
		var companyName = getRequestString("companyName");
		mini.get("enterpriseNumber").setValue(enterpriseNumber);
		mini.get("enterpriseName").setValue(companyName);
	});
	
	// 关闭
	function CloseWindow(action) {
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();
    }
	// 关闭
	function doClose() {       
// 		loadParent();
		CloseWindow("cancel");
	}     
	// 关闭本画面
    function loadParent() {
        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        parent.layer.close(index);
    }
</script>
</body>
</html>
