<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>
            <form method="post" action="receivereq">
                <input type="text" id="in1" name="data" value="data1" disabled="true">
                <input type="button" onclick="setEdit()" value="edit">
                <input type="button" value="confirm" onclick="showHint(document.getElementById('in1').value)">
                </div>
                </body>
                <script>
                    function setEdit() {
                        document.getElementById('in1').disabled = false;
                    }
               
                        function showHint(str) {
                            var xhttp;
                            //str = str + "&q1=";
                           
                            xhttp = new XMLHttpRequest();
                            xhttp.open("POST", "receivereq?data=" + str, true);
                            xhttp.send();
                        }
                    
                </script>
                </html>
