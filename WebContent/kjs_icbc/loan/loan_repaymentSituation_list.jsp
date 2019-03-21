<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.model1.icbc.erp.PageData"%>
<%@page import="com.util.pagedate"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="content-wrapper" style="min-height: 943px;">
<script type="text/javascript">
    function a3(){
		var s=$("#page_limit_select").val();
		var status=$("#status").val();
		var querytype=$("#querytype").val();		
		window.location.href ="${pageContext.request.contextPath }/loan/selectPayList.do?type=khhkqk&dn=loan_repaymentSituation&qn=list&pagesize="+s+"&pagenow=1";
    }
    </script>
		<section class="content-header">
			<h1>
			客户还款情况<small>
			共${requestScope.totalsize}个
			</small>
			</h1>
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="admin-tools">
				<div class="row">
					<div class="col-sm-10">
						<div class="btn-group">		
							<form class="form-horizontal" action="${pageContext.request.contextPath }/loan/selectPayList.do?type=khhkqk&dn=loan_repaymentSituation&qn=list&pagesize=10&pagenow=1" method="post">
								<input autocomplete="off" type="text" placeholder="请输入客户姓名或身份证号" name="param" id="param" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" style="width:500px;">
								<button class="btn btn-info search-btn" type="submit" style="background-color:#00acd6;">查询</button>   																		
							</form>				
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
							<a href="${pageContext.request.contextPath }/loan/selectPayList.do?type=khhkqk&dn=loan_repaymentSituation&qn=list&pagesize=${requestScope.pagesize}&pagenow=${requestScope.pagenow-1}&param=${requestScope.param}" class="btn btn-default">«</a>						
							<%				    	
					         }						
							 if(pagenow1>=1&&pagenow1<totalpage1){
							%>
							<a href="${pageContext.request.contextPath }/loan/selectPayList.do?type=khhkqk&dn=loan_repaymentSituation&qn=list&pagesize=${requestScope.pagesize}&pagenow=${requestScope.pagenow+1}&param=${requestScope.param}" class="btn btn-default">»</a>
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
			<!-- 数据载入中结束 -->
			<table class="table table-bordered table-hover">
				<tbody>	
					<tr>
						<th style="width:3%" class="text-center hidden-xs"><input class="check_all" type="checkbox"></th>
						<th class="text-center hidden-xs">订单编号</th>
						<th class="text-center">客户姓名</th>
						<th class="text-center">身份证</th>
						<th class="text-center">产品名称</th>
						<th class="text-center">贷款金额</th>
						<th class="text-center" >贷款期数</th>
						<th class="text-center" >还款日期</th>
						<th class="text-center" >车辆评估价格</th>
						<th class="text-center" >每月应还</th>
						<th class="text-center" >操作</th>
					</tr>
					<%
						Map mqmap=(Map)request.getAttribute("mqmap");
						List<PageData> list=(List)request.getAttribute("newpdList");
						int mqnub=0;
					%>
					<c:forEach var="pd" items="${requestScope.newpdList}">
					<%
						PageData pd=list.get(mqnub);
					%>
					<tr>
						<td class="text-center hidden-xs">
						<input name="delid"  type="checkbox">
						</td>
						<td class="text-center hidden-xs">
							${pd.gems_code}
						</td>
						<td class="text-center">
							<span class="s-font-blue">
								${pd.c_name}
							</span>
						</td>
						<td class="text-center">
							${pd.c_cardno}
						</td>
						<td class="text-center">
							<p>
								<c:if test="${pd.loan_tpid==1}">
								  卡分期
								</c:if>
							</p>
						</td>
						<td class="text-center">
							<p>
								${pd.dk_total_price}
							</p>
						</td>
						<td class="text-center">
							<p>
								${pd.aj_date}
							</p>
						</td>
						<td class="text-center">
							<p>
								${pd.dt_edit }
							</p>
						</td>
						<td class="text-center">
							<p>
								${pd.price_result}
							</p>
						</td>
						<td class="text-center">
							<p>
								${pd.yh}
							</p>
						</td>
					
						<td class="text-center">
							<!-- 还款情况详情 -->
							<a href="${pageContext.request.contextPath}/loan/selectPayform.do?type=khhkqk&dn=loan_repaymentSituation&qn=form&icbc_id=${pd.icbc_id}">
								<i class="fa fa-hand-paper-o"></i>
							</a>
						</td>
					</tr>
					<% mqnub++; %>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="foot-page">
			<c:if test="${requestScope.totalpage ge '1' }">
				<ul class="pagination no-margin">
				       <c:if test="${requestScope.pagenow ne '1' }">
				        <li><a href="${pageContext.request.contextPath }/loan/selectPayList.do?type=khhkqk&dn=loan_repaymentSituation&qn=list&pagesize=${requestScope.pagesize}&pagenow=${requestScope.pagenow-1}&param=${requestScope.param}" aria-label="Next"><span aria-hidden="true">«</span></a></li>
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
					   <a id="a<%=j %>" href="${pageContext.request.contextPath }/loan/selectPayList.do?type=khhkqk&dn=loan_repaymentSituation&qn=list&pagesize=${requestScope.pagesize}&pagenow=<%=j %>&param=${requestScope.param}">
					   <%=j %>
					   </a>
					   </li>
					   <%
				       }else{
					   %>
	                   <li id="l<%=j %>" >
					   <a id="a<%=j %>" href="${pageContext.request.contextPath }/loan/selectPayList.do?type=khhkqk&dn=loan_repaymentSituation&qn=list&pagesize=${requestScope.pagesize}&pagenow=<%=j %>&param=${requestScope.param}">
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
						  <li><a href="${pageContext.request.contextPath }/loan/selectPayList.do?type=khhkqk&dn=loan_repaymentSituation&qn=list&pagesize=${requestScope.pagesize}&pagenow=${requestScope.pagenow+1}&param=${requestScope.param}" aria-label="Next"><span aria-hidden="true">»</span></a></li>  
						   </c:if>
					   </c:if>
					     				
					   </ul>
			</c:if>		   
				<div class="page-num">共${requestScope.totalsize}个 分${requestScope.totalpage }页显示</div>
			</div>
			
	</section>
	<!-- /.content -->
</div>


