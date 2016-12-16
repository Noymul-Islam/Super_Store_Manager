<!DOCTYPE html>
<!--[if IE 7 ]><html class="ie ie7 lte9 lte8 lte7" lang="en-US"><![endif]-->
<!--[if IE 8]><html class="ie ie8 lte9 lte8" lang="en-US">	<![endif]-->
<!--[if IE 9]><html class="ie ie9 lte9" lang="en-US"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
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
       
        <div style="float: right">
            <form method="post" action="SellerLogOutServlet"><input id="mybutton" type="submit" value="logout"/></form>
        </div>   
   
            <nav>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="nav-bar" >
                    <ul>
                        <li ><a id="ordernav" href="">Online Orders</a></li>
                        <li ><a id="editnav" href="">Edit Item</a></li>
                        <li ><a id="removenav" href="">Remove Item</a></li>
                        <li ><a id="addnav" href="">Add Item</a></li>
                        <li ><a id="billnav" href="">Generate Bill</a></li>
                        <li ><a id="homenav" href="SellerHomePage.jsp">Home</a></li>
                    </ul> <!-- /.nav -->
                </div><!-- /.navbar-collapse -->
            </nav>
            <div class="content-panel">
                <h1 style="font-family: monospace;font-size: 40px;color: whitesmoke;text-align: center">
                    WELCOME EMPLOYEE!!!
                </h1>
               
            </div> <!-- /.header-wrapper -->
    </body>
</html>