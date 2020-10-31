<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <head>
        <title>上海市交通委员会综合业务平台</title>
        <!--引入资源文件-->
        <%@ include file="/WEB-INF/jsp/include/meta.jsp"%>
        <!--引入资源文件 end-->
        <style>
            .no_padding {
                padding: 0;
                margin: 0px;
            }
        </style>
        <script type="text/javascript">
            $(function() {
                if(!$.isEmptyObject($('[data-toggle="tooltip"]'))) {
                    $('[data-toggle="tooltip"]').tooltip();
                }
            });
            var commProcessUrl = "http://122.144.195.126:18001/commProcess-app";

            // 当前工程地址
            var constructionUrl = "http://localhost:18012/construction-app";
            //下拉框查询地址
            var selectboxUrl="";
        </script>
    </head>

<body>
<!--电科互联网网页头部-->
<%@include file="/WEB-INF/common/internet/header.jsp"%>
<!--电科互联网网页头部 end-->
<input type="hidden" name="year" id="year" />
<input type="hidden" name="applyId" id="applyId" value="3159201f-7f98-4927-a770-51092b7cbdf8" />
<div class="page-content subpage" style="margin-top:70px;">
    <div class="row" id="formData">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="page-title">
                    <i class="fa fa-flag"></i> 项目基础信息----新建
                    <div class="pull-right">
                        <!-- 						<a href="#">  -->
                        <button type="button" id="btnBack" class="btn btn-success">
                            <i class="fa fa-backward"></i> 返回
                        </button>
                        <!-- 						</a> -->
                    </div>
                </div>
            </div>
        </div>

        <div id="form1" class="col-lg-12 col-md-12 col-sm-12">
            <!--企业基本信息-->
            <%@include file="/WEB-INF/jsp/parkApproval/baseEnterprise.jsp"%>
            <!--企业基本信息 end-->
            <!--场库信息-->
            <%@include file="/WEB-INF/jsp/parkApproval/parkInfoReadOnly.jsp"%>
            <!--场库信息 end-->
            <!-- 引入附件上传-->
            <%@include file="/WEB-INF/jsp/parkApproval/fileUpload.jsp"%>
            <!--引入附件上传 end-->
            <div class="row padding-bottom-20">
                <div class="col-lg-12 col-md-12 col-sm-12 center-pill">
                    <button type="button" id="btnSave" onclick="submitForm()" class="btn btn-success">
                        <i class="fa fa-save"></i> 提交
                    </button>
                    <button type="button" class="btn btn-default">
                        <i class="fa fa-close"></i> 取消
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    mini.parse();
    var form = new mini.Form("#form1");
    var debugData={"recordNumber":"2312","recordTerm":"2421412","licenseNumber":"21412421","enterpriseName":"1242141242","enterprisePostalCode":"2421421","enterpriseType":"非正规就业","enterpriseNature":"内资","legalRepresentative":"24214124","enterpriseTel":"242141224","enterpriseAddressArea":"黄浦区","enterpriseAddress":"2412412412","ckName":"24124124","ckPropertyRight":"自有","personLiableName":"4124214","personLiablePhone":"124124124214","ckAddressArea":"黄浦区","ckAddressStreet":"214214","ckAddressNumber":"242412421","ckPostalCode":"2131233","ckTermEnd":"2019-03-24T00:00:00","employeesNumber":"242","ckTel":"12312312","complaintTel":"2141242","ckPropertyOwner":"124214214","feeSystemSupplierName":"12421412421","entranceName":["进口地址1","进口地址2","进口地址3"],"exitName":["出口地址1","出口地址2","出口地址3"],"ckPosition":"中外环线间","natureOfManagementI":"公共停车场（库）","natureOfManagementIi":"社会","ckArea":"211421","parkingNumberForeign":"2123","berthsNumberPr":"1231","berthsNumberChargingPile":"2312","berthsNumberBarrierFree":"123321","parkingNumberTime":"12312333","nature":"停车库（地上）-5楼","zLevel":"级别Ⅱ","grade":"级别Ⅱ","area":"1233123","berthsNumber":"12313","parkingNumberLarge":"23","parkingNumberSmall":"23","freightBasis":"23","zSelfPropelled":"12","offspringType":"5","mechanical":"14","shelfValidityPeriod":"safasf","billingMode":"自动计时人工收费","parkingNumber":"23","parkingNumbeLongTerm":"123","pagesize":10,"parkingType":"大型客车,大型货车,小型客车","paymentMethod":"公共交通卡,银行卡,其他","ckType":"136401001"};
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
        entranceDom+="<input  value='"+entranceName_[i]+"' readonly class=\"mini-textbox\"  vtype=\"rangeChar:1,132\" />"
    }
    for (var j=0;j<exitName_.length;j++){
        exitDom+="<input  value='"+exitName_[j]+"' readonly class=\"mini-textbox\"  vtype=\"rangeChar:1,132\" />"
    }
    $("#InAddress").html(entranceDom);
    $("#OutAddress").html(exitDom);
    form.setEnabled(false);
    function submitForm() {
        var form = new mini.Form("#form1");
        form.validate();
        if (form.isValid() == false) return;
        var data = form.getData();
        //获取多个复选框的值
        var box1=mini.get("checkboxList1").getValue();
        var box2=mini.get("checkboxList2").getValue();
        data["parkingType"]=box1;
        data["paymentMethod"]=box2;
        //获取进口地址
        var inAress=[];
        $("#InAddress input[name='entranceName']").each(function(){
            inAress.push($(this).val());
        })
        //获取出口地址
        var outAress=[];
        $("#OutAddress input[name='exitName']").each(function(){
            outAress.push($(this).val());
        })
        data["entranceName"]=inAress;
        data["exitName"]=outAress;
        console.log(data);
        var json = mini.encode(data);
        console.log(json);
        //调试使用
        data=debugData;
        $.ajax({
            url: "${webProperties['app.url.businessApproval.netWeb']}/park/NewParkApproval.data",
            contentType : "application/json;charset=utf-8",
            type : "POST",
            dataType : "json",
            data:JSON.stringify(data),
            success: function (text) {
                mini.alert("申请成功,待审批……");
            }
        });

    }
</script>
<!--电科互联网网页尾部-->
<%@include file="/WEB-INF/common/internet/footer.jsp"%>
<!--电科互联网网页尾部 end-->
</body>

</html>


