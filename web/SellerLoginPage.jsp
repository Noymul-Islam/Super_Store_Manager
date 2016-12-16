<%-- 
    Document   : SellerLoginPage
    Created on : Dec 11, 2015, 6:02:45 PM
    Author     : DELL
--%>
<%@page import="java.sql.*"%>
<%@page import="MyPack.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/SellerPage/SellerHomePage.css">
        <title>Login</title>
    </head>
    <body>
        <h1 style="color: white;text-align: center">Please login to continue!</h1>
        <br>
        <br>
        <br>
        <form method="post" action="SellerLoginServlet" style="text-align: center">
            <table id="b1">
                <th></th>
                <th></th>
                <tr>
                    <td>UserID</td>
                    <td><input type="text" name="userID"> </input></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password"> </input></td>
                </tr>
            
            </table>
            <input class="loginbutton" type="submit" value="login"> </input>
        </form>
    </body>
</html>
