<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
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
<title>查询场地</title>
<link rel="shortcut icon" href="../images/Football.ico" type="image/x-icon" />

<link href="../css/templatemo_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/swfobject/swfobject.js"></script> 
<link rel="stylesheet" href="../css/main.css" />
 
<link rel="stylesheet" type="text/css" href="../css/ddsmoothmenu.css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="../js/others.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">
		<link rel="stylesheet" href="../css/recordSearchResult.css">

		<script type="text/javascript" src="../js/jquery-1.12.3.min.js"></script>
		<script type="text/javascript" src="../js/bootstrap.min.js"></script>
		<script type="text/javascript" src="../js/bootstrap-paginator.min.js"></script>
		
</head>
<body>

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
	    List<Gym> records = (List<Gym>)session.getAttribute("records");
	    String No = (String)session.getAttribute("pageNo");
	    String T = (String)session.getAttribute("totalPages");
	    int pageNo = Integer.parseInt(No);
	    int totalPages = Integer.parseInt(T);
	    System.out.println(No);
	%>
<div class="container">
			<div class="wrapper">	
			<!-- 使用表单展示数据记录 -->	
			<form class="form-area">	  
				<table class="table table-striped table-hover" >
				 	<%
						if (records == null || records.size() == 0) {
							out.println("<tr><td><h4><strong>没有符合要求的记录呢，不如换个搜索条件试试吧~</strong></h4></td></tr>");						
						}
						else {
					%>					
							<tr>							
					<%
								Gym r = records.get(0);
					
								if (r.getGymname() != null) {
									out.println("<td><h4>名称</h4></td>");
								}
								if (r.getSporttype()!= null) {
									out.println("<td><h4>体育类型</h4></td>");
								}
								if (r.getPrice()!= null) {
									out.println("<td><h4>价格</h4></td>");
								}
								if (r.getPhone() != null) {
									out.println("<td><h4>电话</h4></td>");
								}
								if (r.getAddress() != null&&r.getCity()!=null&&r.getCounty()!=null&&r.getProvince()!=null) {
									out.println("<td><h4>地址</h4></td>");
								}		
								if (r != null) {
									out.println("<td><h4>操作</h4></td>");
								}
										
					%>						
							</tr>
					<%
						}
					%>
		
					<%
						if (records != null && records.size() != 0) {
							for (Gym r : records) {						
					%>
					
								<tr>
					
					<%
									if (r.getGymname() != null) {
										out.println("<td>" + r.getGymname() + "</td>");
									}
									if (r.getSporttype() != null) {
										out.println("<td>"+ r.getSporttype() +"</td>");
									}
									if (r.getPrice() != null) {
										out.println("<td>" + r.getPrice() + "</td>");
									}
									if (r.getPhone() != null) {
										out.println("<td>" + r.getPhone() + "</td>");
									}
									if (r.getAddress() != null) {
										out.println("<td>" + r.getAddress() + "</td>");
									}	
							
					%>			
					<td>
					<a href="../adminServlet?method=delete_gym&gymNo=<%=r.getGym()%>&pageNoStr=<%=pageNo%>">删除&nbsp;&nbsp;</a>
					<a href="../adminServlet?method=find_gymnews&gymNo=<%=r.getGym()%>&pageNoStr=<%=pageNo%>">修改</a>
					</td>	
								</tr>
					
					<%
							
							}
					%>
								
						</table>	
						
						<!-- 分页显示div -->																			
						<div align="center">
	  						<ul class="pagination" id="paginator"></ul>
	  					</div>
	  					
	  					</form>	  					
	  		
					<%
						}
					%>			
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
	                    return "../adminServlet?method=find_gym&pageNoStr="+page;	//跳转到选定页面
	                },
	                numberOfPages: 6,	//显示“第几页”的选项数目
	            	currentPage: <%= pageNo %>,	//当前页数
	            	totalPages: <%= totalPages %>	//总页数
	       		}
	
	        $('#paginator').bootstrapPaginator(options);
	    </script>
	
	</body>
</html>