<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" href="images/Football.ico" type="image/x-icon" />

<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.min.css" />
<!--[if lt IE 9]>
<link href="static/h-ui/css/H-ui.ie.css" rel="stylesheet" type="text/css" />
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<style type="text/css">
.ui-sortable .panel-header{ cursor:move}
</style>
<title>注册</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/swfobject/swfobject.js"></script>  
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<script type="text/javascript" src="js/others.js"></script>
<script type="text/javascript" src="js/check.js"></script>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript" src="js/city.js"></script>
<style>
span{
font-size:14px;
}
</style>
</head>
<body style="background-color:white; ">
<div id="templatemo_header_wrapper">
<div id="templatemo_header">
<div id="templatemo_menu" class="ddsmoothmenu">
<ul>
<li><a href="main.jsp">首页</a></li>
<li><a href="Servlet?method=myhome">我的主页</a></li>
<li><a href="login.jsp">登录</a></li>
<li><a href="register.jsp" class="selected">注册</a></li>
</ul>
</div> 
</div>
</div>
		<div class="panel-body" style="margin-top:5%;">
					<form action="Servlet?method=register" method="post" class="form form-horizontal responsive">
						<div class="row cl">
							<label class="form-label col-xs-3">会员名：</label>
							<div class="formControls col-xs-8">
								<input type="text" onBlur="return checkName()"  style="width:600px;" class="input-text" placeholder="会员名" name="username" id="txtUser">
								&#12288;&#12288;
								<span id="tips_username">*用户名由6-18位字符组成</span> 
							</div>
						</div>
						<div class="row cl">
							<label class="form-label col-xs-3">密码：</label>
							<div class="formControls col-xs-8">
								<input style="width:600px;" onBlur="return checkPwd()" type="password" class="input-text" autocomplete="off" placeholder="密码" name="password1" id = "txtPwd">
								&#12288;&#12288;
								<span id = "tips_password" >*密码由6-18位字符组成</span>
							</div>
						</div>
						<div class="row cl">
							<label class="form-label col-xs-3">密码验证：</label>
							<div class="formControls col-xs-8">
								<input style="width:600px;" type="password" onBlur="return checkRpt()" class="input-text" autocomplete="off" placeholder="密码" name="password2" id = "txtRpt">
								&#12288;&#12288;
								<span id = "tips_repeat" >*请再次输入你的密码</span>
							</div>
						</div>
						<div class="row cl">
							<label class="form-label col-xs-3">性别：</label>
							<div class="formControls skin-minimal col-xs-5">
								<div class="radio-box">
									<input type="radio" name="gender" value ="男">
									<label for="sex-1">男</label>
								</div>
								<div class="radio-box">
									<input type="radio" name="gender" value = "女">
									<label for="sex-2">女</label>
								</div>
							</div>
						</div>
						<div class="row cl">
							<label class="form-label col-xs-3">手机：</label>
							<div class="formControls col-xs-8">
								<input style="width:600px;" onBlur="return checkPhone()" type="text" class="input-text" autocomplete="off" placeholder="手机" name="telephone" id="phone">
								&#12288;&#12288;
								<span id="tips_phone" >*请输入你的11位手机号码</span>
							</div>
						</div>
						<div class="row cl">
							<label class="form-label col-xs-3">出生日期：</label>
							<div class="formControls col-xs-8">
								<input style="width:600px;" onBlur="return checktxtDate()" type="date" class="input-text" placeholder="出生日期" autocomplete="off" id = "txtDate" name="datetimepicker">
								&#12288;&#12288;
							<span id = "tips_birthdate" >*请选择你的出生日期</span>	
							</div>
						</div>
						<div class="row cl">
							<label class="form-label col-xs-3">邮箱：</label>
							<div class="formControls col-xs-8">
								<input style="width:600px;" type="text" class="input-text" onBlur="return checkEmail()" placeholder="电子邮箱" name="email" id = "txtMail" autocomplete="off">
								&#12288;&#12288;
								<span id = "tips_email" >*请填写常用的EMAIL</span>
							</div>
						</div>
						
						<div class="row clearfix">
							<label class="form-label col-xs-3">所在城市：</label>
							<div class="formControls col-xs-8">
								<div class="row clearfix" style="margin-top:0">
									<div class="col-xs-6" style="width:11%;">
										<span class="select-box">
											<select class="select" size="1" name="province" id="province">
												<option value="">省份</option>
											</select>
										</span>
									</div>
									<div class="col-xs-6" style="width:12%;">
										<span class="select-box">
											<select class="select" size="1" name="city1" id="city">
												<option value="">地级市</option>
											</select>
										</span>
									</div>
									<div class="col-xs-6" style="width:14%;">
										<span class="select-box">
											<select class="select" size="1" name="districtAndCounty" id="districtAndCounty">
												<option value="">市、县级市</option>
											</select>
										</span>
									</div>
									<div class="col-xs-6" style="width:60%;">
									<div class="formControls col-xs-8">
								         <input type="text" style="width:206px;" class="input-text" onBlur="return checkAddress()" placeholder="详细地址" name="address" id = "address" >
								         &#12288;&#12288;
								         <span id="tips_address" >*请输入你的住址</span>
							        </div>
							        </div>
								</div>
							</div>
						</div>
						<div class="row cl">
							<div class="col-xs-8 col-xs-offset-3">
								<input class="btn btn-primary" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
								&#12288;&#12288;
								<input class="btn btn-primary" type="reset" value="&nbsp;&nbsp;重置&nbsp;&nbsp;">
							</div>
							
						</div>
					</form>
				</div>
	
</body>
</html>
<!--H-ui前端框架提供前端技术支持 h-ui.net @2017-01-01 -->