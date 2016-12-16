<%-- 
    Document   : managerProductInfo2
    Created on : Mar 19, 2016, 9:21:25 PM
    Author     : Noymul Islam
--%>
<%@page import="java.sql.*"%>
<%@page import="MyPack.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body style="background-color: black">
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
    font-size: 16px;
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
        </style>
        <%Connection conn = null;
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
     }%>
        <nav>
            <h1 style="color: white" >Product Modifier Page</h1>
            <%CurrentUser cu2 = null;
            try {
                cu2 = (CurrentUser) session.getAttribute("cu");
                if (cu2 == null) {
                    response.sendRedirect("ReqFailed.jsp");
                }
            } catch (Exception e) {
                response.sendRedirect("UserLoginFailed.jsp");
            }%>
            <p style="color: white">seller : <%=cu2.getSellerID()%></p><br>
            <input type="button" id="loginbutton" value="ADDNEW" onclick="goToAddNewPage()"></input>
        </nav>


        <div style="background-color: grey;height: 100%;width:150px;left: 0px; position: fixed;overflow-y: auto ;" id="div1"  >

            <input  type="button" id="groc" value="Groceries" onclick="showMyElement('tbl1', 'txt1')" style="background-color: darkslategray;width: 100px;border:solid;  font-size: 15px;margin-left: 15px;margin-top: 70px;">
            <input  type="button" id="veg" value="Vegitables" onclick="showMyElement('tbl2', 'txt2')" style="background-color: darkslategray;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">      
            <input  type="button" id="meat" value="Meats" onclick="showMyElement('tbl3', 'txt3')" style="background-color: darkslategray;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">          
            <input  type="button" id="fish" value="Fishes" onclick="showMyElement('tbl4', 'txt4')" style="background-color: darkslategray;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">       
            <input  type="button" id="egg" value="Eggs" onclick="showMyElement('tbl5', 'txt5')" style="background-color: darkslategray;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">  
            <input  type="button" id="liquid" value="Liquids" onclick="showMyElement('tbl6', 'txt6')" style="background-color: darkslategray;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">  
            <input  type="button" id="chock" value="Chockolates" onclick="showMyElement('tbl7', 'txt7')" style="background-color: darkslategray;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">       
            <input  type="button" id="cosm" value="Cosmetics" onclick="showMyElement('tbl8', 'txt8')" style="background-color: darkslategray;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">  
            <input  type="button" id="cold" value="ColdDrinks" onclick="showMyElement('tbl9', 'txt9')" style="background-color: darkslategray;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">      
            <input  type="button" id="other" value="Others" onclick="showMyElement('tbl10', 'txt10')" style="background-color: darkslategray;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">  

        </div>
        <div style="background-color: white;margin-left: 142px; height: 800px;width: 1250px;position:fixed ; overflow-y: hidden;overflow-x: hidden">
            <form style="text-align: center">
                <input type="text" id="txt1" onkeyup="searchItem('txt1', 'tbl1')" value="search groc item" style=" background-color:lightgrey;margin-left: 510px;margin-top: 60px; height:30px;font-size: 20px;display: none" >
                <table id="tbl1" style="display: none" >
                    <th width="200px">Id</th>
                    <th width="200px">Name</th>
                    <th width="200px"></th>
                    <th width="200px"></th>
                    <%
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select id,name from grocerylist");
                            while (rs.next()) {%> 
                    <tr>
                        <td><%=rs.getString("id")%></td>
                        <td><%=rs.getString("name")%></td>    
                        <td><a href="SellerAddRemoveServlet?action=edit&id=<%=rs.getString("id")%>&tablename=grocerylist">Edit</a></td>
                        <td><a href="SellerAddRemoveServlet?action=remove&id=<%=rs.getString("id")%>&tablename=grocerylist">Remove</a></td>
                    </tr>
                     <%}
                    } catch (Exception e) {
                    }
                %>

                </table>      
                <input type="text" id="txt2" onkeyup="searchItem('txt2', 'tbl2')" value="search veg item" style=" background-color:lightgrey;margin-left: 510px;margin-top: 60px; height:30px;font-size: 20px;display: none" >
                <table id="tbl2" style="display: none" >
                    <th width="200px">Id</th>
                    <th width="200px">Name</th>
                    <th width="200px"></th>
                    <th width="200px"></th>

                     <%
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select id,name from vegetablelist");
                            while (rs.next()) {%> 
                    <tr>
                        <td><%=rs.getString("id")%></td>
                        <td><%=rs.getString("name")%></td>    
                        <td><a href="SellerAddRemoveServlet?action=edit&id=<%=rs.getString("id")%>&tablename=vegetablelist">Edit</a></td>
                        <td><a href="SellerAddRemoveServlet?action=remove&id=<%=rs.getString("id")%>&tablename=vegetablelist">Remove</a></td>
                    </tr>
                     <%}
                    } catch (Exception e) {
                    }
                %>

                </table>
                <input type="text" id="txt3" onkeyup="searchItem('txt3', 'tbl3')" value="search meat item" style=" background-color:lightgrey;margin-left: 510px;margin-top: 60px; height:30px;font-size: 20px;display: none" >
                <table id="tbl3" style="display: none" >
                    <th width="200px">Id</th>
                    <th width="200px">Name</th>
                    <th width="200px"></th>
                    <th width="200px"></th>

                    <%
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select id,name from meatslist");
                            while (rs.next()) {%> 
                    <tr>
                        <td><%=rs.getString("id")%></td>
                        <td><%=rs.getString("name")%></td>    
                        <td><a href="SellerAddRemoveServlet?action=edit&id=<%=rs.getString("id")%>&tablename=meatslist">Edit</a></td>
                        <td><a href="SellerAddRemoveServlet?action=remove&id=<%=rs.getString("id")%>&tablename=meatslist">Remove</a></td>
                    </tr>
                     <%}
                    } catch (Exception e) {
                    }
                %>
                </table>
                <input type="text" id="txt4" onkeyup="searchItem('txt4', 'tbl4')" value="search fish item" style=" background-color:lightgrey;margin-left: 510px;margin-top: 60px; height:30px;font-size: 20px;display: none" >
                <table id="tbl4" style="display: none" >
                    <th width="200px">Id</th>
                    <th width="200px">Name</th>
                    <th width="200px"></th>
                    <th width="200px"></th>

                    <%
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select id,name from fisheslist");
                            while (rs.next()) {%> 
                    <tr>
                        <td><%=rs.getString("id")%></td>
                        <td><%=rs.getString("name")%></td>    
                        <td><a href="SellerAddRemoveServlet?action=edit&id=<%=rs.getString("id")%>&tablename=fisheslist">Edit</a></td>
                        <td><a href="SellerAddRemoveServlet?action=remove&id=<%=rs.getString("id")%>&tablename=fisheslist">Remove</a></td>
                    </tr>
                     <%}
                    } catch (Exception e) {
                    }
                %>

                </table>
                <input type="text" id="txt5" onkeyup="searchItem('txt5', 'tbl5')" value="search egg item" style=" background-color:lightgrey;margin-left: 510px;margin-top: 60px; height:30px;font-size: 20px;display: none" >
                <table id="tbl5" style="display: none" >
                    <th width="200px">Id</th>
                    <th width="200px">Name</th>
                    <th width="200px"></th>
                    <th width="200px"></th>

                   <%
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select id,name from eggslist");
                            while (rs.next()) {%> 
                    <tr>
                        <td><%=rs.getString("id")%></td>
                        <td><%=rs.getString("name")%></td>    
                        <td><a href="SellerAddRemoveServlet?action=edit&id=<%=rs.getString("id")%>&tablename=eggslist">Edit</a></td>
                        <td><a href="SellerAddRemoveServlet?action=remove&id=<%=rs.getString("id")%>&tablename=eggslist">Remove</a></td>
                    </tr>
                     <%}
                    } catch (Exception e) {
                    }
                %>
                </table>

                <input type="text" id="txt6" onkeyup="searchItem('txt6', 'tbl6')" value="search liquid item" style=" background-color:lightgrey;margin-left: 510px;margin-top: 60px; height:30px;font-size: 20px;display: none" >
                <table id="tbl6" style="display: none" >
                    <th width="200px">Id</th>
                    <th width="200px">Name</th>
                    <th width="200px"></th>
                    <th width="200px"></th>

                   <%
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select id,name from liquidslist");
                            while (rs.next()) {%> 
                    <tr>
                        <td><%=rs.getString("id")%></td>
                        <td><%=rs.getString("name")%></td>    
                        <td><a href="SellerAddRemoveServlet?action=edit&id=<%=rs.getString("id")%>&tablename=liquidslist">Edit</a></td>
                        <td><a href="SellerAddRemoveServlet?action=remove&id=<%=rs.getString("id")%>&tablename=liquidslist">Remove</a></td>
                    </tr>
                     <%}
                    } catch (Exception e) {
                    }
                %>

                </table>

                <input type="text" id="txt7" onkeyup="searchItem('txt7', 'tbl7')" value="search chok item" style=" background-color:lightgrey;margin-left: 510px;margin-top: 60px; height:30px;font-size: 20px;display: none" >
                <table id="tbl7" style="display: none" >
                    <th width="200px">Id</th>
                    <th width="200px">Name</th>
                    <th width="200px"></th>
                    <th width="200px"></th>

                   <%
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select id,name from chockolateslist");
                            while (rs.next()) {%> 
                    <tr>
                        <td><%=rs.getString("id")%></td>
                        <td><%=rs.getString("name")%></td>    
                        <td><a href="SellerAddRemoveServlet?action=edit&id=<%=rs.getString("id")%>&tablename=chockolateslist">Edit</a></td>
                        <td><a href="SellerAddRemoveServlet?action=remove&id=<%=rs.getString("id")%>&tablename=chockolateslist">Remove</a></td>
                    </tr>
                     <%}
                    } catch (Exception e) {
                    }
                %>

                </table>
                <input type="text" id="txt8" onkeyup="searchItem('txt8', 'tbl8')" value="search cos item" style=" background-color:lightgrey;margin-left: 510px;margin-top: 60px; height:30px;font-size: 20px;display: none" >
                <table id="tbl8" style="display: none" >
                    <th width="200px">Id</th>
                    <th width="200px">Name</th>
                    <th width="200px"></th>
                    <th width="200px"></th>

                     <%
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select id,name from cosmeticslist");
                            while (rs.next()) {%> 
                    <tr>
                        <td><%=rs.getString("id")%></td>
                        <td><%=rs.getString("name")%></td>    
                        <td><a href="SellerAddRemoveServlet?action=edit&id=<%=rs.getString("id")%>&tablename=cosmeticslist">Edit</a></td>
                        <td><a href="SellerAddRemoveServlet?action=remove&id=<%=rs.getString("id")%>&tablename=cosmeticslist">Remove</a></td>
                    </tr>
                     <%}
                    } catch (Exception e) {
                    }
                %>

                </table>
                <input type="text" id="txt9" onkeyup="searchItem('txt9', 'tbl9')" value="search col item" style=" background-color:lightgrey;margin-left: 510px;margin-top: 60px; height:30px;font-size: 20px;display: none" >
                <table id="tbl9" style="display: none" >
                    <th width="200px">Id</th>
                    <th width="200px">Name</th>
                    <th width="200px"></th>
                    <th width="200px"></th>

                    <%
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select id,name from colddrinkslist");
                            while (rs.next()) {%> 
                    <tr>
                        <td><%=rs.getString("id")%></td>
                        <td><%=rs.getString("name")%></td>    
                        <td><a href="SellerAddRemoveServlet?action=edit&id=<%=rs.getString("id")%>&tablename=colddrinkslist">Edit</a></td>
                        <td><a href="SellerAddRemoveServlet?action=remove&id=<%=rs.getString("id")%>&tablename=colddrinkslist">Remove</a></td>
                    </tr>
                     <%}
                    } catch (Exception e) {
                    }
                %>

                </table>
                <input type="text" id="txt10" onkeyup="searchItem('txt10', 'tbl10')" value="search oth item" style=" background-color:lightgrey;margin-left: 510px;margin-top: 60px; height:30px;font-size: 20px;display: none" >
                <table id="tbl10" style="display: none" >
                    <th width="200px">Id</th>
                    <th width="200px">Name</th>
                    <th width="200px"></th>
                    <th width="200px"></th>

                     <%
                        try {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select id,name from otherslist");
                            while (rs.next()) {%> 
                    <tr>
                        <td><%=rs.getString("id")%></td>
                        <td><%=rs.getString("name")%></td>    
                        <td><a href="SellerAddRemoveServlet?action=edit&id=<%=rs.getString("id")%>&tablename=otherslist">Edit</a></td>
                        <td><a href="SellerAddRemoveServlet?action=remove&id=<%=rs.getString("id")%>&tablename=otherslist">Remove</a></td>
                    </tr>
                     <%}
                    } catch (Exception e) {
                    }
                %>

                </table>
            </form>
        </div>

    </body>
    <script>
        function showMyElement(eid, eid2) {

            var flg = 0;
            var flg2 = 0;

            var index;
            var index2;
            var a = ['tbl1', 'tbl2', 'tbl3', 'tbl4', 'tbl5', 'tbl6', 'tbl7', 'tbl8', 'tbl9', 'tbl10'];
            var b = ['txt1', 'txt2', 'txt3', 'txt4', 'txt5', 'txt6', 'txt7', 'txt8', 'txt9', 'txt10'];
            for (index = 0; index < a.length; ++index) {
                if (a[index] === eid) {
                    document.getElementById(a[index]).style.display = "block";
                    flg = 1;
                }
                else
                    document.getElementById(a[index]).style.display = "none";
                //console.log(a[index]);
            }

            for (index2 = 0; index2 < b.length; ++index2) {
                if (b[index2] === eid2) {
                    document.getElementById(b[index2]).style.display = "block";
                    flg2 = 1;
                }
                else
                    document.getElementById(b[index2]).style.display = "none";
                //console.log(a[index]);
            }


        }

        function searchItem(eidtxt, eidtbl) {
            var searchText;
            var targetTable;
            var index;
            var a = ['tbl1', 'tbl2', 'tbl3', 'tbl4', 'tbl5', 'tbl6', 'tbl7', 'tbl8', 'tbl9', 'tbl10'];
            var b = ['txt1', 'txt2', 'txt3', 'txt4', 'txt5', 'txt6', 'txt7', 'txt8', 'txt9', 'txt10'];
            for (index = 0; index < a.length; ++index) {
                if (b[index] === eidtxt) {
                    searchText = document.getElementById(b[index]).value;
                    targetTable = document.getElementById(a[index]);
                    break;
                }
            }

            var targetTableColCount;
            for (var rowIndex = 0; rowIndex < targetTable.rows.length; rowIndex++) {
                var rowData = '';
                if (rowIndex == 0) {
                    targetTableColCount = targetTable.rows.item(rowIndex).cells.length;
                    continue; //do not execute further code for header row.
                }
                for (var colIndex = 0; colIndex < targetTableColCount; colIndex++) {
                    rowData += targetTable.rows.item(rowIndex).cells.item(colIndex).textContent;
                }
                if (rowData.indexOf(searchText) == -1)
                    targetTable.rows.item(rowIndex).style.display = 'none';
                else
                    targetTable.rows.item(rowIndex).style.display = 'table-row';
            }
        }
        
        function goToAddNewPage(){
            var jspcall = "SellerAddNewProduct.jsp";
            window.location.href = jspcall;
        }

    </script>
</html>
