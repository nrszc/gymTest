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
<title>场地预定</title>
<link rel="shortcut icon" href="../images/Football.ico" type="image/x-icon" />

<link href="../css/templatemo_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/swfobject/swfobject.js"></script>  

<link rel="stylesheet" type="text/css" href="../css/ddsmoothmenu.css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="../js/others.js"></script>
<link rel="stylesheet" href="../css/main.css" />
<script type="text/javascript" src="../js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/bootstrap-paginator.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">
		<link rel="stylesheet" href="../css/recordSearchResult.css">
</head>
<body id="top">

<div id="templatemo_header_wrapper">
<div id="templatemo_header">
<div id="templatemo_menu" class="ddsmoothmenu">
<ul>
<li><a href="userhome.jsp">我的主页</a></li>
<li><a href="../userServlet?method=reserve_gym" class="selected">场地预定</a></li>
<li><a href="../userServlet?method=find_myorder">我的订单</a></li>
<li><a href="../userServlet?method=find_mynews">我的信息</a></li>
<li><a href="../Servlet?method=logout">注销</a></li>
</ul>
</div> 
</div>
</div>
<%
	    List<Gym> records = (List<Gym>)session.getAttribute("records");
	    String No = (String)session.getAttribute("pageNo");
	    String T = (String)session.getAttribute("totalPages");
	    int pageNo = Integer.parseInt(No);
	    int totalPages = Integer.parseInt(T);
	    System.out.println(No);
	%>
              
			<!-- Main -->
				<div id="main">
					<div class="inner">

					<!-- Boxes -->
						<div class="thumbnails">

                       <%if (records == null || records.size() == 0) {
							out.println("<strong>暂时还有场地入驻，敬请期待~</strong>");						
						}
						else {
							for (Gym r : records) {	
						%>
							<div class="box" style="background-color:rgb(247, 249, 252);">
								<a href="../userServlet?method=find_gymnews&gymNo=<%=r.getGym() %>" class="image fit"><img src="../myimages/<%=r.getImg() %>" height="210" /></a>
								<div class="inner">
									<h3 style="font-family:Open Sans; font-size:20px; text-align:left;"><%=r.getGymname() %>  <strong style="color:#00CC66;"><%=r.getPrice() %></strong>元</h3>
									<p style="text-align:left;"><%=r.getProvince()+r.getCity()+r.getCounty()+r.getAddress() %></p>
									
								</div>
							</div>
                        <%}
						%>	
						
						
						
						
						<% } %>
							
						</div>
              <div align="center">
	  			<ul class="pagination" id="paginator"></ul>
	  		  </div>
					</div> 
				</div>

	
        <script type='text/javascript'>
	        var options = {
	        		
	        		bootstrapMajorVersion: 3,	//bootstrap版本
	        		size: 'normal',
	        		itemTexts: function (type, page, current) {
	                    switch (type) {
	                    case "first":
	                        return "首页";
	                    case "prev":
	                        return "<i class='fa fa-caret-left'></i> 上一页";
	                    case "next":
	                        return "下一页 <i class='fa fa-caret-right'></i>";
	                    case "last":
	                        return "末页";
	                    case "page":
	                        return page;
	                    }
	        		},
	        		tooltipTitles: function (type, page, current) {
	                    switch (type) {
	                    case "first":
	                        return "首页";
	                    case "prev":
	                        return "上一页";
	                    case "next":
	                        return "下一页";
	                    case "last":
	                        return "末页";
	                    case "page":
	                        return "第" + page + "页";
	                    }
	                },
	                pageUrl: function(type, page, current){
	                    return "../userServlet?method=reserve_gym&pageNoStr="+page;	//跳转到选定页面
	                },
	                numberOfPages: 6,	//显示“第几页”的选项数目
	            	currentPage: <%= pageNo %>,	//当前页数
	            	totalPages: <%= totalPages %>	//总页数
	       		}
	
	        $('#paginator').bootstrapPaginator(options);
	    </script>
	

	</body>
</html>