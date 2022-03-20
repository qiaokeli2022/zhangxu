package servlet.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Validate;
import bean.InsertUpdateDelBean;
import bean.SelectBean;

public class UpdateBookServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdateBookServlet() {
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
		String id = vd.getUnicode(request.getParameter("id"));
		String name = vd.getUnicode(request.getParameter("name"));
		String author = vd.getUnicode(request.getParameter("author"));
		String publishing = vd.getUnicode(request.getParameter("publishing"));
		String number = vd.getUnicode(request.getParameter("number"));
		String dates = vd.getUnicode(request.getParameter("dates"));
		String price = vd.getUnicode(request.getParameter("price"));
		String storage = vd.getUnicode(request.getParameter("storage"));
		String brief = vd.getUnicode(request.getParameter("brief"));
		String type = vd.getUnicode(request.getParameter("type"));
		String tate = vd.getUnicode(request.getParameter("tate"));
		String sql ="update books set name='"+name+"',author='"+author+"',publishing='"+publishing+"',number='"+number+"',price='"+price+"',storage='"+storage+"',brief='"+brief+"',type='"+type+"',tate='"+tate+"',dates='"+dates+"' where id='"+id+"'";
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		ib.insertANDupdateANDdel(sql);
		SelectBean sb = new SelectBean();
		String sql2 = "select * from books where id='"+id+"'";
		String[] args2 = {"id","name","author","publishing","number","price","storage","brief","type","tate","sums","imgpath","dates"};
		ArrayList al2 = sb.select(sql2, args2);
		request.setAttribute("bookinf", al2);
		request.setAttribute("ok", "1");

		RequestDispatcher rd=request.getRequestDispatcher("/admin/updatebook.jsp");
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
