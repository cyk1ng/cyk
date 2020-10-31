<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="cn.seisys.iti.pdd.auth.entity.UserInfo" %>
<%@ page import="cn.seisys.iti.pdd.auth.util.ShiroUtils" %>
<%@ page import="cn.seisys.iti.pdd.approval.constant.SubItemConstant" %>
<%@ page isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp" %>
<%@ include file="/WEB-INF/jsp/include/meta.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>巡游出租汽车个体工商户经营许可</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
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
        #yw2 .asLabel .mini-textbox-border,
        #yw2 .asLabel .mini-textbox-input,
        #yw2 .asLabel .mini-buttonedit-border,
        #yw2 .asLabel .mini-buttonedit-input,
        #yw2 .asLabel .mini-textboxlist-border
        {
            border:0;background:none;cursor:default;
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
        .gridTable tr td:first-child{
			text-align: right!important
		}
		.gridTable tr td:last-child{
			text-align: left!important;
			padding-left: 10px!important;
		}
    </style>
</head>
<body>
<div class="mini-fit">
    <div id="tabs1" class="mini-tabs" activeIndex="0" style="width:100%;height:100%;" plain="false" buttons="#tabsButtons" buttonsAlign="right">
        <div title="申请信息" >
            <form id="hiddenValue">
                <input id="applicationClass" name="applicationClass" class="mini-hidden" value=""/>
                <input id="ownerId" name="ownerId" class="mini-hidden" value=""/>
                <input id="id" name="id" class="mini-hidden" value=""/>
            </form>
            <form id="form" method="post">
				
                <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
                	<tr>
                        <td style="width:130px;" align="right"></td>
                        <td style="width:50%"></td>
                        <td style="width:130px;" align="right"></td>
                        <td style="width:50%"></td>
                	</tr>
                    <tr id="acceptNumber_tr_id" style="display:none;">
                        <td style="width:130px;" align="right">受理编号：</td>
                        <td style="width:50%">
                            <input id="acceptNumber" name="acceptNumber" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>
                        </td>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">申请日期：</td>
                        <td style="width:50%">
                            <input id="applyDate" name="applyDate" class="mini-datepicker asLabel" style="width:96%;" readOnly="true" format="yyyy-MM-dd"/>
                        </td>
                        <td style="width:130px;" align="right">申请人：</td>
                        <td style="width:50%">
					            <input id="applyName" name="applyName" class="mini-textbox" style="width:96%;"  value="" onblur="onBlurCompanyName" required="true"/><span style="color: red;">*</span>
				        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">业户类型：</td>
                        <td style="width:50%">
					        <input id="companyEconomyType" name="companyEconomyType" class="mini-combobox  asLabel" url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=taxiEcoType"
					        	textField="typeNm" valueField="typeCd" readOnly="true" style="width:96%;" value="1"/><span style="color: red;">*</span>
					    </td>
                        <td style="width:130px;" align="right">注册地址：</td>
                        <td style="width:50%">
                        	<input id="registerAddress1" name="registerAddress" class="mini-textbox" required="true" style="width:96%;" value="" onblur="onBlurCompanyRegisterAddress"/><span style="color: red;">*</span>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">申请人姓名：</td>
                        <td style="width:50%">
                            <input id="applicantName" name="applicantName" class="mini-textbox" style="width:96%;"  value="" maxLength="10" onblur="onbulrCorporateRepresentative"/>
                        </td>
                        <td style="width:130px;" align="right">身份证号：</td>
                        <td style="width:50%">
                            <input id="idCard" name="idCard" class="mini-textbox" style="width:96%;"  value=""  maxLength="18" onvalidation="onIDCardsValidation" onblur="onbulrIdCard"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">项目名称：</td>
                        <td style="width:100%" colspan="3">
                            <input id="projectname" name="projectname" class="mini-textbox asLabel" style="width:98%;" readOnly="true" value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">联系人：</td>
                        <td style="width:50%">
                            <input id="contact" name="contact" class="mini-textbox" style="width:96%;" vtype="maxLength:20"/>
                        </td>
                        <td style="width:130px;" align="right">联系电话：</td>
                        <td style="width:50%">
                            <input id="contactNumber" name="contactNumber" class="mini-textbox" maxLength="15" style="width:96%;" onvalidation="onTelValidation" onblur=""/>
                        </td>
                    </tr>
                    <tr>
                    	<td style="width:130px;" align="right">出生日期：</td>
                        <td style="width:50%">
                            <input id="datebirth" name="datebirth" class="mini-datepicker" style="width:96%;" value="" format="yyyy-MM-dd" />
                        </td>
                        <td style="width:130px;" align="right">委托代理人：</td>
                        <td style="width:50%">
                            <input name="agent" class="mini-textbox" style="width:96%;" vtype="maxLength:20"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:130px;" align="right">申请情况说明：</td>
                        <td style="width:100%" colspan="3">
                            <input name="applyDesc" class="mini-textarea" style="width: 98%;height:130px;" />
                        </td>
                    </tr>
                </table>
	            <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
	            	<tr>
	                        <td style="width:130px;" align="right">业务事项：</td>
	                        <td style="width:100%" colspan="3">
	                            <div id="projectnameSix" name="projectnameSix" class="mini-radiobuttonlist" repeatItems="2" repeatLayout="table" repeatDirection="horizontal"
	                                 textField="text" valueField="id" value="089102002" onvaluechanged ="radioChange"
	                                 url="" data="[{id:'089102001',text:'转让给符合条件的其他个人'},{id:'089102002',text:'转让给直系亲属'}]">
	                            </div>
	                        </td>
	                    </tr>
	            </table>
            </form>
        </div>
        <div title="业务信息" >
            <div id="yw1"  style="display: none">
                <h3 class="font-16">业户信息</h3>
                <hr/>
                <form id="form1">
                    <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
                        <tr>
                            <td style="width:130px;" align="right">单位名称：</td>
                            <td style="width:50%">
                            	<input id="companyName" name="companyName" class="mini-textbox" style="width:96%;" required="true" /><span style="color: red;">*</span>
					        </td>
					        <td style="width:130px;" align="right">企业编号：</td>
                            <td style="width:50%">
                                <input id="compamyNumber" name="enterpriseNumber" class="mini-textbox" style="width:96%;" maxLength="4" onvalidation="onEnglishAndNumberValidation"/><span style="color: red;">*</span>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:130px;" align="right">业户类型：</td>
                            <td style="width:50%">
					        	<input id="companyEconomyTypeyh" name="companyEconomyType" class="mini-combobox  asLabel" url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=taxiEcoType"
					        	textField="typeNm" valueField="typeCd" readOnly="true" style="width:96%;" value="1"/>
                            </td>
                            <td style="width:130px;" align="right">委托管理单位：</td>
                            <td style="width:50%">
                                <input id="wtdw" name="beforeDepositName" allowInput="true" valueFromSelect="true" class="mini-combobox" style="width:96%;" 
                                url="${webProperties['app.url.approval']}/taxiIndividualBusiness/queryTrusteeList.htm?enterpriseId=" valueField="enterpriseId" textField="cnname" required="true"/><span style="color: red;">*</span>
                            </td>
                        </tr>
                        <tr>
                        	<td style="width:130px;" align="right">经营范围：</td>
                            <td style="width:50%">
                                <input id="jyfw" name="businessScope" multiSelect="fasle" data="[{code:'21000',value:'租赁'}]"
                                       class="mini-combobox asLabel" style="width:96%;" readonly="readonly" textField="value" valueField="code" emptyText="请选择..." value="21000"/>
                            </td>
                            <td style="width:130px;" align="right">经济类型：</td>
                            <td style="width:50%">
					        	<input id="companyEconomyType1" name="companyEconomyType1" class="mini-combobox" url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?pclCd=taxiEcoType&ptypeCd=1"
					        	textField="typeNm" valueField="typeCd" style="width:96%;" value="400" required="true"/><span style="color: red;">*</span>
                            </td>
                        </tr>
                        <tr>
                        	<td style="width:130px;" align="right">注册地址：</td>
                            <td style="width:50%">
                            	<input id="companyRegisterAddress" name="companyRegisterAddress" class="mini-textbox" style="width:96%;" required="true" /><span style="color: red;">*</span>
                            </td>
                            <td style="width:130px;" align="right">经营地址：</td>
                            <td style="width:50%">
                                <input id="operatingAddress" name="operatingAddress" class="mini-textbox" style="width:96%;" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width:130px;" align="right">注册地所在区县：</td>
                            <td style="width:50%">
                                <input id="registrationLocation" name="registrationLocation" class="mini-combobox" style="width:96%;" url="${webProperties['app.url.ppm-cm-app']}/ppm/cm/district/getDistrictDvolList.data"
                                       textField="districtName" valueField="districtId" emptyText="请选择..." allowInput="true" valueFromSelect="true"/>
                            </td>
                            <td style="width:130px;" align="right">经营地所在区县：</td>
                            <td style="width:50%">
                                <input id="districtsCounties" name="districtsCounties" class="mini-combobox" style="width:96%;" url="${webProperties['app.url.ppm-cm-app']}/ppm/cm/district/getDistrictDvolList.data"
                                       textField="districtName" valueField="districtId" emptyText="请选择..." allowInput="true" valueFromSelect="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:130px;" align="right">注册地邮编：</td>
                            <td style="width:50%">
                                <input id="registrationPostalcode" name="registrationPostalcode" class="mini-textbox" style="width:96%;" vtype="int" maxlength="6" onvalidation="onPostCodeValidation"/>
                            </td>
                            <td style="width:130px;" align="right">经营地邮编：</td>
                            <td style="width:50%">
                                <input id="postcode" name="postcode" class="mini-textbox" style="width:96%;" vtype="int" maxlength="6" onvalidation="onPostCodeValidation"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:130px;" align="right">注册电话：</td>
                            <td style="width:50%">
                                <input id="registrationTel" name="registrationTel" class="mini-textbox" style="width:96%;" maxLength="15" onvalidation="onTelValidation"/>
                            </td>
                            <td style="width:130px;" align="right">运输性质：</td>
                            <td style="width:50%">
                                <input class="mini-combobox" id="transportNature" name="transportNature" vtype="rangeLength:0,10" allowInput="true" valueFromSelect="true"
                                       style="width:96%;" textField="typeNm" valueField="typeCd" emptyText="请选择..." value="1"
                                       url="${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm?clCd=taxiTransNat" showNullItem="true" nullItemText="请选择..."/>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:130px;" align="right">法定代表人：</td>
                            <td style="width:50%">
                                <input id="corporateRepresentative" name="applyLegal" onblur="onBlurCorporateRepresentative" class="mini-textbox" style="width:25%;" />
                                <span>身份证</span>
                                <input name="representativeIdCard" id="btnEdit1" class="mini-textbox" style="width: 50%;" onvalidation="onIDCardsValidation"/>
                                <button id="getFrs" onclick="getFr('corporateRepresentative')" type="button" class="btn btn-info">
                                    <i class="fa"></i>选择
                                </button>
                            </td>
                            <td style="width:130px;" align="right">法定代表人电话：</td>
                            <td style="width:50%">
                                <input id="representativeTel" name="representativeTel" class="mini-textbox" style="width:96%;" maxLength="15" onvalidation="onTelValidation"/>
                            </td>
                        </tr>
                        <tr>

                            <td style="width:130px;" align="right">投诉电话：</td>
                            <td style="width:50%">
                                <input id="" name="complaintsTel" class="mini-textbox" style="width:96%;" vtype="int;maxLength:15" maxlength="15"/>
                            </td>
                            <td style="width:130px;" align="right">投资方：</td>
                            <td style="width:50%">
                                <input name="investor" class="mini-textbox" style="width:96%;" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width:130px;" align="right">联系人：</td>
                            <td style="width:50%">
                                <input name="companyContact" class="mini-textbox" style="width:96%;" maxLength="20"/>
                            </td>
                            <td style="width:130px;" align="right">联系电话：</td>
                            <td style="width:50%">
                                <input name="companyTel" class="mini-textbox" style="width:96%;" maxLength="15"  onvalidation="onTelValidation"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="openingD" style="width:130px;display: none" align="right">开业日期：</td>
                            <td class="openingD" style="width:50%;display: none">
                                <input id="openingDate" name="openingDate" class="mini-datepicker" style="width:96%;" />
                            </td>
                        </tr>
                    </table>
                </form>
                <h3 class="font-16">工商税务信息</h3>
                <hr/>
                <form id="form2" method="post">
                    <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
                        <tr>
                            <td style="width:130px;" align="right">工商登记号：</td>
                            <td style="width:50%">
                                <input name="registrationNumber" class="mini-textbox" style="width:96%;" vtype="int;minLength:13;" maxLength="15"/>
                            </td>
                            <td style="width:130px;" align="right">税务登记号：</td>
                            <td style="width:50%">
                                <input name="taxRegistrationNumber" class="mini-textbox" style="width:96%;" vtype="int;rangeLength:15,18;" maxLength="18"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:130px;" align="right">注册资金人民币：</td>
                            <td style="width:50%">
                                <input name="registrationCapital" class="mini-textbox" style="width:93%;" vtype="range:0,10000000"/> 万
                            </td>
                            <td style="width:130px;" align="right">工商登记号核发日期：</td>
                            <td style="width:50%">
                                <input name="industrialIssuanceDate" class="mini-datepicker" style="width:96%;" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width:130px;" align="right">国税登记号核发日期：</td>
                            <td style="width:50%">
                                <input name="taxIssuanceDate" class="mini-datepicker" style="width:96%;" />
                            </td>
                            <td style="width:130px;" align="right">注册资金美金：</td>
                            <td style="width:50%">
                                <input name="registrationUsCapital" class="mini-textbox" style="width:93%;" vtype="range:0,10000000"/> 万
                            </td>
                        </tr>
                    </table>
<!--                     <h3 class="font-16">额度信息</h3> -->
<!--                     <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;"> -->
<!--                         <tr> -->
<!--                             <td style="width:130px;" align="right">小型车：</td> -->
<!--                             <td style="width:50%"> -->
<!--                                 <input id="smallCar" name="miniCarQuota" class="mini-spinner" maxValue="9999" style="width:96%;" /> -->
<!--                             </td> -->
<!--                             <td style="width:130px;" align="right">中型车：</td> -->
<!--                             <td style="width:50%"> -->
<!--                                 <input id="zCar" name="mediumCarQuota" class="mini-spinner" maxValue="9999" style="width:96%;" /> -->
<!--                             </td> -->
<!--                             <td style="width:130px;" align="right">大型车：</td> -->
<!--                             <td style="width:50%"> -->
<!--                                 <input id="bigCar" name="largeCarQuota" class="mini-spinner" maxValue="9999" style="width:96%;" /> -->
<!--                             </td> -->
<!--                         </tr> -->
<!--                     </table> -->
                </form>
				<br/><br/>
            </div>
            <div id="yw2">
                <form id="form3" method="post">
                	<input id="companyEconomyType2" name="companyEconomyType1" class="mini-hidden" value=""/>
                    <table class="gridTable">
                        <tr>
                            <th style="width:20%;">变更类型</th>
                            <th style="width:40%;">原信息</th>
                            <th style="width:40%;">变更信息</th>
                        </tr>
                        <tbody>
        					<tr>
	                            <td align="right">名称：</td>
	                            <td>
	                                <input name="companyName" id="applyName1" class="mini-textbox asLabel" readonly="readonly" style="width:96%;"/>
	                            </td>
	                            <td>
	                                <input name="changedApplyName" class="mini-textbox" style="width:96%;"/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td align="right">经营地址：</td>
	                            <td>
	                                <input name="operatingAddress" id="operatingAddress1" class="mini-textbox asLabel" readonly="readonly" style="width:96%;" value=""/>
	                            </td>
	                            <td>
	                                <input name="changedOperatingAddress" class="mini-textbox" style="width:96%;"/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td align="right">法定代表人：</td>
	                            <td>
	                                <input name="applyLegal"  id="applyLegal" class="mini-textbox asLabel" readonly="readonly" style="width:96%;" value=""/>
	                            </td>
	                            <td align="left">
	                                <input id="changedApplyLegal" name="changedApplyLegal" class="mini-textbox" style="width:80%;" required="true"/>
	                                <button id="getFr1" onclick="getFr('changedApplyLegal')" type="button" class="btn btn-info">
	                                <i class="fa"></i>选择
	                                </button>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td align="right">邮政号码：</td>
	                            <td>
	                                <input name="postcode"  id="postcode1" class="mini-textbox asLabel" style="width:96%;" readonly="readonly" vtype="int" maxlength="6" value=""/>
	                            </td>
	                            <td>
	                                <input name="changedPostalcode" class="mini-textbox" style="width:96%;" vtype="int" maxlength="6" onvalidation="onPostCodeValidation"/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td align="right">电话号码：</td>
	                            <td>
	                                <input name="representativeTel" id="companyTel" class="mini-textbox asLabel" style="width:96%;" readonly="readonly" value=""/>
	                            </td>
	                            <td>
	                                <input name="changedTel" class="mini-textbox" style="width:96%;"  maxLength="15" onvalidation="onTelValidation"/>
	                            </td>
	                        </tr>
        				</tbody>
                    </table>
                </form>
            </div>
        </div>
        <div title="申请材料">
        <iframe id="fileupload" src="${webProperties['app.url.commProcess']}/entrance/commFileListPage.htm" frameborder="0"
         scrolling="no" marginheight="0" marginwidth="0" height="100%" width="100%" ></iframe>
<%--             <%@ include file="/WEB-INF/jsp/include/commFileUploadPage.jsp" %> --%>
        </div>
        <div name="book" title="法律文书" visible="false">
            <div id="datagrid" class="mini-datagrid" url="${webProperties['app.url.approval']}/commCertificate/getCommCertificateList.htm"
                 style="width:auto;height:auto;" idField="id" allowSortColumn="true" sizeList="[10,20,30]"
                 pageSize="10" onloaderror="mini.alert(e.errorMsg);" showPager='false'>
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
        <%--<jsp:include page="/WEB-INF/jsp/commCertificate/commCertificate.jsp"  flush="true"/>--%>
        <%@ include file="/WEB-INF/jsp/include/tab.jsp" %>

    </div>

    <div id="tabsButtons">
        <a id="toggleBtn1" class="mini-button" iconCls="" onclick="accept()">受理</a>
        <a id="toggleBtn2" class="mini-button" iconCls="" onclick="save('noaccept')">不予受理</a>
        <a id="toggleBtn3" class="mini-button" iconCls="" onclick="save('save')">保存</a>
        <a id="toggleBtn4" class="mini-button" iconCls="" onclick="reset()">重置</a>
    </div>
</div>
<script type="text/javascript">
	
    mini.parse();
    <%UserInfo userinfo = ShiroUtils.getUserInfo(request);%>
    var user = '<%=userinfo.getUsername()%>';
    var userId = '<%=userinfo.getUserid()%>';
    var userGroupName = '<%=userinfo.getOrgName()%>';
    var processInstanceId;
    var acceptNumber;
    var userTaskId = "usertask26";
    var model = getRequestString("model");
    //
    var applyNumber;

    
    //获取url中的请求参数
    function getRequestString(key){
        var reg = new RegExp("(^|&)"+key+"=([^&]*)(&|$)");
        var result = window.location.search.substr(1).match(reg);
        return result?decodeURIComponent(result[2]):null;
    }

    $(document).ready(function(){
    	var acceptNumber = getRequestString("acceptNumber");
    	var id = getRequestString("id");
    	var type = getRequestString("type");
    	
    	if(type=="1"){
    		//创建申请 号
        	getSq();
    	}
    	
        if("view" == model){
            labelModel("form");
            labelModel("form1");
            labelModel("form2");
            labelModel("form3");

            $("#getFrs").hide();
            $("#getFr1").hide();
            $("#acceptNumber_tr_id").show();
            $("#tabsButtons").hide();
             mini.get("projectnameSix").setReadOnly(true);
        }else{ 
            window.parent.setHangYe("","2011","1","1");
        }
        
         if("" != acceptNumber && null != acceptNumber){
        	 $("#fileupload").load(function(){
        		 getTaxiById({acceptNumber:acceptNumber});
        	 });
         }else{
        	 if((id != "" && id!= null)){
        		 $("#fileupload").load(function(){
         		 	getTaxiById({id:id});
              	 });
        	 }else{
        		 var strCurDate = mini.formatDate(new Date(),'yyyy-MM-dd HH:mm:ss');
                 mini.get("applyDate").setValue(strCurDate);
            	 mini.get("projectname").setValue(window.parent.itemObj.name);
                 mini.get("applicationClass").setValue(window.parent.itemId);
                 $("#fileupload").load(function(){
                	 $("#fileupload")[0].contentWindow.getList(mini.get("projectnameSix").getValue());
                 });
        	 }
         }

        getApprovalType({});
        
    });
    //获取申请号
    //type    01 :窗口  02:网申
    function getSq(){
        $.ajax({
            url: "${webProperties['app.url.commProcess']}/entrance/getAcceptNumber.htm",
            type: 'get',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data:{itemId: window.parent.itemId,type:'01'},
            async:false,
            success:function(data){
            	//截取字符串
                applyNumber = data.substring(1,(data.length-1));
            },
            error:function(jqXHR, textStatus, errorThrown){
                mini.alert(jqXHR.responseText);
            }
        });
    }

    /**
	* 打印预览
	*/
	function toPrint(attcd,wsbh,nodeTaskid,subitemid) {
        var param = {};
        var url = "${webProperties['app.url.approval']}/commCertificate/openPdfFileView.htm";
        mini.open({
            url: url,
            title: "文书预览",
            width: 950,
            height: 600,
            allowResize: false,
            onload: function () {
                var iframe = this.getIFrameEl();
                var param = {};
                	param.acceptNumber = acceptNumber,//业务编号
                    param.processInstanceId = processInstanceId,//流程实例ID
                    param.fileName = wsbh;//文书编号
                    param.nodeTaskid = nodeTaskid;
                    param.subitemid = subitemid;
                    param.attcd = attcd;
                    param.processStatus = window.parent.processStatus;
                iframe.contentWindow.SetData(param);
            },
            ondestroy: function (action) {
                var paramObj = {};
                paramObj.subitemid = subitemid;
                paramObj.nodeTaskid = nodeTaskid;
                paramObj.acceptNumber = acceptNumber;
                getLayerBook(paramObj);
            }
        });
    }

    var approvalMap = {};
    function getApprovalType(obj){
        $.ajax({
            url: "${webProperties['app.url.commProcess']}/commConfInfo/getListByClCd.htm",
            type: 'get',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data:{clCd:"approve"},
            success:function(data){
                var dataArr = mini.decode(data);
                for(var i=0;i<dataArr.length;i++){
                    approvalMap[dataArr[i].typeCd] = dataArr[i].typeNm;
                }
            },
            error:function(jqXHR, textStatus, errorThrown){
                mini.alert(jqXHR.responseText);
            }
        });
    }

    function getTaxiById(id){
        $.ajax({
            url: "${webProperties['app.url.approval']}/taxiIndividual/getById.htm",
            type: 'post',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data:{data : mini.encode(id)},
            success:function(data){
                var result = mini.decode(data);
                var dataObj = result.data[0];
                var type = getRequestString("type");
                applyNumber = dataObj.applyNumber;
                
                if(dataObj.projectnameSix == "089102001"){
                    $("#yw1").show();
                    $("#yw2").hide()
                    if(type=="4"){
                    	window.parent.setReadOnly(true);
                    }
                }
                if(dataObj.projectnameSix == "089102002"){
                    $("#yw2").show();
                    $("#yw1").hide()
                    if(type=="4"&&model=="edit"){
                    	window.parent.setComInfo(dataObj.applyName);
                    }
                }
//                 window.parent.setComInfo();

                var form1 = new mini.Form("form1");
                var form = new mini.Form("form");
                var form2 = new mini.Form("form2");
                var form3 = new mini.Form("form3");
                new mini.Form("hiddenValue").setData(dataObj);
                form.setData(dataObj);
                form1.setData(dataObj);
                form2.setData(dataObj);
                form3.setData(dataObj);

                //不是受理和草稿箱
                if("1" != type && "4" != type){
					getHistoryTasksByCondition({instanceId:window.parent.processInstanceId},dataObj);
				}

                // if(dataObj.processInstanceId != "" || dataObj.processInstanceId !=null){
                //     getCurrentImg({instanceId:data.processInstanceId});
                // }

                //调用材料列表，得到信息
                $("#fileupload")[0].contentWindow.getList(dataObj.projectnameSix);

                var fileInfo = [];
                //展示材料信息
                var applyMaterials = dataObj.applyMaterials;
                var applyMaterialArr = [];

                for (var key in applyMaterials) {
                    applyMaterialArr = applyMaterials[key];
                }
                for (var i = 0; i < applyMaterialArr.length; i++) {
                    var params = {};
                    params.id = applyMaterialArr[i].materialCode;
                    params.fileName = applyMaterialArr[i].materialName;
                    params.shoudao = applyMaterialArr[i].getFileCount;
                    fileInfo.push(params);
                }
                if(type=="4"){
                	$("#fileupload")[0].contentWindow.setFileInfo(fileInfo,dataObj.applyNumber);
                }else{
                	$("#fileupload")[0].contentWindow.setFileInfo(fileInfo,dataObj.acceptNumber);
                }
                
//                 if("view" == model){
//                 	$("#fileupload")[0].contentWindow.setCeckDis();
//                 }
            },
            error : function(jqXHR, textStatus, errorThrown) {
                if (jqXHR.status != 200) {
                    mini.alert("【status" + jqXHR.status + "】" + " "
                        + jqXHR.responseText);
                }
            }
        });
    }
    

    function save(type){
    	var obj = {};
        var check = mini.get("projectnameSix").getValue();
        if(check == '089102001'){
            var form = new mini.Form("form");
            var form1 = new mini.Form("form1");
            var form2 = new mini.Form("form2");
            
            form.validate();
            if(!form.isValid()){
            	mini.alert("输入数据不符合规范，请重新填写");
    			return false;
            }
            form1.validate();
            if(!form1.isValid()){
            	mini.alert("输入数据不符合规范，请重新填写");
    			return false;
            }
            form2.validate();
 			if(!form2.isValid()){
 				mini.alert("输入数据不符合规范，请重新填写");
 				return false;
            }

            jQuery.extend(obj,form.getData(),form1.getData(),form2.getData(),new mini.Form("hiddenValue").getData());
        }
        if(check == '089102002'){
            var form = new mini.Form("form");
            var form3 = new mini.Form("form3");
            
            if(mini.get("applyName1").getValue()==""){
            	mini.alert("企业信息不能为空");
            	return false;
            }
            
            form.validate();
            if(!form.isValid()){
 				mini.alert("输入数据不符合规范，请重新填写");
 				return false;
            }
            if(type != "save"){
            	form3.validate();
                if(!form3.isValid()){
     				mini.alert("输入数据不符合规范，请重新填写");
     				return false;
                }
            }

            jQuery.extend(obj,form.getData(),form3.getData(),new mini.Form("hiddenValue").getData());
        }
        obj.formType = mini.get("projectnameSix").getValue();
        if(type == "noaccept"){
            obj.certOrgName = userGroupName;
            var approvingAuth = window.parent.itemObj.approvingAuth;
        }
        obj.overTime = window.parent.itemObj.approveTime;
        //申请号码
        obj.applyNumber = applyNumber;
        if(obj.applyDate){
        	obj.applyDate = mini.formatDate(obj.applyDate,"yyyy-MM-dd HH:mm:ss");
		}
		if(obj.industrialIssuanceDate){
			obj.industrialIssuanceDate = mini.formatDate(obj.industrialIssuanceDate,"yyyy-MM-dd HH:mm:ss");
		}
		if(obj.openingDate){
			obj.openingDate = mini.formatDate(obj.openingDate,"yyyy-MM-dd HH:mm:ss");
		}
		if(obj.taxIssuanceDate){
			obj.taxIssuanceDate = mini.formatDate(obj.taxIssuanceDate,"yyyy-MM-dd HH:mm:ss");
		}
		if(obj.datebirth){
			obj.datebirth = mini.formatDate(obj.datebirth,"yyyy-MM-dd HH:mm:ss");
		}
      
        //保存材料信息
        $("#fileupload")[0].contentWindow.getFileInfo(applyNumber);
        
        var fileInfo = $("#fileupload")[0].contentWindow.fileInfo;

        var arr = [];
        for (var i = 0; i < fileInfo.length; i++) {
            var GetFileEntity = {};
            GetFileEntity.materialCode = fileInfo[i].id;
            GetFileEntity.materialName = fileInfo[i].fileName;
            GetFileEntity.getFileCount = fileInfo[i].shoudao;
            arr.push(GetFileEntity);
        }
        obj.applyMaterials = {
            copyCode: arr
        }
        mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: '处理中...'
        });
        $.ajax({
            url: "${webProperties['app.url.approval']}/taxiIndividual/saveTaxiIndividual.htm",
            type: 'post',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data:{data : mini.encode(obj),type : type},
            success:function(result){
                mini.unmask(document.body);
                var data = mini.decode(result);
                if(type == "noaccept"){
                    mini.alert("不予受理成功");
                    mini.get("acceptNumber").setValue(data.acceptNumber);
                    $("#acceptNumber_tr_id").show();
                    $("#tabsButtons").hide();
                    acceptNumber = data.acceptNumber;
                    processInstanceId = data.processInstanceId;
                    var paramObj = {};
					paramObj.subitemid = obj.projectnameSix;
					paramObj.nodeTaskid = userTaskId;
					paramObj.acceptNumber = data.acceptNumber;
					
					getLayerBook(paramObj);
                    getCurrentImg({instanceId:data.processInstanceId});

                    labelModel("form");
                    labelModel("form1");
                    labelModel("form2");
                    labelModel("form3");
                     mini.get("projectnameSix").setReadOnly(true);
                    $("#fileupload")[0].contentWindow.setCeckDis();
                    $("#fileupload")[0].contentWindow.setUploadDis();
     	    		$("#fileupload")[0].contentWindow.shouJianBuZhen();
                }else{
                    mini.alert("保存成功");
                }
            },
            error : function(jqXHR, textStatus, errorThrown) {
            	mini.unmask(document.body);
                if (jqXHR.status != 200) {
                    mini.alert("【status" + jqXHR.status + "】" + " "
                        + jqXHR.responseText);
                }
            }
        });
    }

    function accept(){
        var businessObj = {};
        var check = mini.get("projectnameSix").getValue();
        if(check == '089102001'){
            var form = new mini.Form("form");
            var form1 = new mini.Form("form1");
            var form2 = new mini.Form("form2");

            form.validate();
            if(!form.isValid()){
            	mini.alert("输入数据不符合规范，请重新填写");
    			return false;
            }
            form1.validate();
            if(!form1.isValid()){
            	mini.alert("输入数据不符合规范，请重新填写");
    			return false;
            }
            form2.validate();
 			if(!form2.isValid()){
 				mini.alert("输入数据不符合规范，请重新填写");
 				return false;
            }
            jQuery.extend(businessObj,form.getData(),form1.getData(),form2.getData(),new mini.Form("hiddenValue").getData());
        }
        if(check == '089102002'){
            var form = new mini.Form("form");
            var form3 = new mini.Form("form3");

            if(mini.get("applyName1").getValue()==""){
            	mini.alert("企业信息不能为空");
            	return false;
            }
            
            form.validate();
            if(!form.isValid()){
 				mini.alert("输入数据不符合规范，请重新填写");
 				return false;
            }
            form3.validate();
            if(!form3.isValid()){
 				mini.alert("输入数据不符合规范，请重新填写");
 				return false;
            }
            
            
            
            jQuery.extend(businessObj,form.getData(),form3.getData(),new mini.Form("hiddenValue").getData());
        }
        businessObj.certUser = user;
        businessObj.certId = userId;
        businessObj.corporateRepresentative = businessObj.applyLegal;
        businessObj.formType = mini.get("projectnameSix").getValue();
        var approvingAuth = window.parent.itemObj.approvingAuth;
        businessObj.applyType = approvalMap[approvingAuth];
        businessObj.overTime = window.parent.itemObj.approveTime;
        businessObj.changedDepositName = businessObj.beforeDepositName;
        businessObj.miniCarQuota = 0;
        businessObj.mediumCarQuota = 0;
        businessObj.largeCarQuota = 0;
        businessObj.representativeIdCard = businessObj.idCard;
        //申请号码
        businessObj.applyNumber = applyNumber;
        if(businessObj.applyDate){
        	businessObj.applyDate = mini.formatDate(businessObj.applyDate,"yyyy-MM-dd HH:mm:ss");
		}
		if(businessObj.industrialIssuanceDate){
			businessObj.industrialIssuanceDate = mini.formatDate(businessObj.industrialIssuanceDate,"yyyy-MM-dd HH:mm:ss");
		}
		if(businessObj.openingDate){
			businessObj.openingDate = mini.formatDate(businessObj.openingDate,"yyyy-MM-dd HH:mm:ss");
		}
		if(businessObj.taxIssuanceDate){
			businessObj.taxIssuanceDate = mini.formatDate(businessObj.taxIssuanceDate,"yyyy-MM-dd HH:mm:ss");
		}
		if(businessObj.datebirth){
			businessObj.datebirth = mini.formatDate(businessObj.datebirth,"yyyy-MM-dd HH:mm:ss");
		}

        //保存材料信息
        $("#fileupload")[0].contentWindow.getFileInfo(applyNumber);

        var fileInfo = $("#fileupload")[0].contentWindow.fileInfo;

        var arr = [];
        for (var i = 0; i < fileInfo.length; i++) {
            var GetFileEntity = {};
            GetFileEntity.materialCode = fileInfo[i].id;
            GetFileEntity.materialName = fileInfo[i].fileName;
            GetFileEntity.getFileCount = fileInfo[i].shoudao;
            arr.push(GetFileEntity);
        }
        businessObj.applyMaterials = {
            copyCode: arr
        }
        mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: '受理中...'
        });
        $.ajax({
            url: "${webProperties['app.url.approval']}/taxiIndividual/acceptTaxiBusinessLicense.htm",
            type: 'post',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data:{data:mini.encode(businessObj)},
            success:function(data){
            	mini.unmask(document.body);
                var dataObj = mini.decode(data);
                if(dataObj){
                    mini.get("acceptNumber").setValue(dataObj.acceptNumber);
                    $("#acceptNumber_tr_id").show();
                    $("#tabsButtons").hide();

                    acceptNumber = dataObj.acceptNumber;
                    processInstanceId = dataObj.processInstanceId;
                    getCurrentImg({instanceId:dataObj.processInstanceId});
                    
                    var paramObj = {};
					paramObj.subitemid = businessObj.projectnameSix;
					paramObj.nodeTaskid = userTaskId;
					paramObj.acceptNumber = dataObj.acceptNumber;
					getLayerBook(paramObj);
                    //queryTaxiBusinessLicense(dataObj.acceptNumber);
                }
                labelModel("form");
                labelModel("form1");
                labelModel("form2");
                labelModel("form3");
                $("#getFrs").hide();
                $("#getFr1").hide();
                 mini.get("projectnameSix").setReadOnly(true);
                mini.alert("受理成功!");
                mini.get("tabs1").setActiveIndex(3);
                $("#fileupload")[0].contentWindow.setCeckDis();
                $("#fileupload")[0].contentWindow.setUploadDis();
 	    		$("#fileupload")[0].contentWindow.shouJianBuZhen();
            },
            error:function(jqXHR, textStatus, errorThrown){
            	mini.unmask(document.body);
                mini.alert(jqXHR.responseText);
            }
        });
    }

    /**
	* 获取法律文书
	*/
	function getLayerBook(paramObj) {
        var datagrid = mini.get("datagrid");
        datagrid.on("drawcell", function (e) {
            var record = e.record;
            var field = e.field;
            if (field == 'cz') {
                var gridHtml = "";
                gridHtml +=
                    '<a href="javascript:;" target="sub-right-frame" class="btn btn-sm green" style="width:50px;" onclick="toPrint(&quot;' +record.attcd + '&quot;,&quot;' +record.wsbh + '&quot;,&quot;' +paramObj.nodeTaskid + '&quot;,&quot;' +paramObj.subitemid + '&quot;);"><i class="fa fa-pencil"></i> 打印 </a>';
                e.cellHtml = gridHtml;
            }
        });
        datagrid.load(paramObj);
        var tabs = mini.get("tabs1");
        var tab = tabs.getTab("book");
        if (tab) {
            tabs.updateTab(tab, {visible: true});
        }
	}

    
    /**
	* 查询流程历史任务集合
	*/
	function getHistoryTasksByCondition(paramObj,businessObj){
		var sortCondition = {};
		sortCondition.orderByTaskCreateTime = "asc";
		paramObj.sortCondition = sortCondition;
		$.ajax({
	       	url: "${webProperties['app.url.approval']}/approvalProcess/getHistoryTasksByCondition.htm",
			type: 'post',
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data:{data:mini.encode(paramObj)},
			success:function(data){
				var dataObj = mini.decode(data);
				var result = dataObj.data;
				
				acceptNumber = businessObj.acceptNumber;
				processInstanceId = paramObj.instanceId;
				var curTask = result[result.length-1].taskDefinitionKey; 
				var type = getRequestString("type");//这是前台传参数方法，通过modelview跳转页面通过别打的方法获取
				var param = {};
		        param.subitemid=businessObj.projectnameSix;
		        param.acceptNumber = businessObj.acceptNumber;
		        //type：2 待办
				if("2" == type){
					param.nodeTaskid = curTask;
					if("usertask3" == curTask || "usertask11" == curTask){
						updateBusinessModel();
					}
					//如果是复核节点可以上传，否则全部隐藏
					if("usertask3" == curTask){
						//隐藏上传和收件补正按钮
	    				$("#fileupload")[0].contentWindow.shouJianBuZhen();
					}else{
						$("#fileupload")[0].contentWindow.setUploadDis();
         	    		$("#fileupload")[0].contentWindow.shouJianBuZhen();
         	    		$("#fileupload")[0].contentWindow.setCeckDis();
					}
					//许可之后显示许可日期
					if("usertask22" == curTask){
						$(".openingD").show();
					}
				}
		        //type：3是已办
				if("3" == type){
					$("#fileupload")[0].contentWindow.setUploadDis();
     	    		$("#fileupload")[0].contentWindow.shouJianBuZhen();
     	    		$("#fileupload")[0].contentWindow.setCeckDis();
     	    		
					var arr = [];
					for(var i=0;i<result.length;i++){
						if(userId == result[i].assignee){
							arr.push(result[i].taskDefinitionKey);
						}
					}
					param.nodeTaskid = arr.join(",");
					
					//许可之后显示许可日期
					if("usertask22" == curTask){
						$(".openingD").show();
					}
				}
				getLayerBook(param);
				//var curTaskObj = result[result.length-1];
				
			},
			error:function(jqXHR, textStatus, errorThrown){
				mini.alert(jqXHR.responseText);
			}
	    });
	}

    function getFr(id) {
        mini.open({
            url:"${webProperties['app.url.approval']}/taxiIndividual/selectLegal.htm",
            title: "法人选择", width: 750, height: 500,
            onload: function () {

            },
            ondestroy: function (action) {
                if(action == "ok"){
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = mini.clone(data);
                    if(data){
                        mini.get(id).setValue(data.b_legalperson);
                        mini.get("btnEdit1").setValue(data.b_legalpersondocumentnum);
                    }
                }
            }
        });
    }

    function test(){
        var form = new mini.Form("form");
        form.validate();
    }
    function onButtonEdit(e) {
        alert("弹出选择");
    }

    //单位名称
    function onBlurCompanyName(e){
        mini.get("companyName").setValue(e.sender.value);
    }

    //注册地址
    function onBlurCompanyRegisterAddress(e){
        mini.get("companyRegisterAddress").setValue(e.sender.value);
    }

    //法人代表
    function onBlurCorporateRepresentative(e){
        mini.get("applicantName").setValue(e.sender.value);
    }

    function onItemClickCompanyEconomyType1(e){
        mini.get("companyEconomyType").setValue(e.sender.value);
    }

    function onbulrCorporateRepresentative(e){
    	mini.get("corporateRepresentative").setValue(e.sender.value);
    }
    
    function onbulrRepresentativeTel(e){
    	mini.get("representativeTel").setValue(e.sender.value);
    }
    
    function onbulrIdCard(e){
    	mini.get("btnEdit1").setValue(e.sender.value);
    }
    /**
     * 设置企业信息
     */
    function setCompanyData(comInfo){
    	//
        mini.get("applyName").setValue(comInfo.b_cnname);
        mini.get("companyEconomyType2").setValue(comInfo.b_economictype);
        mini.get("registerAddress1").setValue(comInfo.b_registeredaddress);
        mini.get("ownerId").setValue(comInfo.b_enterpriseId);
        mini.get("applicantName").setValue(comInfo.b_legalperson);

        mini.get("companyName").setValue(comInfo.b_cnname);
        mini.get("corporateRepresentative").setValue(comInfo.b_legalperson);
        mini.get("representativeTel").setValue(comInfo.b_legalpersonphone);
        mini.get("companyRegisterAddress").setValue(comInfo.b_registeredaddress);
        mini.get("registrationPostalcode").setValue(comInfo.b_registeredpostalcode);
        mini.get("operatingAddress").setValue(comInfo.operateaddress);
        mini.get("postcode").setValue(comInfo.operatepostalcode);
        mini.get("contactNumber").setValue(comInfo.b_phonenumber);

        //选择转让给直系亲属时，业务信息
        mini.get("applyName1").setValue(comInfo.b_cnname);   //名称
        mini.get("operatingAddress1").setValue(comInfo.operateaddress);  //经营地址
        mini.get("applyLegal").setValue(comInfo.b_legalperson); //法人代表
        mini.get("postcode1").setValue(comInfo.operatepostalcode); //邮政号码
        mini.get("companyTel").setValue(comInfo.b_legalpersonphone); //电话号码

    }

    function labelModel(formId) {
        var form = new mini.Form(formId);
        var fields = form.getFields();
        for (var i = 0, l = fields.length; i < l; i++) {
            var c = fields[i];
            if(c.getValue() == ""){
                c.setValue("");
            }
            if (c.setReadOnly) c.setReadOnly(true);     //只读
            if (c.setIsValid) c.setIsValid(true);      //去除错误提示
            if (c.addCls) c.addCls("asLabel");          //增加asLabel外观
        }
    }

    function radioChange(e) {
         
    	var val = mini.get("projectnameSix").getValue();
    	
        if("089102001" == val){
            $("#yw1").show();
            $("#yw2").hide();
            window.parent.setReadOnly(true);
        }
        if("089102002" == val){
            $("#yw2").show();
            $("#yw1").hide();
            window.parent.setReadOnly(false);
        }
        reset1(val);
    }
    
    function reset1(projectNameSixValue){
    	if (projectNameSixValue == null) {
    		projectNameSixValue = mini.get("projectnameSix").getValue();
    	}
    	$("#fileupload")[0].contentWindow.setCeckNoChe();
        $("#fileupload")[0].contentWindow.getList(projectNameSixValue);
        new mini.Form("form").clear();
        new mini.Form("form1").clear();
        new mini.Form("form2").clear();
        new mini.Form("form3").clear();

        if (projectNameSixValue != null) {
        	mini.get("projectnameSix").setValue(projectNameSixValue);
        }
        mini.get("projectname").setValue(window.parent.itemObj.name);
        var strCurDate = mini.formatDate(new Date(),'yyyy-MM-dd HH:mm:ss');
        mini.get("applyDate").setValue(strCurDate);
        mini.get("companyEconomyType1").setValue("400");
        mini.get("companyEconomyType").setValue("1");
        mini.get("companyEconomyTypeyh").setValue("1");
//         mini.get("isField").setValue("1");
        mini.get("transportNature").setValue("1");
        mini.get("jyfw").setValue("21000");
        
        window.parent.setNone();
    }
    
    function reset(projectNameSixValue) {
    	mini.confirm("是否确定重置？", "提示",function(action){
			 if(action == "ok"){
			    	if (projectNameSixValue == null) {
			    		projectNameSixValue = mini.get("projectnameSix").getValue();
			    	}
			    	$("#fileupload")[0].contentWindow.setCeckNoChe();
			        $("#fileupload")[0].contentWindow.getList(projectNameSixValue);
			        new mini.Form("form").clear();
			        new mini.Form("form1").clear();
			        new mini.Form("form2").clear();
			        new mini.Form("form3").clear();

			        if (projectNameSixValue != null) {
			        	mini.get("projectnameSix").setValue(projectNameSixValue);
			        }
			        mini.get("projectname").setValue(window.parent.itemObj.name);
			        var strCurDate = mini.formatDate(new Date(),'yyyy-MM-dd HH:mm:ss');
			        mini.get("applyDate").setValue(strCurDate);
			        mini.get("companyEconomyType1").setValue("400");
			        mini.get("companyEconomyType").setValue("1");
			        mini.get("companyEconomyTypeyh").setValue("1");
// 			        mini.get("isField").setValue("1");
			        mini.get("transportNature").setValue("1");
			        mini.get("jyfw").setValue("21000");
			        
			        window.parent.setNone();
			 }
		});			 
    }
    //获取企业名称
    function getApplyName(){
    	var contact = mini.get("contact").getValue();
    	var contactNumber = mini.get("contactNumber").getValue();
    	var projectname = mini.get("projectname").getValue();
    	var applyName =  mini.get("applyName").getValue();
    	var itemId = window.parent.itemId;
    	
    	var param = {};
    	param["contact"] = contact;
    	param["contactTel"] = contactNumber;
    	param["projectname"] = projectname;
    	param["applyName"] = applyName;
    	param["itemId"] = itemId;
    	
    	return param;
    }
    
    function updateBusinessModel(){
    	//方法体里将业务信息里所有非申请信息的内容变为可编辑模式
    	
    	var check = mini.get("projectnameSix").getValue();
    	
    	if(check == "089102001"){
//     		$("#getFrs").show();
    		var form = new mini.Form("form1");
//    		var names = "companyName,complaintsTel,companyEconomyType1,companyRegisterAddress,companyContact,companyTel,businessScope";
    		var names = "companyEconomyType1,businessScope";
    		var fields = form.getFields();                
            for (var i = 0, l = fields.length; i < l; i++) {
                var c = fields[i];
                if(names.indexOf(c.getName()) < 0){
                	if (c.setReadOnly) c.setReadOnly(false);
                	if (c.removeCls) c.removeCls("asLabel");
                }
            }
            var form2 = new mini.Form("form2");
    		var fields2 = form2.getFields();                
            for (var j = 0, l2 = fields2.length; j < l2; j++) {
                var c = fields2[j];
                	if (c.setReadOnly) c.setReadOnly(false);
                	if (c.removeCls) c.removeCls("asLabel");
            }

        }else{
        	$("#getFr1").show();
        	var names = "companyName,applyName,operatingAddress,applyLegal,postcode,representativeTel";
        	var form = new mini.Form("form3");
            var fields = form.getFields();
            for (var i = 0, l = fields.length; i < l; i++) {
                var c = fields[i];
                if(names.indexOf(c.getName()) < 0){
                	if (c.setReadOnly) c.setReadOnly(false);
                	if (c.removeCls) c.removeCls("asLabel");
                }
            }
        }
    }    
    
    function updateBusinessInfo(){
    	//方法体里调用更新接口将页面所有信息更新
    	var businessObj = {};
        var check = mini.get("projectnameSix").getValue();
        if(check == '089102001'){
            var form = new mini.Form("form");
            var form1 = new mini.Form("form1");
            var form2 = new mini.Form("form2");

            form.validate();
            if(!form.isValid()){
            	mini.alert("输入数据不符合规范，请重新填写");
    			return false;
            }
            form1.validate();
            if(!form1.isValid()){
            	mini.alert("输入数据不符合规范，请重新填写");
    			return false;
            }
            form2.validate();
 			if(!form2.isValid()){
 				mini.alert("输入数据不符合规范，请重新填写");
 				return false;
            }
            jQuery.extend(businessObj,form.getData(),form1.getData(),form2.getData(),new mini.Form("hiddenValue").getData());
        }
        if(check == '089102002'){
            var form = new mini.Form("form");
            var form3 = new mini.Form("form3");

            form.validate();
            if(!form.isValid()){
 				mini.alert("输入数据不符合规范，请重新填写");
 				return false;
            }
            form3.validate();
            if(!form3.isValid()){
 				mini.alert("输入数据不符合规范，请重新填写");
 				return false;
            }
            if(mini.get("applyName1").getValue()==""){
            	mini.alert("企业信息不能为空");
            	return false;
            }
            
            jQuery.extend(businessObj,form.getData(),form3.getData(),new mini.Form("hiddenValue").getData());
        }
        if(businessObj.applyDate){
        	businessObj.applyDate = mini.formatDate(businessObj.applyDate,"yyyy-MM-dd HH:mm:ss");
		}
		if(businessObj.industrialIssuanceDate){
			businessObj.industrialIssuanceDate = mini.formatDate(businessObj.industrialIssuanceDate,"yyyy-MM-dd HH:mm:ss");
		}
		if(businessObj.openingDate){
			businessObj.openingDate = mini.formatDate(businessObj.openingDate,"yyyy-MM-dd HH:mm:ss");
		}
		if(businessObj.taxIssuanceDate){
			businessObj.taxIssuanceDate = mini.formatDate(businessObj.taxIssuanceDate,"yyyy-MM-dd HH:mm:ss");
		}
		if(businessObj.datebirth){
			businessObj.datebirth = mini.formatDate(businessObj.datebirth,"yyyy-MM-dd HH:mm:ss");
		}
        //保存材料信息
        $("#fileupload")[0].contentWindow.getFileInfo(businessObj.acceptNumber);
        var fileInfo = $("#fileupload")[0].contentWindow.fileInfo;
        
        var arr = [];
        for (var i = 0; i < fileInfo.length; i++) {
            var GetFileEntity = {};
            GetFileEntity.materialCode = fileInfo[i].id;
            GetFileEntity.materialName = fileInfo[i].fileName;
            GetFileEntity.getFileCount = fileInfo[i].shoudao;
            arr.push(GetFileEntity);
        }
        businessObj.applyMaterials = {
            copyCode: arr
        }

        var updateResult = false;
        $.ajax({
            url: "${webProperties['app.url.approval']}/taxiIndividual/saveTaxiIndividual.htm",
            type: 'post',
			async: false,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data:{data : mini.encode(businessObj),type : "update"},
            success:function(result){
            	updateResult = true;
            },
            error : function(jqXHR, textStatus, errorThrown) {
            	mini.alert(jqXHR.responseText);
            	updateResult = false;
            }
        });
        
        return updateResult;
   	}
    
    function updateBusinessInfo1(){
    	//方法体里调用更新接口将页面所有信息更新
    	var businessObj = {};
        var check = mini.get("projectnameSix").getValue();
        if(check == '089102002'){
        	return true;
        }
        if(check == '089102001'){
            var form = new mini.Form("form");
            var form1 = new mini.Form("form1");
            var form2 = new mini.Form("form2");

            form.validate();
            if(!form.isValid()){
            	mini.alert("输入数据不符合规范，请重新填写");
    			return false;
            }
            form1.validate();
            if(!form1.isValid()){
            	mini.alert("输入数据不符合规范，请重新填写");
    			return false;
            }
            form2.validate();
 			if(!form2.isValid()){
 				mini.alert("输入数据不符合规范，请重新填写");
 				return false;
            }
            jQuery.extend(businessObj,form.getData(),form1.getData(),form2.getData(),new mini.Form("hiddenValue").getData());
        }
        
        //保存材料信息
        $("#fileupload")[0].contentWindow.getFileInfo(businessObj.acceptNumber);
        var fileInfo = $("#fileupload")[0].contentWindow.fileInfo;
        //许可时间
        businessObj.openingDate = mini.formatDate(new Date(),"yyyy-MM-dd HH:mm:ss");
        var arr = [];
        for (var i = 0; i < fileInfo.length; i++) {
            var GetFileEntity = {};
            GetFileEntity.materialCode = fileInfo[i].id;
            GetFileEntity.materialName = fileInfo[i].fileName;
            GetFileEntity.getFileCount = fileInfo[i].shoudao;
            arr.push(GetFileEntity);
        }
        businessObj.applyMaterials = {
            copyCode: arr
        }

        var updateResult = false;
        $.ajax({
            url: "${webProperties['app.url.approval']}/taxiIndividual/saveTaxiIndividual.htm",
            type: 'post',
			async: false,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data:{data : mini.encode(businessObj),type : "update"},
            success:function(result){
            	updateResult = true;
            },
            error : function(jqXHR, textStatus, errorThrown) {
            	mini.alert(jqXHR.responseText);
            	updateResult = false;
            }
        });
        
        return updateResult;
   	}
    
    //联系方式校验
    function onTelValidation(e){
        if (e.isValid) {
            if (isTel(e.value) == false) {
                e.errorText = "联系方式格式不对";
                e.isValid = false;
            }
        }
    }

    function isTel(value){
        if(value){
            if (/^\d+-?\d+$/.test(value)) return true;
            return false;
        }else{
            return true;
        }
    }

    /**
	* 邮编校验
	*/
	function onPostCodeValidation(e){
		if(e.value){
			var reg = /^[0-9]{6}$/;
			if(reg.test(e.value)){
				e.isValid = true;
			}else{
                e.errorText = "邮政编码格式有误，请重输";
				e.isValid = false;
			}
		}
	}
    
    function onIDCardsValidation(e) {
        // 1 "验证通过!", 0 //校验不通过
        var format = /^(([1][1-5])|([2][1-3])|([3][1-7])|([4][1-6])|([5][0-4])|([6][1-5])|([7][1])|([8][1-2]))\d{4}(([1][9]\d{2})|([2]\d{3}))(([0][1-9])|([1][0-2]))(([0][1-9])|([1-2][0-9])|([3][0-1]))\d{3}[0-9xX]$/;

        if(e.value != "" && e.value != null){
            if(e.value.length < 18){
                e.errorText = "身份证号码不合规";
                e.isValid = false;
                return;
            }
            //号码规则校验
            if(!format.test(e.value)){
                e.errorText = "身份证号码不合规";
                e.isValid = false;
                return;
            }
            //区位码校验
            //出生年月日校验   前正则限制起始年份为1900;
            var year = e.value.substr(6,4),//身份证年
                month = e.value.substr(10,2),//身份证月
                date = e.value.substr(12,2),//身份证日
                time = Date.parse(month+'-'+date+'-'+year),//身份证日期时间戳date
                now_time = Date.parse(new Date()),//当前时间戳
                dates = (new Date(year,month,0)).getDate();//身份证当月天数
            if(time>now_time||date>dates){
                e.errorText = "出生日期不合规";
                e.isValid = false;
                return;
            }
            //校验码判断
            var c = new Array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2);   //系数
            var b = new Array('1','0','X','9','8','7','6','5','4','3','2');  //校验码对照表
            var id_array = e.value.split("");
            var sum = 0;
            for(var k=0;k<17;k++){
                sum+=parseInt(id_array[k])*parseInt(c[k]);
            }
            if(id_array[17].toUpperCase() != b[sum%11].toUpperCase()){
                e.errorText = "身份证校验码不合规";
                e.isValid = false;
                return;
            }
        }
    }

    function registrationNumberVa(e){
            if (e.isValid) {
                var pattern = /\d*/;
                if (e.value.length < 13 || e.value.length > 15 || pattern.test(e.value) == false) {
                    e.errorText = "必须输入13~15位数字";
                    e.isValid = false;
                }
            }
    }
    
    function onEnglishAndNumberValidation(e) {
        if (e.isValid) {
            if (isEnglishAndNumber(e.value) == false) {
                e.errorText = "必须输入英文+数字";
                e.isValid = false;
            }
        }
    }
    /* 是否英文+数字 */
    function isEnglishAndNumber(v) {
        
        var re = new RegExp("^[0-9a-zA-Z\_]+$");
        if (re.test(v)) return true;
        return false;
    }


</script>
</body>
</html>
