<%-- 
    Document   : managerCustomerInfo
    Created on : Dec 15, 2015, 10:14:03 PM
    Author     : Shorot
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="MyPack.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Info</title>
        <link rel="stylesheet" type="text/css" href="CSS/SellerPage/ManagerPage.css">
    </head>
       
   
 
    <body id="mcustomerinfo">
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
            
            
            ManagerInfoDAO mngr=null;
            try{
                 mngr = (ManagerInfoDAO) session.getAttribute("mngrdao");
            }
            catch(Exception e){
                response.sendRedirect("UserLoginFailed.jsp");
            }
            
        
        %>
               
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
        <br>
        <p style="margin-left: 50px;color: white">user : <%=mngr.getUserName()%></p><br>
        <form  id="myForm" style="text-align: center">
            <p style="color: white">Search by Username <input type="text" id="searchUser" class="search_box" onkeyup="doUserSearch()"/></p> 
             
            <table id="b1" style="margin-left: 150px">
            <th >Username</th>
            <th >PhoneNo</th>
            <th >TotalPurchased</th>
            <th >Coins</th>
            <%
            try{
                
                Statement st=conn.createStatement();
  
            ResultSet rs=st.executeQuery("select usercoins.id,username,coins,phoneno,total_purchased from userinfo,usercoins where "
                    + "userinfo.id=usercoins.id and userinfo.id>0 order by total_purchased desc");
         
     while(rs.next()){ %>
            <tr >
          <td ><%=rs.getString("username").toString()%></td>
          <td ><%=rs.getString("phoneno").toString()%></td>
          <td ><%=rs.getDouble("total_purchased")%></td>
          <td ><input type="text" value="<%=rs.getInt("coins")%>" id="<%=rs.getInt("id")%>" readonly="readonly"/></td>
          <td ><input type="button" value="Edit"  onclick="enable(<%=rs.getInt("id")%>);"style="background-color: chocolate"/></td>
          <td ><input type="button" value="Save"  onclick="saveIt(<%=rs.getInt("id")%>);"style="background-color: bisque"/></td>
       </tr>
              
    
        
                
    <%}
      
   
   }
    catch(Exception e){
        System.out.println("Oeta aslaamto!");
     System.out.println(e);
    }
            
            %>
           
            
            
        </table>
            <br>
            <br>
        <input type="button" value="Alert All"  onclick="alertAll();"style="background-color: bisque"/>
  </form>
        
        
    </body>
    <script>
       function doUserSearch(){
       
           var text=document.getElementById('searchUser').value.toLowerCase().toString();
          
           var  userTable=document.getElementById('b1');
           var targetColumn;
           for(var rowIndex=0;rowIndex<userTable.rows.length;rowIndex++)
           {
               var rowData='';
               if(rowIndex==0)
               {
                   targetColumn = userTable.rows.item(rowIndex).cells.length;
                   continue;
               }
               
               for(var colIndex=0;colIndex<targetColumn;colIndex++)
               {
                   rowData+=userTable.rows.item(rowIndex).cells.item(colIndex).textContent;
                   
               }
               if(rowData.toLowerCase().indexOf(text)==-1)
               {
                   userTable.rows.item(rowIndex).style.display = 'none';
               }
               else 
               {
                    userTable.rows.item(rowIndex).style.display = 'table-row';
                   
               }
               
           }
           
       } 
       function enable(bd){
          
           document.getElementById(bd).removeAttribute('readonly');
          // $("#"+bd).prop("readonly",false);
          
       }
       function saveIt(id){
           
           var text=document.getElementById(id).value.toString();
           alert(text);
           var jspcall = "ManagerCustomerChange?coin="+text+"&id="+id;
           window.location.href = jspcall;
           
           
       }
       function alertAll(){
           
           
           var jspcall = "ManagerAlertAll.jsp";
           window.location.href = jspcall;
           
           
       }

        
    </script>
</html>
