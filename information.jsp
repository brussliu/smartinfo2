<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>マスタ情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css"/>

            <style>
      


                /* c_query */
                .c_query {
                    width: var(--width);

                }

                .c_q_nav {
                    width: 100%;
                    line-height: 55px;
                    border-collapse: collapse;

                }

                .one {
                    margin-top: 10px;
                }

                .one td {
                    width: 13%;
                }

                .one td button {
                    float: right;
                }

                .two input:not(:first-child) {
                    margin-left: 40px;
                }

                .three table {
                    border-collapse: collapse;
                    text-align: center;
                    width: 1824px;
                    white-space:nowrap;
                    overflow: auto;
                }
                .three td:last-child{
                    table-layout: auto;
                }
                /* info */
                .info {
                    width: 1824px;
                    margin: auto;
               
                    overflow: auto;
                    height: 750px;
                }

                .info th {
                    height: 45px;
                    border: 1px solid black;
                    background-color: #f6f6f6;
                }

                .info .btn {
                    width: 60px;
                    font-size: 16px;
                }

                .three td {
                    height: 65px;
                }

                .info div {
                    width: 100px;
                    height: 30px;
                    border: 1px solid whitesmoke;
                    border-radius: 20px;
                    box-shadow: 2px 2px 1px #888888;
                }
 

                /* detail */
                .detail {
                    width: 1000px;
                    position: absolute;
                    left: 40%;
                    top: 50%;
                    margin-top: -200px;
                    margin-left: -300px;
                    background: #ffffff;
                    border: 1px solid black;

                }

                .d2 {
                    margin-top: 20px;
                    border-top: 1px solid black;
                    padding-top: 20px;
                }

                .d2 tr {
                    line-height: 40px;
                }

                .d2 select {
                    width: 140px;
                    height: 30px;
                }

                .d2 input {
                    width: 140px;
                    height: 30px;
                }

                input[type="text"] {
                    border: 1px solid black;
                }


                /* number */
                .number {
                    width: 100%;
                    text-align: center;
                    border-collapse: collapse;
                    line-height: 30px;
                }

                .footbtn {
                    width: 100%;
                    height: 80px;
                }

                .footbtn tr {
                    line-height: 60px;
                }

                .footbtn td {
                    width: 25%;

                }
            </style>
        </head>

        <body>
            <efw:Part path="information_inputdialog.jsp" />
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
                            <button class="hright_r" onclick="Efw('common_menu_goto',{page:'shoplist.jsp'})">切替</button>
                        </div>
                    </div>  
                </div>
                <div class="topnav">
                    <p><a href="menu.jsp">メニュー</a> > マスタ情報管理</p>
                </div>
                <div class="c_query">
                    <div style="width: 95%;margin: auto;border-bottom: 1px solid black;">
                        <table class="c_q_nav one">
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><button class="btn">検索</button></td>


                                </tr>
                            </tbody>
                        </table>
                        <table class="c_q_nav two">
                            <tbody>
                                <tr>
                                    <td style="width: 7%;">商品分類：</td>
                                    <td style="width: 93%;">
                                        <input type="checkbox" name="rain" value="レインコート" checked> レインコート
                                        <input type="checkbox" name="type" value="靴下"> 靴下

                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <table class="c_q_nav">
                            <tbody>
                                <tr>
                                    <td style="width: 7%;">商品番号：</td>
                                    <td style="width: 10%;">
                                        <select style="width: 128px;height:42px;">
                                        </select>
                                    </td>
                                    <td style="width: 7%;">キーワード：</td>
                                    <td style="width: 10%;">
                                        <input type="text" style="width:  128px;height: 42px;"></input>
                                    </td>

                                    <td style="width: 6%;">表示項目：</td>
                                    <td style="width: 60%;">
                                        <input type="checkbox" name="project" value="ASIN、SKU、LABEL"> ASIN、SKU、LABEL
                                    </td>
                                     

                                </tr>
                            </tbody>
                        </table>

                    </div>


                    <div class="info three">
                        <table  class="table_detail"  style="  table-layout: fixed;">
                            <!-- <colgroup>
                                <col width="200">
                                <col width="120">
                                <col width="140">

                                <col width="120">
                                <col width="110">
                                <col width="110">

                                <col width="120">
                                <col width="120">
                                <col width="120">

                                <col width="120">
                                <col width="120">
                             <col width="220">
                            </colgroup> -->
                            <thead>
                                <tr>

                                 
                                    <th  style="width: 5%;">操作</th>
                                    <th style="width: 5%;">商品種別</th>
                                    <th style="width: 7%;">商品管理番号</th>
                                    <th style="width: 5%;">親子区分</th>
                                    <th style="width: 5%;">分類①</th>
                                    <th style="width: 5%;">分類②</th>
                                    <th style="width: 6%;">ASIN番号</th>
                                    <th style="width: 6%;">SKU番号</th>
                                    <th style="width: 6%;">LABEL番号</th>
                                    <th style="width: 4%;">仕入価格</th>
                                    <th style="width: 6%;">FBA発送方式</th>
                                    <th style="width: 10%;">商品名称</th>
                             
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><button class="btn" id="update">更新</button></td>
                                    <td>XXX</td>
                                    <td>XXX</td>
                                    <td>XXX</td>
                                    <td>XXX</td>
                                    <td>XXX</td>
                                    <td>XXX</td>
                                    <td>XXX</td>
                                    <td>XXX</td>
                                    <td>XXX</td>
                                    <td>XXXXXX</td>
                                    <td>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
                                </tr>
                                <tr>
                                    <td><button class="btn" id="update">更新</button></td>
                                    <td>XXX</td>
                                    <td>XXX</td>
                                    <td>XXX</td>
                                    <td>XXX</td>
                                    <td>XXX</td>
                                    <td>XXX</td>
                                    <td>XXX</td>
                                    <td>XXX</td>
                                    <td>XXX</td>
                                    <td>XXXXXX</td>
                                    <td>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </body>

        </html>