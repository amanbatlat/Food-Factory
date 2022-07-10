<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="Model.AdminLogin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
AdminLogin a1=new AdminLogin();
a1.setUSERNAME("aman");
a1.setPASSWORD("aman");
SessionFactory sf=new Configuration().configure().buildSessionFactory();
Session ss=sf.openSession();
Transaction t=ss.beginTransaction();
ss.save(a1);
t.commit();
ss.close();
sf.close();
System.out.println("Completed");

%>