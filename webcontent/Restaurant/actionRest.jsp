<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,org.hibernate.*,Model.*,org.hibernate.cfg.Configuration" %>
<%
String NAME=request.getParameter("NAME");
String EMAIL=request.getParameter("EMAIL");
String CONTACT=request.getParameter("CONTACT");
String RPASSWORD=request.getParameter("RPASSWORD");
Restaurant r1=new Restaurant();
r1.setNAME(NAME);
r1.setEMAIL(EMAIL);
r1.setCONTACT(CONTACT);
r1.setRPASSWORD(RPASSWORD);
SessionFactory sf=new Configuration().configure().buildSessionFactory();
Session ss=sf.openSession();
Transaction t=ss.beginTransaction();
ss.save(r1);
t.commit();
ss.close();
sf.close();
System.out.println("Completed");
response.sendRedirect("index.jsp");
%>      



