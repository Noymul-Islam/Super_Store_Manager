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
        <title>Sign Up Form</title>


        <link rel="stylesheet" type="text/css" href="CSS/SellerPage/ManagerPage.css">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
                <script src="assets/js/html5shiv.js"></script>
                <script src="assets/js/respond.js"></script>
        <![endif]-->

        <!--[if IE 8]>
        <script src="assets/js/selectivizr.js"></script>
        <![endif]-->
        
           
    </head>

    <body id="login">
        <h1 style="font-family: monospace;text-align: center;font-size: 40px;color: #FFF">
           Manager Send Message
        </h1>
        <form method="post" action="SendMessageToAllServlet" style="color: whitesmoke;text-align: center">
            <input type="button" id="loginbutton" value="Home"  onclick="goToHome()"/>
            <table style="margin-left: 440px;margin-top:50px ">
                <th ></th>
                <th ></th>
                <tr id="tabledata">
                    <td>Message</td>
                    <td ><textarea name="msg" style="width:250px;height:150px;"></textarea></td>
                </tr>
            </table>
            <br>
            <input type="submit" id="loginbutton" value="Send">
        </form>
    </body>
    <script>
        function goToHome(){
            var jspcall = "ManagerHomePage.jsp";
            window.location.href = jspcall;
        }
    </script>
</html>