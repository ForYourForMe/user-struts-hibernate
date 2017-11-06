<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>用户管理系统</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div id="container">
		<div class="headerPanel">
			<div class="logo-title">
				<img src="images/logo.png" alt="logo">
				<h3>用户管理系统</h3>
			</div>
			<div class="opertion-group">
				<button type="button">帮助</button>
				<button type="button">退出</button>
			</div>
		</div>
		<div class="subjectPanel">
			<div class="left-menu">
				<ul>
					<li class="query-user">用户查询</li>
					<li class="add-user">用户新增</li>
				</ul>
				<div class="user-info">
					<div class="user-img"></div>
					<div>当前用户</div>
				</div>
			</div>
			<div class="contentPanel">
				
			</div>
		</div>
	</div>

	<script src="plugins/jquery-2.1.3.js"></script>
	<script>
		$(function(){
			var $container=$("#container");
			var $muen=$container.find(".subjectPanel").find(".left-menu");
			var $content=$container.find(".subjectPanel").find(".contentPanel");
			
			$muen.find(".query-user").addClass("active");
			$content.load("loadUserListPage");
			
			
			//高度自适应
			$(window).resize(function(){
				var height=$(window).height()-$container.find(".headerPanel").height();
				if(height<520){
					$container.find(".subjectPanel").height(height);
				}else{
					$container.find(".subjectPanel").height(520);
				}
			});

			//加载用户查询页面
			$muen.find(".query-user").on("click",function(){
				$muen.find("ul li").removeClass("active");
				$(this).addClass("active");
				$content.load("loadUserListPage");
			});

			//加载用户新增页面
			$muen.find(".add-user").on("click",function(){
				$muen.find("ul li").removeClass("active");
				$(this).addClass("active");
				$content.load("loadUserFormPage");
			});
		});
	</script>
</body>
</html>