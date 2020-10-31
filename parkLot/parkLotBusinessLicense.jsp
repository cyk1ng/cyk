<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>停车场窗口受理</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
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
        .asLabel .mini-textboxlist-border {
            border: 0;
            background: #f3f0f0;
            cursor: default;
        }

        .asLabel .mini-buttonedit-button,
        .asLabel .mini-textboxlist-close {
            display: none;
        }

        .asLabel .mini-textboxlist-item {
            padding-right: 8px;
        }

        .mini-tabs-buttons {
            padding-right: 30px;
        }
    </style>
</head>
<body>
<div class="mini-fit">
    <div id="tabs1" class="mini-tabs" activeIndex="0" style="width:100%;height:100%;" plain="false"
         buttons="#tabsButtons" buttonsAlign="right">
        <div title="申请信息">
            <%--隐藏域--%>
            <form id="applyDataForm" method="post">
            <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
		    <tr>
				<td style="width:130px;" align="right" >受理编号：</td>
				<td style="width:100%" colspan="2">
					<input id="acceptNumber"  name="acceptNumber" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>
				</td>
			</tr>
			<tr>
				
				<td style="width:130px;" align="right" >项目名称：</td>
				<td style="width:100%" colspan="2">
					<input id="projectName"  name="projectName" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>
				</td>
			</tr>
			 <tr>
				<td style="width:130px;" align="right" >办理事项：</td>
				<td style="width:100%" colspan="2">
					<input id="applicationClassName"  name="applicationClassName" class="mini-textbox asLabel" style="width:96%;" readOnly="true" value=""/>
				</td>
			</tr>
		    <tr>
		        <td style="width:130px;" align="right">申请人：</td>
		        <td style="width:50%" colspan="2">
		            <input id=createUser name="createUser" class="mini-textbox asLabel" style="width:96%;" readOnly="true" />
		        </td>
		       
		    </tr>
		    <tr>
		        <td style="width:130px;" align="right">申请时间：</td>
		        <td style="width:50%" colspan="2">
		            <input id=createTime name="createTime" class="mini-textbox asLabel" style="width:96%;" readOnly="true" />
		        </td>
		       
		    </tr>
		    <tr>
		        <td style="width:130px;" align="right">联系人：</td>
		        <td style="width:50%" colspan="2">
		            <input id="contact" name="contact" class="mini-textbox asLabel" style="width:96%;" readOnly="true" />
		        </td>
		       
		    </tr>
		    <tr>
		        <td style="width:130px;" align="right">联系电话：</td>
		        <td style="width:50%" colspan="2">
		            <input id="contactTel" name="contactTel" class="mini-textbox  asLabel" style="width:96%;" readOnly="true" value=""/>
		        </td>
		    </tr>
		     <tr>
		        <td >&nbsp;</td>
		        <td >&nbsp;</td>
		        <td >&nbsp;</td>
		    </tr>
		  </table>
		  </form>
        </div>
        <div title="业务信息" style="display: none">
            <form id="businessForm" method="post">
                <%@include file="/WEB-INF/jsp/parkLot/baseEnterprise.jsp"%>
                <%@include file="/WEB-INF/jsp/parkLot/parkInfoReadOnly.jsp"%>
            </form>
        </div>
        <div title="申请材料" style="display: none">
            <iframe id="fileupload" src="${webProperties['app.url.commProcess']}/entrance/commFileListPage.htm"
                    frameborder="0" scrolling="no" marginheight="0" marginwidth="0" height="100%" width="100%"></iframe>
        </div>
        <div name="book" title="法律文书" visible="false">
            <div id="datagrid" class="mini-datagrid"
                 url="${webProperties['app.url.approval']}/commCertificate/getCommCertificateList.htm"
                 style="width:auto;height:auto;" idField="id" allowSortColumn="true" sizeList="[10,20,30]"
                 pageSize="10" onloaderror="mini.alert(e.errorMsg);" showPager='false'>
                <div property="columns">
                    <div type="indexcolumn" align="center" headerAlign="center">序号</div>
                    <div field="wsbh" align="center" visible='false' width='80' headerAlign="center">文书编号</div>
                    <div field="wsname" align="center" width='80' headerAlign="center">文书名称</div>
                    <div field="printstatus" align="center" visible='false' width='80' headerAlign="center">打印状态</div>
                    <div field="printstatusmc" align="center" width='80' headerAlign="center">打印状态</div>
                    <div field="cz" align="center" width="80" headerAlign="center">操作</div>
                </div>
            </div>
        </div>

        <%@ include file="/WEB-INF/jsp/include/tab.jsp" %>
    </div>
