package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.SelectBean;

import util.Validate;

public class OrderListServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public OrderListServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Validate vd = new Validate();
		String username = vd.getUnicode(request.getParameter("username"));
		String bookname = vd.getUnicode(request.getParameter("bookname"));
		String sql = "select a.name as username,realname,b.name as bookname,c.* from users a,books b,loanbook c where a.id=c.users and b.id=c.books ";
		String[] args = {"username","realname","bookname","id","users","books","price","sumday","begintime","endtime","continueday","continuetime","flag"};
		
		if(username != null && !username.equals("")){
			sql += "and a.name like '%"+username+"%'";
		}
		if(bookname != null && !bookname.equals("")){
			sql += "and b.name like '%"+bookname+"%'";
		}
		
		SelectBean sb = new SelectBean();
		ArrayList al = sb.select(sql, args);
		request.setAttribute("order", al);
		RequestDispatcher rd=request.getRequestDispatcher("/admin/order.jsp");
        rd.forward(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
