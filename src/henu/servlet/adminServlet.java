package henu.servlet;

import java.io.IOException;


import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import henu.bean.Gym;
import henu.impl.adminImpl;

/**
 * Servlet implementation class adminServlet
 */
@WebServlet("/adminServlet")
public class adminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServletConfig servletconfig;
	private static final int pageSize = 10;	//设定每页显示的记录条数（当前为每页显示10条记录）
	
	public void init(ServletConfig config)throws ServletException{
    	this.servletconfig = config;
    }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminServlet() {
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
		      case "add_gym": add_gym(request, response); break;
		      case "update_gym": update_gym(request, response); break;
		      case "find_gym": find_gym(request, response); break;
		      case "delete_gym": delete_gym(request, response); break;
		      case "find_gymnews": find_gymnews(request, response); break;
		}
	}

	private void find_gymnews(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String gymNo = request.getParameter("gymNo");
		adminImpl aI = new adminImpl();
		Gym gym = aI.find_gymnews(gymNo);
		request.getSession().setAttribute("gym", gym);
		response.sendRedirect("admin/update_gym.jsp");
	}
	
	private void delete_gym(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String gymNo = request.getParameter("gymNo");
		adminImpl aI = new adminImpl();
		boolean result = aI.delete_gym(gymNo);
		if(result){
			find_gym(request, response);
		}
		else
		{
		    PrintWriter out = response.getWriter();
			out.println("<script>alert('删除出错!');history.back();</script>");
		}
	}
	private void find_gym(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
		out.println("<script>window.location.href='/gymTest/admin/find_gym.jsp'</script>");
	}

	private void update_gym(HttpServletRequest request, HttpServletResponse response) throws IOException {
		SmartUpload su = new SmartUpload();
		try{
			su.initialize(servletconfig, request, response);
		}catch(ServletException e)
		{
			e.printStackTrace();
		}
		su.setAllowedFilesList("jpg,png,jpeg");
		su.setMaxFileSize(10*1024*1024);
		su.setTotalMaxFileSize(12*1024*1024);
		try{
			su.upload();
		}catch(ServletException e1)
		{
			e1.printStackTrace();
		}catch(IOException e1)
		{
			e1.printStackTrace();
		}catch(SmartUploadException e1)
		{
			e1.printStackTrace();
		}
		Request req = su.getRequest();
		Files files = su.getFiles();
		File file = files.getFile(0);
		String extFile = file.getFileExt();
		Date curDate = new Date();
		long d = curDate.getTime();
		String mainFile = String.valueOf(d);
		String filename = "/myimages/" + mainFile + "." + extFile;
		try{
			file.saveAs(filename);
		}catch(IOException e1)
		{
			e1.printStackTrace();
		}
		catch(SmartUploadException e1){
			e1.printStackTrace();
		}
		String gymname = req.getParameter("gymname");
		String sporttype = req.getParameter("sporttype");
		String price = req.getParameter("price");
		String telephone = req.getParameter("telephone");
		String province = req.getParameter("province");
		String city = req.getParameter("city1");
		String county = req.getParameter("districtAndCounty");
		String address = req.getParameter("address");
		String gymNo = request.getParameter("gymNo");
		filename = mainFile + "." + extFile;
		Gym gym = new Gym();
		gym.setGymname(gymname);
		gym.setSporttype(sporttype);
		gym.setAddress(address);
		gym.setImg(filename);
		gym.setPhone(telephone);
		gym.setPrice(price);
		gym.setCity(city);
		gym.setCounty(county);
		gym.setProvince(province);
		gym.setGym(gymNo);
		adminImpl aI = new adminImpl();
	    boolean result = aI.update_gym(gym);
	    PrintWriter out = response.getWriter();
		if(result)
		{
		 	out.println("<script>alert('修改成功!');</script>");
		 	find_gym(request, response);
		 	return;
		}	
		else
			out.println("<script>alert('修改失败，请确保输入信息正确!');history.back();</script>");

	}

	private void add_gym(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		SmartUpload su = new SmartUpload();
		try{
			su.initialize(servletconfig, request, response);
		}catch(ServletException e)
		{
			e.printStackTrace();
		}
		su.setAllowedFilesList("jpg,png,jpeg");
		su.setMaxFileSize(10*1024*1024);
		su.setTotalMaxFileSize(12*1024*1024);
		try{
			su.upload();
		}catch(ServletException e1)
		{
			e1.printStackTrace();
		}catch(IOException e1)
		{
			e1.printStackTrace();
		}catch(SmartUploadException e1)
		{
			e1.printStackTrace();
		}
		Request req = su.getRequest();
		Files files = su.getFiles();
		File file = files.getFile(0);
		String extFile = file.getFileExt();
		Date curDate = new Date();
		long d = curDate.getTime();
		String mainFile = String.valueOf(d);
		String filename = "/myimages/" + mainFile + "." + extFile;
		try{
			file.saveAs(filename);
		}catch(IOException e1)
		{
			e1.printStackTrace();
		}
		catch(SmartUploadException e1){
			e1.printStackTrace();
		}
		String gymname = req.getParameter("gymname");
		String sporttype = req.getParameter("sporttype");
		String price = req.getParameter("price");
		String telephone = req.getParameter("telephone");
		String province = req.getParameter("province");
		String city = req.getParameter("city1");
		String county = req.getParameter("districtAndCounty");
		String address = req.getParameter("address");
		filename = mainFile + "." + extFile;
		Gym gym = new Gym();
		gym.setGymname(gymname);
		gym.setSporttype(sporttype);
		gym.setAddress(address);
		gym.setImg(filename);
		gym.setPhone(telephone);
		gym.setPrice(price);
		gym.setCity(city);
		gym.setCounty(county);
		gym.setProvince(province);
		adminImpl aI = new adminImpl();
	    boolean result = aI.add_gym(gym);
	    PrintWriter out = response.getWriter();
		if(result)
		{
		 	out.println("<script>alert('录入成功!');</script>");
			 out.println("<script>window.location.href='/gymTest/admin/add_gym.jsp'</script>");
		 	return;
		}	
		else
			out.println("<script>alert('录入失败，请确保输入信息正确!');history.back();</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
