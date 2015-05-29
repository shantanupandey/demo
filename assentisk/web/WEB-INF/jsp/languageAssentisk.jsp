<%@ page language="java" import="java.util.*" %>
<%
ResourceBundle resource = ResourceBundle.getBundle("resources/messages");

String sPath=resource.getString("Header_MyProfile");
String sName=resource.getString("Header_Accounts");

System.out.println(sPath);
System.out.println(sName);

%>