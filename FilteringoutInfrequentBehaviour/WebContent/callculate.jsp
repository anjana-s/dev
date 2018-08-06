<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% float sp=20,gp=50,cp;

float p=sp*(gp/100);
cp=sp-p;

System.out.print("g%="+gp);
System.out.print("cp="+cp);
System.out.print("sp="+sp);
System.out.print("profit="+p);
System.out.println();
%>
</body>
</html>