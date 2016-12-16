<%-- 
    Document   : GeneratedBill
    Created on : Oct 19, 2015, 3:25:17 PM
    Author     : DELL
--%>
<%@page import="java.sql.*"%>
<%@page import="MyPack.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Bill!!!</title>
        <style>
            .loginbutton{
                background-color: Transparent;
                background-repeat:no-repeat;
                border: none;
                cursor:pointer;
                overflow: hidden;
                outline:none;
                height: 50px;
                width : 170px;
                font-size: 25px;
                color: white;

            }
            .loginbutton:hover{
                /*background-color: #a3a2a2;*/
                background-repeat:no-repeat;
                /*border: none;*/
                border: solid;
                border-color: white;
                border-width: 2px;
                cursor:pointer;
                overflow: hidden;
                outline:none;
            }
            th {
                width: 200px;
            }
            table{
                color: white;
                width: 600px;
                margin-left: 380px;

            }
            body{
                background-color: black;
            }
        </style>
    </head>
    <body>

        <%
            CurrentUser cu2 = (CurrentUser) session.getAttribute("cu");
        %>
        <div style="margin-top: 100px">
            <h1 style="color: white;text-align: center"><%=cu2.getName()%>'s Current Shopping Cart </h1>
            <br>
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
        <%
            try {
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery("select coins from usercoins where id="+Integer.parseInt(cu2.getID()));
                 while (rs.next()) {%> 
        <p style="color: white;text-align: center">You have <%=rs.getInt("coins")%> coins </p>
        <%}
            } catch (Exception e) {
            }%>
            <br>
            <br>
            <form method="get" action="FinalizeUserOrderServlet?" style="text-align: center">

                <table>
                    <th>Item</th>
                    <th>Amount</th>
                    <th>Cost</th>
                        <%
                for (int i = 0; i < cu2.getVegCount(); ++i) {%>
                    <tr>
                        <td>
                            <%=cu2.vegNames[i]%>
                        </td>
                        <td>
                            <%=cu2.vegAmounts[i]%>
                        </td>
                        <td>
                            <%=cu2.vegCost[i]%>
                        </td>
                    </tr>


                    <% } %>

                    <%
                    for (int i = 0; i < cu2.getGroceryCount(); ++i) {%>
                    <tr>
                        <td>
                            <%=cu2.groceryNames[i]%>
                        </td>
                        <td>
                            <%=cu2.groceryAmounts[i]%>
                        </td>
                        <td>
                            <%=cu2.groceryCost[i]%>
                        </td>
                    </tr>


                    <% } %>

                    <%
                    for (int i = 0; i < cu2.getLiquidsCount(); ++i) {%>
                    <tr>
                        <td>
                            <%=cu2.liquidsNames[i]%>
                        </td>
                        <td>
                            <%=cu2.liquidsAmounts[i]%>
                        </td>
                        <td>
                            <%=cu2.liquidsCost[i]%>
                        </td>
                    </tr>


                    <% } %>


                    <%
                     for (int i = 0; i < cu2.getChockolatesCount(); ++i) {%>
                    <tr>
                        <td>
                            <%=cu2.chockolatesNames[i]%>
                        </td>
                        <td>
                            <%=cu2.chockolatesAmounts[i]%>
                        </td>
                        <td>
                            <%=cu2.chockolatesCost[i]%>
                        </td>
                    </tr>


                    <% } %>


                    <%
                     for (int i = 0; i < cu2.getEggsCount(); ++i) {%>
                    <tr>
                        <td>
                            <%=cu2.eggsNames[i]%>
                        </td>
                        <td>
                            <%=cu2.eggsAmounts[i]%>
                        </td>
                        <td>
                            <%=cu2.eggsCost[i]%>
                        </td>
                    </tr>


                    <% } %>



                    <%
                     for (int i = 0; i < cu2.getMeatsCount(); ++i) {%>
                    <tr>
                        <td>
                            <%=cu2.meatsNames[i]%>
                        </td>
                        <td>
                            <%=cu2.meatsAmounts[i]%>
                        </td>
                        <td>
                            <%=cu2.meatsCost[i]%>
                        </td>
                    </tr>


                    <% } %>



                    <%
                       for (int i = 0; i < cu2.getFishesCount(); ++i) {%>
                    <tr>
                        <td>
                            <%=cu2.fishesNames[i]%>
                        </td>
                        <td>
                            <%=cu2.fishesAmounts[i]%>
                        </td>
                        <td>
                            <%=cu2.fishesCost[i]%>
                        </td>
                    </tr>


                    <% } %>


                    <%
                       for (int i = 0; i < cu2.getColddrinksCount(); ++i) {%>
                    <tr>
                        <td>
                            <%=cu2.colddrinksNames[i]%>
                        </td>
                        <td>
                            <%=cu2.colddrinksAmounts[i]%>
                        </td>
                        <td>
                            <%=cu2.colddrinksCost[i]%>
                        </td>
                    </tr>


                    <% } %>



                    <%
                        for (int i = 0; i < cu2.getCosmeticsCount(); ++i) {%>
                    <tr>
                        <td>
                            <%=cu2.cosmeticsNames[i]%>
                        </td>
                        <td>
                            <%=cu2.cosmeticsAmounts[i]%>
                        </td>
                        <td>
                            <%=cu2.cosmeticsCost[i]%>
                        </td>
                    </tr>


                    <% } %>




                    <%
                            for (int i = 0; i < cu2.getOthersCount(); ++i) {%>
                    <tr>
                        <td>
                            <%=cu2.othersNames[i]%>
                        </td>
                        <td>
                            <%=cu2.othersAmounts[i]%>
                        </td>
                        <td>
                            <%=cu2.othersCost[i]%>
                        </td>
                    </tr>


                    <% }%>


                    <tr>
                        <td>
                            Total
                        </td>
                        <td>
                            <%=cu2.totalAmountPurchased%>
                        </td>
                        <td>
                            <%=cu2.totalCostOfPurchasedProducts%>
                        </td>
                    </tr>   




                </table>
                 <br>
                 <br>
                <input class="loginbutton" type="submit" value="ConfirmOrder" >
                <input class="loginbutton" onclick="useCoinFunc()" type="button" value="Use Coins" ></input>
            </form>
        </div>

    </body>
    <script>
        function useCoinFunc(){
        var jspcall = "FinalizeUserOrderServlet?action=coin";
        window.location.href = jspcall;
    }
    </script>
</html>
