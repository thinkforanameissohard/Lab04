<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.entity.infor,java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>学生信息管理</title>
	<link rel="stylesheet" type="text/css" href="css/default.css">
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,700">
  	<link rel="stylesheet" href="css/style.min.css">
	<link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
	<style type="text/css">
			.glyphicon { margin-right:5px; }
			.btn-wrapper{
				padding: 1em 0;
			}
			.thumbnail
			{
			    margin-bottom: 20px;
			    padding: 0px;
			    -webkit-border-radius: 0px;
			    -moz-border-radius: 0px;
			    border-radius: 0px;
			}
	
			.item.list-group-item
			{
			    float: none;
			    width: 100%;
			    background-color: #fff;
			    margin-bottom: 10px;
			}
			.item.list-group-item:nth-of-type(odd):hover,.item.list-group-item:hover
			{
			    background: #428bca;
			}
	
			.item.list-group-item .list-group-image
			{
			    margin-right: 10px;
			}
			.item.list-group-item .thumbnail
			{
			    margin-bottom: 0px;
			}
			.item.list-group-item .caption
			{
			    padding: 9px 9px 0px 9px;
			}
			.item.list-group-item:nth-of-type(odd)
			{
			    background: #eeeeee;
			}
			.item.list-group-item:before, .item.list-group-item:after
			{
			    display: table;
			    content: " ";
			}
	
			.item.list-group-item img
			{
			    float: left;
			}
			.item.list-group-item:after
			{
			    clear: both;
			}
			.list-group-item-text
			{
			    margin: 0 0 11px;
			}
			.htmleaf-header{
				background-color: #CDDC39;
				background:url("https://pic2.zhimg.com/80/1d4b229e2e625a236a57fb44b67f6f7b_720w.jpg");
				background-size:100%;
			}
			body{
				background-color:white;
				color: #000000;
			}
			#footer{
			        bottom: 20px;
				    position: fixed;
				    text-align: center;
				    left: 38%;
			    
			}
			.btn-wrapper{
				    text-align: center;
			}
			.thumbnail {
				padding: 10px;
			}
			.col-md-6 {
				text-align: center;
			}
			.item.list-group-item {
				left: 10%;
				width: 80%;
			}
	</style>
	<style type="text/css">
		#table th {
		    display: block;
		    width: 50px;
		}
		#table tr {
		    display: inline-flex;
		    margin-top: 10px;
		    margin-bottom:10px;
			margin-left: 60px;
			font-size: 16px;
		}
		input{
			border-radius: 5px;
		}
		.input1 {
		   margin-left: 67px;
		    margin-right: 60px;
		}
		.change{
		    left: 800px;
			display: block;
	        margin-left: 750px;
	        margin-top:100px;
		}
		.input2{
		   width: 300px;
		   text-align: center;
		}
	</style>
</head>

<body>
	<div id="wrapper" class="wrapper">
		<header class="header htmleaf-header">
			<h1>学生信息管理<span>Welcome to our system</span></h1>
		</header>
	  <main>
				<div class="container">
					<div class="btn-wrapper">
						<strong>显示为：</strong>
						<div class="btn-group">
							<a href="#" id="list" class="btn btn-default btn-sm">
								<span class="glyphicon glyphicon-th-list"></span>列表布局
							</a>
							<a href="#" id="grid" class="btn btn-default btn-sm">
								<span class="glyphicon glyphicon-th"></span>网格布局
							</a>
						</div>
					</div>
					<div id="products" class="row list-group">
						<%
						if(request.getParameter("id")!=null)
						{
							infor bi = (infor) request.getAttribute("bi");
						%>
										
								<form class="change" action="editsave.do"  onsubmit="return is_empty()" method="post">
									<table id="table" style="width:50%">
										<tr>
											<th width="30%">姓名：</th>
											<td width="70%">
												<input name="name"  class="input2 Safe" type="text" value="<%=bi.getName()%>"></input>
											</td>
										</tr>
										<tr>
											<th>性别：</th>
											<td>
												<input name="gender" class="input2 Safe" type="text" value="<%=bi.getGender()%>"></input>
											</td>
										</tr>
										<tr>
											<th>生日：</th>
											<td>
												<input name="birthday" class="input2 Safe" type="text" value="<%=bi.getBirthday()%>"></input>
											</td>
										</tr>
										<tr>
											<th>地址：</th>
											<td>
												<input name="address" class="input2 Safe" type="text" value="<%=bi.getAddress()%>"></input>
											</td>
										</tr>
										<tr>
											<th></th>
											<td>
												<input type="hidden" name="id" value="<%=bi.getId()%>"></input>
											</td>	
										</tr>
										<tr>
											<th></th>
											<td>
												<input type="submit" class="input1" value="修改"></input>
												<input type="reset" value="重置"></input>
											</td>
										</tr>
									</table>
								</form>
								<script type="text/javascript">
									 function is_empty()
									   {
										   var len=document.getElementsByClassName('Safe').length;
										   for (i=0;i<len;++i)
										   {
											   if(document.getElementsByClassName('Safe')[i].value=="")
											   {
													alert("输入不为空");
													break;
													return false;
											   }

										   }
										   return true;						   	   
									   }
								</script>														
						 <% }
							else
							{
								@SuppressWarnings("unchecked") 
								ArrayList<infor> list = (ArrayList<infor>) request.getAttribute("list"); 
								for (infor bi : list)
								{
									int id = bi.getId();
									out.print("<div class=\"item  col-xs-4 col-lg-4\">"+
												"<div class=\"thumbnail\">"+
										        "<img class=\"group list-group-image\" src=\"img/link-fox.png\" alt=\"\" />"+
										        "<div class=\"caption\">"+
										            "<h4 class=\"group inner list-group-item-heading\">"+bi.getName()+"</h4>"+
														"<ul>"+
															"<li>"+bi.getGender()+"</li>"+
															"<li>"+bi.getBirthday()+"</li>"+
															"<li>"+bi.getAddress()+"</li>"+
														"</ul>"+
										           "<p class=\"group inner list-group-item-text\">"+
										                "I heard the echo, from the valleys and the heart.Open to the lonely soul of sickle harvesting."+
										                "Repeat outrightly, but also repeat the well-being of.Eventually swaying in the desert oasis.</p>"+
										            "<div class=\"row\">"+
										                "<div class=\"col-xs-12 col-md-6\">"+
										                    "<a class=\"btn btn-success\"  onclick=\"displayWindow()\" href=\"student.do?id="+id+"\">修改</a>"+
										                "</div>"+
														"<div class=\"col-xs-12 col-md-6\">"+
														    "<a class=\"btn btn-success\" href=\"del.do?id="+id+"\">删除</a>"+
														"</div>"+
										            "</div>"+
										        "</div>"+
										      "</div>"+
										   "</div>");
									
								}
							}
					%>
					</div>
			</div>
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
	<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
		    $('#list').click(function(event){event.preventDefault();$('#products .item').addClass('list-group-item');});
		    $('#grid').click(function(event){event.preventDefault();$('#products .item').removeClass('list-group-item');$('#products .item').addClass('grid-group-item');});
		});
	</script>
	<footer id="footer">
		Copyright &copy; 2019.Company name All rights reserved.公网安备xxxxx号京ICP证xxx号 <!-- 假的备案，能在本机环境允许 -->
	</footer><!-- footer -->
</body>
</html>