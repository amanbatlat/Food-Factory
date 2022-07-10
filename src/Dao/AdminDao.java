package Dao;

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
import Controller.FoodControl;
import Controller.RestaurantControl;
import Model.Customer;
import Model.Food;
import Model.Restaurant;

/**
 * Servlet implementation class AdminDao
 */
@WebServlet("/AdminDao")
public class AdminDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDao() {
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
			FoodControl con = new FoodControl();
			Food obj = con.select(obj_id);
			if(obj !=null) {
				con.Delete(obj);
			}
			response.sendRedirect("Admin/Foodsman.jsp");
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
			int id = Integer.parseInt( request.getParameter("FID"));
			FoodControl con = new FoodControl();
			String NAME=request.getParameter("NAME");
			Restaurant r1=new Restaurant();
			r1.setNAME(NAME);
			
			SessionFactory ss=new Configuration().configure().buildSessionFactory();
			Session sf=ss.openSession();
			Criteria cr=sf.createCriteria(Restaurant.class);
			cr.add(Restrictions.eq("NAME",NAME));
			java.util.Iterator<Restaurant> itr=cr.list().iterator();
			while(itr.hasNext())
			{
				Restaurant r2=itr.next();
				int i=r2.getId();
				r1.setId(i);
			}
			
			System.out.println(r1.getNAME());
			if(id==0) {
				
				//insert code here
				String FOODNAME=request.getParameter("FOODNAME");
				int PRICE=Integer.parseInt(request.getParameter("PRICE"));
				String IMAGE=request.getParameter("IMAGE");
				String CATEGORY=request.getParameter("CATEGORY");
				Food obj=new Food();
				obj.setFOODNAME(FOODNAME);
				obj.setIMAGE(IMAGE);
				obj.setPRICE(PRICE);
			
				obj.setRestaurant_id(r1);
				con.insert(obj);
				
			}else {
				
			
				//update code here

				String FOODNAME=request.getParameter("FOODNAME");
				int PRICE=Integer.parseInt(request.getParameter("PRICE"));
				String IMAGE=request.getParameter("IMAGE");
				String CATEGORY=request.getParameter("CATEGORY");
				Food obj=new Food();
				obj.setFOODNAME(FOODNAME);
				obj.setIMAGE(IMAGE);
				obj.setPRICE(PRICE);
			
				obj.setRestaurant_id(r1);
					con.insert(obj);
				
			}
			
			response.sendRedirect("Admin/Foodsman.jsp");
		}catch(Exception e) {
			System.out.print(e);
			response.sendRedirect(".jsp");
			
		}
	}

	}


