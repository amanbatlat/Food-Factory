package Dao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.CustomerControl;
import Controller.FeedbackControl;
import Controller.FoodControl;
import Controller.RestaurantControl;
import Model.Customer;
import Model.Feedback;
import Model.Food;
import Model.Restaurant;

/**
 * Servlet implementation class FeedbackDao
 */
@WebServlet("/FeedbackDao")
public class FeedbackDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedbackDao() {
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
			FeedbackControl con = new FeedbackControl();
			Feedback obj = con.select(obj_id);
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
			
			int id=Integer.parseInt(request.getParameter("Cid"));

			FeedbackControl con = new FeedbackControl();
			if(id==0) {
				
				//insert code here
				String NAME=request.getParameter("NAME");
				String EMAIL=request.getParameter("EMAIL");
				String PHONE=request.getParameter("PHONE");
				String GENDER=request.getParameter("GENDER");
				String COMMENTS=request.getParameter("COMMENTS");
				Feedback obj=new Feedback();
				obj.setNAME(NAME);
				obj.setGENDER(GENDER);
				obj.setPHONE(PHONE);
				obj.setEMAIL(EMAIL);
				obj.setCOMMENTS(COMMENTS);
				con.insert(obj);
				
			}else {
				//update code here
				String NAME=request.getParameter("NAME");
				String EMAIL=request.getParameter("EMAIL");
				String PHONE=request.getParameter("PHONE");
				String GENDER=request.getParameter("GENDER");
				String COMMENTS=request.getParameter("COMMENTS");
				Feedback obj=new Feedback();
				obj.setPHONE(PHONE);
				obj.setGENDER(GENDER);
				obj.setNAME(NAME);
				obj.setEMAIL(EMAIL);
				obj.setCOMMENTS(COMMENTS);
				con.update(obj);
				
			
			}
			
			response.sendRedirect("Feedback.jsp");
		}catch(Exception e) {
			System.out.print(e);
		
			response.sendRedirect("Restaurant.jsp");
			
		}
	}

	}


