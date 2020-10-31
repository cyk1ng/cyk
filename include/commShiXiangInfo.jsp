<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="mini-fit">
	<form action="" id="formSx">
     <table border="0" cellpadding="1" cellspacing="2"
           style="height:auto;width:100%;table-layout:fixed;line-height: 40px;padding-right:40px">
        <tr>
            <td style="width:130px;" align="right"></td>
            <td style="width:50%"></td>
            <td style="width:130px;" align="right"></td>
            <td style="width:50%"></td>
        </tr>
        <tr>
            <td style="width:130px;" align="right">事项名称：</td>
            <td style="width:50%">
                <input allowInput="false" readonly="true"  id="itemName" class="mini-textbox " value="${itemName}" style="width:96%;"/>
            </td>
            <td style="width:130px;" align="right">办事指南：</td>
            <td style="width:50%"><a href="#">查看</a></td>
        </tr>
        <tr>
            <td style="width:130px;" align="right">事项类型：</td>
            <td style="width:50%">
                <input allowInput="false"readonly="true" id="itemType" class="mini-textbox " value="${itemType}" style="width:96%;"/>
            </td>
            <td style="width:130px;" align="right">办理方式：</td>
            <td style="width:50%">
                <input allowInput="false" readonly="true" class="mini-textbox " value="${processAMenTo}" id="processAMenTo" style="width:96%;"/>
            </td>
        </tr>
        <tr>
            <td style="width:130px;" align="right">审批机构：</td>
            <td style="width:50%">
                <input id="approvingAuth" readonly="true" allowInput="false" class="mini-textbox " value="${approvingAuth}" style="width:96%;"/>
            </td>
            <td style="width:130px;" align="right">审批期限：</td>
            <td style="width:50%">
                <input allowInput="false" readonly="true" class="mini-textbox " value="${approveTime}" id="approveTime" style="width:96%;"/>
            </td>
        </tr>
    </table>
    </form>
</div>

<script type="text/javascript">

	var itemObj={};
    function queryItemInfo(itemId) {
        $.ajax({
            url: "${webProperties['app.url.commProcess']}/entrance/commShiXiangInfo.htm",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            type: 'POST',
            data: {
                itemId: itemId
            },
            async: false,
            success: function (data) {
            	console.log(data);
            	var dataObj = mini.decode(data);
            	jQuery.extend(itemObj,dataObj);
            	//itemObj = dataObj;
               if(data != null) {
            	   if(dataObj.approveTime == null || dataObj.approveTime =="" || dataObj.approveTime == "null"|| dataObj.approveTime == 0 || dataObj.approveTime =="0"){
            		   dataObj.approveTime = "当场办结";
                   }else{
                       dataObj.approveTime = dataObj.approveTime + "个工作日";
                   }
            	   var form = new mini.Form("formSx");
            	   form.setData(dataObj);
                   mini.get("itemName").setValue(dataObj.name);
                   mini.get("itemType").setValue(dataObj.itemType);
                   mini.get("approvingAuth").setValue(dataObj.approvingAuth);
                   mini.get("processAMenTo").setValue(dataObj.processAMenTo);
                   mini.get("approveTime").setValue(dataObj.approveTime);
            	   //mini.get("projectname").setValue(dataObj.name);
               }
               var panel1 = mini.get("panel1");
               if(panel1){
            	   panel1.setTitle("申请事项："+dataObj.name);
               }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                mini.alert(jqXHR.responseText);
            }
        });
    }

</script>
