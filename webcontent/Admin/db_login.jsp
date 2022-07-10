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
	String USERNAME=request.getParameter("USERNAME");
	String PASSWORD=request.getParameter("PASSWORD");
	AdminLogin a1=new AdminLogin();
	a1.setUSERNAME(USERNAME);
	a1.setPASSWORD(PASSWORD);	
	SessionFactory sf=new Configuration().configure().buildSessionFactory();
	Session ss=sf.openSession();
	Criteria cr=ss.createCriteria(AdminLogin.class);
	cr.add(Restrictions.eq("USERNAME",USERNAME));
	cr.add(Restrictions.eq("PASSWORD",PASSWORD));
	Iterator<AdminLogin> itr= cr.list().iterator();
	if(itr.hasNext())
	{
		
		response.sendRedirect("Dashboard.jsp");
	}
	else
	{
		response.sendRedirect("Error.jsp");
	}
%>  
    



