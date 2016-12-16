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
        <title>Sign Up Form</title>


        <style>
            #submitbutton{
                background-color: Transparent;
                background-repeat:no-repeat;
                border: none;
                cursor:pointer;
                overflow: hidden;
                outline:none;
                height: 50px;
                width : 90px;
                font-size: 25px;
                color: white;
                text-align: center;
            }
            #submitbutton:hover{
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
            #tabledata{
                margin-top: 20px;
                height: 50px;
                width: 50px;
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
            body#home a#homenav,body#signup a#signnav,body#login a#loginnav,body#product a#productnav{
                color: red;
            }
            body {
                background-color:black;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
        </style>
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
                <script src="assets/js/html5shiv.js"></script>
                <script src="assets/js/respond.js"></script>
        <![endif]-->

        <!--[if IE 8]>
        <script src="assets/js/selectivizr.js"></script>
    <![endif]-->
    </head>

    <body id="signup">
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

        <!-- Home -->
        <section>

           
            <div>
                <div>
                    <div>
                        <h1 style="font-family: monospace;text-align: center;font-size: 40px;color: #FFF">
                            Update your info
                        </h1>

                    </div> <!-- /.header-wrapper -->
                    <div>
                        <form method="post" action="ProfileUpdateServlet" style="text-align: center;color: whitesmoke">
                            <table width="100%">

                                <th width="50%"></th>
                                <th width="50%" style="text-align: left"></th>

                                <% try {
                                        Statement st = conn.createStatement();
                                        ResultSet rs = st.executeQuery("select * from userinfo where id=" + Integer.parseInt(cu2.getID()));
                                        if (rs.next()) {%>
                                        <tr id="tabledata">
                                    <td>ID</td>
                                    <td style="color: #a3a2a2"><input type="text" value="<%=rs.getString("id")%>" readonly="readonly" name="id"></td>
                                </tr>

                                <tr id="tabledata">
                                    <td>Password</td>
                                    <td style="color: #a3a2a2"><input type="password" value="<%=rs.getString("password")%>" name="ChoosePassword"></td>
                                </tr>
                                <tr id="tabledata">
                                    <td>Phone Number</td>
                                    <td style="color: #a3a2a2"><input value="<%=rs.getString("phoneno")%>" name="PhoneNumber"></td>
                                </tr>
                                <tr id="tabledata">
                                    <td>City</td>
                                    <td style="color: #a3a2a2"><input value="<%=rs.getString("city")%>" name="City"></td>
                                </tr>
                                <tr id="tabledata">
                                    <td>Area</td>
                                    <td style="color: #a3a2a2"><input value="<%=rs.getString("area")%>" name="Area"></td>
                                </tr>
                                <tr id="tabledata">
                                    <td>Email</td>
                                    <td style="color: #a3a2a2"><input value="<%=rs.getString("houseno")%>" name="HouseNumber"></td>
                                </tr>
                                <%}%>

                                <%} catch (Exception e) {
                }%>
                            </table>
                            <input type="submit" value="Update" id="submitbutton">
                        </form>
                    </div>

                </div>
            </div> <!-- /.container -->
        </section> <!-- /#header -->




    </body>
</html>