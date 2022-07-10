package Dao;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.hsqldb.lib.Iterator;

import Controller.CustomerControl;
import Controller.RestaurantControl;
import Controller.RestaurantControl;
import Model.Customer;
import Model.Restaurant;
import Model.Restaurant;

/**
 * Servlet implementation class RestaurantDao
 */
@WebServlet("/RestaurantDao")
public class RestaurantDao extends HttpServlet {
	private static final long serialVersionUID = 1L;

	  private final String UPLOAD_DIRECTORY = "/Food_Factory/WebContent/images/Restaurants";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestaurantDao() {
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
			RestaurantControl con = new RestaurantControl();
			Restaurant obj = con.select(obj_id);
			if(obj !=null) {
				con.Delete(obj);
			}
			response.sendRedirect("Admin/Dashboard.jsp");
		}catch(Exception e) {
			response.sendRedirect("");
		}
	
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		
		try {
			String id1=request.getParameter("Id");
			int id=Integer.parseInt(id1);

			RestaurantControl con = new RestaurantControl();
			if(id==0) {
				
				//insert code here
				String NAME=request.getParameter("NAME");
				String EMAIL=request.getParameter("EMAIL");
				String CONTACT=request.getParameter("CONTACT");
				String RPASSWORD=request.getParameter("RPASSWORD");
				Restaurant obj=new Restaurant();
				obj.setNAME(NAME);
				obj.setEMAIL(EMAIL);
				obj.setCONTACT(CONTACT);
				obj.setRPASSWORD(RPASSWORD);
				con.insert(obj);
				
			}else {
				
			
				//update code here
		
				Restaurant obj=con.select(id);

				String NAME=request.getParameter("NAME");
				String EMAIL=request.getParameter("EMAIL");
				String CONTACT=request.getParameter("CONTACT");
				String RPASSWORD=request.getParameter("RPASSWORD");
				//Restaurant obj=new Restaurant();
				obj.setNAME(NAME);
				obj.setEMAIL(EMAIL);
				obj.setCONTACT(CONTACT);
				obj.setRPASSWORD(RPASSWORD);
			
				con.update(obj);
				
			}
			
			response.sendRedirect("Admin/Dashboard.jsp");
		}catch(Exception e) {
			System.out.print(e);
		
			response.sendRedirect("Restaurant.jsp");
			
		}
	}

	}


