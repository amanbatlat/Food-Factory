<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="java.util.Iterator"%>
<%@page import="Model.Restaurant"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
int i;
String ID=request.getParameter("id");
SessionFactory sf =new Configuration().configure().buildSessionFactory();
Session ss = sf.openSession();
Transaction t = ss.beginTransaction();
Criteria c = ss.createCriteria(Restaurant.class);
c.add(Restrictions.eq("Id", (int)Integer.parseInt(ID)));
Iterator<Restaurant> itr = c.list().iterator();
//t.commit();
//ss.close();
//sf.close();
if(itr.hasNext())
{
	Restaurant r1=itr.next();
	ss.delete(r1);
	t.commit();
	ss.close();
	sf.close();
	response.sendRedirect("Dashboard.jsp");
}
%>
