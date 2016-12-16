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
        <title>Product Info</title>
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

            ManagerInfoDAO mngr = null;
            try {
                mngr = (ManagerInfoDAO) session.getAttribute("mngrdao");
            } catch (Exception e) {
                response.sendRedirect("UserLoginFailed.jsp");
            }

        %>
    </head>

    <body id="mproductinfo">
        <!-- Home -->
        <section>
            <nav>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div>
                    <ul>
                        <li ><a id="msellernav" href="managersellerAccess.jsp">Seller Access</a></li>
                        <li ><a id="mcoinnav" href="managerCoinconfigure.jsp">Coin Configure</a></li>
                        <li ><a id="msuppliernav" href="managersupplierInfo.jsp">Suppliers Options</a></li>
                        <li ><a id="mproductinfonav" href="managerProductInfo.jsp">Products Info</a></li>
                        <li ><a id="mcustomernav" href="managerCustomerInfo.jsp">Customers Info</a></li>
                        <li ><a id="mhomenav" href="ManagerHomePage.jsp">Home</a></li>
                    </ul> <!-- /.nav -->
                </div><!-- /.navbar-collapse -->
            </nav>
           
        </section> <!-- /#header -->
        <br>
        <p style="margin-left: 50px;color: white">user : <%=mngr.getUserName()%></p><br>


        <form style="text-align: center" >




            <input  type="button" id="veg" value="Vegitables" onclick="showVeg()" style="background-color: chocolate;width: 100px;overflow: hidden; font-size: 15px; text-align: center"> 
            <input type="text" id="text1" onkeyup="doSearch('text1', 't1');" style="margin-left: 110px">
            <br>

            <table id="t1" style="display: none;text-align: center;margin-left: 200px">
                <th style="color: blue;font-size: 15px;padding-left: -50px">Item(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">Price(tk)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">TotalSold(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">RecentSold(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">RemainigUnit</th>
                    <%
                        try {
                            Statement st = conn.createStatement();

                            ResultSet rs = st.executeQuery("select name,price,total_sold,recent_sold,remaining_item from vegetablelist order by total_sold desc");

                    while (rs.next()) {%>
                <tr>
                    <td style="color: green;font-size: 20px"><%=rs.getString("name").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs.getInt("price")%></td>
                    <td style="color: green;font-size: 20px"><%=rs.getDouble("total_sold")%></td>
                    <td style="color: green;font-size: 20px"><%=rs.getDouble("recent_sold")%></td>
                    <td style="color: green;font-size: 20px"><%=rs.getDouble("remaining_item")%></td>

                </tr>


                <% }

                    } catch (Exception e) {
                        System.out.println("Aschi");
                    }
                %>

            </table>
            <br>
            <input  type="button" id="groc" value="Groceries" onclick="showGroc()" style="background-color: chocolate;width: 100px;overflow: hidden; font-size: 15px; text-align: center"> 
            <input type="text" id="text2" onkeyup="doSearch('text2', 't2');
                    ;" style="margin-left: 110px">
            <br>
            <table id="t2" style="display: none;text-align: center;margin-left: 200px">
                <th style="color: blue;font-size: 15px;padding-left: -50px">Item(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">Price(tk)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">TotalSold(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">RecentSold(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">RemainigUnit</th>
                    <%
                        try {
                            Statement st2 = conn.createStatement();

                            ResultSet rs2 = st2.executeQuery("select name,price,total_sold,recent_sold,remaining_item from grocerylist order by total_sold desc");

                    while (rs2.next()) {%>
                <tr>
                    <td style="color: green;font-size: 20px"><%=rs2.getString("name").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs2.getString("price").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs2.getString("total_sold").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs2.getString("recent_sold").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs2.getString("remaining_item").toString()%></td>

                </tr>


                <% }

                    } catch (Exception e) {
                        System.out.println("Aschi");
                    }
                %>




            </table>
            <br>
            <input  type="button" id="meat" value="Meats" onclick="showMeat()" style="background-color: chocolate;width: 100px;overflow: hidden; font-size: 15px; text-align: center"> 
            <input type="text" id="text3" onkeyup="doSearch('text3', 't3');" style="margin-left: 110px">
            <br>
            <table id="t3" style="display: none;text-align: center;margin-left: 200px">
                <th style="color: blue;font-size: 15px;padding-left: -50px">Item(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">Price(tk)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">TotalSold(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">RecentSold(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">RemainigUnit</th>

                <%
                    try {
                        Statement st3 = conn.createStatement();

                        ResultSet rs3 = st3.executeQuery("select name,price,total_sold,recent_sold,remaining_item from meatslist order by total_sold desc");

                    while (rs3.next()) {%>
                <tr>
                    <td style="color: green;font-size: 20px"><%=rs3.getString("name").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs3.getString("price").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs3.getString("total_sold").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs3.getString("recent_sold").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs3.getString("remaining_item").toString()%></td>

                </tr>


                <% }

                    } catch (Exception e) {
                        System.out.println("Aschi");
                    }
                %>


            </table>
            <br>
            <input  type="button" id="fish" value="Fishes" onclick="showFish()" style="background-color: chocolate;width: 100px;overflow: hidden; font-size: 15px; text-align: center"> 
            <input type="text" id="text4" onkeyup="doSearch('text4', 't4');" style="margin-left: 110px">
            <br>
            <table id="t4" style="display: none;text-align: center;margin-left: 200px">
                <th style="color: blue;font-size: 15px;padding-left: -50px">Item(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">Price(tk)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">TotalSold(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">RecentSold(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">RemainigUnit</th>
                    <%
                        try {
                            Statement st4 = conn.createStatement();

                            ResultSet rs4 = st4.executeQuery("select name,price,total_sold,recent_sold,remaining_item from fisheslist order by total_sold desc");

                     while (rs4.next()) {%>
                <tr>
                    <td style="color: green;font-size: 20px"><%=rs4.getString("name").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs4.getString("price").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs4.getString("total_sold").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs4.getString("recent_sold").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs4.getString("remaining_item").toString()%></td>

                </tr>


                <% }

                    } catch (Exception e) {
                        System.out.println("Aschi");
                    }
                %>







            </table>
            <br>
            <input  type="button" id="liquid" value="Liquides" onclick="showLiquid()" style="background-color: chocolate;width: 100px;overflow: hidden; font-size: 15px; text-align: center"> 
            <input type="text"  id="text5" onkeyup="doSearch('text5', 't5');" style="margin-left: 110px">
            <br>
            <table id="t5" style="display: none;text-align: center;margin-left: 200px">
                <th style="color: blue;font-size: 15px;padding-left: -50px">Item(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">Price(tk)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">TotalSold(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">RecentSold(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">RemainigUnit</th>
                    <%
                        try {
                            Statement st5 = conn.createStatement();

                            ResultSet rs5 = st5.executeQuery("select name,price,total_sold,recent_sold,remaining_item from liquidslist order by total_sold desc");

                     while (rs5.next()) {%>
                <tr>
                    <td style="color: green;font-size: 20px"><%=rs5.getString("name").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs5.getString("price").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs5.getString("total_sold").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs5.getString("recent_sold").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs5.getString("remaining_item").toString()%></td>

                </tr>


                <% }

                    } catch (Exception e) {
                        System.out.println("Aschi");
                    }
                %>







            </table>
            <br>
            <input  type="button" id="chock" value="Chockolates" onclick="showChockolat()" style="background-color: chocolate;width: 100px;overflow: hidden; font-size: 15px; text-align: center"> 
            <input type="text" id="text6" onkeyup="doSearch('text6', 't6');" style="margin-left: 110px">
            <br>
            <table id="t6" style="display: none;text-align: center;margin-left: 200px">
                <th style="color: blue;font-size: 15px;padding-left: -50px">Item(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">Price(tk)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">TotalSold(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">RecentSold(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">RemainigUnit</th>
                    <%
                        try {
                            Statement st6 = conn.createStatement();

                            ResultSet rs6 = st6.executeQuery("select name,price,total_sold,recent_sold,remaining_item from chockolateslist order by total_sold desc");

                         while (rs6.next()) {%>
                <tr>
                    <td style="color: green;font-size: 20px"><%=rs6.getString("name").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs6.getString("price").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs6.getString("total_sold").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs6.getString("recent_sold").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs6.getString("remaining_item").toString()%></td>

                </tr>


                <% }

                    } catch (Exception e) {
                        System.out.println("Aschi");
                    }
                %>






            </table>
            <br>
            <input  type="button" id="cold" value="Colddrinks" onclick="showCold()" style="background-color: chocolate;width: 100px;overflow: hidden; font-size: 15px; text-align: center"> 
            <input type="text" id="text7" onkeyup="doSearch('text7', 't7');" style="margin-left: 110px">
            <br>
            <table id="t7" style="display: none;text-align: center;margin-left: 200px">
                <th style="color: blue;font-size: 15px;padding-left: -50px">Item(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">Price(tk)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">TotalSold(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">RecentSold(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">RemainigUnit</th>

                <%
                    try {
                        Statement st7 = conn.createStatement();

                        ResultSet rs7 = st7.executeQuery("select name,price,total_sold,recent_sold,remaining_item from colddrinkslist order by total_sold desc");

                     while (rs7.next()) {%>
                <tr>
                    <td style="color: green;font-size: 20px"><%=rs7.getString("name").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs7.getString("price").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs7.getString("total_sold").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs7.getString("recent_sold").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs7.getString("remaining_item").toString()%></td>

                </tr>


                <% }

                    } catch (Exception e) {
                        System.out.println("Aschi");
                    }
                %>






            </table>
            <br>
            <input  type="button" id="egg" value="Eggs" onclick="showEgg()" style="background-color: chocolate;width: 100px;overflow: hidden; font-size: 15px; text-align: center"> 
            <input type="text" id="text8" onkeyup="doSearch('text8', 't8');" style="margin-left: 110px">
            <br>
            <table id="t8" style="display: none;text-align: center;margin-left: 200px">
                <th style="color: blue;font-size: 15px;padding-left: -50px">Item(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">Price(tk)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">TotalSold(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">RecentSold(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">RemainigUnit</th>
                    <%
                        try {
                            Statement st8 = conn.createStatement();

                            ResultSet rs8 = st8.executeQuery("select name,price,total_sold,recent_sold,remaining_item from eggslist order by total_sold desc");

                         while (rs8.next()) {%>
                <tr>
                    <td style="color: green;font-size: 20px"><%=rs8.getString("name").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs8.getString("price").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs8.getString("total_sold").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs8.getString("recent_sold").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs8.getString("remaining_item").toString()%></td>

                </tr>


                <% }

                    } catch (Exception e) {
                        System.out.println("Aschi");
                    }
                %>






            </table>
            <br>

            <input  type="button" id="cosm" value="Cosmetics" onclick="showCosm()" style="background-color: chocolate;width: 100px;overflow: hidden; font-size: 15px; text-align: center"> 
            <input type="text" id="text9" onkeyup="doSearch('text9', 't9');" style="margin-left: 110px">
            <br>
            <table id="t9" style="display: none;text-align: center;margin-left: 200px">
                <th style="color: blue;font-size: 15px;padding-left: -50px">Item(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">Price(tk)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">TotalSold(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">RecentSold(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">RemainigUnit</th>

                <%
                    try {
                        Statement st9 = conn.createStatement();

                        ResultSet rs9 = st9.executeQuery("select name,price,total_sold,recent_sold,remaining_item from cosmeticslist order by total_sold desc");

                         while (rs9.next()) {%>
                <tr>
                    <td style="color: green;font-size: 20px"><%=rs9.getString("name").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs9.getString("price").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs9.getString("total_sold").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs9.getString("recent_sold").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs9.getString("remaining_item").toString()%></td>

                </tr>


                <% }

                    } catch (Exception e) {
                        System.out.println("Aschi");
                    }
                %>





            </table>
            <br>
            <input  type="button" id="oth" value="Others" onclick="showOthers()" style="background-color: chocolate;width: 100px;overflow: hidden; font-size: 15px; text-align: center"> 
            <input type="text" id="text10"  onkeyup="doSearch('text10', 't10');" style="margin-left: 110px">
            <br>
            <table id="t10" style="display: none;text-align: center;margin-left: 200px">
                <th style="color: blue;font-size: 15px;padding-left: -50px">Item(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">Price(tk)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">TotalSold(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">RecentSold(unit)</th>
                <th style="color: blue;font-size: 15px;padding-left: 50px">RemainigUnit</th>

                <%
                    try {
                        Statement st10 = conn.createStatement();

                        ResultSet rs10 = st10.executeQuery("select name,price,total_sold,recent_sold,remaining_item from otherslist order by total_sold desc");

                     while (rs10.next()) {%>
                <tr>
                    <td style="color: green;font-size: 20px"><%=rs10.getString("name").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs10.getString("price").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs10.getString("total_sold").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs10.getString("recent_sold").toString()%></td>
                    <td style="color: green;font-size: 20px"><%=rs10.getString("remaining_item").toString()%></td>

                </tr>


                <% }

                    } catch (Exception e) {
                        System.out.println("Aschi");
                    }
                %>





            </table>

        </form>  





    </body>
    <script>
        var a = 0;
        var b = 0;
        var c = 0;
        var d = 0;
        var e = 0;
        var f = 0;
        var g = 0;
        var h = 0;
        var i = 0;
        var j = 0;

        function doSearch(tx, t1)
        {
            var text = document.getElementById(tx).value.toLowerCase().toString();

            var userTable = document.getElementById(t1);
            var targetColumn;
            for (var rowIndex = 0; rowIndex < userTable.rows.length; rowIndex++)
            {
                var rowData = '';
                if (rowIndex == 0)
                {
                    targetColumn = userTable.rows.item(rowIndex).cells.length;
                    continue;
                }

                for (var colIndex = 0; colIndex < targetColumn; colIndex++)
                {
                    rowData += userTable.rows.item(rowIndex).cells.item(colIndex).textContent;

                }
                if (rowData.toLowerCase().indexOf(text) == -1)
                {
                    userTable.rows.item(rowIndex).style.display = 'none';
                }
                else
                {
                    userTable.rows.item(rowIndex).style.display = 'table-row';

                }

            }

        }

        function showVeg()
        {
            if (a == 0)
            {
                document.getElementById("veg").value = 'HideList'.toString();
                document.getElementById("t1").style.display = "block";
                a = 1;
            }
            else if (a == 1)
            {
                document.getElementById("veg").value = 'Vegetables'.toString();
                document.getElementById("t1").style.display = "none";
                a = 0;
            }

        }
        function showGroc() {
            if (b == 0)
            {
                document.getElementById("groc").value = 'HideList'.toString();
                document.getElementById("t2").style.display = "block";
                b = 1;
            }
            else if (b == 1)
            {
                document.getElementById("groc").value = 'Groceries'.toString();
                document.getElementById("t2").style.display = "none";
                b = 0;
            }



        }
        function showMeat() {
            if (c == 0)
            {
                document.getElementById("meat").value = 'HideList'.toString();
                document.getElementById("t3").style.display = "block";
                c = 1;
            }
            else if (c == 1)
            {
                document.getElementById("meat").value = 'Meats'.toString();
                document.getElementById("t3").style.display = "none";
                c = 0;
            }



        }

        function showFish() {
            if (d == 0)
            {
                document.getElementById("fish").value = 'HideList'.toString();
                document.getElementById("t4").style.display = "block";
                d = 1;
            }
            else if (d == 1)
            {
                document.getElementById("fish").value = 'Fishes'.toString();
                document.getElementById("t4").style.display = "none";
                d = 0;
            }



        }
        function  showLiquid() {
            if (e == 0)
            {
                document.getElementById("liquid").value = 'HideList'.toString();
                document.getElementById("t5").style.display = "block";
                e = 1;
            }
            else if (e == 1)
            {
                document.getElementById("liquid").value = 'Liquides'.toString();
                document.getElementById("t5").style.display = "none";
                e = 0;
            }


        }

        function  showChockolat() {
            if (f == 0)
            {
                document.getElementById("chock").value = 'HideList'.toString();
                document.getElementById("t6").style.display = "block";
                f = 1;
            }
            else if (f == 1)
            {
                document.getElementById("chock").value = 'Chockolates'.toString();
                document.getElementById("t6").style.display = "none";
                f = 0;
            }


        }

        function  showCold() {
            if (g == 0)
            {
                document.getElementById("cold").value = 'HideList'.toString();
                document.getElementById("t7").style.display = "block";
                g = 1;
            }
            else if (g == 1)
            {
                document.getElementById("cold").value = 'Colddrinks'.toString();
                document.getElementById("t7").style.display = "none";
                g = 0;
            }


        }
        function  showEgg() {
            if (h == 0)
            {
                document.getElementById("egg").value = 'HideList'.toString();
                document.getElementById("t8").style.display = "block";
                h = 1;
            }
            else if (h == 1)
            {
                document.getElementById("egg").value = 'Eggs'.toString();
                document.getElementById("t8").style.display = "none";
                h = 0;
            }


        }

        function  showCosm() {
            if (i == 0)
            {
                document.getElementById("cosm").value = 'HideList'.toString();
                document.getElementById("t9").style.display = "block";
                i = 1;
            }
            else if (i == 1)
            {
                document.getElementById("cosm").value = 'Cosmetics'.toString();
                document.getElementById("t9").style.display = "none";
                i = 0;
            }


        }

        function  showOthers() {
            if (j == 0)
            {
                document.getElementById("oth").value = 'HideList'.toString();
                document.getElementById("t10").style.display = "block";
                j = 1;
            }
            else if (j == 1)
            {
                document.getElementById("oth").value = 'Others'.toString();
                document.getElementById("t10").style.display = "none";
                j = 0;
            }


        }





    </script>
</html>