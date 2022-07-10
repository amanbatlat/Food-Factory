package Dao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.CartControl;
import Controller.CustomerControl;
import Model.Cart;
import Model.Customer;

@WebServlet("/RemoveCart")
public class RemoveCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public RemoveCart() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int cid=Integer.parseInt(request.getParameter("cid"));
			String id = request.getParameter("id");
			int obj_id = Integer.parseInt(id);
			CartControl con = new CartControl();
			Cart obj = con.select(obj_id);
			if(obj !=null) {
				con.Delete(obj);
			}
			response.sendRedirect("Cart.jsp?id="+cid);
		}catch(Exception e) {
			response.sendRedirect("Error.jsp");
		}
	}

}
