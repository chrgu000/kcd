<%@page import="com.model1.icbc.erp.PageData"%>
<%@page import="com.util.pagedate"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="content-wrapper" style="min-height: 652px;">
		<!-- Content Header (Page header) -->

<script type="text/javascript">
$(document).ready(function(){
    //alert('加载完毕');
    $("input[name='aid']").each(function(j,item){
   // 你要实现的业务逻辑
     	$.ajax({
        type: "POST",
        url: "editname.do",
        data:{id:item.value},
        dataType: "json",
        success: function(msg){
        	$.each(msg,function(index, n){
            $("#cn"+item.value).text(msg[index].adminname+"正在操作"); 
        	});      	
        }
        	
      });
     });

	
  });
</script>


<script type="text/javascript">
    function a3(){
		var s=$("#page_limit_select").val();
		var status=$("#status").val();
		var querytype=$("#querytype").val();		
		window.location.href ="${pageContext.request.contextPath}/erp/index_.do?type=wlghd&dn=kk&qn=list&pagesize="+s+"&pagenow=1"+"&status="+status;
    }
    function a2(){
    	var oname=$("#type_select").find("option:selected").text();   	
		var s=$("#page_limit_select").val();
		var type_select=$("#type_select").val();
		var querytype=$("#querytype").val();		
		window.location.href ="${pageContext.request.contextPath}/erp/index_.do?type=wlghd&dn=kk&qn=list&pagesize="+s+"&pagenow=1"+"&status="+type_select;
    }
    function a1(){
    	var oname=$("#type_select1").find("option:selected").text();   	
		var s=$("#size").val();
		var status=$("#status").val();
		var querytype=$("#type_select1").val();		
		window.location.href ="kjs_kk.do?querytype="+querytype+"&size="+s+"&status="+status;
    }
</script>				
		<section class="content-header">
			<h1>
			开卡<small>共${requestScope.totalsize}个</small>				
			</h1>			
		</section>
		<!-- Main content -->
		<section class="content">
		<input id="querytype" name="querytype" value="${requestScope.querytype}" type="hidden">
		<input id="status" name="status" value="${requestScope.status}" type="hidden">
		<input id="size" name="size" value="${requestScope.pagesize}" type="hidden">
			<div class="admin-tools">
				<div class="row">
					<div class="col-sm-10 admin-button">
							<div class="btn-group">						
