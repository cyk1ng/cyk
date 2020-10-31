<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>租赁汽车客运服务企业经营许可</title>
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
				            <input name="licensePlate1" id="licensePlate1" class="mini-combobox" required="true"
				             textField="typeNm" valueField="typeCd" emptyText="请选择..."  allowInput="false" showNullItem="false"
				             url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=carFirstWord" value="02"
				            style="width:20%;" /> 
<!-- 				            <input name="licensePlate2" id="licensePlate2" class="mini-combobox" required="true" -->
<!-- 				             textField="value" valueField="id" emptyText="请选择..."  allowInput="false" showNullItem="false" -->
<%-- 				             url="${webProperties['app.url.approval']}/taxiBusinessOp/getCarPostComBobox.htm" value="D" --%>
<!-- 				             style="width:14%;" /> -->
<!-- 				            <input name="licensePlate3" id="licensePlate3" class="mini-combobox" required="true" -->
<!-- 				             textField="value" valueField="id" emptyText="请选择..."  allowInput="false" showNullItem="false" -->
<%-- 				             url="${webProperties['app.url.approval']}/taxiBusinessOp/getCarPostComBobox.htm" value="X" --%>
<!-- 				             style="width:14%;" /> -->
				            <input name="licensePlate4" id="licensePlate4" class="mini-textbox" required="true" style="width:42%;" onBlur="myChange('licensePlate4')" onvalidation="engChange('licensePlate4',e);" vtype="rangeChar:6,7"/><span style="color: red;">*</span>
				            <a class="mini-button" iconCls="" onclick="initAddData()"style="background-color: blue; color: white" >获取公安接口信息</a>
				            <input name="licensePlate" id="licensePlate" class="mini-hidden"/>
				            <input id="licensePlateOld" class="mini-hidden"/>
				        </td>
				        <td style="width:130px;" align="right" >批量插入：</td>
				        <td style="width:50%">
				            <input name="batchInsertion" id="batchInsertion" class="mini-textbox asLabel" style="width:96%;" readOnly="true"/>
				        </td>
				        
				    </tr>
				    <tr>
				    	 <td style="width:130px;" align="right">车辆型号：</td>
				        <td style="width:50%">