</div>
<script type="text/javascript">
	var acceptNumber=parent.acceptNumber;
    
    function submitForm() {
        $.ajax({
            url: "${webProperties['app.url.businessApproval']}/parkApprovalChange/getParkChangeData.htm?mainId="+acceptNumber,
            contentType : "application/json;charset=utf-8",
            type : "POST",
            dataType : "json",
            data:{

            },
            success: function (debugData) {
                mini.parse();
                debugger;
                var form = new mini.Form("#tabs1");
                debugData=debugData[0];
                //var debugData={"recordNumber":"2312","recordTerm":"2421412","licenseNumber":"21412421","enterpriseName":"1242141242","enterprisePostalCode":"2421421","enterpriseType":"非正规就业","enterpriseNature":"内资","legalRepresentative":"24214124","enterpriseTel":"242141224","enterpriseAddressArea":"黄浦区","enterpriseAddress":"2412412412","ckName":"24124124","ckPropertyRight":"自有","personLiableName":"4124214","personLiablePhone":"124124124214","ckAddressArea":"黄浦区","ckAddressStreet":"214214","ckAddressNumber":"242412421","ckPostalCode":"2131233","ckTermEnd":"2019-03-24T00:00:00","employeesNumber":"242","ckTel":"12312312","complaintTel":"2141242","ckPropertyOwner":"124214214","feeSystemSupplierName":"12421412421","entranceName":["进口地址1","进口地址2","进口地址3"],"exitName":["出口地址1","出口地址2","出口地址3"],"ckPosition":"中外环线间","natureOfManagementI":"公共停车场（库）","natureOfManagementIi":"社会","ckArea":"211421","parkingNumberForeign":"2123","berthsNumberPr":"1231","berthsNumberChargingPile":"2312","berthsNumberBarrierFree":"123321","parkingNumberTime":"12312333","nature":"停车库（地上）-5楼","zLevel":"级别Ⅱ","grade":"级别Ⅱ","area":"1233123","berthsNumber":"12313","parkingNumberLarge":"23","parkingNumberSmall":"23","freightBasis":"23","zSelfPropelled":"12","offspringType":"5","mechanical":"14","shelfValidityPeriod":"safasf","billingMode":"自动计时人工收费","parkingNumber":"23","parkingNumbeLongTerm":"123","pagesize":10,"parkingType":"大型客车,大型货车,小型客车","paymentMethod":"公共交通卡,银行卡,其他","ckType":"136401001"};
                form.setData(mini.decode(debugData));
                var checklist1=mini.get("checkboxList1");
                checklist1.setValue(debugData.parkingType);
                var checklist2=mini.get("checkboxList2");
                checklist2.setValue(debugData.paymentMethod);
                var entranceName_= debugData.entranceName;
                var exitName_= debugData.exitName;
                var entranceDom="<label>进口地址：</label>";
                var exitDom="<label>出口地址：</label>"
                for (var i=0;i<entranceName_.length;i++){
                    entranceDom+="<input  value='"+entranceName_[i]+"' readonly class=\"mini-textbox asLabel\"  vtype=\"rangeChar:1,132\" />"
                }
                for (var j=0;j<exitName_.length;j++){
                    exitDom+="<input  value='"+exitName_[j]+"' readonly class=\"mini-textbox asLabel\"  vtype=\"rangeChar:1,132\" />"
                }
                $("#InAddress").html(entranceDom);
                $("#OutAddress").html(exitDom);

                form.setEnabled(false);
                mini.parse();
            }
        });

    }

</script>
<script type="text/javascript">
    submitForm();

</script>
<script type="text/javascript">
    mini.parse();
    $(document).ready(function(){
    	getApply();
	});
    
	function getApply(){
		 var applyForm = new mini.Form("applyDataForm");
		 // debugger;
		 var applyData={};
		 applyData.acceptNumber=acceptNumber;
		 applyData.applicationClassName=parent.applicationClassName;
		 applyData.createTime =parent.createTime;
		 applyData.createUser=parent.createUser;
		 applyData.contact=parent.contact;
		 applyData.contactTel=parent.contactTel;
		 applyData.projectName=parent.projectName;
		 
		 applyForm.setData(applyData);
    }
</script>
</body>
</html>
