<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>学生数据库管理系统</title>
	<link rel="stylesheet" type="text/css" href="css/default.css">
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,700">
  	<link rel="stylesheet" href="css/style.min.css">
	<link href='https://fonts.googleapis.com/css?family=Freckle+Face' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
	<link rel="stylesheet" type="text/css" href="css/fox.css" />
	<style>
	.htmleaf-header h1 span{
	    color: white;
	}
	main{
		padding:0px;
	
	}
	#footer{
			bottom: 20px;
		    position: fixed;
		    text-align: center;
		    left: 38%;
		}
	</style>
</head>
<body >
	<div id="wrapper" class="wrapper">
	  <main class="demo-fox">
			<div class="snow"></div>
			<div class="container">
			<header class="header htmleaf-header">
				<h1>欢迎登陆<span>Welcome to our system</span></h1>
				<div class="htmleaf-links">
					<a class="htmleaf-icon icon-htmleaf-home-outline" href="#" target="_blank"><span></span></a>
					<a class="htmleaf-icon icon-htmleaf-arrow-forward-outline" href="#" title="" target="_blank"><span> </span></a>
				</div>
			</header>
			<div class="content content--fox">
				<div class="fox">
					<div class="fox-body">
						<div class="fox-front-leg"></div>
						<div class="fox-front-leg"></div>
					</div>
					<div class="fox-head">
						<div class="fox-face">
							<div class="fox-ears">
								<div class="fox-ear"></div>
								<div class="fox-ear"></div>
							</div>
							<div class="fox-skull"></div>
							<div class="fox-front"></div>
							<div class="fox-eyes"></div>
							<div class="fox-nose"></div>
						</div>
					</div>
					<div class="fox-tail">
						<div class="fox-tail">
							<div class="fox-tail">
								<div class="fox-tail">
									<div class="fox-tail">
										<div class="fox-tail">
											<div class="fox-tail">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<svg xmlns="http://www.w3.org/2000/svg" version="1.1" style="display:none">
					<defs>
						<filter id="squiggly-0">
							<feTurbulence id="turbulence" baseFrequency="0.02" numOctaves="3" result="noise" seed="0" />
							<feDisplacementMap id="displacement" in="SourceGraphic" in2="noise" scale="2" />
						</filter>
						<filter id="squiggly-1">
							<feTurbulence id="turbulence" baseFrequency="0.02" numOctaves="3" result="noise" seed="1" />
							<feDisplacementMap in="SourceGraphic" in2="noise" scale="3" />
						</filter>
						<filter id="squiggly-2">
							<feTurbulence id="turbulence" baseFrequency="0.02" numOctaves="3" result="noise" seed="2" />
							<feDisplacementMap in="SourceGraphic" in2="noise" scale="2" />
						</filter>
						<filter id="squiggly-3">
							<feTurbulence id="turbulence" baseFrequency="0.02" numOctaves="3" result="noise" seed="3" />
							<feDisplacementMap in="SourceGraphic" in2="noise" scale="3" />
						</filter>
						<filter id="squiggly-4">
							<feTurbulence id="turbulence" baseFrequency="0.02" numOctaves="3" result="noise" seed="4" />
							<feDisplacementMap in="SourceGraphic" in2="noise" scale="1" />
						</filter>
					</defs>
				</svg>
			</div><!-- /content -->
		</div><!-- /container -->	
	  </main>
	</div><!-- /wrapper -->

	<button id="mm-menu-toggle" class="mm-menu-toggle">Toggle Menu</button>
	<nav id="mm-menu" class="mm-menu">
	  <div class="mm-menu__header">
	    <h2 class="mm-menu__title">Administrator</h2>
	  </div>
	  <ul class="mm-menu__items">
	    <li class="mm-menu__item">
	      <a class="mm-menu__link" href="index.do">
	        <span class="mm-menu__link-text"><i class="md md-home"></i>主页</span>
	      </a>
	    </li>
	    <li class="mm-menu__item">
	      <a class="mm-menu__link" href="student.do">
	        <span class="mm-menu__link-text"><i class="md md-person"></i>学生信息管理</span>
	      </a>
	    </li>
	    <li class="mm-menu__item">
	      <a class="mm-menu__link" href="#">
	        <span class="mm-menu__link-text"><i class="md md-inbox"></i>教师信息管理</span>
	      </a>
	    </li>
	    <li class="mm-menu__item">
	      <a class="mm-menu__link" href="insert.do">
	        <span class="mm-menu__link-text"><i class="md md-favorite"></i>添加信息</span>
	      </a>
	    </li>
	    <li class="mm-menu__item">
	      <a class="mm-menu__link" href="#">
	        <span class="mm-menu__link-text"><i class="md md-settings"></i>系统设置</span>
	      </a>
	    </li>
	  </ul>
	</nav><!-- /nav -->
	
	<script src="js/production/materialMenu.min.js"></script>
	<script>
	  var menu = new Menu;
	</script>
	<footer id="footer">
		Copyright &copy; 2020.Company name All rights reserved.公网安备xxxxx号京ICP证xxx号 <!-- 假的备案，能在本机环境允许 -->
	</footer><!-- footer -->
</body>
</html>