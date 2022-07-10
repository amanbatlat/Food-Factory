package Dao;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.hsqldb.lib.Iterator;

import com.oreilly.servlet.MultipartRequest;

import Controller.CustomerControl;
import Controller.FoodControl;
import Controller.RestaurantControl;
import Model.Category;
import Model.Customer;
import Model.Food;
import Model.Restaurant;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.sql.*;
import javax.servlet.http.Part;
import java.nio.file.*;
/**
 * Servlet implementation class FoodDao
 */
@WebServlet("/FoodDao")

@javax.servlet.annotation.MultipartConfig
public class FoodDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private final String UPLOAD_DIRECTORY = "F:/Eclispe Workspace for project/Food_Factory/WebContent/upload";

    public FoodDao() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String id = request.getParameter("id");
			int obj_id = Integer.parseInt(id);
			FoodControl con = new FoodControl();
			Food obj = con.select(obj_id);
			if(obj !=null) {
				con.Delete(obj);
			}
			response.sendRedirect("Restaurant/HotelAdmin.jsp");
		}catch(Exception e) {
			response.sendRedirect("");
		}
	
	}
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  response.setContentType("text/html;charset=UTF-8");
		   //  InputStream name=name.getInputStream();
		     String savepath=UPLOAD_DIRECTORY + File.separator;
		     File filesavedir=new File(savepath);

		      Part part=request.getPart("IMAGE");
		        String filename=extractfilename(part);
		        part.write(UPLOAD_DIRECTORY + File.separator + filename);
		
		        
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			
			FoodControl con = new FoodControl();
			String CATEGORY=request.getParameter("CATEGORY");
			Category c=new Category();
			c.setCATEGORY(CATEGORY);
			String NAME=request.getParameter("NAME");
			Restaurant r1=new Restaurant();
			r1.setNAME(NAME);
			 
			SessionFactory ss=new Configuration().configure().buildSessionFactory();
			Session sf=ss.openSession();
			
			Criteria cr=sf.createCriteria(Restaurant.class);
			Criteria cr1=sf.createCriteria(Category.class);
			cr1.add(Restrictions.eq("CATEGORY", CATEGORY));
			java.util.Iterator<Category> itr1=cr1.list().iterator();
			cr.add(Restrictions.eq("NAME",NAME));
			java.util.Iterator<Restaurant> itr=cr.list().iterator();
			while(itr.hasNext())
			{
				Restaurant r2=itr.next();
				int i=r2.getId();
				r1.setId(i);
			}
			while(itr1.hasNext())
			{
				Category c1=itr1.next();
				int i1=c1.getCAT_ID();
				c.setCAT_ID(i1);
			}
		
			if(id==0) {		//insert code here
				String FOODNAME=request.getParameter("FOODNAME");
				int PRICE=Integer.parseInt(request.getParameter("PRICE"));
		
				Food obj=new Food();
				obj.setFOODNAME(FOODNAME);
				obj.setIMAGE(filename);
				obj.setPRICE(PRICE);
				obj.setCategory_id(c);
				obj.setRestaurant_id(r1);
				con.insert(obj);
				
			}else {
				
			
				//update code here
				Food obj=con.select(id);
				String FOODNAME=request.getParameter("FOODNAME");
				int PRICE=Integer.parseInt(request.getParameter("PRICE"));
		
				obj.setFOODNAME(FOODNAME);
				obj.setIMAGE(filename);
				obj.setPRICE(PRICE);
				obj.setCategory_id(c);
				obj.setRestaurant_id(r1);
				con.update(obj);
				
			}
		//response.sendRedirect("upload.jsp");
			response.sendRedirect("Restaurant/HotelAdmin.jsp");
		}catch(Exception e) {
			System.out.print(e);
			response.sendRedirect("Restaurant.jsp");
		}
			
		}
		 
	  private String extractfilename(Part part)
	   {
	      String contentdisp=part.getHeader("content-disposition");
	      String[] items=contentdisp.split(";");
	      for(String s : items)
	      {
	        if(s.trim().startsWith("filename"))
	        {
	          return s.substring(s.indexOf("=")+2,s.length()-1);
	        }      
	      }
	  
return "";
}
	
	}


