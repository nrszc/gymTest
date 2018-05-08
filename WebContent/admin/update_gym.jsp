<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="java.sql.*"
    import="henu.bean.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" href="../images/Football.ico" type="image/x-icon" />

<!--[if lt IE 9]>
<script type="text/javascript" src="../lib/html5shiv.js"></script>
<script type="text/javascript" src="../lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" href="../css/main.css" />

<link rel="stylesheet" type="text/css" href="../static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../lib/Hui-iconfont/1.0.8/iconfont.min.css" />
<!--[if lt IE 9]>
<link href="../static/h-ui/css/H-ui.ie.css" rel="stylesheet" type="text/css" />
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="../lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<style type="text/css">
.ui-sortable .panel-header{ cursor:move}
</style>
<title>修改场地</title>
<link href="../css/templatemo_style.css" rel="stylesheet" type="text/css" />
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript" src="../js/city.js"></script>
<link rel="stylesheet" type="text/css" href="../css/ddsmoothmenu.css" />
<script type="text/javascript" src="../js/others.js"></script>

</head>
<body style="background-color:white; ">
<div id="templatemo_header_wrapper">
<div id="templatemo_header">
<div id="templatemo_menu" class="ddsmoothmenu">
<ul>
<li><a href="adminhome.jsp" >我的主页</a></li>
<li><a href="add_gym.jsp">场地录入</a></li>
<li><a href="../adminServlet?method=find_gym" class="selected">场地查询</a></li>
<li><a href="../Servlet?method=logout">注销</a></li>
</ul>
</div> 
</div>
</div>

<%
Gym gym = (Gym)session.getAttribute("gym");
System.out.println(gym.getGym()+"***********");
%>

		<div class="panel-body" style="margin-top:5%;">
					<form action="../adminServlet?method=update_gym&gymNo=<%=gym.getGym() %>" enctype="multipart/form-data" method="post" class="form form-horizontal responsive">
				
					<div class="row cl">
							<label class="form-label col-xs-3">图片：</label>
							<div class="formControls col-xs-8">
								<span class="btn-upload form-group">
								<input class="input-text upload-url" type="text" name="uploadfile-2" id="uploadfile-2" readonly style="width:200px">
								<a href="javascript:void();" class="btn btn-primary upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
								<input type="file" name="file-2" class="input-file">
								</span>
							</div>
						</div>
						
						<div class="row cl">
							<label class="form-label col-xs-3">场地名称：</label>
							<div class="formControls col-xs-8">
								<input style="width:600px;" value=<%=gym.getGymname() %> type="text" class="input-text" placeholder="场地名称" name="gymname">
							</div>
						</div>
						<div class="row cl">
							<label class="form-label col-xs-3">运动类型：</label>
							<div class="formControls col-xs-8">
								
										<span class="select-box" style="width:600px;">
											<select style="width:600px;" class="select" size="1" name="sporttype">
											    <option value=<%=gym.getSporttype() %>><%=gym.getSporttype() %></option>
												<option value="篮球">篮球</option>
												<option value="足球">足球</option>
												<option value="网球">网球</option>
												<option value="乒乓球">乒乓球</option>
												<option value="羽毛球">羽毛球</option>
												<option value="毽球">毽球</option>
												<option value="台球">台球</option>
												<option value="游泳">游泳</option>
												<option value="健身">健身</option>
											</select>
										</span>
									
							</div>
						</div>
						<div class="row cl">
							<label class="form-label col-xs-3">价格：</label>
							<div class="formControls col-xs-8">
								<input style="width:600px;" value=<%=gym.getPrice() %> type="text" class="input-text" autocomplete="off" placeholder="价格" name="price" >
							</div>
						</div>
						<div class="row cl">
							<label class="form-label col-xs-3">手机：</label>
							<div class="formControls col-xs-8">
								<input style="width:600px;" value=<%=gym.getPhone() %> type="text" class="input-text" autocomplete="off" placeholder="手机" name="telephone" id="telephone">
							</div>
						</div>
						<div class="row clearfix">
							<label class="form-label col-xs-3">所在城市：</label>
							<div class="formControls col-xs-8">
								<div class="row clearfix" style="margin-top:0">
									<div class="col-xs-6" style="width:11%;">
										<span class="select-box">
											<select class="select" size="1" name="province" id="province">
												<option value=<%=gym.getProvince() %>><%=gym.getProvince() %></option>
											</select>
										</span>
									</div>
									<div class="col-xs-6" style="width:12%;">
										<span class="select-box">
											<select class="select" size="1" name="city1" id="city">
												<option value=<%=gym.getCity() %>><%=gym.getCity() %></option>
											</select>
										</span>
									</div>
									<div class="col-xs-6" style="width:14%;">
										<span class="select-box">
											<select class="select" size="1" name="districtAndCounty" id="districtAndCounty">
												<option value=<%=gym.getCounty() %>><%=gym.getCounty() %></option>
											</select>
										</span>
									</div>
									<div class="col-xs-6" style="width:60%;">
									<div class="formControls col-xs-8">
								         <input style="width:206px;" type="text" value=<%=gym.getAddress() %> class="input-text" placeholder="详细地址" name="address" id="address" >
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