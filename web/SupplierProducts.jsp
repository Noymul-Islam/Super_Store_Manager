<%-- 
    Document   : SupplierProducts
    Created on : Mar 24, 2016, 3:30:56 PM
    Author     : DELL
--%>
<%@page import="java.sql.*"%>
<%@page import="MyPack.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <link rel="stylesheet" type="text/css" href="CSS/SellerPage/ManagerPage.css">
    </head>
    <body>
        <h1 style="text-align: center;color: white" >Hello <%=cu2.getName()%></h1>
        <p style="text-align: center;color: white" >Here Goes Your Product's Performance Live Dashboard!!!</p>
        <form style="color: whitesmoke;text-align: center">
            <input type="button" id="loginbutton" value="logout" onclick="goHome()"> 
            <p style="color: white">SEARCH FOR IT!!!</p>
            <input type="text" id="go" onkeyup="doSearch()"> 
            <table id="b1" style="margin-top:150px;color: white">

                <th >P_ID</th>
                <th >P_NAME</th>
                <th >TOTAL_SOLD</th>
                <th >RECENT_SOLD</th>
                <th >AMMOUNT_SUPPLIED</th>
                <th >REMAINING_ITEM</th>
                
                <% try {
                Statement st = conn.createStatement();
                
ResultSet rs = st.executeQuery("select id,name,total_sold,recent_sold,ammount_supplied,ammount_supplied-recent_sold from vegetablelist where id in (select pid from supplierproductinfo where sid="+Long.parseLong(cu2.getID())+") union "+"select id,name,total_sold,recent_sold,ammount_supplied,ammount_supplied-recent_sold from grocerylist where id in (select pid from supplierproductinfo where sid="+Long.parseLong(cu2.getID())+") union "+"select id,name,total_sold,recent_sold,ammount_supplied,ammount_supplied-recent_sold from eggslist where id in (select pid from supplierproductinfo where sid="+Long.parseLong(cu2.getID())+") union "+"select id,name,total_sold,recent_sold,ammount_supplied,ammount_supplied-recent_sold from meatslist where id in (select pid from supplierproductinfo where sid="+Long.parseLong(cu2.getID())+") union "+"select id,name,total_sold,recent_sold,ammount_supplied,ammount_supplied-recent_sold from fisheslist where id in (select pid from supplierproductinfo where sid="+Long.parseLong(cu2.getID())+") union "+"select id,name,total_sold,recent_sold,ammount_supplied,ammount_supplied-recent_sold from chockolateslist where id in (select pid from supplierproductinfo where sid="+Long.parseLong(cu2.getID())+") union "+"select id,name,total_sold,recent_sold,ammount_supplied,ammount_supplied-recent_sold from colddrinkslist where id in (select pid from supplierproductinfo where sid="+Long.parseLong(cu2.getID())+") union "+"select id,name,total_sold,recent_sold,ammount_supplied,ammount_supplied-recent_sold from cosmeticslist where id in (select pid from supplierproductinfo where sid="+Long.parseLong(cu2.getID())+") union "+"select id,name,total_sold,recent_sold,ammount_supplied,ammount_supplied-recent_sold from liquidslist where id in (select pid from supplierproductinfo where sid="+Long.parseLong(cu2.getID())+") union "+"select id,name,total_sold,recent_sold,ammount_supplied,ammount_supplied-recent_sold from otherslist where id in (select pid from supplierproductinfo where sid="+Long.parseLong(cu2.getID())+")");
                
                
                
                
                
                
                
                
                
                
                
                 while (rs.next()) {%> 
                

                <tr id="tabledata" >
                    <td><%=rs.getString("id")%></td>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("total_sold")%></td>
                    <td><%=rs.getString("recent_sold")%></td>
                    <td><%=rs.getString("ammount_supplied")%></td>
                    <td><%=rs.getString("ammount_supplied-recent_sold")%></td>
                </tr>
               
                <%}}catch(Exception e){
                    System.out.println(e);
                }%>
            </table>

   
          
        </form>
    </body>
    <script>
        function doSearch(){
             var searchText = document.getElementById('go').value;
            var targetTable = document.getElementById('b1');
            var targetTableColCount;

            //Loop through table rows
            for (var rowIndex = 0; rowIndex < targetTable.rows.length; rowIndex++) {
                var rowData = '';

                //Get column count from header row
                if (rowIndex == 0) {
                    targetTableColCount = targetTable.rows.item(rowIndex).cells.length;
                    continue; //do not execute further code for header row.
                }

                //Process data rows. (rowIndex >= 1)
                for (var colIndex = 0; colIndex < targetTableColCount; colIndex++) {
                    rowData += targetTable.rows.item(rowIndex).cells.item(colIndex).textContent;
                }

                //If search term is not found in row data
                //then hide the row, else show
                if (rowData.indexOf(searchText) == -1)
                    targetTable.rows.item(rowIndex).style.display = 'none';
                else
                    targetTable.rows.item(rowIndex).style.display = 'table-row';
            }
        }
         function goHome() {
            var jspcall = "LogOutServlet?action=supplier";
            window.location.href = jspcall;
        }
    </script>
</html>
