package Dao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.OrderdControl;
import Model.Orderd;

@WebServlet("/CancelOrderd")
public class CancelOrderd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CancelOrderd() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String id = request.getParameter("id");
			int obj_id = Integer.parseInt(id);
			OrderdControl con = new OrderdControl();
			Orderd obj = con.select(obj_id);
			if(obj !=null) {
				con.Delete(obj);
			}
			response.sendRedirect("Restaurant/Order.jsp");
		}catch(Exception e) {
			response.sendRedirect("");
		}
	}

}
