<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>SmartInfo 2.0</title>
            <link rel="stylesheet" href="css/common.css" type="text/css"/>

            <efw:Client />
            <style>
           
                /* content */
                .content {
                    width: var(--width);
                    height: 55vh;
                    display: flex;
                    justify-content: center;
                    align-items: center;

                }
                .content table{
                    border-collapse: collapse;

                }
                th,
                td {
                    width: 2000px;
                    max-width: 200px;
                    height: 45px;
                    max-height: 70px;
                    text-align: center;
                    border: 1px solid black;
                }
                th{
                    background-color:#f6f6f6;
                }
               td a{
                    text-decoration-line: underline;
                    color: rgb(29, 18, 177);
                }
            </style>
        </head>

        <body>
            <div>
                <div class="head">
                    <div class="hleft">
                        <h1 style="height: 80px;line-height: 80px;margin-left:40px;">SmartInfo 2.0</h1>
                    </div>
                    <div class="hright">
                        <div class="hright_l">
                            <p>店舗ID：<span id="shopid">未选择</span></p>
                            <p>UserID：<span id="userid">XXXX</span></p>
                        </div>
                        <div>
                            <button class="hright_r" onclick="Efw('common_menu_goto',{page:'login.jsp'})">ログオフ</button>
                            <button class="hright_r" onclick="Efw('common_menu_goto',{page:'shoplist.jsp'})" style="visibility: hidden;">切替</button>
                        </div>
                    </div>
                </div>
        
                <div class="topnav">
                    <p>店舗を選択してください。</p>                </div>
                <div class="content">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>店舗名称</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                           
                                <td><a onclick="Efw('common_smartChoice',{UserID:this.innerHTML})">Smart-bear</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
 
        </body>

        </html>