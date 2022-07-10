package Dao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.CustomerControl;
import Model.Customer;

/**
 * Servlet implementation class CustomerDao
 */
@WebServlet("/CustomerDao")
public class CustomerDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerDao() {
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
			CustomerControl con = new CustomerControl();
			Customer obj = con.select(obj_id);
			if(obj !=null) {
				con.delete(obj);
			}
			response.sendRedirect("Admin/Dashboard.jsp");
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
			int id = Integer.parseInt( request.getParameter("Customer_id"));
			
			CustomerControl con = new CustomerControl();
			if(id==0) {
				
				//insert code here

				String NAME=request.getParameter("NAME");
			String EMAIL=request.getParameter("EMAIL");
			String CONTACT=request.getParameter("CONTACT");
			String ADDRESS=request.getParameter("ADDRESS");
			String PASSWORD=request.getParameter("PASSWORD");

			
				Customer obj = new Customer();
				obj.setNAME(NAME);
				obj.setEMAIL(EMAIL);
				obj.setCONTACT(CONTACT);
				obj.setADDRESS(ADDRESS);
				obj.setPASSWORD(PASSWORD);
				con.insert(obj);
				
			}else {
				
			
				//update code here


				String NAME=request.getParameter("NAME");
			String EMAIL=request.getParameter("EMAIL");
			String CONTACT=request.getParameter("CONTACT");
			String ADDRESS=request.getParameter("ADDRESS");
			String PASSWORD=request.getParameter("PASSWORD");

			
				Customer obj = new Customer();
				obj.setNAME(NAME);
				obj.setEMAIL(EMAIL);
				obj.setCONTACT(CONTACT);
				obj.setADDRESS(ADDRESS);
				
				con.update(obj);
			}
			
			response.sendRedirect("Register.jsp");
		}catch(Exception e) {
			System.out.print(e);
			response.sendRedirect("Register.jsp");
		}
	
	}

}
