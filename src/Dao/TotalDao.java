package Dao;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TotalDao
 */
@WebServlet("/TotalDao")
public class TotalDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TotalDao() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int q=Integer.parseInt(request.getParameter("pri"));
		int p=0;
		p=p+q;
		System.out.println(q);
		response.setContentType("text/HTML");
		PrintWriter out=response.getWriter();
		out.print(p);
	}

}