<!-- 							<a data-toggle="modal" data-target="#modal2" href="" style="background-color: #447feb;" class="btn btn-default">
							新增</a>	 -->																														
							<a href="${pageContext.request.contextPath}/toExcel.do?type=icbc&amp;querytype=&amp;bc_status=" style="background-color: #ff8700;" class="btn btn-default">
							导出
							</a>
							<select class="form-control" id="type_select" onchange="a2()" style="float: right;margin-right: 20px;">	
								<option value="">全部状态</option>
								<option value="2" ${requestScope.status==2?"selected='selected'":''}>身份核查中</option>
								<option value="3" ${requestScope.status==3?"selected='selected'":''}>开卡审核中</option>
								<option value="4" ${requestScope.status==4?"selected='selected'":''}>回退补件</option>
								<option value="5" ${requestScope.status==5?"selected='selected'":''}>申请失败</option>
								<option value="7" ${requestScope.status==7?"selected='selected'":''}>申请成功</option>
								<option value="8" ${requestScope.status==8?"selected='selected'":''}>电审回退</option>
								<option value="9" ${requestScope.status==9?"selected='selected'":''}>开卡完成</option>
							</select>		
							</div>
					</div>
					<div class="col-sm-2 admin-page-top hidden-xs">
					   <div class="btn-group">											
					   <ul class="pagination no-margin">					     				       
						<li>
						<select id="page_limit_select" onchange="a3()" class="form-control">
						    <option value="${requestScope.pagesize}">当前每页${requestScope.pagesize}条</option>
							<option value="10">每页10条</option>
							<option value="20">每页20条</option>
							<option value="30">每页30条</option>
							<option value="40">每页40条</option>
							<option value="50">每页50条</option>
							<option value="60">每页60条</option>
							<option value="70">每页70条</option>
							<option value="80">每页80条</option>
							<option value="90">每页90条</option>
							<option value="100">每页100条</option>
						</select>
						</li>
						<li>
							<%
							int pagenow1=Integer.parseInt(request.getAttribute("pagenow").toString());
						    int totalpage1=Integer.parseInt(request.getAttribute("totalpage").toString());
						    if(pagenow1>1&&pagenow1<=totalpage1){
							%>
							<a href="${pageContext.request.contextPath }/erp/index_.do?type=wlghd&dn=kk&qn=list&pagesize=${requestScope.pagesize}&pagenow=${requestScope.pagenow-1}" class="btn btn-default">«</a>						
							<%				    	
					         }						
							 if(pagenow1>=1&&pagenow1<totalpage1){
							%>
							<a href="${pageContext.request.contextPath }/erp/index_.do?type=wlghd&dn=kk&qn=list&pagesize=${requestScope.pagesize}&pagenow=${requestScope.pagenow+1}" class="btn btn-default">»</a>
	                        <%
	                        }
	                        %>
						</li>
						</ul>
					   </div>	
							</div>
				</div>
			</div>
			<div id="main_list" class="admin-content box">
			<!-- 数据载入中 请在搜索，筛选，载入的时候显示 放在.box里 -->
			<div class="overlay" style="display:none;">
			<i class="fa fa-refresh fa-spin"></i>
			</div>
			<script type="text/javascript">
			function khhc(id){
				$.ajax({
			        type:"POST",
			        url:"kjs/khhc.do",
			        dataType: "text",
			        data:{id:id},
			        success: function(msg){
			        	if(msg=="true"){
			        	alert("成功,客户可重新进件");	  
					    window.location.reload();
			        	}else{
			        	alert("失败,请联系管理员");	  	
			        	}			        
			        }
			        ,
			         error:function(e){
			           	alert("失败，请稍后重试!"+e.status);
			       }
				});	
				
			}
			 //获取checkbox按钮组
			 var allpro = document.getElementsByName("delid");
			 //全选方法
			 function change() {
			    //获取全选按钮
			 var all = document.getElementById("btcheck_all");
			 //全选按钮被选中时，遍历所有按钮
			    if (all.checked) {
			     for (var i = 0; i < allpro.length; i++) {
			     if (allpro[i].type=="checkbox") {
			     allpro[i].checked=true;

			     }
			     }
			     //全选按钮未被选中时
			    }else{
			     for (var i = 0; i < allpro.length; i++) {
			     if (allpro[i].type=="checkbox") {
			     allpro[i].checked=false;
			     }
			     }
			    }
			 }
			</script>
			<!-- 数据载入中结束 -->
	<table id="tableExcel" class="table table-bordered table-hover">
	<tbody>
		<tr>
			<th style="width: 3%" class="text-center">
			<input onchange="change()" id="btcheck_all" class="check_all" type="checkbox">
			</th>
			<th class="hidden-xs text-center">订单编号</th>
			<th class="text-center">公司-姓名</th>
			<th class="hidden-xs text-center">提交/更新时间</th>
			<th class="hidden-xs text-center">客户姓名</th>
			<th class="hidden-xs text-center">卡号</th> 		
			<th class="hidden-xs text-center">手机号码</th>
			<th class="hidden-xs text-center">贷款金额(元)</th>
			<th style="width: 140px" class="text-center">操作</th>
			<!--  <th class="text-center hidden-xs" style="width: 188px">银联代收代付</th>-->			
			<th style="width: 80px">开卡状态</th>
		</tr>
			<%
			Map kkmap=(Map)request.getAttribute("kkmap");
			List<PageData> list=(List)request.getAttribute("newpdList");
			int kknub=0;
			%>
		
			<c:forEach var="pd" items="${requestScope.newpdList}">
			<%
			PageData pd=list.get(kknub);
			%>
			<tr>
				<td class="text-center"><input name="delid" type="checkbox"></td>
				<td class="hidden-xs text-center">
				${pd.gems_code}
				</td>
				<td class="text-center">
	                                     来源:${pd.fsname}-${pd.gemsname}
	            </td>
				<td class="hidden-xs text-center">
			${fn:substring(pd.dt_add,0,19)}<br/>
			<font color="#807c7c">${fn:substring(pd.dt_edit,0,19)}</font>
			</td>
			<td class="hidden-xs text-center">${pd.c_name}</td>
			<td class="hidden-xs text-center">${pd.kk_kh}</td>
			<td class="hidden-xs text-center">${pd.c_tel}</td>
			<td class="hidden-xs text-center">
			<fmt:formatNumber type="number" value="${pd.dk_total_price}" pattern="0.00" maxFractionDigits="2"/>
			</td>
			<td class="text-center">
				<!--  编辑-->
				<div class="table-button">
				<a href="${pageContext.request.contextPath }/erp/wdrw_from.do?type=wlghd&dn=jdgz&qn=form&icbc_id=${pd.icbc_id}&cn=kk" class="btn btn-default">
				<i class="fa fa-search-plus" title="明细查看"></i>
				</a>
				<a href="${pageContext.request.contextPath}/erp/index_.do?type=wlghd&dn=kk&qn=form&id=${pd.id}&icbc_id=${pd.icbc_id}" class="btn btn-default">
				<i class="fa fa-pencil" title="审核编辑"></i>
				</a>
				</div>
			</td>
				
            <td><!--当前状态  -->
			<a href="${pageContext.request.contextPath}/erp/index_.do?type=wlghd&dn=kk&qn=form&id=${pd.id}&icbc_id=${pd.icbc_id}">
			<span id="kk${pd.id}" class="label label-success"><%=kkmap.get(Integer.parseInt(pd.get("bc_status").toString())) %></span></a>
			</td>	

			</tr>
			<% kknub++; %>
			</c:forEach>
			</tbody>
