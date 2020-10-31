<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div style="width: 100%;margin-top:10px;">
	<table border="0" cellpadding="1" cellspacing="2" style="width:99%;table-layout:fixed;border-color: #E7ECF1;">
	    <tr>
	    	<td style="width:130px;" align="right">核查结果：</td>
	    	<td style="width:100%" align="left">
	            <input id="fileupload" type="file" style="display:none">  
				<div class="input-append">  
				    <input id="photoCover" class="mini-textbox" readonly="true" style="width: 400px;margin-right: -4px;">  
				    <a class="mini-button mini-button-primary" onclick="uploadFileClick()" style="height: 35px;padding:6px 10px 4px 10px;">选择文件</a>
				</div>
				<span style="color: red;">文件后缀限定doc、docx、pdf</span>
			</td>
	    </tr>
	    <tr style="padding-top: 2px;height: 60px;">
	    	<td colspan="2" style="width: 100%;">
				<a class="mini-button mini-button-primary" onclick="pushFieldAuditTask()">下一步</a>
	    		<a class="mini-button" onclick="closeWindow()">关闭</a>
	    	</td>
	    </tr>
	</table>
	<script type="text/javascript" src="${webProperties['app.url.approval']}/resources/js/commFileupload.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			mini.get("test12").updatePane(2,{size:"150"});
		});
		 
		 /**
		 * 上传文件到ftp
		 */
		 var fileObj = {};
		 function uploadFileClick() {
             Comm_File.commUploadFile({
                 fileType: "99",
                 fileupload: "fileupload",
                 fnCallback: function () {
                     $('#fileupload').click();
                 }
             });
			 // getFileInfo({attCd:"5406a569-8159-4ade-b89f-f602800704ca"});
		 }
		
		 /**
		 * 实地核查下一步
		 */
		function pushFieldAuditTask(){
			saveFieldAuditFile(fileObj);
		}
		 
		/**
		* 保存文件到Git
		*/
		
		function saveFieldAuditFile(paramObj){
			if (paramObj.saveFileName == null || typeof(paramObj.saveFileName) == "undefined") {
				mini.alert("请上传核查结果。");
				return;
			}
			var url = "${webProperties['app.url.commProcess']}/commFile/save.htm";
			var jsonArray = [];
			var jsonObject = {};
			var curDay = mini.formatDate(new Date(),"yyyyMMdd");
			//var curDay = new Date().getFullYear() + "" + new Date().getMonth() + "" + new Date().getDay();
			var path = businessObj.applicationClass + "/" + curDay + "/" + businessObj.acceptNumber;
			
			jsonObject.saveRelativePath = path;
			jsonObject.saveFileName = paramObj.saveFileName;
			jsonObject.attCl = "99";
			jsonObject.attNm = paramObj.saveFileName;
			jsonObject.attOrigNm = paramObj.attOrigNm;
			jsonObject.attCd = "";
			jsonObject.attAddr = path;
			jsonObject.bizCd = businessObj.acceptNumber;//业务编号
			jsonObject.commitMessage = "注释";//注释
			jsonObject.bizSn = processStatus;
			jsonArray.push(jsonObject);

			if (jsonArray.length > 0) {
		        $.ajax({
		            url: url,
		            contentType: "application/x-www-form-urlencoded;charset=utf-8",
		            type: 'POST',
		            data: {
		                json: JSON.stringify(jsonArray)
		            },
		            success: function (data) {
		            	var dataObj = mini.decode(data);
		            	fieldAuditResult = dataObj.attCd;
		            	completeTask("3");
		            	console.log(data);
		                //delFileArray = [];
		                //Comm_Tool.loadGridTable("attDatagrid", bizCd, bizSn, true,'construction','indusNat_road','pjtSch_workers_can');
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		                mini.alert(jqXHR.responseText);
		            }
		        });
		    }
		}
		 
	</script>
</div>