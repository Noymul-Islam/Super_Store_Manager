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
            ManagerInfoDAO mngr=null;
            try{
                 mngr = (ManagerInfoDAO) session.getAttribute("mngrdao");
            }
            catch(Exception e){
                response.sendRedirect("UserLoginFailed.jsp");
            }
            
        %>
    </head>

    <body id="mhome">
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
            <div>
                <h1 style="font-family: monospace;font-size: 40px;color: whitesmoke;text-align: center">
                    WELCOME <%=mngr.getUserName()%>!!!
                </h1>
                <form style="text-align: center" method="post" action="managerInsertData">
                    <p>It's Been A Month Or A Year!!!<p>
                    <table style="margin-left: 485px">
                    <th></th>
                    <th>Name of Year or Month</th>
                    <tr>
                        <td>
                            <select name="action">
                              <option value="year">YearData</option>
                              <option value="month">Month</option>
                          </select>
                        </td>
                        <td><input type="text" name="moy" value="0"><td>
                    </tr>
                    </table>
                <input type="submit" id="loginbutton" value="Insert">
                </form>
            </div> <!-- /.header-wrapper -->
        </section> <!-- /#header -->
    </body>
    
</html>