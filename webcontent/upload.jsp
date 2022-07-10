<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>  
<%  
int i=32767;
MultipartRequest m = new MultipartRequest(request,"d:upload/",i);  
out.print("successfully uploaded");  
  
%>  
