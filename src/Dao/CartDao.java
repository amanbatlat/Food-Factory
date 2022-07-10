package Dao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.CartControl;
import Model.Cart;
import Model.Customer;
import Model.Food;
import Model.Restaurant;
@WebServlet("/CartDao")
public class CartDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public CartDao() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int Quantity=Integer.parseInt(request.getParameter("qty1"));
			int rid=Integer.parseInt(request.getParameter("rid"));
		int id=Integer.parseInt(request.getParameter("id"));
		Restaurant r1=new Restaurant();
		r1.setId(rid);
		System.out.print(id);
		Food f1=new Food();
		f1.setId(id);
		CartControl con=new CartControl();
		int cid=Integer.parseInt(request.getParameter("cid"));
		System.out.print(cid);
		
		Customer c2=new Customer();
		c2.setCustomer_id(cid);
		System.out.print(f1.getId());
		System.out.print(c2.getCustomer_id());
			Cart c1=new Cart();
			c1.setC_id(c2);
			c1.setFood_id(f1);
			c1.setQUANTITY(Quantity);
			c1.setRest_id(r1);
			System.out.print(c1.getC_id());
			System.out.print(c1.getFood_id());
			con.insert(c1);
			response.sendRedirect("Product.jsp?id="+rid);
		
}
}