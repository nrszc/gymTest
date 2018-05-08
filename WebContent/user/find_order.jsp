<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="java.util.*"
    import="java.sql.*"
    import="henu.bean.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="keywords" content="work center, theme, piecemaker 3D image slider, 960, free templates, CSS, HTML" />
<meta name="description" content="Work Center Theme is a free CSS Template from www.cssmoban.com for everyone. Feel free to use it for any purpose." />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的订单</title>
<link rel="shortcut icon" href="../images/Football.ico" type="image/x-icon" />

<link href="../css/templatemo_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/swfobject/swfobject.js"></script>  
<link rel="stylesheet" href="../css/main.css" />
<link rel="stylesheet" type="text/css" href="../css/ddsmoothmenu.css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="../js/others.js"></script>

</head>
<body style="background-color:black;">

<div id="templatemo_header_wrapper">
<div id="templatemo_header">
<div id="templatemo_menu" class="ddsmoothmenu">
<ul>
<li><a href="userhome.jsp" >我的主页</a></li>
<li><a href="../userServlet?method=reserve_gym">场地预定</a></li>
<li><a href="../userServlet?method=find_myorder" class="selected">我的订单</a></li>
<li><a href="../userServlet?method=find_mynews">我的信息</a></li>
<li><a href="../Servlet?method=logout">注销</a></li>
</ul>
</div> 
</div>
</div>

<%
List<Order> records = (List<Order>)session.getAttribute("order");
%>

<div class="cont" style="margin-top:5%;">
<%if (records == null || records.size() == 0) {
		out.println("<center><strong>暂时还没有订单哦~</strong></center>");						
		}
	else {
		for (Order r : records) {	
	%>
   <table class="orderList">
    <tr style="color:block;">
     <th ></th>
     <th width="160">场地图片</th>
     <th width="150">场地名称</th>
     <th width="150">地址</th>
     <th width="150">下单时间</th>
     <th width="150">预约时间</th>
     <th width="100">单价</th>
     <th width="100">总结</th>
     <th width="100">数量</th>
      <th width="100">状态</th>
     <th>操作</th>
    </tr>
    <tr>
     <td><input type="checkbox" /></td>
     <td>
      <dl>
       <dt><img src="../myimages/<%=r.getImg() %>" width="120" height="100" /></dt>
      </dl>
     </td>
     <td><strong class="red"><%=r.getGymname() %></strong></td>
     <td>
    <strong class="red"><%=r.getAddress() %></strong></td>
  
     <td><strong class="red"><%=r.getOrdertime() %></strong></td>
     <td><strong class="red"><%=r.getMytime() %></strong></td>
      <td><strong class="red"><%=r.getPrice() %></strong></td>
       <td><strong class="red"><%=r.getNum() %></strong></td>
       <td><strong class="red"><%=r.getTotal() %></strong></td>
       <%if(r.isState())
       { out.println("<td><strong class='red'>已订单</strong></td>");}
       else
    	  out.println("<td><strong class='red'>已退单</strong></td>"); 
       %>
       
     <td><a href="../userServlet?method=chargeback&orderNo=<%=r.getOrderNo() %>" class="green">退单</a><br /></td>
    </tr>
    
   </table><!--orderList/-->
   <%
		}}
   %>
 </div>
</body>
</html>