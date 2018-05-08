package henu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import henu.bean.Gym;
import henu.bean.Order;
import henu.bean.User;
import henu.impl.adminImpl;
import henu.impl.userImpl;

/**
 * Servlet implementation class userServlet
 */
@WebServlet("/userServlet")
public class userServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int pageSize = 12;	//设定每页显示的记录条数（当前为每页显示12条记录
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		myway(request, response);
	}

	private void myway(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String method = request.getParameter("method");
		switch(method)
		{
		      case "find_mynews": find_mynews(request, response); break;
		      case "update_mynews": update_mynews(request, response);  break;
		      case "reserve_gym": reserve_gym(request, response); break;
		      case "find_myorder": find_order(request, response); break;
		      case "chargeback": chargeback(request, response); break;
		      case "order": order(request, response); break;
		      case "find_gymnews": find_gymnews(request, response); break;
		}
	}

	private void find_gymnews(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String gymNo = request.getParameter("gymNo");
		userImpl uI = new userImpl();
		Gym gym = uI.find_gymnews(gymNo);
		request.getSession().setAttribute("gym",gym);
		PrintWriter out = response.getWriter();
		out.println("<script>window.location.href='/gymTest/user/gymnews.jsp'</script>");
	}

	private void order(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String gymNo = request.getParameter("gymNo");
		String num = request.getParameter("num");
		String mytime = request.getParameter("mytime");
		String username = (String)request.getSession().getAttribute("username");
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String ordertime = dateFormat.format(now);
		Order r = new Order();
		r.setNum(num);
		r.setMytime(mytime);
		r.setGymNo(gymNo);
		r.setUsername(username);
		r.setOrdertime(ordertime);
		userImpl uI = new userImpl();
		boolean result = uI.order(r);
		PrintWriter out = response.getWriter();
		if(result)
		{
		    out.println("<script>alert('预定成功!');</script>");
			reserve_gym(request, response);
		}
		else
		{
		    out.println("<script>alert('预定失败!');history.back();</script>");
		}
	}

	private void chargeback(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String orderNo = request.getParameter("orderNo");
		userImpl uI = new userImpl();
		boolean result = uI.chargeback(orderNo);
		PrintWriter out = response.getWriter();
		if(result){
		    out.println("<script>alert('退单成功!');</script>");
		    find_order(request, response);
		}
		else
		    out.println("<script>alert('退单失败!');history.back();</script>");
	}

	private void find_order(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username=(String)request.getSession().getAttribute("username");
		userImpl uI = new userImpl();
		List<Order> list = uI.find_order(username);
		request.getSession().setAttribute("order", list);
		PrintWriter out = response.getWriter();
		out.println("<script>window.location.href='/gymTest/user/find_order.jsp'</script>");
	}

	private void reserve_gym(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String pageNoStr = request.getParameter("pageNoStr");	//接收客户端传递的要显示页数
		int pageNo = 1;	//要显示的页数
		int totalPages = 1;	//总页数
		//检查、设置pageNo
		if (pageNoStr != null && !pageNoStr.equals("")) {
			try {
				pageNo = Integer.parseInt(pageNoStr);				
				if (pageNo < 1) {
					//pageNo小于1时默认显示第一页
					pageNo = 1;
				}
			}
			catch (NumberFormatException e) {
				//获取到的pageNo（当前页面数）不合法时，默认显示第一页
				pageNo = 1;
			}
		}
		else {
			//其他未获取到pageNo的情况都默认显示第一页
			pageNo = 1;
		}
		adminImpl aI = new adminImpl();
		totalPages = aI.countPage(pageSize);
		/* 如果页数大于总页数，则默认显示最后一页 */
		if (pageNo > totalPages) {
			pageNo = totalPages;
		}

		String No = Integer.toString(pageNo);
		String T = Integer.toString(totalPages);
		List<Gym> records = aI.Record(pageNo,pageSize);
		request.getSession().setAttribute("records", records);
		request.getSession().setAttribute("pageNo", No);
		request.getSession().setAttribute("totalPages", T);
		PrintWriter out = response.getWriter();
		out.println("<script>window.location.href='/gymTest/user/reserve_gym.jsp'</script>");
	}

	private void update_mynews(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		User user = new User();
		String username = (String) request.getSession().getAttribute("username");
		user.setUserNo(username);
		user.setBirthdate(request.getParameter("datetimepicker"));
		user.setEmail(request.getParameter("email"));
		user.setGender(request.getParameter("gender"));
		user.setPassword(request.getParameter("password"));
		user.setPhone(request.getParameter("telephone"));
		user.setUsername(request.getParameter("username"));
		user.setNewPwd(request.getParameter("password2"));
		user.setProvince(request.getParameter("province"));
		user.setCity(request.getParameter("city1"));
		user.setCounty(request.getParameter("districtAndCounty"));
		user.setAddress(request.getParameter("address"));
		userImpl uI = new userImpl();
		int result = uI.update_mynews(user);
		PrintWriter out = response.getWriter();
		if(result==0)
		    out.println("<script>alert('修改失败，请确保输入信息正确!');history.back();</script>");
		else if(result==2){
		    out.println("<script>alert('请输入正确的原密码!');history.back();</script>");
		}
		else{
		    out.println("<script>alert('修改成功!');</script>");
			request.getSession().setAttribute("username", request.getParameter("username"));
		    find_mynews(request, response);
		}
	}

	private void find_mynews(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		User user = new User();
		userImpl uI = new userImpl();
		String username = (String) request.getSession().getAttribute("username");
		user = uI.find_mynews(username);
		PrintWriter out = response.getWriter();
		if(user==null)
		{
			out.println("<script>alert('出错!暂时未能找到您的消息！');history.back();</script>");
		}
		else{
			request.getSession().setAttribute("user",user);
			out.println("<script>window.location.href='/gymTest/user/mynews.jsp'</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
