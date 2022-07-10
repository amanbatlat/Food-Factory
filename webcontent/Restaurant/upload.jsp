<%@page import="org.hibernate.HibernateException"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="Controller.FoodControl"%>
<%@page import="Model.Food"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="Model.Category"%>
<%@page import="Model.Restaurant"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>  
<%  

String CATEGORY=request.getParameter("CATEGORY");
Category c=new Category();
c.setCATEGORY(CATEGORY);
String NAME=request.getParameter("NAME");
Restaurant r1=new Restaurant();
r1.setNAME(NAME);
MultipartRequest m = new MultipartRequest(request,"d:/"); 
SessionFactory ss=new Configuration().configure().buildSessionFactory();
Session sf=ss.openSession();

Criteria cr=sf.createCriteria(Restaurant.class);
Criteria cr1=sf.createCriteria(Category.class);

cr1.add(Restrictions.eq("CATEGORY", CATEGORY));
java.util.Iterator<Category> itr1=cr1.list().iterator();
cr.add(Restrictions.eq("NAME",NAME));
java.util.Iterator<Restaurant> itr=cr.list().iterator();

while(itr.hasNext())
{
	Restaurant r2=itr.next();
	int i=r2.getId();
	r1.setId(i);
}
while(itr1.hasNext())
{
	Category c1=itr1.next();
	int i1=c1.getCAT_ID();
	c.setCAT_ID(i1);
}

FoodControl con=new FoodControl();
String FOODNAME=request.getParameter("FOODNAME");
String PRICE=request.getParameter("PRICE");
String IMAGE=request.getParameter("IMAGE");
Food obj=new Food();
obj.setFOODNAME(FOODNAME);
obj.setIMAGE(IMAGE);
obj.setPRICE(PRICE);
obj.setCategory_id(c);
obj.setRestaurant_id(r1);
sf.save(obj);
response.sendRedirect("Fooditem.jsp");
%>  
