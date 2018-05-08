<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>登录</title>
<!-- Custom Theme files -->
<link href="css/login-style.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="shortcut icon" href="images/Football.ico" type="image/x-icon" />
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<!--Google Fonts-->
<link href='http://fonts.useso.com/css?family=Roboto:500,900italic,900,400italic,100,700italic,300,700,500italic,100italic,300italic,400' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<!--Google Fonts-->
</head>
<body>
<div class="login">
	<div class="login-top">
		<h1>登录</h1>
		<form method="post" action="Servlet?method=login" >
			<input type="text" name="username" value="会员名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '账号';}">
			<input type="password" name="password" value="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password';}">
			<input type="radio" name="radiobutton" value="user" checked>会员 
            <input type="radio" name="radiobutton" value="admin">管理员 
	    <div class="forgot">
	    	<input type="submit" value="登录" >
	    </div>
	    </form>
	</div>
	
	<div class="login-bottom">
		<h3>新用户？ &nbsp;<a href="register.jsp">立即注册</a></h3>
	</div>
</div>	
<div class="copyright">
	<p>Copyright &copy; 2017.Company name All rights reserved.</p>
</div>


</body>
</html>