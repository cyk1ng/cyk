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
    </style>
</head>
<body>
<div class="mini-fit">
    <form id="form">
        <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;line-height: 40px;padding-right:40px;">
            <tr>
                <td style="width:70px;" align="right">身份证号：</td>
                <td style="width:180px">
                    <input id="" name="b_legalpersondocumenttype" class="mini-textbox" style="width:100%;" maxLength="18"/>
                </td>
                 <td style="width:70px;" align="right">法人名称：</td>
                <td style="width:140px">
                    <input id="" name="b_legalperson" class="mini-textbox" style="width:100%;" />
                </td>
                <td style="width:70px;" align="right">企业名称：</td>
                <td style="width:140px">
                    <input id="" name="b_cnname" class="mini-textbox" style="width:100%;" />
                </td>
                <td style="padding-left: 10px">
                    <a class="mini-button" iconCls="" onclick="onSearch('form')">查询</a>
                </td>
            </tr>
        </table>
    </form>
    <div id="datagrid" class="mini-datagrid" allowResize="false" showEmptyText="true" emptyText="没有记录"
         url="${webProperties['app.url.approval']}/taxiIndividual/selectLegalPerson.htm"
         ajaxOptions="{timeout:'8000'}"
         idField="" sizeList="[10,20,30]" pageSize="30" virtualColumns="true"
         onloaderror="mini.alert(e.errorMsg);" style="width:100%;height:70%" onrowdblclick="selectPerson">
        <div property="columns">
            <div type="indexcolumn" width="30px"></div>
            <div field="b_enterpriseId" width="25%" align="center" headerAlign="center">企业编号</div>
            <div field="b_legalpersondocumentnum" width="25%" align="center" headerAlign="center">身份证号</div>
            <div field="b_legalperson" width="25%" align="center" headerAlign="center">姓名</div>
            <div field="b_cnname" width="25%" align="center" headerAlign="center">企业名称</div>
<!--              <div field="organcode" width="150" align="center" headerAlign="center">组织机构代码</div> -->
<!--             <div field="principalcetfno" width="150" align="center" headerAlign="center">身份证号</div> -->
<!--             <div field="principalname" width="150" align="center" headerAlign="center">法定代表人</div> -->
<!--             <div field="operateaddress" width="150" align="center" headerAlign="center">地址</div> -->
        </div>
    </div>
    <div class="mini-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;margin-bottom: -20px;"
     borderStyle="border:0;">
	    <a class="mini-button" style="width:60px;" onclick="selectPerson()">确定</a>
	    <span style="display:inline-block;width:25px;"></span>
	    <a class="mini-button" style="width:60px;" onclick="onCancel()">取消</a>
	</div>
 </div>
    

<script type="text/javascript">
    mini.parse();
    //获取url中的请求参数
    function getRequestString(key){
        var reg = new RegExp("(^|&)"+key+"=([^&]*)(&|$)");
        var result = window.location.search.substr(1).match(reg);
        return result?decodeURIComponent(result[2]):null;
    }
    $(document).ready(function(){
        onSearch('form');

    });

    function onSearch(form) {
        var grid = mini.get("datagrid");
        grid.clearRows();
        var form = new mini.Form(form);

        var o = form.getData();

        var json = mini.encode(o);
        
//         grid.loading();
//         $.ajax({
//             url: "${webProperties['app.url.approval']}/taxiIndividual/selectLegalPerson.htm",
//             type: 'post',
//             timeout : 10000,
//             contentType: "application/x-www-form-urlencoded; charset=utf-8",
//             data:{data:json},
//             success:function(data){
//             	grid.unmask();
//                 var dataObj = mini.decode(data);
//                 console.log(dataObj);
//                 if(dataObj.length < 1 ){
//                 	alert(1);
                	
//                 }else{
//                 	grid.setData(dataObj);
//                 }
                
                
                
//             },
//             error:function(jqXHR, textStatus, errorThrown){
//             	grid.unmask();
//             	if(textStatus=='timeout'){
//                     //处理超时的逻辑
//                     mini.alert("查询超时");
//                  }else{
//                 	 mini.alert(jqXHR.responseText);
//                 	 grid.setEmptyText("没有记录");
//                  }
                
//             }
//         });

        grid.load({data:json},null,function(result1){
        	if(result1.textStatus=='timeout'){
        		mini.alert("查询超时");
        	}
        });
    }

    function GetData() {
        var row = mini.get("datagrid").getSelected();

        return row;
    }

    function selectPerson() {

        CloseWindow("ok");
    }
    function onIDCardsValidation(e) {
        if (e.isValid) {
            var pattern = /\d*/;

            if(e.value.length <18){
                e.errorText = "必须输入18位或者17位+一位字母";
                e.isValid = false;
            }
            if(/[A-Z]/.test(e.value.charAt(e.value.length-1))==false && pattern.test(e.value.substr(0, e.value.length-1))){
                e.errorText = "必须输入18位或者17位+一位字母";
                e.isValid = false;
            }
        }
    }

    function onIDCardsValidation(e) {
        // 1 "验证通过!", 0 //校验不通过
        var format = /^(([1][1-5])|([2][1-3])|([3][1-7])|([4][1-6])|([5][0-4])|([6][1-5])|([7][1])|([8][1-2]))\d{4}(([1][9]\d{2})|([2]\d{3}))(([0][1-9])|([1][0-2]))(([0][1-9])|([1-2][0-9])|([3][0-1]))\d{3}[0-9xX]$/;
        //号码规则校验
        if(!format.test(e.value)){
            e.errorText = "身份证号码不合规";
            e.isValid = false;
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
        }
    }

    function CloseWindow(action) {
        if (action == "close" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow)
            return window.CloseOwnerWindow(action);
        else
            window.close();
    }

    function onCancel(e) {
        CloseWindow("cancel");
    }
</script>
</body>
</html>
