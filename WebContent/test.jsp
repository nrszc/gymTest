<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="keywords" content="work center, theme, piecemaker 3D image slider, 960, free templates, CSS, HTML" />
<meta name="description" content="Work Center Theme is a free CSS Template from www.cssmoban.com for everyone. Feel free to use it for any purpose." />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>体育馆场地预约系统</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/swfobject/swfobject.js"></script>  
<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="js/others.js"></script>
<link rel="stylesheet" href="http://www.17sucai.com/preview/220220/2014-11-11/%E8%B4%AD%E7%89%A9%E8%BD%A6%EF%BC%88%E6%BA%90%E4%BB%A3%E7%A0%81%EF%BC%89ok/css/style.css"/>

</head>
<body style="background-color:white;">

<div id="templatemo_header_wrapper">
<div id="templatemo_header">
<div id="templatemo_menu" class="ddsmoothmenu">
<ul>
<li><a href="userhome.jsp" class="selected">我的主页</a></li>
<li><a href="../userServlet?method=reserve_gym">场地预定</a></li>
<li><a href="../userServlet?method=find_myorder">我的订单</a></li>
<li><a href="../userServlet?method=find_mynews">我的信息</a></li>
<li><a href="../Servlet?method=logout">注销</a></li>
</ul>
</div> 
</div>
</div>
<div class="content" style="margin-top:3%; width:100%;" >
            <div class="catbox">

	<table id="cartTable" style="width:100%;">
		<thead>
			<tr>
				<th>商品详情</th>
				<th>下单时间</th>
				<th>单价</th>
				<th>数量</th>
				<th>小计</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<%
		 
		/* if(list!=null&&list.size()>0)
         {
             for(int i=0;i<list.size();i++)
             {
            	 DaoOrder order = list.get(i);
            	 Float p = Float.parseFloat(order.getPrice())*Float.parseFloat(order.getNum());
            	 */
		%>
			<tr>
				<td class="goods"><img src="images/03.jpeg" width="100" height="40" alt=""/><span>1111111</span></td>
				<td class="price">11111</td>
				<td class="price">111111</td>
				<td class="count"><span>111111</span></td>
				<td class="subtotal">11111</td>
				<td class="operation"><span class="delete"><a href="../../Servlet?method=deleteorder&mNo=111111">删除</a></span>
				</td>
			</tr>
		<%
          
		%>
		</tbody>
	</table>
</div>
        </div>


</body>
</html>