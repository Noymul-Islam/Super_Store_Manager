<%-- 
    Document   : SellerProductOptions
    Created on : Mar 16, 2016, 7:16:38 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Options</title>
        <link rel="stylesheet" type="text/css" href="CSS/SellerPage/SellerHomePage.css">
    </head>
    <body id="productoptions">
         <nav style="margin-top: 30px">
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div >
                <ul>
                    <li ><a id="poptionsnav" href="SellerProductOptions.jsp">Product Options</a></li>
                    <li ><a href="LogOutServlet?action=logout">LogOut</a></li>
                    <li ><a id="ordernav" href="SellerOnlineOrderViewSetup?action=view">Online Orders</a></li>
                    <li ><a id="billnav" href="SellerGenerateBill.jsp">Generate Bill</a></li>
                    <li ><a id="homenav" href="SellerHomePage.jsp">Home</a></li>
                </ul> <!-- /.nav -->
            </div ><!-- /.navbar-collapse -->
        </nav>
        <h1>Hello World!</h1>
    </body>
</html>
