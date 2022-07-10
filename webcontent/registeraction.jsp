<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="Model.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String NAME=request.getParameter("NAME");
String EMAIL=request.getParameter("EMAIL");
String CONTACT=request.getParameter("CONTACT");
String ADDRESS=request.getParameter("ADDRESS");
String PASSWORD=request.getParameter("PASSWORD");

Customer c1=new Customer();
c1.setNAME(NAME);
c1.setEMAIL(EMAIL);
c1.setCONTACT(CONTACT);
c1.setADDRESS(ADDRESS);
c1.setPASSWORD(PASSWORD);
SessionFactory sf=new Configuration().configure().buildSessionFactory();
Session ss=sf.openSession();
Transaction t=ss.beginTransaction();
ss.save(c1);
t.commit();
ss.close();
sf.close();
response.sendRedirect("Login.jsp");
%>
