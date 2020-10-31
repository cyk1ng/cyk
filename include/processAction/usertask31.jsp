<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div style="width: 100%;margin-top:10px;">
	<table class="audit-opinion" border="0" cellpadding="1" cellspacing="2" style="width:99%;table-layout:fixed;border-color: #E7ECF1;">
	    <tr style="padding-top: 2px;">
	    	<td style="width:130px;" align="right">中心领导审批意见：</td>
	    	<td style="width:70%" align="left">
	            <span id="appOpinion_span_id"></span>
	        </td>
	        <td></td>
	    </tr>
	    <tr style="padding-top: 2px;height: 40px;">
	    	<td style="width:130px;" align="right">中心领导审批结果：</td>
	    	<td style="width:70%" align="left">
	    		<input id="appResult" name="appResult" class="mini-hidden" value=""/>
	            <span id="appResult_span_id"></span>
	        </td>
	        <td></td>
	    </tr>
	    <tr id="enterpriseNumber_tr_id" style="padding-top: 2px;height: 40px;display: none;">
	    	<td style="width:130px;" align="right">企业编号：</td>
	    	<td style="width:70%">
	            <input id="enterpriseNumberNew" name="enterpriseNumberNew" class="mini-textbox"  style="width:96%;" maxLength="4"/>
	        </td>
	    </tr>
	    <tr id="messageTr" style="padding-top: 2px;height: 40px;display: none;">
	    	<td></td>
	        <td colspan="2" align="left">
	        	<span id="messageTip_span_id" style="color: red;"></span>
	        </td>
	    </tr>
	    <!-- <tr id="validity_tr_id1" style="display: none;height: 40px;">
	        <td style="width:130px;" align="right">有效年限：</td>
			<td style="width:70%">
				 <input id="termValidity" name="termValidity" class="mini-textbox" style="width:94%;" value="3" onvaluechanged="onTermValidity" />年
			</td>
	        <td></td>
	    </tr> -->
	    <tr id="validity_tr_id2" style="display: none;height: 40px;">
	    	<td style="width:130px;" align="right">有效期：</td>
	        <td style="width:70%">
                 <input id="validityPeriod" name="validityPeriod" class="mini-datepicker" allowInput="false" style="width:96%;" format="yyyy-MM-dd" />
	        </td>
	        <td></td>
	    </tr>
	    <tr style="padding-top: 2px;height: 60px;">
	    	<td colspan="3" style="width: 100%;">
				<!-- <a class="mini-button mini-button-primary" onclick="completeFinalTask('1')">许可</a>
				<a class="mini-button mini-button-primary" onclick="completeFinalTask('2')">不许可</a> -->
				<a class="mini-button mini-button-primary" onclick="submitTask()">提交</a>
	    		<a class="mini-button" onclick="closeWindow()">关闭</a>
	    	</td>
	    </tr>
	</table>
	
	<script type="text/javascript">
		$(document).ready(function(){
			mini.get("test12").updatePane(2,{size:"160"});
			
		});
	</script>
</div>