<%-- 
    Document   : logout
    Created on : Nov 19, 2024, 9:11:25 AM
    Author     : SHERE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page session="true" %>
        <%
            session.invalidate();
            response.sendRedirect("home.jsp");
        %>

    </body>
</html>
