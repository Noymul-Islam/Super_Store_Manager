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
    
   

    <body id="home">
       
        <nav style="margin-top: 30px">
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="nav-bar" >
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
            CurrentUser cu2=null;
            try{
                 cu2 = (CurrentUser) session.getAttribute("cu");
            }
            catch(Exception e){
                response.sendRedirect("UserLoginFailed.jsp");
            }
            
        %>
        <div style="margin-top: 150px">
            
            <h1 style="font-family: monospace;font-size: 40px;color: whitesmoke;text-align: center">Hello Employee <%=cu2.getSellerID()%>!!!</h1>
            
        </div> 
    </body>
    
       
</html>