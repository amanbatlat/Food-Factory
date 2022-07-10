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
import Controller.PaymentControl;
import Controller.PaymentControl;
import Controller.RestaurantControl;
import Controller.RestaurantControl;
import Model.Cart;
import Model.Customer;
import Model.Payment;
import Model.Payment;
import Model.Restaurant;
import Model.Restaurant;

/**
 * Servlet implementation class RestaurantDao
 */
@WebServlet("/PaymentDao")
public class PaymentDao extends HttpServlet {
	private static final long serialVersionUID = 1L;


  
    public PaymentDao() {
        super();
 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Email=request.getParameter("email");
		int rid=Integer.parseInt(request.getParameter("rid"));
		String HOLDER=request.getParameter("HOLDER");
		String CARDNUMBER=request.getParameter("CARDNUMBER");
		String MONTH=request.getParameter("MONTH");
		String YEAR=request.getParameter("YEAR");
		String CVV=request.getParameter("CVV");	
		String name=request.getParameter("name");
		
			String phone=request.getParameter("phone");
			Integer cid=Integer.parseInt(request.getParameter("cid"));
			String type=request.getParameter("type");
			int total=Integer.parseInt(request.getParameter("total"));
			Customer c1=new Customer();
			c1.setCustomer_id(cid);
			PaymentControl con = new PaymentControl();
				Payment obj=new Payment();
				obj.setCustid(c1);
				obj.setType(type);
				obj.setTotal(total);
				con.insert(obj);
		response.sendRedirect("Order.jsp?name="+name+"&phone="+phone+"&HOLDER="+HOLDER+"&CARDNUMBER="+CARDNUMBER+"&MONTH="+MONTH+"&YEAR="+YEAR+"&CVV="+CVV+"&cid="+cid+"&total="+total+"&rid="+rid+"&email="+Email);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	}


