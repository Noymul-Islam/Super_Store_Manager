<%-- 
    Document   : managerSupplierWelCome
    Created on : Mar 10, 2016, 11:42:38 PM
    Author     : Noymul Islam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color: black">
        
        <h1 style="text-align: center;color:white">Registration Completed Successfully</h1>
        <br>
        <h1 style="text-align: center;color:white">Your Id  is:<%= request.getParameter("id")%></h1>
    </body>
</html>