</table>				
  <script type="text/javascript">
      function del_icbc(id){
    	  if(confirm('确实要删除该内容吗?'))
    	  {
    	 	  $.ajax({
  		        type:"POST",
  		        url:"del_icbc.do",
  		        data:{icbc_id : id},
  		        success: function(msg){
  		  		  alert("删除成功");
  		  		window.location.reload();
  		  		},
  		  		error:function(){
  		  	      alert("删除失败，请稍后重试...");         
  		  	   }
  			}); 
    	  }
   
    	  
      }
  
      function fkup(id){
    	var fk_status=document.getElementById("checkstatus_"+id).value;  
    	$.ajax({
		        type:"POST",
		        url:"fk_up.do",
		        data:{id : id,
		           fk_status : fk_status	
		        },
		        success: function(msg){
		  		alert("提交成功");
		  		window.location.reload();
		  		},
		  		error:function(){
		  	      alert("提交失败，请稍后重试...");         
		  	   }
			});     	  	  
      }  
  </script>
			</div>
	<div class="foot-page">
			<c:if test="${requestScope.totalpage ge '1' }">
				<ul class="pagination no-margin">
				       <c:if test="${requestScope.pagenow ne '1' }">
				        <li><a href="${pageContext.request.contextPath }/erp/index_.do?type=wlghd&dn=kk&qn=list&pagesize=${requestScope.pagesize}&pagenow=${requestScope.pagenow-1}" aria-label="Next"><span aria-hidden="true">«</span></a></li>
				       </c:if>
					   <%
				       int pagenow=Integer.parseInt(request.getAttribute("pagenow").toString());
				       int totalpage=Integer.parseInt(request.getAttribute("totalpage").toString());
				       int i=5; 
				       int h=1;
				    	 if(totalpage>=5){
				    		  if((pagenow-1)%4==0){
				    			 h=pagenow;
				    			 i=pagenow+4;
				    		  }else{
				    			 h=4*(pagenow-1-((pagenow-1)%4))/4+1;
				    			 i=h+4;
				    		  }				    		  
				    	  }else{
				    		i=totalpage;
				    	  } 
				       for(int j=h;j<i+1;j++){				    	   				    	   
				       if(j==pagenow){
				       %>
					   <li id="l<%=j %>" class="active">
					   <a id="a<%=j %>" href="${pageContext.request.contextPath }/erp/index_.do?type=wlghd&dn=kk&qn=list&pagesize=${requestScope.pagesize}&pagenow=<%=j %>">
					   <%=j %>
					   </a>
					   </li>
					   <%
				       }else{
					   %>
	                   <li id="l<%=j %>" >
					   <a id="a<%=j %>" href="${pageContext.request.contextPath }/erp/index_.do?type=wlghd&dn=kk&qn=list&pagesize=${requestScope.pagesize}&pagenow=<%=j %>">
					   <%=j %>					   
					   </a>
					   </li>					   
		               <%
				       }
				       if(j>=totalpage){
					    	  j=i+1; 
					   }
				       }				
		               %>
					   <c:if test="${requestScope.pagenow lt requestScope.totalpage}">
			               <c:if test="${requestScope.totalpage gt 5}">
						  <li><a href="${pageContext.request.contextPath }/erp/index_.do?type=wlghd&dn=kk&qn=list&pagesize=${requestScope.pagesize}&pagenow=${requestScope.pagenow+1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>  
						   </c:if>
					   </c:if>
					     				
					   </ul>
			</c:if>		   
				<div class="page-num">共${requestScope.totalsize}个 分${requestScope.totalpage }页显示</div>
			</div>
			
			</section><!-- /.content -->
		</div>