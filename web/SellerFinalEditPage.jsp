<!DOCTYPE html>
<!--[if IE 7 ]><html class="ie ie7 lte9 lte8 lte7" lang="en-US"><![endif]-->
<!--[if IE 8]><html class="ie ie8 lte9 lte8" lang="en-US">	<![endif]-->
<!--[if IE 9]><html class="ie ie9 lte9" lang="en-US"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<%@page import="java.sql.*"%>
<%@page import="MyPack.*"%>
<html class="noIE" lang="en-US">
    <!--<![endif]-->
    <head>
        <!-- meta -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale = 1.0, maximum-scale=1.0, user-scalable=no"/>
        <title>Home Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/SellerPage/ManagerPage.css">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
                <script src="assets/js/html5shiv.js"></script>
                <script src="assets/js/respond.js"></script>
        <![endif]-->

        <!--[if IE 8]>
        <script src="assets/js/selectivizr.js"></script>
    <![endif]-->

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
                System.out.println("inside macusinfo");

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
            
            SellerPageObject spo = null;
                try {
                    spo = (SellerPageObject) request.getAttribute("dao");
                } catch (Exception e) {

                }
        %>
    </head>

    <body id="mseller">
        <!-- Home -->
        <h1 style="color: white;text-align: center" >Final Edit Page</h1>
        <br>
        <p style="color: white">seller : <%=cu2.getSellerID()%></p><br>
        <br>
        <br>
      


        <br>
        
        <form method="post" action="SellerFinalEditPageServlet" style="text-align: center">
            <table style="margin-left: 450px" >
                <th></th>
                <th></th>
                  <%
            try {
                Statement st = conn.createStatement();

                ResultSet rs = st.executeQuery("select * from "+spo.getTableName()+" where id='"+spo.getPid()+"'");

                if (rs.next()) {%>
                <tr>
                    <td>Product Table</td>
                    <td><input name="tablename" type="text1" id="t1" value="<%=spo.getTableName()%>" readonly="readonly" ></td>
                </tr>
                <tr>
                    <td>ID</td>
                    <td><input name="id" type="text1" id="t1" value="<%= rs.getString("id")%>" readonly="readonly" ></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input name="name" type="text1" id="t1" value="<%= rs.getString("name")%>" ></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input name="price" type="text1" id="t1" value="<%= rs.getString("price")%>" ></td>
                </tr>
                <tr>
                    <td>Total_sold</td>
                    <td><input name="total_sold" type="text1" id="t1" value="<%= rs.getString("total_sold")%>" ></td>
                </tr>
                <tr>
                    <td>Recent_sold</td>
                    <td><input name="recent_sold" type="text1" id="t1" value="<%= rs.getString("recent_sold")%>" ></td>
                </tr>
                <tr>
                    <td>Ammount_supplied</td>
                    <td><input name="ammount_supplied" type="text1" id="t1" value="<%= rs.getString("ammount_supplied")%>" ></td>
                </tr>
                <tr>
                    <td>Allowed_ammount</td>
                    <td><input name="allowed_amount" type="text1" id="t1" value="<%= rs.getString("allowed_amount")%>" ></td>
                </tr>
                <tr>
                    <td>Exp_date</td>
                    <td><input name="expdate" type="text1" id="t1" value="<%= rs.getDate("expdate")%>" ></td>
                </tr>
                 <%
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        %>
                
            </table>
        <br>
        <br>
                    <input style="font-size: 20px" type="submit" id="loginbutton" value="Commit">
        </form>
                   

       
       
    </body>
   
</html>