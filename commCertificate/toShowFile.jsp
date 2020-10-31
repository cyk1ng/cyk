<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
        <%@ include file="/WEB-INF/jsp/include/taglib.jsp" %>
            <%@ include file="/WEB-INF/jsp/include/meta.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

    <head>
        <meta charset="utf-8">
        <title></title>
        <script>
        var wsData='${url}';
//         var wsData1='{"doctcnf":"2019","dochjh":"0123","doctitle":"测试文书","dochjnund":"20","doctcyf":"01","doctcr":"23","docslh":"20190123","docnf":"2019","docyf":"01","docr":"23","fileName":"zyxzxkjds"}';
//         alert(JSON.parse(wsData1))
        $(document).ready(function () {
			//debugger;
        });
        var acceptNumber;
    	var fileName;
    	var nodeTaskid;
    	var subitemid;
    	var attcd;
        function SetData(data) {
        	//debugger;
            data = mini.clone(data);
            rowObj = data;
            //debugger;
        	acceptNumber=data.acceptNumber,
        	fileName=data.fileName;
        	processInstanceId=data.processInstanceId;
        	nodeTaskid = data.nodeTaskid;
        	subitemid = data.subitemid;
        	processStatus = data.processStatus;
        	attcd = data.attcd;
        	yulan(attcd);
        }
      //文件预览
        function yulan(attcd) {
            $("#yulanDiv").attr("src", "");
//             $("#yulanDiv").attr("src", "http://192.254.20.161:18001/web-root/resources/ceshi/ywlzd_1548063319879.pdf");
//             $("#yulanDiv").attr("src", "ftp://lzd:lzd@172.16.0.2/ywlzd_1548241079764.pdf");
			var url2 = "";
			//debugger;
			if(attcd!=null&&attcd!=""&&attcd!="null"){
           		url2 = "${webProperties['app.url.approval']}/commCertificate/gitShowFile.htm";
			}else{
				url2 = "${webProperties['app.url.approval']}/commCertificate/showFile.htm";
			}
            
            $.ajax({
                url: url2,
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                type: 'post',
                data: {attcd:attcd,acceptNumber: acceptNumber,fileName: fileName,processInstanceId: processInstanceId,nodeTaskid:nodeTaskid,subitemid:subitemid,processStatus:processStatus},
                success: function (result) {
                    result = eval(result);
                    $("#yulanDiv").attr("src", result);
                },
                complete: function () {

                },
                error: function (jqXHR, textStatus, errorThrown) {

                }
            });
        }
        </script>
    </head>

    <body style='overflow-y: hidden;'>
                  <div class="portlet-body" style='overflow-x: hidden;'>
                      <div class="row">
                          <div class="col-xs-12">
                              <div class="scroller" style="height: 800px;width:99%;background-color: #fff;"><!--这里的高度作用：当内容高度超过400px是自动出现滚动条-->
                                  <iframe id="yulanDiv" style="width:99%;height: 100%"></iframe>
                              </div>
                          </div>
                      </div>
                  </div>
          <!--END 弹出框-->
    </body>

</html>
