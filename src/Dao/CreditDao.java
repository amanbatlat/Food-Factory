package Dao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hsqldb.Session;

import com.email.durgesh.Email;

import Controller.CreditControl;
import Model.Credit;
import Model.Customer;
import Model.Feedback;
@WebServlet("/CreditDao")
public class CreditDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public CreditDao() {
        super();
    }protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
try {
	int id=0;
	int rid=Integer.parseInt(request.getParameter("rid"));
	int total=Integer.parseInt(request.getParameter("total"));
	int cid=Integer.parseInt(request.getParameter("cid"));
	Customer id1=new Customer();
	id1.setCustomer_id(cid);
	String Email=request.getParameter("email");
		String HOLDER=request.getParameter("HOLDER");
		String CARDNUMBER=request.getParameter("CARDNUMBER");
		String MONTH=request.getParameter("MONTH");
		String YEAR=request.getParameter("YEAR");
		String CVV=request.getParameter("CVV");
		CreditControl con=new CreditControl();//insert code here
		//insert code here
	if(HOLDER!=null)
	{	Credit obj=new Credit();
		obj.setCARDNUMBER(CARDNUMBER);
		obj.setCVV(CVV);
		obj.setMONTH(MONTH);
		obj.setYEAR(YEAR);
		obj.setHOLDERNAME(HOLDER);
		obj.setCustid(id1);
		con.insert(obj);
		try {
			Email email=new Email("foodfactoryma@gmail.com","FoodFactory@@");
			email.setFrom("foodfactoryma@gmail","Food Factory");
			email.setSubject("ORDER CONFIRMATION FROM FOOD FACTORY");
			email.setText("Hello "+HOLDER+" Your Order is Confirmed It Will Be Deliverd In 31 Minutes , Thank you For Ordering From Food Factory");
			email.addRecipient(Email);
			
			email.send();
    	}
    	catch (Exception e) {
			// TODO: handle exception
		}
	
		response.sendRedirect("OrderdDao?total="+total+"&cid="+cid+"&rid="+rid+"&id="+id);
	}
	else {
		response.sendRedirect("OrderdDao?total="+total+"&cid="+cid+"&rid="+rid+"&id="+id);
	}
		}
catch (Exception e) {
	// TODO: handle exception
	System.out.print(e);
}
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rid=Integer.parseInt(request.getParameter("rid"));
		String Email=request.getParameter("email");
		String HOLDER=request.getParameter("HOLDER");
		String CARDNUMBER=request.getParameter("CARDNUMBER");
		String MONTH=request.getParameter("MONTH");
		String YEAR=request.getParameter("YEAR");
		String CVV=request.getParameter("CVV");
			String cid=request.getParameter("cid");
			String phone=request.getParameter("phone");
			String name=request.getParameter("name");
			String type="CREDIT";
			String total=request.getParameter("total");
			response.sendRedirect("PaymentDao?phone="+phone+"&name="+name+"&type="+type+"&total="+total+"&cid="+cid+"&HOLDER="+HOLDER+"&CARDNUMBER="+CARDNUMBER+"&MONTH="+MONTH+"&YEAR="+YEAR+"&CVV="+CVV+"&rid="+rid+"&email="+Email);	
		
	}

}
