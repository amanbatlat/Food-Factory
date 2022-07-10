<%@page import="Model.Customer"%>

<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="Model.AdminLogin"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%
	String NAME=request.getParameter("NAME");
	String PASSWORD=request.getParameter("PASSWORD");
	Customer a1=new Customer();
	a1.setNAME(NAME);
	a1.setPASSWORD(PASSWORD);	
	SessionFactory sf=new Configuration().configure().buildSessionFactory();
	Session ss=sf.openSession();
	Criteria cr=ss.createCriteria(Customer.class);
	cr.add(Restrictions.eq("NAME",NAME));
	cr.add(Restrictions.eq("PASSWORD",PASSWORD));
	Iterator<Customer> itr= cr.list().iterator();
	if(itr.hasNext())
	{
		HttpSession session3=request.getSession();
		session3.setAttribute("CUSTOMER",NAME);
		response.sendRedirect("Index.jsp");
	}
	else
	{
		response.sendRedirect("Plz Enter Valid email or Password");
	}
%>  
    

    