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

        
        <style>
            #loginbutton{
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
            #loginbutton:hover{
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
            table{
                margin-left: 450px;
            }
            #tabledata{
                margin-top: 20px;
                height: 50px;
                width: 50px;
            }
            th{
                width: 200px;
            }
            ul {
                list-style-type: none;
                padding: 0;
                overflow: hidden;
            }
            li{
                float: right;
            }
            a {
            
                color: white;
            
            }
            body#home a#homenav,body#signup a#signnav,body#login a#loginnav,body#product a#productnav{
                color: red;
            }
            body {
                background-color: black;
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

    <body id="login">

        <!-- Home -->
        <section>

           
            <div style="margin-top: 100px">
                <div>
                     <div>
                        <h1 style="font-family: monospace;text-align: center;font-size: 40px;color: #FFF">
                            Change Password
                        </h1>

                    </div> <!-- /.header-wrapper -->
                  
                    <div style="padding-top: 50px">
                        <form method="post" action="ManagerPasswordChange" style="text-align: center;color: whitesmoke">
                            <table >

                                <th ></th>
                                <th ></th>
                               

                                <tr id="tabledata">
                                    <td>Old Password</td>
                                    <td ><input name="previoususername"></td>
                                   
                                </tr>
                                <tr id="tabledata">
                                    <td>New Password</td>
                                    <td ><input type="password" name="newusername"></td>
                                    
                                </tr>
                              
                            </table>
                            <input type="submit" id="loginbutton" value="Submit">
                        </form>
                    </div>

                </div>
            </div> <!-- /.container -->
        </section> <!-- /#header -->

       

       
    </body>
</html>