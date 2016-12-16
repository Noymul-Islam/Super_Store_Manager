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

    <body id="msupplierinfo">
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
        </section>
         <br>
        <p style="margin-left: 50px;color: white">user : <%=mngr.getUserName()%></p><br>
         <form >
            <h2 style="color: white;margin-left: 450px"> Please Provide The Folllowing Information<h2/>
                <div  style="color:white;margin-left: 450px;margin-top: 100px;font-size: 30px">
                Name: <input type="text" id="name" style="margin-left: 300px;font-size: 20px"/>
                <br>
                <br>
                Phone:  <input type="text" id="phone" style="margin-left: 295px;font-size: 20px"/>
                <br>
                <br>
                Email:  <input type="text" id="email" style="margin-left: 300px;font-size: 20px"/>
                <br>
                <br>
                Address:  <input type="text" id="address" style="margin-left: 272px;font-size: 20px"/>
                <br>
                <br>
                Password: <input type="text" id="password" style="margin-left: 272px;font-size: 20px"/>
                <br>
                <br>
               
               <input type="button" id="loginbutton" value="Submit"  onclick="takeInfo()" style="width: 100px;height:30px; margin-left: 210px;font-size: 20px" />
             
                <div/>
                 
        </form>
    </body>
    <script>
        
         function takeInfo()
         {
             var name=document.getElementById("name").value;
             var contact=document.getElementById("phone").value;
             var email=document.getElementById("email").value;
             var address=document.getElementById("address").value;
             var password=document.getElementById("password").value;
             
             if(name==""||contact==""||email==""||address==""||password=="")
                 alert("No Field Should be empty1")
             
             else
             {
                   var jspcall = "managerSupplier?name="+name+"&phone="+contact+"&email="+email+"&address="+address+"&password="+password;
              window.location.href = jspcall;
            
                 
             }
            
             
         }
        
        
    </script>
    
</html>