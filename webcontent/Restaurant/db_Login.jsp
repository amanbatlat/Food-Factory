
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
String NAME=request.getParameter("NAME");
String RPASSWORD=request.getParameter("RPASSWORD");
Restaurant r1=new Restaurant();
r1.setNAME(NAME);
r1.setRPASSWORD(RPASSWORD);
SessionFactory sf=new Configuration().configure().buildSessionFactory();
Session ss=sf.openSession();
Criteria cr=ss.createCriteria(Restaurant.class);
cr.add(Restrictions.eq("NAME", NAME));
cr.add(Restrictions.eq("RPASSWORD", RPASSWORD));
Iterator<Restaurant> itr=cr.list().iterator();
if(itr.hasNext())
{
	HttpSession session2=request.getSession();				
	session2.setAttribute("RESTAURANT", NAME);
	response.sendRedirect("HotelAdmin.jsp");
}
else
{
	response.sendRedirect("index.jsp");
}
%>    