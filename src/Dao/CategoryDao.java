package Dao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.CategoryControl;
import Model.Category;

/**
 * Servlet implementation class CategoryDao
 */
@WebServlet("/CategoryDao")
public class CategoryDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryDao() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {
			String id = request.getParameter("id");
			int obj_id = Integer.parseInt(id);
			CategoryControl con = new CategoryControl();
			Category obj = con.select(obj_id);
			if(obj !=null) {
				con.Delete(obj);
			}
			response.sendRedirect("Dashboard.jsp");
		}catch(Exception e) {
			response.sendRedirect("Error.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			int id1=Integer.parseInt(request.getParameter("CAT_ID"));
			CategoryControl con = new CategoryControl();
			if(id1==0){
				
				//insert code here
				String CATEGORY=request.getParameter("CATEGORY");
				Category obj=new Category();
				obj.setCATEGORY(CATEGORY);
				con.insert(obj);
				
			}else {
				//update code here
				String CATEGORY=request.getParameter("CATEGORY");
				Category obj=new Category();
				obj.setCATEGORY(CATEGORY);
				con.insert(obj);
				
			
			}
			response.sendRedirect("Category.jsp");
		}catch(Exception e) {
			System.out.print(e);
			response.sendRedirect("Restaurant.jsp");
		}

	}

}
