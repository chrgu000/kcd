<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="content-wrapper" style="min-height: 943px;">
		<section class="content-header">
			<h1>
			电催作业<small>
			共1个
			</small>
			</h1>
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="admin-tools">
				<div class="row">
					<div class="col-sm-10">
							<label>
								逾期情况
								<select onchange="" class="form-control form-inline hidden-xs">
									<option value="">***逾期情况***</option>
									<option value="">初级</option>
									<option value="">中级</option>
									<option value="">高级</option>
								</select>
							</label>	
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label>
							金融产品
							<select class="form-control form-inline hidden-xs">
								<option value="">***金融产品***</option>
							</select>
							</label>	
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input onkeydown="" id="getC_name" type="text" placeholder="请输入客户姓名或客户电话或客户身份证号" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" style="width:400px;">
							<button class="btn btn-info search-btn" type="button" style="background-color:#00acd6;">查询</button>			
					</div>		
					<div class="col-sm-2">
					<select class="form-control">
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
		       </div>
			</div>
		</div>
		<div class="box">
			<!-- 数据载入中 请在搜索，筛选，载入的时候显示 放在.box里 -->
			<div class="overlay" style="display:none;">
				<i class="fa fa-refresh fa-spin"></i>
			</div>
			<!-- 数据载入中结束 -->
			<table class="table table-bordered table-hover">
				<tbody>	
					<tr>
						<th style="width:3%" class="text-center hidden-xs"><input class="check_all" type="checkbox"></th>
						<th class="text-center">订单编号</th>
						<th class="text-center">客户姓名</th>
						<th class="text-center">身份证号</th>
						<th class="text-center">金融产品</th>
						<th class="text-center">贷款金额</th>
						<th class="text-center" >逾期金额</th>
						<th class="text-center" >代理团队</th>
						<th class="text-center" >业务员</th>
						<th class="text-center" >催收人员</th>
						<th class="text-center" >操作</th>
					</tr>
					<tr>
						<td class="text-center hidden-xs">
						<input name="delid"  type="checkbox">
						</td>
						<td class="text-center hidden-xs">
							1234
						</td>
						<td class="text-center">
							<span class="s-font-blue">
								李四
							</span>
						</td>
						<td class="text-center">
							410181198012542659
						</td>
						<td class="text-center">
							<p>
								产品
							</p>
						</td>
						<td class="text-center">
							<p>
								
							</p>
						</td>
						<td class="text-center">
							<p>
								
							</p>
						</td>
							<td class="text-center">
							<p>
								产品
							</p>
						</td>
						<td class="text-center">
							<p>
								
							</p>
						</td>
						<td class="text-center">
							<p>
								
							</p>
						</td>
						<td class="text-center">
							<a href="${pageContext.request.contextPath }/erp/demo.do?type=hkqkxq&dn=dh_repaymentTelReminders&qn=form">
								<i class="fa fa-hand-paper-o"></i>
							</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</section>
	<!-- /.content -->
</div>