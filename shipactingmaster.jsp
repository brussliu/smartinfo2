<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>代行発送商品管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            
            <style>
                
            </style>
     
        </head>

        <body>

            <efw:Part path="shipactingmaster_inputdialog.jsp" />
        
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
                                <td style="text-align: right;padding-right: 20px;">
                                    店舗ID：<span id="shopid">未选择</span>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    UserID：<span id="userid">XXXX</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="topnav">
                    <p><a href="menu.jsp">メニュー</a> > 代行発送商品管理</p>
                </div>
                <div class="content">
                    <div class="c_btn" style="border-bottom: 1px solid black;">
                        <table class="table_btn" style="margin-bottom: 5px;">
                            <tbody>
                                <tr>
                                    <td> </td>
                                    <td> </td>
                                    <td> </td>
                                    <td style="width: 200px;"><button  onclick="shipactingmaster_inputdialog.dialog('open');">新規</button></td>
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
                                    <th style="width: 120px;">管理番号</th>
                                    <th style="width: 150px">商品分類</th>
                                    <th style="width: 400px;">名称/色/サイズ（中国語）</th>

                                    <th style="width: 200px;">名称（日本語）</th>
                                    <th style="width: 150px;">数量</th>
                                
                                </tr>
                            </thead>
                        </table>
                    </div>
 
                    <div class="c_detail_content" style="overflow: auto;height: 673px;margin-left:48px;width: 1106px;">
                        <table class="table_detail_content" style="table-layout: fixed;" >
                            <tbody>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;"class="c"><input type="radio"></input></td>
                                    <td style="width: 120px;" class="c" >0001</td>
                                    <td style="width: 150px;" class="l"><span class="l5">A：販売商品</span></td>
                                    <td style="width: 400px;" class="l"><span class="l5">战术笔P9</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">タクティカルペン</span></td>
                                    <td style="width: 150px;" class="r"><span class="r5">999</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </body>

        </html>
