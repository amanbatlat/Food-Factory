package Dao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Controller.OrderdControl;

import Model.Customer;
import Model.Orderd;
import Model.Restaurant;
@WebServlet("/OrderdDao")
public class OrderdDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public OrderdDao() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		String status;
		OrderdControl con=new OrderdControl();
		if(id==0)
		{
			status="In Processing";
			int rid=Integer.parseInt(request.getParameter("rid"));	
			int total=Integer.parseInt(request.getParameter("total"));
			int cid=Integer.parseInt(request.getParameter("cid"));Restaurant r=new Restaurant();
			r.setId(rid);
			Customer c=new Customer();
			c.setCustomer_id(cid);
		
			Orderd obj=new Orderd();
			obj.setTotal(total);
			obj.setCustid(c);
			obj.setStatus(status);
			obj.setRestid(r);
			con.insert(obj);
			response.sendRedirect("Orderplaced.jsp?cid="+cid);
		}else
		{
			status="Deliverd";
			Orderd obj=con.select(id);
			obj.setStatus(status);
			con.update(obj);
			response.sendRedirect("Restaurant/Order.jsp");
		}
		
			
	}
}
