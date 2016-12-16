<%-- 
    Document   : managerProductInfo2
    Created on : Mar 19, 2016, 9:21:25 PM
    Author     : Noymul Islam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="MyPack.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body style="background-color: black">
           
        <nav>
            <%ManagerInfoDAO mngr=null;
            
            try{
                 mngr = (ManagerInfoDAO) session.getAttribute("mngrdao");
            }
            catch(Exception e){}%>
            <h1 style="color: white">User : <%=mngr.userName %></h1>
            
           
        </nav>
        
      
        <div style="background-color: black;height: 100%;width:150px;left: 0px; position: fixed;overflow-y: auto ;" id="div1"  >
            
            
            <input  type="button" id="groc" value="Groceries" onclick="showGroc()" style="background-color: white;width: 100px;border:solid;  font-size: 15px;margin-left: 15px;margin-top: 70px;">
            <input  type="button" id="veg" value="Vegitables" onclick="showVeg()" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">      
            <input  type="button" id="meat" value="Meats" onclick="showMeat()" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">          
            <input  type="button" id="meat" value="Fishes" onclick="showFish()" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">       
            <input  type="button" id="meat" value="Eggs" onclick="showEgg()" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">  
            <input  type="button" id="liquid" value="Liquids" onclick="showLiquid()" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">  
            <input  type="button" id="chock" value="Chockolates" onclick="showChockolate()" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">       
             <input  type="button" id="cosm" value="Cosmetics" onclick="showCosmetics()" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">  
             <input  type="button" id="cold" value="ColdDrinks" onclick="showColdDrinks()" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">      
               <input  type="button" id="other" value="Others" onclick="showOthers()" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">  
               <input  type="button" id="other" value="Overview" onclick="goHome()" style="background-color: white;width: 100px;border:solid; font-size: 15px;margin-left: 15px;margin-top: 20px">  
          
        </div>
       
        <div style="text-align: center;background-color: black;margin-left: 142px; height: 800px;width: 1250px;position:fixed ; overflow-y: hidden;overflow-x: hidden">
            <input type="text" id="txt1" onkeyup="searchTable()" style=" background-color:white;margin-left: 510px;margin-top: 60px; height:30px;font-size: 20px" >
            <table id="tbl1" style="color: white">
             <th style="color: blue;font-size: 15px;padding-left: -50px">Item(unit)</th>
            
            <th style="color: blue;font-size: 15px;padding-left: 50px">TotalSold(unit)</th>
            <th style="color: blue;font-size: 15px;padding-left: 50px">RecentSold(unit)</th>
            <th style="color: blue;font-size: 15px;padding-left: 50px">RemainigUnit</th>
            <th style="color: blue;font-size: 15px;padding-left: 50px">ExpireDate</th>
            <th style="color: blue;font-size: 15px;padding-left: 50px">Remaining(Month)</th>
            <th style="color: blue;font-size: 15px;padding-left: 50px">SortBy:</th>
            <th style="margin-right: 20px"><select id="s1">
                   
  <option value="TotalSold">TotalSold</option>
  <option value="RecentSold">RecentSold</option>
  <option value="RemainingItem">RemainingItem</option>
              </select></th>
               
               <th><input type="button" onclick="doSort()" id="btn1" value="OK" style="width: 35px"></th>
               <% int i;
               SavingData obj=(SavingData)request.getAttribute("obj");
                   for(i=0;i<obj.counter;i++){
                       System.out.println("-->"+obj.Item[i]);
              // System.out.println(obj.Item[i]+""+"Ascciii");
               %>
               <tr>
                  <td style="text-align: center" ><%=obj.Item[i].toString() %></td>
                  
                  <td><%=obj.totalSold[i].toString() %> </td>
                  <td><%=obj.recentSold[i].toString() %> </td>
                  <td><%=obj.remainingUnit[i].toString() %> </td>
                  <td><%=obj.expireDate[i].toString() %> </td>
                 <td><%=obj.remainingMonth[i].toString() %> </td>
                  <% 
                   }
                 %>
                 </tr>
            </table>          
            
        </div>
        
    </body>
    <script>
      
         function showGroc()
        {
         
         var res= document.getElementById('s1').value;
            
             var jspcall = "managerProductSort?Item=groc"+"&selection="+res;
           window.location.href = jspcall;
           
        }
        function showVeg()
        {
        
         var res= document.getElementById('s1').value;
            //alert(res);
             var jspcall = "managerProductSort?Item=veg"+"&selection="+res;
           window.location.href = jspcall;
           
        }
        function showMeat(){
         
       
         var res= document.getElementById('s1').value;
            //alert(res);
             var jspcall = "managerProductSort?Item=meat"+"&selection="+res;
           window.location.href = jspcall;
        }
        function showFish(){
         
        
         var res= document.getElementById('s1').value;
            //alert(res);
             var jspcall = "managerProductSort?Item=fish"+"&selection="+res;
           window.location.href = jspcall;
        }
        function showEgg(){
         
        
         var res= document.getElementById('s1').value;
            //alert(res);
             var jspcall = "managerProductSort?Item=egg"+"&selection="+res;
           window.location.href = jspcall;
        }
        function showCosmetics(){
         
       
         var res= document.getElementById('s1').value;
            //alert(res);
             var jspcall = "managerProductSort?Item=cosm"+"&selection="+res;
           window.location.href = jspcall;
        }
        function showColdDrinks(){
         
         var res= document.getElementById('s1').value;
            //alert(res);
             var jspcall = "managerProductSort?Item=cold"+"&selection="+res;
           window.location.href = jspcall;
        }
        
        function showLiquid(){
         
         
         var res= document.getElementById('s1').value;
            //alert(res);
             var jspcall = "managerProductSort?Item=liq"+"&selection="+res;
           window.location.href = jspcall;
            
            
        }
      function  showChockolate(){
          
      
        
         var res= document.getElementById('s1').value;
            //alert(res);
             var jspcall = "managerProductSort?Item=chock"+"&selection="+res;
           window.location.href = jspcall;
            
            
        }
      function  showOthers(){
          
      
         var res= document.getElementById('s1').value;
            //alert(res);
             var jspcall = "managerProductSort?Item=other"+"&selection="+res;
           window.location.href = jspcall;
            
        }
          
         function doSort()
        {
           
            var res= document.getElementById('s1').value;
            
           // alert(res);
           <%  
                   // ManagerInfoDAO mngr=null;
            try{
                 mngr = (ManagerInfoDAO) session.getAttribute("mngrdao");
            }
            catch(Exception e){
                response.sendRedirect("UserLoginFailed.jsp");
            }
           String type=mngr.item.toString();
          // System.out.println(type);
           %>
           
           <% if( type.equals("veg")){ %>
              //alert("veg");
                 var jspcall = "managerProductSort?Item=veg"+"&selection="+res;
           window.location.href = jspcall;
           <% } 
           
             else if(type.equals("meat")){ %>
          // alert("meat");   
           var jspcall = "managerProductSort?Item=meat"+"&selection="+res;
           window.location.href = jspcall;
           <% } 
           
             else if(type.equals("fish")){ %>
               var jspcall = "managerProductSort?Item=fish"+"&selection="+res;
           window.location.href = jspcall;
          <% }  
            else if(type.equals("egg")){ %>
               var jspcall = "managerProductSort?Item=egg"+"&selection="+res;
           window.location.href = jspcall;
         <%  } 
           else if(type.equals("cosm")){ %>
               var jspcall = "managerProductSort?Item=cosm"+"&selection="+res;
           window.location.href = jspcall;
          <% } 
           else if(type.equals("chock")){ %>
               var jspcall = "managerProductSort?Item=chock"+"&selection="+res;
           window.location.href = jspcall;
          <% } 
           else if(type.equals("cold")){ %>
                var jspcall = "managerProductSort?Item=cold"+"&selection="+res;
           window.location.href = jspcall;
          <% } 
          else if(type.equals("liq")){ %>
            var jspcall = "managerProductSort?Item=liq"+"&selection="+res;
           window.location.href = jspcall;   
          <% } 
          else if(type.equals("other")){ %>
               var jspcall = "managerProductSort?Item=other"+"&selection="+res;
           window.location.href = jspcall;
          <% } 
          else if(type.equals("groc")){ %>
             //alert("BUGGG");
            var jspcall = "managerProductSort?Item=groc"+"&selection="+res;
           window.location.href = jspcall;
           
               
         <%  } %>
           
            
        }
       function searchTable(){
       
       
       var text=document.getElementById('txt1').value.toLowerCase().toString();
         
           var  userTable=document.getElementById('tbl1');
           var targetColumn;
           //alert(""+userTable.rows.length);
           for(var rowIndex=0;rowIndex<userTable.rows.length;rowIndex++)
           {
               //alert(text); 
               var rowData='';
                
               if(rowIndex==0)
               {
                   targetColumn = userTable.rows.item(rowIndex).cells.length-3;
                  //alert(rowData); 
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
       function goHome(){
            var jspcall = "MyManager.jsp";
           window.location.href = jspcall;  
       }
    </script>
</html>
