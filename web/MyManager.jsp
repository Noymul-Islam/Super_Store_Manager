<%-- 
    Document   : MyManager
    Created on : Mar 22, 2016, 6:34:45 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body >
       
        <div style="background-color: black;height: 100%;width:150px;left: 0px; position: fixed;overflow-y: auto ;" id="div1"  >
            
            <input  type="button" value="Home" onclick="goToHome()" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">  
            <br>
            <br>
            <br>
            <p style="color: white">OverAllStat</p>
            <input  type="button" value="TotalSold" onclick="showIt('total_sold')" style="background-color: white;width: 100px;border:solid;  font-size: 15px;margin-left: 15px;margin-top: 70px;">
            <input  type="button" value="RecentSold" onclick="showIt('recent_sold')" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">      
            <input  type="button" value="MonthsLeft" onclick="showIt('expdate')" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">          
            <input  type="button" value="ItemLeft" onclick="showIt('remaining_item')" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">       
            <input  type="button" value="Yearly stat" onclick="showIt('yeardata')" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">       
            <input  type="button" value="Monthly stat" onclick="showIt('monthdata')" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">       
            <br>
            <br>
            <br>
            <p style="color: white">IndividualStat</p>
            <br>
            <br>
            <input  type="button" value="Gro" onclick="showIt('gro')" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">       
            <input  type="button" value="Veg" onclick="showIt('veg')" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">       
            <input  type="button" value="Liquid" onclick="showIt('liq')" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">       
            <input  type="button" value="Egg" onclick="showIt('egg')" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">       
            <input  type="button" value="Meat" onclick="showIt('meat')" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">       
            <input  type="button" value="Fish" onclick="showIt('fish')" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">       
            <input  type="button" value="Chocklt" onclick="showIt('chock')" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">       
            <input  type="button" value="Colddrnk" onclick="showIt('cold')" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">       
            <input  type="button" value="Cosmtc" onclick="showIt('cos')" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">       
            <input  type="button" value="Others" onclick="showIt('oth')" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">       
            <br>
            <br>
            


        </div>
        <div style="width: 800px;height:800px">
            <div id="chart_div"></div>
        </div>
    </body>
    <script>
        function showIt(action){
            var jspcall = "ManagerGraphServlet?action="+action;
            window.location.href = jspcall;
        }
        function goToHome(){
            var jspcall = "ManagerHomePage.jsp";
            window.location.href = jspcall;
        }
    </script>
</html>
