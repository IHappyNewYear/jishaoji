<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	
	<script type="text/javascript" src="static/js/jquery-3.2.1.js"></script>
	
	<script type="text/javascript" src="static/js/angular.min.js"></script>
	
	<script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
	   var eapp = angular.module("eapp",[]);
	   
		eapp.controller("eController", [ "$scope","$http", function($scope,$http) {
		    var eids = "";
		    var charr = 0;
		    var scharr = 0;
			$scope.ss = false;

			$scope.flag = function(num) {
				if (num == 0) {
					return true;
				} else {
					return false;
				}
			};

			$scope.up = function() {
				location.href = "em/selectAllup";
			};

			$scope.down = function() {
				location.href = "em/selectAlldown";
			};

			$scope.checkedAll = function() {
				$scope.ss = !$scope.ss;
				angular.element(".ch").prop("checked", $scope.ss);
			};

			$scope.del = function() {
				
				charr = angular.element(".ch:checked");

				if (charr.length == 0) {
					alert("您还未勾选");
				} else {
				    angular.element("#delcfmModel").modal("show");
					
				};
			};

			$scope.delbutton = function() {
			    for (var i = 0; i < charr.length; i++) {
						var eid = charr[i].value;
						if (i == 0) {
							eids += eid;
						} else {
							eids += "," + eid;
						}
					};
					
					$http({
					   url:"em/delSome?eids=" + eids,
					   method:"post"
					});
					angular.element("#delcfmModel").modal("hide");
					location.reload();
				/*进不去function  $.post("em/delSome?eids=" + eids, function(d) {
					alert("GG");
					if (d == ok) {
						alert("删除成功");
						location.href = "em/selectAll";
					} else {
						alert("删除失败");
					}
				}, "json").error(function() {
					alert("error");
				}); */
				
			};
			
			
	      $scope.yd = function(){
	         scharr = angular.element(".ch:checked");
	         
	         if (scharr.length == 0) {
					alert("您还未勾选");
				} else {
				    angular.element("#updStatusModel").modal("show");
				};
	      };
	      
	      $scope.upStatusbutton = function(){
	         scharr.each(function(){
	            var id = $(this).val();
	            $http({
					   url:"em/updStatus?id=" + id,
					   method:"post"
					});
	         });
	         angular.element("#updStatusModel").modal("hide");
	         location.reload();
	      };

		} ]);
	</script>
  </head>
  
  <body ng-app="eapp" ng-controller="eController">
	<div class="container">
		<center>
			<h1>我的邮箱页面</h1>
		</center>

	<div class="row">
		<div class="dropdown" class="col-md-6 col-md-offset-3">
			<button type="button" class="btn dropdown-toggle" id="dropdownMenu1"
				data-toggle="dropdown">
				已读/未读邮件<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
			    <li role="presentation"><a role="menuitem" tabindex="-1"
					href="em/selectAll">全部邮件</a></li>
				<li role="presentation"><a role="menuitem" tabindex="-1"
					href="em/selectwd">未读邮件</a></li>
				<li role="presentation"><a role="menuitem" tabindex="-1"
					href="em/selectyd">已读邮件</a></li>
			</ul>
		</div>

		<table class="table table-bordered table-hover">
			<tr>
				<td><span class="glyphicon glyphicon-user"></span></td>
				<td><button type="button" class="btn btn-success" ng-click="yd()">批量设置为已读</button></td>
				<td><button type="button" class="btn btn-danger" ng-click="del()">批量删除</button></td>
				<td><button type="button" class="btn btn-primary" ng-click="up()">按时间升序排列</button></td>
				<td><button type="button" class="btn btn-info" ng-click="down()">按时间降序排列</button></td>
			</tr>

			<tr>
				<td><input type="checkbox" ng-click="checkedAll()"/></td>
				<td>发件人</td>
				<td>阅读状态</td>
				<td>邮件标题</td>
				<td>发送时间</td>
			</tr>
			<c:forEach items="${selectAll}" var="em">
				<tr>
					<td><input type="checkbox" class="ch" value="${em.id}"/></td>
					<td>${em.fname}</td>
					<td>
					    <span ng-show="flag(${em.status})" class="glyphicon glyphicon-ok"></span>
					    <span ng-show="!flag(${em.status})" class="glyphicon glyphicon-envelope"></span>
					</td>
					<td>${em.title}</td>
					<td>${em.date}</td>
				</tr>
			</c:forEach>
		</table>
		
		
		</div>
	</div>
	
	
	<div class="modal fade" id="delcfmModel">  
  <div class="modal-dialog">  
    <div class="modal-content message_align">  
      <div class="modal-header">  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>  
        <h4 class="modal-title">进行删除</h4>  
      </div>  
      <div class="modal-body">  
        <p>您确认要删除吗？</p>  
      </div>  
      <div class="modal-footer">  
         <input type="hidden" id="url"/>  
         <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>  
         <a class="btn btn-success" ng-click="delbutton()">确定</a>  
      </div>  
    </div><!-- /.modal-content -->  
  </div><!-- /.modal-dialog -->  
</div><!-- /.modal -->


  <div class="modal fade" id="updStatusModel">  
  <div class="modal-dialog">  
    <div class="modal-content message_align">  
      <div class="modal-header">  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>  
        <h4 class="modal-title">设置已读/未读</h4>  
      </div>  
      <div class="modal-body">  
        <p>您确认要修改吗？</p>  
      </div>  
      <div class="modal-footer">  
         <input type="hidden" id="url"/>  
         <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>  
         <a class="btn btn-success" ng-click="upStatusbutton()">确定</a>  
      </div>  
    </div><!-- /.modal-content -->  
  </div><!-- /.modal-dialog -->  
</div><!-- /.modal -->
</body>
</html>
