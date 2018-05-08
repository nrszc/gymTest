<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="java.sql.*"
    import="henu.bean.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>场地详情</title>
<link rel="shortcut icon" href="../images/Football.ico" type="image/x-icon" />

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<link type="text/css" rel="stylesheet" href="../css/style.css">
<link href="../css/templatemo_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/swfobject/swfobject.js"></script>  
<link rel="stylesheet" type="text/css" href="../css/ddsmoothmenu.css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="../js/others.js"></script>
<script type="text/javascript" src="../js/as.js"></script>

</head>

<body>

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
<%
Gym g = (Gym)session.getAttribute("gym");
%>
<div id="container" style="width:65%;">
	<!-- Start	Product details -->
	<div class="product-details" style="width:33%;">
		<!-- Product Name -->
		<center><h2><%=g.getGymname() %></h2></center>
        <form action="../userServlet?method=order&gymNo=<%=g.getGym() %>" method="post" style="font-size:16px;">
        <p class="sdsd">&#12288;&#12288;&#12288;单价：<%=g.getPrice() %>元</p>  
        <p>&#12288;&#12288;&#12288;数量：<span onclick="numDec()">-</span> <input size="1" value="1" type="text" name="num" id="quantity" /> <span onclick="numAdd()">+</span></p>  
    <p class="sdsd">&#12288;&#12288;&#12288;小计： <span id="totalPrice"><%=g.getPrice() %></span>元</p>
    <input type="hidden" value=<%=g.getPrice() %> id="price" />  
    <p>&#12288;&#12288;&#12288;预定日期：<input type="date" name="mytime" /></p>
    <p>&#12288;&#12288;&#12288;电话：<%=g.getPhone() %></p>
    <p>&#12288;&#12288;&#12288;地址：<%=g.getProvince()+g.getCity()+g.getCounty()+g.getAddress() %></p>
  <input type="hidden" value="28.1" id="price" /><!--单价-->  
	
		<!-- Control -->
		<div class="control">&#12288;&#12288;&#12288;
			<!-- Start Button buying -->
			<button class="btn" type="submit">
			    <span class="buy">立即预定</span>
		 	</button>
			<!-- End Button buying -->
		</div>
		</form>
	</div>
	<!-- End Product details -->

	<!-- Start product image & Information -->
	<div class="product-image" style="width:60%;">
		<img src="../myimages/<%=g.getImg() %>" alt="Omar Dsoky">
		
	</div>
	<!-- End product image -->
</div>
</body>
</html>