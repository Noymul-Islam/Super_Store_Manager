<%@page import="java.sql.*"%>
<%@page import="MyPack.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Google Chart - Servlet 3</title>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
    // Load the Visualization API and the piechart package.
    google.load('visualization', '1.0', {
        'packages' : [ 'corechart' ]
    });

    // Set a callback to run when the Google Visualization API is loaded.
    google.setOnLoadCallback(drawChart);
    
    <%
        GraphData spo = null;
                try {
                    spo = (GraphData) request.getAttribute("dao");
                } catch (Exception e) {

                }
    
    %>

    // Callback that creates and populates a data table,
    // instantiates the pie chart, passes in the data and
    // draws it.
    function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
                    <%for(int i=0;i<10;++i){%>
                        [ '<%=spo.nameOfTypes[i]%>', <%=spo.totalSoldOfEachType[i]%> ],
                    <%}%>
                    ]);   
        /*var data = google.visualization.arrayToDataTable([
                                                              ['Country', 'Area(square km)'],
                                                              
                                                        ]);*/

        // Set chart options
        var options = {
            'title' : 'PRODUCT TYPE WISE GODOWN PERCENTAGE PIE CHART', //title which will be shown right above the Google Pie Chart
            is3D : true, //render Google Pie Chart as 3D
            pieSliceText: 'label', //on mouse hover show label or name of the Country
            tooltip :  {showColorCode: true}, // whether to display color code for a Country on mouse hover
            'width' : 900, //width of the Google Pie Chart
            'height' : 700 //height of the Google Pie Chart
        };

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
    }
</script>
                    <link href="http://www.tutorialspoint.com/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body >
    <div class="row">
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
        
        <div class="col-md-2"></div>
        <div class="col-md-8" >
        <div id="chart_div"></div>
    </div>
        
        
        
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
