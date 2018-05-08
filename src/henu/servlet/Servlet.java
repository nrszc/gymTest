package henu.servlet;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import henu.bean.User;
import henu.impl.Impl;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		myway(request, response);
	}

	protected void myway(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String method = request.getParameter("method");
		if(method.equals("login"))
			login(request, response);
		else if(method.equals("register")){
		    register(request, response);
		}
		else if(method.equals("logout"))
			logout(request, response);
		else if(method.equals("myhome"))
			myhome(request, response);
	}
	
	private void myhome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = (String) request.getSession().getAttribute("username");
		String admin = (String) request.getSession().getAttribute("admin");
		PrintWriter out = response.getWriter();
		if(admin!=null){
			out.println("<script>window.location.href='/gymTest/admin/adminhome.jsp'</script>");
		}
		else if(username!=null) 
		{
			out.println("<script>window.location.href='/gymTest/user/userhome.jsp'</script>");
		}
		else
		{
			out.println("<script>window.location.href='/gymTest/login.jsp'</script>");
		}
	}

	//注销
	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().invalidate();  
		PrintWriter out = response.getWriter();
		out.println("<script>alert('注销成功!');window.location.href='/gymTest/main.jsp'</script>");
	}

	//注册
	private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password2"));
		user.setGender(request.getParameter("gender"));
		user.setPhone(request.getParameter("telephone"));
		user.setEmail(request.getParameter("email"));
		user.setBirthdate(request.getParameter("datetimepicker"));
		user.setProvince(request.getParameter("province"));
		user.setCity(request.getParameter("city1"));
		user.setCounty(request.getParameter("districtAndCounty"));
		user.setAddress(request.getParameter("address"));
		Impl impl = new Impl();
		boolean result = impl.register(user);
		PrintWriter out = response.getWriter();
		if(result){	
			out.println("<script>alert('注册成功！');</script>"); 
			 out.println("<script>window.location.href='/gymTest/main.jsp'</script>");
			return;	
		}	
		else
		{
			 out.println("<script>alert('注册失败，请确保输入数据正确！');history.back();</script>"); 
		}
	}

	//登录
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String usertype = request.getParameter("radiobutton");
		User user = new User();
		user.setPassword(password);
		user.setUsername(username);
		user.setUsertype(usertype);
		Impl impl = new Impl();
		boolean result = impl.login(user);
		PrintWriter out = response.getWriter();
		if(result){
			if(usertype.equals("admin")){
			request.getSession().setAttribute("admin", username);
			out.println("<script>window.location.href='/gymTest/admin/adminhome.jsp'</script>");
		    }
			else{
			request.getSession().setAttribute("username", username);
		    out.println("<script>window.location.href='/gymTest/user/userhome.jsp'</script>");
			}
		}	
		else
		{
			 out.println("<script>alert('账号或密码错误');history.back();</script>"); 
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
