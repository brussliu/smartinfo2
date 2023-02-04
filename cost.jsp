<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>コスト情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <style>
           

            </style>
            <script>
                function init(){
        	        Efw('cost_init');
                }
            </script>
            
        </head>

        <body onload="init();">
            <efw:Part path="cost_inputdialog.jsp" />
            
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
                                    店舗ID：<span id="shopid" style="font-weight: bold;color: yellow;">未选择</span>
                                    &nbsp;&nbsp;&nbsp;
                                    UserID：<span id="userid" style="font-weight: bold;color: yellow;">XXXX</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="topnav">
                    <p><a href="menu.jsp">メニュー</a> > コスト情報管理</p>
                </div>
                <div class="content"  >
                    <div class="c_btn" style="border-bottom: 1px solid black;">
                        <table class="table_btn" style="margin-bottom: 5px;">
                            <tbody>
                                <tr>
                                    <td> </td>
                                    <td> </td> 
                                    <td> </td>         
                                    <td style="width: 200px;"><button  onclick="cost_inputdialog.dialog('open');">新規</button></td>
                                    <td style="width: 200px;"><button >更新</button></td>
                                     <td style="width: 200px;"><button >削除</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
 
                    <div class="c_detail_header" style="overflow: hidden;">
                        <table class="table_detail_header" style="table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 50px;">選択</th>
                                    <th style="width: 200px">登録日</th>
                                    <th style="width: 200px;">発生日</th>

                                    <th style="width: 120px;">ステータス</th>
                                    <th style="width: 200px;">分類</th>
                                    <th style="width: 350px;">タイトル</th>

                                    <th style="width: 120px;">金額（元）</th>
                                    <th style="width: 120px;">金額（円）</th>
                                    <th style="width: 100px;">為替レート</th>

                                    <th style="width: 316px;">備考</th>
                                 
                                </tr>
                            </thead>
                        </table>
                    </div>

                    <div class="c_detail_content" style="overflow-y: auto;overflow-x: hidden;height: 627px;margin-left:48px;">
                        <table class="table_detail_content" style="table-layout: fixed;">
                            <tbody>
                                
                               
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </body>
        

        </html>
