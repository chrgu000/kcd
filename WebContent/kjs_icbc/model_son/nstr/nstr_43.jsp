<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if  test="${fn:contains(sessionScope.pd.purview_map,'trshyj_43')==true}">
<li class="text-primary">
<em>审核员通融审核意见反馈</em>
<div class="big-conte_">  
<div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
<strong>开始时间：</strong>
</div>
<div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
<strong>处理时间：</strong>
</div>
<div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
<strong>处理人：</strong></div>
<strong style="margin-left:10px;"><i>处理信息：</i></strong><br>
<div class="task_margin ng-scope"  style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
<form id="nstrsh_43" name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope">
	    <input type="hidden" name="adminid" value="${sessionScope.pd.id}">
		<input type="hidden" name="type_id" value="${requestScope.type_id}"> 
		<input type="hidden" name="icbc_id" value="${pd.icbc_id}"> 
	<div class="form-group">
		<label class="col-sm-2 control-label">通融说明</label>
		<div class="col-sm-8">
			<textarea name="trsm" id="trsm" rows="3" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" ></textarea>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">备注</label>
		<div class="col-sm-8">
			<textarea name="result_1_msg" rows="3" class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text"></textarea>
		</div>
	</div>
	<!-- ngIf: rootData.orgType=='ALAN'&&((rootData.taskDefKey=='loanOrder_flexibleFeedback_director'||rootData.taskDefKey=='loanOrder_flexibleFeedback_manager')||(action=='detail'&&task.remarks1)) -->
	<div class="form-group">
		<label class="col-sm-2 control-label">通融材料</label>
		<!-- ngIf: rootData.taskDefKey=='flexibleFeedback'||rootData.taskDefKey=='loanOrder_flexibleFeedback_exception'||rootData.taskDefKey=='loanOrder_flexibleFeedback_director'||rootData.taskDefKey=='loanOrder_flexibleFeedback_manager' -->
	</div>
	<div>
		<input class="form-control ng-pristine ng-untouched ng-valid ng-empty ng-hide" type="text">
	</div>
	<!-- 根据action确定操作  -->
<!-- ngIf: !notUseButton -->
<div class="modal-footer">
	<a onclick="location.href='${pageContext.request.contextPath}/erp/wdrw_list.do?type=wdrw&dn=${requestScope.dn }&qn=list&cn=${requestScope.cn }&yw_id=${requestScope.yw_id }'" class="btn btn-warning" >取消</a>
	<a onclick="erp_nstrsh_43()"  class="btn btn-primary" >提交</a>	
</div>
</form>
<script type="text/javascript">
function erp_nstrsh_43(){
		var trsm = $("#trsm").val();
		if(trsm==""){
			alert("请输入通融说明!");
		}else{
			var form = new FormData(document.getElementById("nstrsh_43"));
		   	$.ajax({
		           url:"${pageContext.request.contextPath}/erp/erp_nstrsh_43.do",
		           type:"post",
		           data:form,
		           processData:false,
		           contentType:false,
		           success:function(data){
		            alert("提交成功!");
		            window.location.href='${pageContext.request.contextPath}/erp/wdrw_list.do?type=wdrw&dn=${requestScope.dn }&qn=list&cn=${requestScope.cn }';
		           },
		           error:function(e){
		            alert("错误！！");
		           }
		    });  
		}
	   	
}
</script>
</div>                                             
</div>							  	
</li>
</c:if>