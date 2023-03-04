<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>SmartInfo 2.0</title>
            <link rel="stylesheet" href="css/common.css" type="text/css"/>

            <efw:Client />
            <script>

                function selectShop(shopid){
                    Efw("common_chooseshop",{"shopid": shopid});
                }


            </script>
            <style>
           
                /* content */
                
                .content {
                    width: var(--width);
                    height: 55vh;
                    display: flex;
                    justify-content: center;
                    align-items: center;

                }


                .shoplist{
                    border-collapse: collapse;

                }
                .shoplist td {
                    width: 2000px;
                    max-width: 200px;
                    height: 45px;
                    max-height: 70px;
                    text-align: center;
                    border: 1px solid black;
                }
                .shoplist th{
                    background-color:#f6f6f6;
                }
               .link {
                    text-decoration-line: underline;
                    color: rgb(29, 18, 177);
                    cursor: pointer;
                } 
            </style>
        </head>

        <body onload="Efw('common_shoplistinit');">
            <div>
                <div class="head">
                    <div class="hleft">
                        <h1 style="height: 80px;line-height: 80px;margin-left:40px;">SmartInfo 2.0</h1>
                    </div>
                    <div class="hright">
                        <table style="float: right;width: 100%;color: aliceblue;">
                            <tr>
                                <td>
                                    <button class="hright_r" onclick="Efw('common_menu_goto',{page:'login.jsp'})">ログオフ</button>
                                    <button class="hright_r" onclick="Efw('common_menu_goto',{page:'shoplist.jsp'})">切替</button>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;padding-right: 20px;" id="sessioninfo">
                                    店舗ID:<span id="shopid" style="font-weight: bold;color: yellow;">未选择</span>
                                    &nbsp;&nbsp;&nbsp;
                                    UserID:<span id="userid" style="font-weight: bold;color: yellow;">XXXX</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
        
                <div class="topnav">
                    <p>店舗を選択してください。</p>
                </div>

                <div class="content">
                    <table border="1" class="shoplist">
                        <thead>
                            <tr>
                                <th>店舗名称</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
 
        </body>

        </html>