<!-- 				            <input name="brandModel" id="brandModel" class="mini-textbox" style="width:96%;" vtype="rangeChar:1,50"/> -->
				            <input id="brandModel" name="brandModel" class="mini-autocomplete"  style="width:82%;" valueField="modelno" textField="modelno" searchField="modelno"
				           			url="${webProperties['app.url.commProcess']}/basicData/queryTobjVehicleModel.htm?pageIndex=1&pageSize=100"/>
									<a class="mini-button" iconCls="" onclick="selectTaxiType()"style="background-color: blue; color: white" >选择</a>
				        </td>
				        <td style="width:130px;" align="right">营运证类别：</td>
				        <td style="width:50%">
				            <input name="operationCertificateClass" id="operationCertificateClass" class="mini-combobox "
				            textField="typeNm" valueField="typeCd" emptyText="请选择..."  allowInput="false" showNullItem="false"
				             url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=retailCardType" value="1"
				            style="width:96%;"/>
				        </td>
				    </tr>
				    <tr>
				        <td style="width:130px;" align="right">车辆颜色：</td>
				        <td style="width:50%">
				            <input name="licenseColor" id="licenseColor" required="true" class="mini-combobox" value="216"
				             textField="typeNm" valueField="typeCd" emptyText="请选择..."  allowInput="false" showNullItem="false"
				             url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=vehicleColor"
				            style="width:96%;"/><span style="color: red;">*</span>
				        </td>
				        <td style="width:130px;" align="right">牌照类型：</td>
				        <td style="width:50%">
				            <input name="vehicleColour" id="vehicleColour" class="mini-combobox" required="true" value="B"
				              textField="typeNm" valueField="typeCd" emptyText="请选择..."  allowInput="true" showNullItem="false"
				             url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=plantColor"
				            style="width:96%;"/><span style="color: red;">*</span>
				            
				        </td>
				    </tr>
				    <tr>
				        <td style="width:130px;" align="right">车架号：</td>
				        <td style="width:50%">
				            <input name="frameNumber" id="frameNumber" class="mini-textbox" style="width:96%;" onvalidation="engChange('frameNumber',e)" maxLength="17" vtype="rangeChar:17,17"/>
				        </td>
				        <td style="width:130px;" align="right">发动机号：</td>
				        <td style="width:50%">
				            <input name="engineNumber" id="engineNumber" class="mini-textbox" style="width:96%;" onvalidation="engChange('engineNumber',e)" vtype="rangeChar:6,50"/>
				        </td>
				    </tr>
				    <tr>
				        <td style="width:130px;" align="right">投运日期：</td>
				        <td style="width:50%">
				            <input name="commissioningDate" id="commissioningDate" required="true" class="mini-datepicker" 
				            valueType="date" allowInput="false" format="yyyy-MM-dd" timeFormat="H:mm:ss" showTime="false"
						    showOkButton="false" showClearButton="true" 
				            style="width:96%;" /><span style="color: red;">*</span>
				        </td>
				         <td style="width:130px;" align="right">车辆类型：</td>
				        <td style="width:50%">
				            <input name="carType" id="carType" class="mini-combobox"  required="true" value="3"
				             textField="typeNm" valueField="typeCd" emptyText="请选择..."  allowInput="false" showNullItem="false"
				             url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=retialCarType"
				            style="width:96%;" />
				        </td>
				    </tr>
				    <tr>
				     	<td style="width:130px;" align="right">发动机功率：</td>
				        <td style="width:50%">
				            <input name="enginePower" id="enginePower" class="mini-textbox" style="width:91%;" vtype="int;range:0,100000.0"/><span>KW</span>
				        </td>
				        <td style="width:130px;" align="right">厂牌标志：</td>
				        <td style="width:50%">
				            <input name="label" id="label" class="mini-textbox asLabel" style="width:96%;" readOnly="true"/>
				        </td>
				       
				    </tr>
				    <tr>
				     	<td style="width:130px;" align="right">运价/公里：</td>
				        <td style="width:50%">
				            <input name="freightRate" id="freightRate" class="mini-textbox" style="width:96%;" vtype="float;range:0,99.99"/>
				        </td>
				        <td style="width:130px;" align="right">载客人数：</td>
				        <td style="width:50%">
				            <input name="passengerNo" id="passengerNo" class="mini-textbox" style="width:96%;" vtype="int;range:0,1000"/>
				        </td>
				    </tr>
				    <tr>
				        <td style="width:130px;" align="right">企业名称：</td>
				        <td style="width:50%">
				            <input name="enterpriseName" id="enterpriseName" class="mini-textbox asLabel"  style="width:96%;" readOnly="true"/>
				        </td>
				        <td style="width:130px;" align="right">企业编号：</td>
				        <td style="width:50%">
				            <input name="enterpriseNumber" id="enterpriseNumber" class="mini-textbox asLabel"  style="width:96%;" readOnly="true"/>
				        </td>
				    </tr>
				    <tr>
				        <td style="width:130px;" align="right">自动门安装：</td>
				        <td style="width:50%">
				            <input name="autoDoorInstall" id="autoDoorInstall" class="mini-combobox" emptyText="请选择..." data="[{id:'1',text:'是'},{id:'0',text:'否'}]" style="width:96%;" />
				        </td>
				        <td style="width:130px;" align="right">LPG安装：</td>
				        <td style="width:50%">
				            <input name="lpgInstall" id="lpgInstall" class="mini-combobox" emptyText="请选择..." data="[{id:'1',text:'是'},{id:'0',text:'否'}]" style="width:96%;" />
				        </td>
				    </tr>
				    <tr>
				        <td style="width:130px;" align="right">GPS安装：</td>
				        <td style="width:50%">
				            <input name="gpsInstall" id="gpsInstall" class="mini-combobox" emptyText="请选择..." data="[{id:'1',text:'是'},{id:'0',text:'否'}]" style="width:96%;"/>
				        </td>
