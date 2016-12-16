<%-- 
    Document   : newjsp
    Created on : Oct 22, 2015, 10:07:30 AM
    Author     : DELL
--%>
<%@page import="java.sql.*"%>
<%@page import="MyPack.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .loginbutton{
                background-color: Transparent;
                background-repeat:no-repeat;
                border: none;
                cursor:pointer;
                overflow: hidden;
                outline:none;
                height: 30px;
                width : 140px;
                font-size: 15px;
                color: white;
                text-align: center;
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
            .search_box {
                height: 17px;
                width: 150px;
                background-image: url("assets/homepage/images/Search_back.png");
                -webkit-background-size: cover;

                background-size: cover;
            }
            table {
                width: 800px;
                margin-left: 250px;
            }
            th {
                width: 200px;
            }
            #b1,#b3,#b5,#b7,#b9,#b11,#b13,#b15,#b17,#b19 {
                color: white;
            }
            #b2,#b4,#b6,#b8,#b10,#b12,#b14,#b16,#b18,#b20 {
                margin-right: 60px;
            }
            ul {
                list-style-type: none;
                padding: 0;
                overflow: hidden;
            }
            li{
                float: right;
            }
            nav a {
                display: block;
                width: 100px;
                height: 30px;
                color: white;
                font-size: 20px;
                text-decoration: none;
            }
            body#home a#homenav,body#signup a#signnav,body#login a#loginnav{
                color: red;
            }
            body {
                /*background: url("assets/homepage/images/header.png");*/
                background-color: black;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
            #logout{
                background-color: Transparent;
                background-repeat:no-repeat;
                border: none;
                cursor:pointer;
                overflow: hidden;
                outline:none;
                height: 30px;
                width : 100px;
                font-size: 20px;
                color: white;
            }

        </style>
        <title>Login Successful !!!</title>
    </head>
    <body style="overflow-y: auto;overflow-x: hidden">
        <nav>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div>
                <ul>

                    <li style="margin-top:40px"><a href="UserProfileUpdate.jsp">Update</a></li>
                    <li style="margin-top:40px"><a href="LogOutServlet?action=logouttologin">LogOut</a></li>
                    
                   <!-- <li style="margin-top:40px"><form method="post" action="LogOutServlet"><input id="logout" type="submit" value="logout"/></form></li> -->
                </ul> <!-- /.nav -->
            </div><!-- /.navbar-collapse -->
        </nav>

        <%
            CurrentUser cu2 = null;
            try {
                cu2 = (CurrentUser) session.getAttribute("cu");
            } catch (Exception e) {
                response.sendRedirect("UserLoginFailed.jsp");
            }
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
                 <h1 style="color: white;text-align: center" >Hello <%=cu2.getName()%> (<%=rs.getInt("coins")%> coins)</h1>
        <%}%>
        
            <%} catch (Exception e) {
            }%>
        



        <!--<table style="color: white;width :400px;margin-left: 445px" >
            <th>Product Category</th>
            <th>Search Bar</th>
        </table>-->
        <br>
        
        

        <form method="post" action="ReceiveReqServlet" style="text-align: center">
            <input class="loginbutton" onclick="showVeg()" type="button" value="ShowVegetable" id="b2"></input>
            <input style="margin-left: 330px" type="text" id="searchVegTerm" class="search_box" onkeyup="doVegSearch()"/>
            <br>
            <table id="b1" >

                <th></th>
                <th></th>
                <th>Item</th>
                <th>Price</th>
                <th>Amount(in kg)</th>
                    <%
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select name,price,ppath from vegetablelist");
                            while (rs.next()) {%> 



                <tr>
                    <td><input type="checkbox" name="vegitems" value=<%=rs.getString(1)%>></input></td>
                    <td><img src="<%=rs.getString("ppath")%>" style="height:80px;width: 80px" /></td>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <!--<td><input type="text" name="vegamount" size="6" value="0" ></input></td>-->
                    <td>
                          <select name="vegamount">
                              <option value="0">0</option>
                              <option value="1">1</option>
                              <option value="5">5</option>
                              <option value="10">10</option>
                              <option value="15">15</option>
                          </select>
                      </td>
                </tr>
                <%}
                    } catch (Exception e) {
                    }
                %>

            </table>
            <br>
            <input class="loginbutton" onclick="showGrocery()" type="button" value="ShowGrocery" id="b4"></input>
            <input style="display: none;margin-left: 330px" type="text" id="searchGroceryTerm" class="search_box" onkeyup="doGrocerySearch()" />
            <br>
            <table style="display: none" id="b3">
                <th></th>
                <th></th>
                <th>Item</th>
                <th>Price</th>
                <th>Amount(in kg)</th>
                    <%
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select name,price,ppath from grocerylist");
                            while (rs.next()) {%>
                <tr>
                    <td><input type="checkbox" name="groceryitems" value=<%=rs.getString(1)%>></input></td>
                    <td><img src="<%=rs.getString("ppath")%>" style="height:80px;width: 80px" /></td>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <!--<td><input type="text" name="groceryamount" size="6" value="0"></input></td>-->
                    <td>
                       <select name="groceryamount">
                          <option value="0">0</option>
                           <option value="1">1</option>
                           <option value="5">5</option>
                           <option value="10">10</option>
                           <option value="15">15</option>
                       </select>
                   </td>
                </tr>
                <%}
                    } catch (Exception e) {
                    }
                %> 
            </table>
            <br>
            <input class="loginbutton" onclick="showLiquids()" type="button" value="ShowLiquids" id="b6" ></input>
            <input style="display: none;margin-left: 330px" type="text" id="searchLiquidsTerm" class="search_box" onkeyup="doLiquidsSearch()" />
            <br>
            <table style="display: none" id="b5">
                <th></th>
                <th></th>
                <th>Item</th>
                <th>Price</th>
                <th>Amount(in ltr)</th>
                    <%
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select name,price,ppath from liquidslist");
                            while (rs.next()) {%>
                <tr>
                    <td><input type="checkbox" name="liquidsitems" value=<%=rs.getString(1)%>></input></td>
                    <td><img src="<%=rs.getString("ppath")%>" style="height:80px;width: 80px" /></td>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td>
                        <select name="liquidsamount">
                           <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="5">5</option>
                            <option value="10">10</option>
                            <option value="15">15</option>
                        </select>
                    </td>

                </tr>
                <%}
                    } catch (Exception e) {
                    }
                %> 
            </table>
            <br>
            <input class="loginbutton" onclick="showChockolates()" type="button" value="ShowChockolates" id="b8" ></input>
            <input style="display: none;margin-left: 330px" type="text" id="searchChockolatesTerm" class="search_box" onkeyup="doChockolatesSearch()"/>
            <br>
            <table style="display: none" id="b7">
                <th></th>
                <th></th>
                <th>Item</th>
                <th>Price</th>
                <th>Amount(in pkg)</th>
                    <%
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select name,price,ppath from chockolateslist");
                            while (rs.next()) {%>
                <tr>
                    <td><input type="checkbox" name="chockolatesitems" value=<%=rs.getString(1)%>></input></td>
                    <td><img src="<%=rs.getString("ppath")%>" style="height:80px;width: 80px" /></td>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td>
                        <select name="chockolatesamount">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="10">10</option>
                            <option value="20">20</option>                            
                        </select>
                    </td>

                </tr>
                <%}
                    } catch (Exception e) {
                    }
                %> 
            </table>
            <br>
            <input class="loginbutton" onclick="showEggs()" type="button" value="ShowEggs" id="b10" ></input>
            <input style="display: none;margin-left: 330px" type="text" id="searchEggsTerm" class="search_box" onkeyup="doEggsSearch()"/>
            <br>
            <table style="display: none" id="b9">
                <th></th>
                <th></th>
                <th>Item</th>
                <th>Price</th>
                <th>Amount</th>
                    <%
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select name,price,ppath from eggslist");
                            while (rs.next()) {%>
                <tr>
                    <td><input type="checkbox" name="eggsitems" value=<%=rs.getString(1)%>></input></td>
                    <td><img src="<%=rs.getString("ppath")%>" style="height:80px;width: 80px" /></td>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td>
                        <select name="eggsamount">
                            <option value="0">0</option>
                            <option value="4">4</option>
                            <option value="8">8</option>
                            <option value="16">16</option>
                            <option value="32">32</option>
                            <option value="36">36</option>                        
                        </select>
                    </td>

                </tr>
                <%}
                    } catch (Exception e) {
                    }
                %> 
            </table>
            <br>
            <input class="loginbutton" onclick="showMeats()" type="button" value="ShowMeats" id="b12" ></input>
            <input style="display: none;margin-left: 330px" type="text" id="searchMeatsTerm" class="search_box" onkeyup="doMeatsSearch()"/>
            <br>
            <table style="display: none" id="b11">
                <th></th>
                <th></th>
                <th>Item</th>
                <th>Price</th>
                <th>Amount</th>
                    <%
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select name,price,ppath from meatslist");
                            while (rs.next()) {%>
                <tr>
                    <td><input type="checkbox" name="meatsitems" value=<%=rs.getString(1)%>></input></td>
                    <td><img src="<%=rs.getString("ppath")%>" style="height:80px;width: 80px" /></td>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td>
                        <select name="meatsamount">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>    
                            <option value="8">8</option>    
                            <option value="10">10</option>    
                            <option value="15">15</option>    
                            <option value="20">20</option>    
                        </select>
                    </td>

                </tr>
                <%}
                    } catch (Exception e) {
                    }
                %> 
            </table>
            <br>
            <input class="loginbutton" onclick="showFishes()" type="button" value="ShowFishes" id="b14"></input>
            <input style="display: none;margin-left: 330px" type="text" id="searchFishesTerm" class="search_box" onkeyup="doFishesSearch()"/>
            <br>
            <table style="display: none" id="b13">
                <th></th>
                <th></th>
                <th>Item</th>
                <th>Price</th>
                <th>Amount</th>
                    <%
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select name,price,ppath from fisheslist");
                            while (rs.next()) {%>
                <tr>
                    <td><input type="checkbox" name="fishesitems" value=<%=rs.getString(1)%>></input></td>
                    <td><img src="<%=rs.getString("ppath")%>" style="height:80px;width: 80px" /></td>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td>
                        <select name="fishesamount">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>    
                            <option value="8">8</option>    
                            <option value="10">10</option>    
                            <option value="15">15</option>    
                            <option value="20">20</option>    
                        </select>
                    </td>

                </tr>
                <%}
                    } catch (Exception e) {
                    }
                %> 
            </table>
            <br>
            <input class="loginbutton" onclick="showColdDrinks()" type="button" value="ShowColdDrinks" id="b16" ></input>
            <input style="display: none;margin-left: 330px" type="text" id="searchColdDrinksTerm" class="search_box" onkeyup="doColdDrinksSearch()"/>
            <br>
            <table style="display: none" id="b15">
                <th></th>
                <th></th>
                <th>Item</th>
                <th>Price</th>
                <th>Amount</th>
                    <%
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select name,price,ppath from colddrinkslist");
                            while (rs.next()) {%>
                <tr>
                    <td><input type="checkbox" name="colddrinksitems" value=<%=rs.getString(1)%>></input></td>
                    <td><img src="<%=rs.getString("ppath")%>" style="height:80px;width: 80px" /></td>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td>
                        <select name="colddrinksamount">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>    
                            <option value="8">8</option>    
                            <option value="10">10</option>    
                            <option value="15">15</option>    
                            <option value="20">20</option>    
                        </select>
                    </td>

                </tr>
                <%}
                    } catch (Exception e) {
                    }
                %> 
            </table>
            <br>
            <input class="loginbutton" onclick="showCosmetics()" type="button" value="ShowCosmetics" id="b18" ></input>
            <input style="display: none;margin-left: 330px" type="text" id="searchCosmeticsTerm" class="search_box" onkeyup="doCosmeticsSearch()"/>
            <br>
            <table style="display: none" id="b17">
                <th></th>
                <th>Item</th>
                <th>Price</th>
                <th>Amount</th>
                    <%
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select name,price,ppath from cosmeticslist");
                            while (rs.next()) {%>
                <tr>
                    <td><input type="checkbox" name="cosmeticsitems" value=<%=rs.getString(1)%>></input></td>
                    <td><img src="<%=rs.getString("ppath")%>" style="height:80px;width: 80px" /></td>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td>
                        <select name="cosmeticsamount">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>    
                            <option value="8">8</option>    

                        </select>
                    </td>

                </tr>
                <%}
                    } catch (Exception e) {
                    }
                %> 
            </table>
            <br>
            <input class="loginbutton" onclick="showOthers()" type="button" value="ShowOthers" id="b20" ></input>
            <input style="display: none;margin-left: 330px" type="text" id="searchOthersTerm" class="search_box" onkeyup="doOthersSearch()"/>
            <br>
            <table style="display: none" id="b19">
                <th></th>
                <th>Item</th>
                <th>Price</th>
                <th>Amount</th>
                    <%
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select name,price,ppath from otherslist");
                            while (rs.next()) {%>
                <tr>
                    <td><input type="checkbox" name="othersitems" value=<%=rs.getString(1)%>></input></td>
                    <td><img src="<%=rs.getString("ppath")%>" style="height:80px;width: 80px" /></td>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td>
                        <select name="othersamount">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>    
                            <option value="8">8</option>    

                        </select>
                    </td>

                </tr>
                <%}
                    } catch (Exception e) {
                    }
                %> 
            </table>
            <br>
            <input style="margin-bottom: 100px" class="loginbutton" type="submit" value="GenerateBill" >


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

        function showVeg() {
             document.getElementById("b1").style.display = "block";
                document.getElementById("b3").style.display = "none";
                document.getElementById("b5").style.display = "none";
                document.getElementById("b7").style.display = "none";
                document.getElementById("b9").style.display = "none";
                document.getElementById("b11").style.display = "none";
                document.getElementById("b13").style.display = "none";
                document.getElementById("b15").style.display = "none";
                document.getElementById("b17").style.display = "none";
                document.getElementById("b19").style.display = "none";
                document.getElementById("searchVegTerm").style.display = "block";
                document.getElementById("searchGroceryTerm").style.display = "none";
                document.getElementById("searchLiquidsTerm").style.display = "none";
                document.getElementById("searchChockolatesTerm").style.display = "none";
                document.getElementById("searchEggsTerm").style.display = "none";
                document.getElementById("searchMeatsTerm").style.display = "none";
                 document.getElementById("searchFishesTerm").style.display = "none";
                 document.getElementById("searchColdDrinksTerm").style.display = "none";
                 document.getElementById("searchCosmeticsTerm").style.display = "none";
                 document.getElementById("searchOthersTerm").style.display = "none";

        }
        function showGrocery() {
            document.getElementById("b1").style.display = "none";
                document.getElementById("b3").style.display = "block";
                document.getElementById("b5").style.display = "none";
                document.getElementById("b7").style.display = "none";
                document.getElementById("b9").style.display = "none";
                document.getElementById("b11").style.display = "none";
                document.getElementById("b13").style.display = "none";
                document.getElementById("b15").style.display = "none";
                document.getElementById("b17").style.display = "none";
                document.getElementById("b19").style.display = "none";
                document.getElementById("searchVegTerm").style.display = "none";
                document.getElementById("searchGroceryTerm").style.display = "block";
                document.getElementById("searchLiquidsTerm").style.display = "none";
                document.getElementById("searchChockolatesTerm").style.display = "none";
                document.getElementById("searchEggsTerm").style.display = "none";
                document.getElementById("searchMeatsTerm").style.display = "none";
                 document.getElementById("searchFishesTerm").style.display = "none";
                 document.getElementById("searchColdDrinksTerm").style.display = "none";
                 document.getElementById("searchCosmeticsTerm").style.display = "none";
                 document.getElementById("searchOthersTerm").style.display = "none";
        }
        function showLiquids() {
            document.getElementById("b1").style.display = "none";
                document.getElementById("b3").style.display = "none";
                document.getElementById("b5").style.display = "block";
                document.getElementById("b7").style.display = "none";
                document.getElementById("b9").style.display = "none";
                document.getElementById("b11").style.display = "none";
                document.getElementById("b13").style.display = "none";
                document.getElementById("b15").style.display = "none";
                document.getElementById("b17").style.display = "none";
                document.getElementById("b19").style.display = "none";
                document.getElementById("searchVegTerm").style.display = "none";
                document.getElementById("searchGroceryTerm").style.display = "none";
                document.getElementById("searchLiquidsTerm").style.display = "block";
                document.getElementById("searchChockolatesTerm").style.display = "none";
                document.getElementById("searchEggsTerm").style.display = "none";
                document.getElementById("searchMeatsTerm").style.display = "none";
                 document.getElementById("searchFishesTerm").style.display = "none";
                 document.getElementById("searchColdDrinksTerm").style.display = "none";
                 document.getElementById("searchCosmeticsTerm").style.display = "none";
                 document.getElementById("searchOthersTerm").style.display = "none";
        }
        function showChockolates() {
          document.getElementById("b1").style.display = "none";
                document.getElementById("b3").style.display = "none";
                document.getElementById("b5").style.display = "none";
                document.getElementById("b7").style.display = "block";
                document.getElementById("b9").style.display = "none";
                document.getElementById("b11").style.display = "none";
                document.getElementById("b13").style.display = "none";
                document.getElementById("b15").style.display = "none";
                document.getElementById("b17").style.display = "none";
                document.getElementById("b19").style.display = "none";
                document.getElementById("searchVegTerm").style.display = "none";
                document.getElementById("searchGroceryTerm").style.display = "none";
                document.getElementById("searchLiquidsTerm").style.display = "none";
                document.getElementById("searchChockolatesTerm").style.display = "block";
                document.getElementById("searchEggsTerm").style.display = "none";
                document.getElementById("searchMeatsTerm").style.display = "none";
                 document.getElementById("searchFishesTerm").style.display = "none";
                 document.getElementById("searchColdDrinksTerm").style.display = "none";
                 document.getElementById("searchCosmeticsTerm").style.display = "none";
                 document.getElementById("searchOthersTerm").style.display = "none";
        }
        function showEggs() {
          document.getElementById("b1").style.display = "none";
                document.getElementById("b3").style.display = "none";
                document.getElementById("b5").style.display = "none";
                document.getElementById("b7").style.display = "none";
                document.getElementById("b9").style.display = "block";
                document.getElementById("b11").style.display = "none";
                document.getElementById("b13").style.display = "none";
                document.getElementById("b15").style.display = "none";
                document.getElementById("b17").style.display = "none";
                document.getElementById("b19").style.display = "none";
                document.getElementById("searchVegTerm").style.display = "none";
                document.getElementById("searchGroceryTerm").style.display = "none";
                document.getElementById("searchLiquidsTerm").style.display = "none";
                document.getElementById("searchChockolatesTerm").style.display = "none";
                document.getElementById("searchEggsTerm").style.display = "block";
                document.getElementById("searchMeatsTerm").style.display = "none";
                 document.getElementById("searchFishesTerm").style.display = "none";
                 document.getElementById("searchColdDrinksTerm").style.display = "none";
                 document.getElementById("searchCosmeticsTerm").style.display = "none";
                 document.getElementById("searchOthersTerm").style.display = "none";
        }
        function showMeats() {
           document.getElementById("b1").style.display = "none";
                document.getElementById("b3").style.display = "none";
                document.getElementById("b5").style.display = "none";
                document.getElementById("b7").style.display = "none";
                document.getElementById("b9").style.display = "none";
                document.getElementById("b11").style.display = "block";
                document.getElementById("b13").style.display = "none";
                document.getElementById("b15").style.display = "none";
                document.getElementById("b17").style.display = "none";
                document.getElementById("b19").style.display = "none";
                document.getElementById("searchVegTerm").style.display = "none";
                document.getElementById("searchGroceryTerm").style.display = "none";
                document.getElementById("searchLiquidsTerm").style.display = "none";
                document.getElementById("searchChockolatesTerm").style.display = "none";
                document.getElementById("searchEggsTerm").style.display = "none";
                document.getElementById("searchMeatsTerm").style.display = "block";
                document.getElementById("searchFishesTerm").style.display = "none";
                document.getElementById("searchColdDrinksTerm").style.display = "none";
                document.getElementById("searchCosmeticsTerm").style.display = "none";
                document.getElementById("searchOthersTerm").style.display = "none";
        }
        function showFishes() {
            document.getElementById("b1").style.display = "none";
                document.getElementById("b3").style.display = "none";
                document.getElementById("b5").style.display = "none";
                document.getElementById("b7").style.display = "none";
                document.getElementById("b9").style.display = "none";
                document.getElementById("b11").style.display = "none";
                document.getElementById("b13").style.display = "block";
                document.getElementById("b15").style.display = "none";
                document.getElementById("b17").style.display = "none";
                document.getElementById("b19").style.display = "none";
                document.getElementById("searchVegTerm").style.display = "none";
                document.getElementById("searchGroceryTerm").style.display = "none";
                document.getElementById("searchLiquidsTerm").style.display = "none";
                document.getElementById("searchChockolatesTerm").style.display = "none";
                document.getElementById("searchEggsTerm").style.display = "none";
                document.getElementById("searchMeatsTerm").style.display = "none";
                document.getElementById("searchFishesTerm").style.display = "block";
                document.getElementById("searchColdDrinksTerm").style.display = "none";
                document.getElementById("searchCosmeticsTerm").style.display = "none";
                document.getElementById("searchOthersTerm").style.display = "none";
        }
        function showColdDrinks() {
            document.getElementById("b1").style.display = "none";
                document.getElementById("b3").style.display = "none";
                document.getElementById("b5").style.display = "none";
                document.getElementById("b7").style.display = "none";
                document.getElementById("b9").style.display = "none";
                document.getElementById("b11").style.display = "none";
                document.getElementById("b13").style.display = "none";
                document.getElementById("b15").style.display = "block";
                document.getElementById("b17").style.display = "none";
                document.getElementById("b19").style.display = "none";
                document.getElementById("searchVegTerm").style.display = "none";
                document.getElementById("searchGroceryTerm").style.display = "none";
                document.getElementById("searchLiquidsTerm").style.display = "none";
                document.getElementById("searchChockolatesTerm").style.display = "none";
                document.getElementById("searchEggsTerm").style.display = "none";
                document.getElementById("searchMeatsTerm").style.display = "none";
                document.getElementById("searchFishesTerm").style.display = "none";
                document.getElementById("searchColdDrinksTerm").style.display = "block";
                document.getElementById("searchCosmeticsTerm").style.display = "none";
                document.getElementById("searchOthersTerm").style.display = "none";
        }
        function showCosmetics() {
             document.getElementById("b1").style.display = "none";
                document.getElementById("b3").style.display = "none";
                document.getElementById("b5").style.display = "none";
                document.getElementById("b7").style.display = "none";
                document.getElementById("b9").style.display = "none";
                document.getElementById("b11").style.display = "none";
                document.getElementById("b13").style.display = "none";
                document.getElementById("b15").style.display = "none";
                document.getElementById("b17").style.display = "block";
                document.getElementById("b19").style.display = "none";
                document.getElementById("searchVegTerm").style.display = "none";
                document.getElementById("searchGroceryTerm").style.display = "none";
                document.getElementById("searchLiquidsTerm").style.display = "none";
                document.getElementById("searchChockolatesTerm").style.display = "none";
                document.getElementById("searchEggsTerm").style.display = "none";
                document.getElementById("searchMeatsTerm").style.display = "none";
                document.getElementById("searchFishesTerm").style.display = "none";
                document.getElementById("searchColdDrinksTerm").style.display = "none";
                document.getElementById("searchCosmeticsTerm").style.display = "block";
                document.getElementById("searchOthersTerm").style.display = "none";
        }
        function showOthers() {
            document.getElementById("b1").style.display = "none";
                document.getElementById("b3").style.display = "none";
                document.getElementById("b5").style.display = "none";
                document.getElementById("b7").style.display = "none";
                document.getElementById("b9").style.display = "none";
                document.getElementById("b11").style.display = "none";
                document.getElementById("b13").style.display = "none";
                document.getElementById("b15").style.display = "none";
                document.getElementById("b17").style.display = "none";
                document.getElementById("b19").style.display = "block";
                document.getElementById("searchVegTerm").style.display = "none";
                document.getElementById("searchGroceryTerm").style.display = "none";
                document.getElementById("searchLiquidsTerm").style.display = "none";
                document.getElementById("searchChockolatesTerm").style.display = "none";
                document.getElementById("searchEggsTerm").style.display = "none";
                document.getElementById("searchMeatsTerm").style.display = "none";
                document.getElementById("searchFishesTerm").style.display = "none";
                document.getElementById("searchColdDrinksTerm").style.display = "none";
                document.getElementById("searchCosmeticsTerm").style.display = "none";
                document.getElementById("searchOthersTerm").style.display = "block";
        }
        function doVegSearch() {
            var searchText = document.getElementById('searchVegTerm').value;
            var targetTable = document.getElementById('b1');
            var targetTableColCount;

            //Loop through table rows
            for (var rowIndex = 0; rowIndex < targetTable.rows.length; rowIndex++) {
                var rowData = '';

                //Get column count from header row
                if (rowIndex == 0) {
                    targetTableColCount = targetTable.rows.item(rowIndex).cells.length;
                    continue; //do not execute further code for header row.
                }

                //Process data rows. (rowIndex >= 1)
                for (var colIndex = 0; colIndex < targetTableColCount; colIndex++) {
                    rowData += targetTable.rows.item(rowIndex).cells.item(colIndex).textContent;
                }

                //If search term is not found in row data
                //then hide the row, else show
                if (rowData.indexOf(searchText) == -1)
                    targetTable.rows.item(rowIndex).style.display = 'none';
                else
                    targetTable.rows.item(rowIndex).style.display = 'table-row';
            }
        }
        function doGrocerySearch() {
            var searchText = document.getElementById('searchGroceryTerm').value;
            var targetTable = document.getElementById('b3');
            var targetTableColCount;

            //Loop through table rows
            for (var rowIndex = 0; rowIndex < targetTable.rows.length; rowIndex++) {
                var rowData = '';

                //Get column count from header row
                if (rowIndex == 0) {
                    targetTableColCount = targetTable.rows.item(rowIndex).cells.length;
                    continue; //do not execute further code for header row.
                }

                //Process data rows. (rowIndex >= 1)
                for (var colIndex = 0; colIndex < targetTableColCount; colIndex++) {
                    rowData += targetTable.rows.item(rowIndex).cells.item(colIndex).textContent;
                }

                //If search term is not found in row data
                //then hide the row, else show
                if (rowData.indexOf(searchText) == -1)
                    targetTable.rows.item(rowIndex).style.display = 'none';
                else
                    targetTable.rows.item(rowIndex).style.display = 'table-row';
            }
        }
        function doLiquidsSearch() {
            var searchText = document.getElementById('searchLiquidsTerm').value;
            var targetTable = document.getElementById('b5');
            var targetTableColCount;

            //Loop through table rows
            for (var rowIndex = 0; rowIndex < targetTable.rows.length; rowIndex++) {
                var rowData = '';

                //Get column count from header row
                if (rowIndex == 0) {
                    targetTableColCount = targetTable.rows.item(rowIndex).cells.length;
                    continue; //do not execute further code for header row.
                }

                //Process data rows. (rowIndex >= 1)
                for (var colIndex = 0; colIndex < targetTableColCount; colIndex++) {
                    rowData += targetTable.rows.item(rowIndex).cells.item(colIndex).textContent;
                }

                //If search term is not found in row data
                //then hide the row, else show
                if (rowData.indexOf(searchText) == -1)
                    targetTable.rows.item(rowIndex).style.display = 'none';
                else
                    targetTable.rows.item(rowIndex).style.display = 'table-row';
            }
        }
        function doChockolatesSearch() {
            var searchText = document.getElementById('searchChockolatesTerm').value;
            var targetTable = document.getElementById('b7');
            var targetTableColCount;

            //Loop through table rows
            for (var rowIndex = 0; rowIndex < targetTable.rows.length; rowIndex++) {
                var rowData = '';

                //Get column count from header row
                if (rowIndex == 0) {
                    targetTableColCount = targetTable.rows.item(rowIndex).cells.length;
                    continue; //do not execute further code for header row.
                }

                //Process data rows. (rowIndex >= 1)
                for (var colIndex = 0; colIndex < targetTableColCount; colIndex++) {
                    rowData += targetTable.rows.item(rowIndex).cells.item(colIndex).textContent;
                }

                //If search term is not found in row data
                //then hide the row, else show
                if (rowData.indexOf(searchText) == -1)
                    targetTable.rows.item(rowIndex).style.display = 'none';
                else
                    targetTable.rows.item(rowIndex).style.display = 'table-row';
            }
        }
        function doEggsSearch() {
            var searchText = document.getElementById('searchEggsTerm').value;
            var targetTable = document.getElementById('b9');
            var targetTableColCount;

            //Loop through table rows
            for (var rowIndex = 0; rowIndex < targetTable.rows.length; rowIndex++) {
                var rowData = '';

                //Get column count from header row
                if (rowIndex == 0) {
                    targetTableColCount = targetTable.rows.item(rowIndex).cells.length;
                    continue; //do not execute further code for header row.
                }

                //Process data rows. (rowIndex >= 1)
                for (var colIndex = 0; colIndex < targetTableColCount; colIndex++) {
                    rowData += targetTable.rows.item(rowIndex).cells.item(colIndex).textContent;
                }

                //If search term is not found in row data
                //then hide the row, else show
                if (rowData.indexOf(searchText) == -1)
                    targetTable.rows.item(rowIndex).style.display = 'none';
                else
                    targetTable.rows.item(rowIndex).style.display = 'table-row';
            }
        }
        function doMeatsSearch() {
            var searchText = document.getElementById('searchMeatsTerm').value;
            var targetTable = document.getElementById('b11');
            var targetTableColCount;

            //Loop through table rows
            for (var rowIndex = 0; rowIndex < targetTable.rows.length; rowIndex++) {
                var rowData = '';

                //Get column count from header row
                if (rowIndex == 0) {
                    targetTableColCount = targetTable.rows.item(rowIndex).cells.length;
                    continue; //do not execute further code for header row.
                }

                //Process data rows. (rowIndex >= 1)
                for (var colIndex = 0; colIndex < targetTableColCount; colIndex++) {
                    rowData += targetTable.rows.item(rowIndex).cells.item(colIndex).textContent;
                }

                //If search term is not found in row data
                //then hide the row, else show
                if (rowData.indexOf(searchText) == -1)
                    targetTable.rows.item(rowIndex).style.display = 'none';
                else
                    targetTable.rows.item(rowIndex).style.display = 'table-row';
            }
        }
        function doFishesSearch() {
            var searchText = document.getElementById('searchFishesTerm').value;
            var targetTable = document.getElementById('b13');
            var targetTableColCount;

            //Loop through table rows
            for (var rowIndex = 0; rowIndex < targetTable.rows.length; rowIndex++) {
                var rowData = '';

                //Get column count from header row
                if (rowIndex == 0) {
                    targetTableColCount = targetTable.rows.item(rowIndex).cells.length;
                    continue; //do not execute further code for header row.
                }

                //Process data rows. (rowIndex >= 1)
                for (var colIndex = 0; colIndex < targetTableColCount; colIndex++) {
                    rowData += targetTable.rows.item(rowIndex).cells.item(colIndex).textContent;
                }

                //If search term is not found in row data
                //then hide the row, else show
                if (rowData.indexOf(searchText) == -1)
                    targetTable.rows.item(rowIndex).style.display = 'none';
                else
                    targetTable.rows.item(rowIndex).style.display = 'table-row';
            }
        }
        function doColdDrinksSearch() {
            var searchText = document.getElementById('searchColdDrinksTerm').value;
            var targetTable = document.getElementById('b15');
            var targetTableColCount;

            //Loop through table rows
            for (var rowIndex = 0; rowIndex < targetTable.rows.length; rowIndex++) {
                var rowData = '';

                //Get column count from header row
                if (rowIndex == 0) {
                    targetTableColCount = targetTable.rows.item(rowIndex).cells.length;
                    continue; //do not execute further code for header row.
                }

                //Process data rows. (rowIndex >= 1)
                for (var colIndex = 0; colIndex < targetTableColCount; colIndex++) {
                    rowData += targetTable.rows.item(rowIndex).cells.item(colIndex).textContent;
                }

                //If search term is not found in row data
                //then hide the row, else show
                if (rowData.indexOf(searchText) == -1)
                    targetTable.rows.item(rowIndex).style.display = 'none';
                else
                    targetTable.rows.item(rowIndex).style.display = 'table-row';
            }
        }
        function doCosmeticsSearch() {
            var searchText = document.getElementById('searchCosmeticsTerm').value;
            var targetTable = document.getElementById('b17');
            var targetTableColCount;

            //Loop through table rows
            for (var rowIndex = 0; rowIndex < targetTable.rows.length; rowIndex++) {
                var rowData = '';

                //Get column count from header row
                if (rowIndex == 0) {
                    targetTableColCount = targetTable.rows.item(rowIndex).cells.length;
                    continue; //do not execute further code for header row.
                }

                //Process data rows. (rowIndex >= 1)
                for (var colIndex = 0; colIndex < targetTableColCount; colIndex++) {
                    rowData += targetTable.rows.item(rowIndex).cells.item(colIndex).textContent;
                }

                //If search term is not found in row data
                //then hide the row, else show
                if (rowData.indexOf(searchText) == -1)
                    targetTable.rows.item(rowIndex).style.display = 'none';
                else
                    targetTable.rows.item(rowIndex).style.display = 'table-row';
            }
        }
        function doOthersSearch() {
            var searchText = document.getElementById('searchOthersTerm').value;
            var targetTable = document.getElementById('b19');
            var targetTableColCount;

            //Loop through table rows
            for (var rowIndex = 0; rowIndex < targetTable.rows.length; rowIndex++) {
                var rowData = '';

                //Get column count from header row
                if (rowIndex == 0) {
                    targetTableColCount = targetTable.rows.item(rowIndex).cells.length;
                    continue; //do not execute further code for header row.
                }

                //Process data rows. (rowIndex >= 1)
                for (var colIndex = 0; colIndex < targetTableColCount; colIndex++) {
                    rowData += targetTable.rows.item(rowIndex).cells.item(colIndex).textContent;
                }

                //If search term is not found in row data
                //then hide the row, else show
                if (rowData.indexOf(searchText) == -1)
                    targetTable.rows.item(rowIndex).style.display = 'none';
                else
                    targetTable.rows.item(rowIndex).style.display = 'table-row';
            }
        }
    </script>
</html>    