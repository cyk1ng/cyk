<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp" %>
<%@ include file="/WEB-INF/jsp/include/meta.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>上海交通综合规划平台</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <style type="text/css">
        html, body {
            margin: 0;
            border: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            background: white
        }

        .asLabel .mini-textbox-border,
        .asLabel .mini-textbox-input,
        .asLabel .mini-buttonedit-border,
        .asLabel .mini-buttonedit-input,
        .asLabel .mini-textboxlist-border {
            border: 0;
            background: none;
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
    <table border="0" cellpadding="1" cellspacing="2"
           style="height:auto;width:100%;table-layout:fixed;line-height: 40px;padding-right:40px">
        <tr>
            <td style="width:130px;" align="right">企业名称：</td>
            <td style="width:50%">
                <input id="b_cnname" class="mini-buttonedit" allowInput="false" onbuttonclick="onButtonEdit"
                       placeholder="请输入关键字进行查询..."  autocomplete="off"  data-provide="typeahead"  type="text"
                       style="width:96%;"/>
            </td>
            <td style="width:130px;" align="right">经济类型：</td>
            <td style="width:50%">
                <input id="b_economictypemc" allowInput="false" readonly="true" class="mini-textbox"
                       style="width:96%;"/>
            </td>
        </tr>
        <tr>
            <td style="width:130px;" align="right">企业编号：</td>
            <td style="width:50%">
                <input id="baseNumber" allowInput="false" readonly="true" class="mini-textbox" style="width:96%;"/>
            </td>
            <td style="width:130px;" align="right">行业：</td>
            <td style="width:50%">
                <input allowInput="false" class="mini-textbox" readonly="true" value="${industry}" id="tradeName"
                       style="width:96%;"/>
                <input allowInput="false" class="mini-textbox" value="" id="tradeId" style="display: none"/>
                <input allowInput="false" class="mini-textbox" value="" id="type" style="display: none"/>
                <input allowInput="false" class="mini-textbox" value="" id="manageClass" style="display: none"/>
                <input allowInput="false" class="mini-textbox" value="" id="scopeId" style="display: none"/>
            </td>
        </tr>
    </table>
</div>
</button>
</body>
<script type="text/javascript">
    var comInfo;
    /**
     初期处理
     **/
    $(document).ready(function () {
        mini.parse();
    });

    //设置行业
    function setHangYe(tradeName, tradeId, type, manageClass,scopeId) {
        mini.get("tradeName").setValue(tradeName);
        //除了新增 为"201"
        mini.get("tradeId").setValue(tradeId);
        //新增标识 新增type 1
        mini.get("type").setValue(type);
        mini.get("manageClass").setValue(manageClass);
        mini.get("scopeId").setValue(scopeId);
    }
    function setReadOnly(flag){
  	  mini.get("b_cnname").setReadOnly(flag);
    }

    //草稿箱进入时，设置企业信息
    function setComInfo(b_cnname) {
        var type = mini.get("type").getValue();
        $.ajax({
            url: "${webProperties['app.url.commProcess']}/entrance/commYeHuListForBase.htm",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            type: 'POST',
            data: {
                comName: b_cnname,
                type: type
            },
            async: false,
            success: function (data) {
                console.log(data);
                var dataObj = mini.decode(data);
                if (dataObj != null && dataObj.data != null && dataObj.data.length > 0) {
                    var obj = dataObj.data[0];
                    mini.get("b_cnname").setText(obj.b_cnname);
                    mini.get("b_economictypemc").setValue(obj.b_economictypemc);
                    mini.get("baseNumber").setValue(obj.taxiBaseNumber);
                    mini.get("tradeName").setValue(obj.tradeName);
                } else {
                    mini.alert("调取企业信息出错，请重试或联系管理员");
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                mini.alert(jqXHR.responseText);
            }
        });
    }

    //设置企业为空
    function setNone() {
        mini.get("b_cnname").setValue("");
        mini.get("b_cnname").setText("");
        mini.get("b_economictypemc").setValue("");
        mini.get("baseNumber").setValue("");
        mini.get("tradeName").setValue("");
        mini.get("scopeId").setValue("");
    }

    function onButtonEdit(e) {
        var btnEdit = this;
        var tradeId = mini.get("tradeId").getValue();
        var type = mini.get("type").getValue();
        var manageClass = mini.get("manageClass").getValue();
        var scopeId = mini.get("scopeId").getValue();
        mini.open({
            url: "${webProperties['app.url.commProcess']}/entrance/commYeHuListPage.htm?tradeId=" + tradeId + "&type=" + type + "&manageClass=" + manageClass+"&scopeId"+scopeId,
            title: "选择企业",
            width: 900,
            height: 600,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = mini.clone(data);    //必须
                    if (data) {
                        comInfo = data;
                        var res = $("#license_frame")[0].contentWindow.setCompanyData(comInfo);
                        if (res != -1) {
                            btnEdit.setText(data.b_cnname);
                            mini.get("b_economictypemc").setValue(data.b_economictypemc);
                            mini.get("baseNumber").setValue(data.taxiBaseNumber);
                            mini.get("tradeName").setValue(data.tradeName);
                        }
                    }
                }

            }
        });
    }
</script>