<!-- 				         <td style="width:130px;" align="right">车名：</td> -->
<!-- 				        <td style="width:50%"> -->
<!-- 				            <input name="vehicleBrand" id="vehicleBrand" class="mini-textbox" style="width:96%;" vtype="rangeChar:1,30" vtype="rangeChar:1,150" /> -->
<!-- 				        </td> -->
 						<td style="width:130px;" align="right">车辆品牌：</td>
				        <td style="width:50%">
				            <input name="vehicleBrand" id="vehicleBrand" class="mini-textbox" style="width:96%;" vtype="rangeChar:1,30" vtype="rangeChar:1,150" />
				        </td>
				    </tr>
				    <tr>
				        <td style="width:130px;" align="right">购车日期：</td>
				        <td style="width:50%">
				            <input name="purchaseDate" id="purchaseDate" class="mini-datepicker" 
				            valueType="date" allowInput="false" format="yyyy-MM-dd" timeFormat="H:mm:ss" showTime="false"
						    showOkButton="false" showClearButton="true" 
				            style="width:96%;" />
				        </td>
				        <td style="width:130px;" align="right">出厂日期：</td>
				        <td style="width:50%">
				            <input name="productionDate" id="productionDate" class="mini-datepicker" 
				            valueType="date" allowInput="false" format="yyyy-MM-dd" timeFormat="H:mm:ss" showTime="false"
						    showOkButton="false" showClearButton="true" 
				            style="width:96%;" />
				        </td>
				    </tr>
				    <tr>
				        <td style="width:130px;" align="right">燃料类型：</td>
				        <td style="width:50%">
				            <input name="fuelType" id="fuelType" 
				             textField="typeNm" valueField="typeCd" emptyText="请选择..."  allowInput="false" showNullItem="false"
				             url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=vehicleFuel"
				            class="mini-combobox" value="1" style="width:96%;" />
				        </td>
					    
				    </tr>
				    </tr>
				     <td style="width:100%" colspan="6" align="center">
				     	<a class="mini-button" iconCls="" onclick="doClose()">关闭</a>
						<a class="mini-button" iconCls="" onclick="doSaveClose()">保存退出</a>
					    <a class="mini-hidden" iconCls="" onclick="doSave()" >保存新增</a>
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
		// 编辑
		var data = getRequestString("row");
		if (data != null && data != "") {
			data = JSON.parse(data)
			Object.keys(data).forEach(function(key){
				if (mini.get(key) != "undefined" && typeof(mini.get(key)) != "undefined") {
					if(key == "brandModel"){
						mini.get(key).setText(data[key]);
					}
					mini.get(key).setValue(data[key]);
				}
				if ("licensePlate" == key) {
					mini.get("licensePlate1").setText(data[key].substr(0,1));
// 					mini.get("licensePlate2").setValue(data[key].substr(1,1));
// 					mini.get("licensePlate3").setValue(data[key].substr(2,1));
					mini.get("licensePlate4").setValue(data[key].substr(1));
					mini.get("licensePlateOld").setValue(data[key]);
				} else if ("_state" == key) {
					mini.get(key).setValue('modified');
				}
			});
		}
		var model = getRequestString("model");
		var acceptNum = getRequestString("acceptNum");
		var enterpriseNumber = getRequestString("enterpriseNumber");
		var companyName = getRequestString("companyName");
		var uidArr = getRequestString("uidArr");
		uidArr = uidArr.split(",");
		mini.get("enterpriseNumber").setValue(enterpriseNumber);
		mini.get("enterpriseName").setValue(companyName);
		if (uidArr.length > 1) {
			mini.get("batchInsertion").setValue(uidArr.length);
		} else {
			mini.get("batchInsertion").setValue("1");
		}
		
		if("view" == model){
			labelModel("formVehicle");
		}else if("edit" == model && (acceptNum != "" && acceptNum != null && acceptNum != "null")){
			setSomeReadOnly();
		}
	});
	
	// 保存新增
	function doSave() { 
		var form = new mini.Form("#formVehicle");
    	form.validate();
		if (form.isValid() == false){
		     return;
		}
		var data = getDate();
		var uidArr = getRequestString("uidArr");
		uidArr = uidArr.split(",");
// 		if ( parent.checkEditGridData(data, uidArr) == false) {
		if ( window.Owner.checkEditGridData(data, uidArr) == false) {
			mini.alert("该车牌号已经存在，请确认！");
			return;
		}
// 	    parent.updateGridData(data, uidArr);
 		window.Owner.updateGridData(data, uidArr);
 		// 获取到旧的车牌
 		var licensePlateOld = mini.get("licensePlateOld").getValue();
 		var licensePlateNew = data.licensePlate;
 		window.Owner.replacePlateNm(licensePlateOld, licensePlateNew);
	    mini.alert("保存成功！");
	}    
	
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
	// 保存关闭
    function doSaveClose() {
    	var form = new mini.Form("#formVehicle");
    	form.validate();
		if (form.isValid() == false){
		     return;
		}
    	var data = getDate();
    	var uidArr = getRequestString("uidArr");
    	uidArr = uidArr.split(",");
//     	if ( parent.checkEditGridData( data, uidArr) == false) {
		if ( window.Owner.checkEditGridData(data, uidArr) == false) {
			mini.alert("该车牌号已经存在，请确认！");
			return;
		}
//        	parent.updateGridData(data, uidArr);
 		window.Owner.updateGridData(data, uidArr);
 		
 		// 获取到旧的车牌
 		var licensePlateOld = mini.get("licensePlateOld").getValue();
 		var licensePlateNew = data.licensePlate;
 		window.Owner.replacePlateNm(licensePlateOld, licensePlateNew);
 		
       	mini.alert("保存成功！" , "", function() {
//        		loadParent();
       		CloseWindow("ok");
       	});
    };
    
    function getDate() {
    	var form = new mini.Form("#formVehicle");
        var data = form.getData();
//         data.licensePlate = mini.get("licensePlate1").getText() + mini.get("licensePlate2").getValue() 
//         				  + mini.get("licensePlate3").getValue() + mini.get("licensePlate4").getValue();
		data.commissioningDate = mini.get("commissioningDate").getFormValue();
		data.purchaseDate = mini.get("purchaseDate").getFormValue();
		data.productionDate = mini.get("productionDate").getFormValue();
		data.licensePlate = mini.get("licensePlate1").getText() + mini.get("licensePlate4").getValue();
        data.licensePlate1Nm = mini.get("licensePlate1").getText();
        data.licensePlate1Nm = mini.get("licensePlate1").getText();
        data.operationCertificateClassNm = mini.get("operationCertificateClass").getText();
        data.carTypeNm = mini.get("carType").getText();
        data.vehicleColourNm = mini.get("vehicleColour").getText();
        return data;
    }
	// 关闭本画面
    function loadParent() {
        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        parent.layer.close(index);
    }
	
 // 公安接口信息
	function initAddData() {
		var licensePlate1 = mini.get("licensePlate1").getText();
// 		var licensePlate2 = mini.get("licensePlate2").getText();
// 		var licensePlate3 = mini.get("licensePlate3").getText();
		var licensePlate4 = mini.get("licensePlate4").getValue();
		if( (licensePlate1 != null && licensePlate1 != "") && (licensePlate4 != null && licensePlate4 != "")){
			var licensePlate2 = licensePlate4.substr(0,1);
			var licensePlate3 = licensePlate4.substr(1);
			var licensePlate = licensePlate1 + licensePlate2 +"-"+ licensePlate3;
		$.ajax({
			type : "POST", 
			url : "${webProperties['app.url.approval']}/taxiBusinessOp/getPublicSecurityData.htm",
			data : {  
				licensePlate: licensePlate,
			},
			success : function(data){
				if(data != null && data != ""){
					data = $.parseJSON(data);
					mini.get('brandModel').setValue(data.brandModel);
// 					mini.get('licenseColor').setValue(data.licenseColor); 
					mini.get('engineNumber').setValue(data.engineNumber);
					mini.get('vehicleColour').setValue(data.vehicleColour);
					mini.get('frameNumber').setValue(data.frameNumber);
					mini.get('fuelType').setValue(data.fuelType);
					mini.get('vehicleBrand').setValue(data.vehicleBrand);
					mini.get('commissioningDate').setValue(data.commissioningDate);
					mini.get('passengerNo').setValue(data.passengerNo);
				}
			},
		})
		
		}else{
			mini.alert("车牌号为空");
		}
	}
 function setSomeReadOnly(){
	 mini.get("#licensePlate1").setReadOnly(true);
		mini.get("#licensePlate1").addCls("asLabel");
// 		mini.get("#licensePlate2").setReadOnly(true);
// 		mini.get("#licensePlate2").addCls("asLabel");
// 		mini.get("#licensePlate3").setReadOnly(true);
// 		mini.get("#licensePlate3").addCls("asLabel");
		mini.get("#licensePlate4").setReadOnly(true);
		mini.get("#licensePlate4").addCls("asLabel");
		mini.get("#licenseColor").setReadOnly(true);
		mini.get("#licenseColor").addCls("asLabel");
		mini.get("#vehicleColour").setReadOnly(true);
		mini.get("#vehicleColour").addCls("asLabel");
		mini.get("#commissioningDate").setReadOnly(true);
		mini.get("#commissioningDate").addCls("asLabel");
 }
</script>
</body>
</html>