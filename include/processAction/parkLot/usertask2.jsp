<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div style="width: 100%;margin: 10px;">
	<table border="0" cellpadding="1" cellspacing="2" style="width:99%;table-layout:fixed;border-color: #E7ECF1;">
	    <tr style="padding-top: 2px;height: 60px;">
	    	<td colspan="2" style="width: 100%;">
				<a class="mini-button mini-button-primary" onclick="submitTask('1')">通过</a>
	    		<a class="mini-button" onclick="closeWindow()">关闭</a>
	    	</td>
	    </tr>
	</table>
	
	<script type="text/javascript">
		$(document).ready(function(){
			mini.get("test12").updatePane(2,{size:"80"});
		});
		//任务提交
		function submitTask(flag){
			var parmObj={};
			//var variables={};
			//variables.accept_type =flag;
			//parmObj.variables  =variables;
			
			//提交任务
			Comm_Activiti_Utils.completeTaskAction(parmObj);
		}
	</script>
</div>