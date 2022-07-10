<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
String Email=request.getParameter("email");
int rid=Integer.parseInt(request.getParameter("rid"));
int total=Integer.parseInt(request.getParameter("total"));
String cid=request.getParameter("cid");
String name=request.getParameter("name");
String phone=request.getParameter("phone");
String HOLDER=request.getParameter("HOLDER");
String CARDNUMBER=request.getParameter("CARDNUMBER");
String MONTH=request.getParameter("MONTH");
String YEAR=request.getParameter("YEAR");
String CVV=request.getParameter("CVV");	
int otp= (Integer) session.getAttribute("otp");
String otpvalue=request.getParameter("otpvalue");
int enterOtp=Integer.parseInt(otpvalue);
if(otp==enterOtp)
{
try
{
	
	response.sendRedirect("CreditDao?HOLDER="+HOLDER+"&CARDNUMBER="+CARDNUMBER+"&MONTH="+MONTH+"&YEAR="+YEAR+"&CVV="+CVV+"&cid="+cid+"&total="+total+"&rid="+rid+"&email="+Email);
	
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
}
else
{
out.println("OTP not matched");
}
%>