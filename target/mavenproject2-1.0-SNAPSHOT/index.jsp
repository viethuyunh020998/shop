<%-- 
    Document   : index
    Created on : Dec 3, 2020, 10:12:22 PM
    Author     : viet
--%>

<%@page import="com.learn.mavenproject2.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/nav.jsp" %>
        <%
            out.println(FactoryProvider.getFactory());
            out.println(FactoryProvider.getFactory());
            out.println(FactoryProvider.getFactory());
        %>
    </body>
</html>
