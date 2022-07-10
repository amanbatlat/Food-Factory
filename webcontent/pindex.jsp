<%@ page import="java.sql.*"%>

<%
int n=Integer.parseInt(request.getParameter("val"));


out.print(++n);

n=n++;
%>