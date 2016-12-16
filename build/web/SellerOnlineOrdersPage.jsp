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
        <link rel="stylesheet" type="text/css" href="CSS/SellerPage/SellerHomePage.css">


        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
                <script src="assets/js/html5shiv.js"></script>
                <script src="assets/js/respond.js"></script>
        <![endif]-->

        <!--[if IE 8]>
        <script src="assets/js/selectivizr.js"></script>
    <![endif]-->
    </head>



    <body id="onlineorders">
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
        %>


        <div style="margin-top: 30px">
            <nav>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div >
                    <ul>
                        <li ><a id="poptionsnav" href="SellerEditPage.jsp">Product Options</a></li>
                        <li ><a href="LogOutServlet?action=logout">LogOut</a></li>
                        <li ><a id="ordernav" href="SellerOnlineOrderViewSetup?action=view">Online Orders</a></li>
                        
                        <li ><a id="billnav" href="SellerGenerateBill.jsp">Generate Bill</a></li>
                        <li ><a id="homenav" href="SellerHomePage.jsp">Home</a></li>
                    </ul> <!-- /.nav -->
                </div><!-- /.navbar-collapse -->
            </nav>
            <%
                int coins=0;
                int actualCost = 0;
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
        </div>

        <h1 style="font-family: monospace;font-size: 40px;color: whitesmoke;text-align: center">Online order view for employee<%=cu2.getSellerID()%> <%=spo.getNumberOfOrders()%></h1>


        <%
            for (int i = 0; i < spo.getNumberOfOrders(); ++i) {%>


        <div style="margin-top: 50px;color: white">
            <%
                try {
                    Statement st = conn.createStatement();
                    ResultSet rs = st.executeQuery("select username,phoneno from userinfo where id=" + spo.id[i]);
                         while (rs.next()) {%>
            <h style="margin-left: 150px">Name : <%=rs.getString(1)%></h><br>
            <h style="margin-left: 150px">Phone Number : <%=rs.getString(2)%></h><br>
            <br>
                <%}
                        } catch (Exception e) {
                        }%>
            
            <form style="text-align: center;color:white">

                <table class="MySellerTable" >


                    <th>Item</th>
                    <th>Amount(kg,litre or unit)</th>
                    <th>Price</th>

                    <%
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select * from " + spo.tableNames[i]);
                            while (rs.next()) {%> 
                    <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                    </tr>
                    <%}
                        } catch (Exception e) {
                        }
                    %>

                    <%
                        actualCost = 0;
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select sum(itemcost) from " + spo.tableNames[i]);
                            while (rs.next()) {
                                actualCost = Integer.parseInt(rs.getString(1));
                    %> 
                    <tr>
                        <td></td>
                        <td>Total Cost</td>
                        <td><%=actualCost%></td>
                    </tr>
                    <%}
                        } catch (Exception e) {
                        }
                    %>
                    <%
                        coins = 0;
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select status from paymentinfo where id=" + spo.id[i]);
                            while (rs.next()) {
                                ResultSet rs2 = st.executeQuery("select coins from usercoins where id=" + spo.id[i]);
                                while (rs2.next()) {
                                    coins = rs2.getInt("coins");
                                }

                                //coins -= actualCost;
                    %> 
                   
                    <tr>
                        <td></td>
                        <td>Revised Cost</td>
                        <td>paid by coins</td>
                    </tr>
                    <%}
                        } catch (Exception e) {
                        }
                    %>

                </table>
                <br>
            </form>
                    
                    <input style="margin-left: 130px" class="MySellerButton" onclick="removeTable(<%=spo.id[i]%>,<%=coins-actualCost%>)" type="button" value="Remove" ></input>
        </div>

        <% }%>


    </body>
<script>

    function showOrders() {
        if (document.getElementById("").style.display = "none") {
            document.getElementById("b1").style.display = "block";
            document.getElementById("b2").value = "HideList";

        }
        else {
            document.getElementById("").style.display = "none";
            document.getElementById("b2").value = "ShowList";

        }

    }

    function removeTable(id,coins) {
        //alert(coins);
        var jspcall = "SellerOnlineOrderViewSetup?action=view&action2=" + id+"&action3="+coins;
        window.location.href = jspcall;
    }

</script>


</html>