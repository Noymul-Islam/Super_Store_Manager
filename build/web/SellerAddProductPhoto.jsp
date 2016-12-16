<%-- 
    Document   : SellerAddNewProduct
    Created on : Mar 16, 2016, 9:17:11 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="MyPack.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/SellerPage/SellerHomePage.css">
    </head>
    <body>
        <%
            Connection conn = null;
            conn = null;
            try {
                String driverName = "oracle.jdbc.driver.OracleDriver";
                Class.forName(driverName);
                String serverName = "localhost";
                String serverPort = "1521";
                String sid = "orcl";
                String url = "jdbc:oracle:thin:@" + serverName + ":" + serverPort + ":" + sid;
                String username = "SuperStoreDatabase";
                String password = "1234";
                conn = DriverManager.getConnection(url, username, password);
                System.out.println("ALHAMDULILLAH");
            } catch (Exception e) {
                System.out.println("error rror ttor");
            }
            CurrentUser cu2 = null;
            try {
                cu2 = (CurrentUser) session.getAttribute("cu");
                if (cu2 == null) {
                    response.sendRedirect("ReqFailed.jsp");
                }
            } catch (Exception e) {
                response.sendRedirect("UserLoginFailed.jsp");
            }
        %>
        <p style="margin-left: 50px;color: white">seller : <%=cu2.getSellerID()%></p><br>
      
        
        <h1 style="font-family: monospace;font-size: 40px;color: whitesmoke;text-align: center">Insert Photo of Product</h1>
        <div style="margin-top: 100px">
            <form method="post" action="ProductPhotoServlet" enctype="multipart/form-data" style="text-align: center;color:white">
                <table id="b1" style="margin-left: 450px">
                    <th></th>
                    <th></th>

                    <tr>
                        <td>Photo</td>
                        <td><input type="file" name="photo"></input></td>
                    </tr>

                </table>
                <input style="margin-top: 50px" class="loginbutton" type="submit" id="mybutton" value="Insert">
            </form>
        </div>
        
    </body>
    <script>

    </script>
</html>
