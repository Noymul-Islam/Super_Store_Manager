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

            ManagerInfoDAO mngr = null;
            try {
                mngr = (ManagerInfoDAO) session.getAttribute("mngrdao");
            } catch (Exception e) {
                response.sendRedirect("UserLoginFailed.jsp");
            }

        %>
    </head>

    <body id="mcoin">
        <!-- Home -->
        <section>
            <nav>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div>
                    <ul>
                        <li ><a href="LogOutServlet?action=manager">LogOut</a></li>
                        <li ><a id="msellernav" href="managersellerAccess.jsp">Seller Access</a></li>
                        <li ><a id="mcoinnav" href="managerCoinconfigure.jsp">Coin Configure</a></li>
                        <li ><a id="msuppliernav" href="managersupplierInfo.jsp">Suppliers Options</a></li>
                        <li ><a id="mproductinfonav" href="managerProductSort?selection=TotalSold&Item=groc">Products Info</a></li>
                        <li ><a id="mcustomernav" href="managerCustomerInfo.jsp">Customers Info</a></li>
                        <li ><a id="mhomenav" href="ManagerHomePage.jsp">Home</a></li>
                    </ul> <!-- /.nav -->
                </div><!-- /.navbar-collapse -->
            </nav>
            <br>
            <p style="margin-left: 50px;color: white">user : <%=mngr.getUserName()%></p><br>

        </section> <!-- /#header -->
        <%
            try {
                Statement st = conn.createStatement();

                ResultSet rs = st.executeQuery("select limit_value,rate from coingenerationinfo");

                while (rs.next()) {%>
        <br>
        <br>
        <form style="text-align: center;margin-left: 300px">
            <table>
                <th></th>
                <th></th>
                <th></th>
                <tr>
                    <td>Limit Value</td>
                    <td><input type="text1" id="t1" value="<%= rs.getInt("limit_value")%>" readonly="readonly"></td>
                    <td><input type="button" value="Edit"  onclick="makeEditable('t1')" style="background-color: chocolate"/></td>
                </tr>
                <tr>
                    <td>Rate</td>
                    <td><input type="text2" id="t2" value="<%= rs.getInt("rate")%>" readonly="readonly"> </td>
                    <td><input type="button" value="Edit"  onclick="makeEditable('t2')" style="background-color: chocolate"/></td>
                </tr>

            </table>

        </form>
        <br>
        <br>
        <br>
        <input type="button" value="Save"  onclick="saveIt()" style="height: 30px;width: 120px;margin-left: 550px;background-color: bisque"/>

        <!--  <div style="color:white;margin-left: 500px;;font-size: 25px">
              Taka:     <input type="text1" id="t1" value="<%= rs.getInt("limit_value")%>" readonly="readonly">
              <input type="button" value="Edit"  onclick="makeEditable('t1')" style="background-color: chocolate"/>
  
              <br>
              <br>
              Coins:    <input type="text2" id="t2" value="<%= rs.getInt("rate")%>" readonly="readonly"> 
              <input type="button" value="Edit"  onclick="makeEditable('t2')" style="background-color: chocolate"/>
              <br>
              <br>
              <input type="button" value="Save"  onclick="saveIt()"style="background-color: bisque;height: 30px;width: 100px ;margin-left: 100px"/>
          </div>-->
        <%
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        %>
    </body>
    <script>
        function makeEditable(bd) {

            document.getElementById(bd).removeAttribute('readonly');
            // $("#"+bd).prop("readonly",false);

        }
        function saveIt() {

            var text = document.getElementById('t1').value.toString();
            var text2 = document.getElementById('t2').value.toString();
            alert("Change confirm??");
            var jspcall = "managerCoin?taka=" + text + "&coin=" + text2;
            window.location.href = jspcall;


        }

    </script>
</html>