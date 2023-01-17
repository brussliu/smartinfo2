<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>マスタ情報管理</title>
            <efw:Client />
            <style>
                :root {
                    --width: 1920px;
                }

                * {
                    margin: 0;
                    letter-spacing: 3px;
                }

                .head {
                    width: var(--width);
                    height: 60px;
                    background-color: rgb(178, 178, 240);
                    color: aliceblue;
                }

                .hleft {
                    float: left;
                    width: 50%;
                    height: 60px;
                }

                .hright {
                    float: right;
                    width: 30%;
                    height: 60px;
                }

                .hright_r {
                    float: right;
                    margin-right: 57.6px;
                    margin-top: 21px;
                    width: 90px;
                    height: 30px;
                    border: 0;
                    border-radius: 20px;
                }

                .hright_l {
                    float: left;
                    line-height: 30px;
                }

                /* topnav */
                .topnav {
                    width: var(--width);
                    line-height: 43px;
                    height: 43px;
                    background: rgb(233, 229, 173);
                }

                .topnav p {
                    text-indent: 2.5em;

                }



                /* c_query */
                .c_query {
                    width: var(--width);
                    /* height: 216px; */
                }

                .c_q_nav {
                    width: 95%;
                    margin-top: 30px;
                    line-height: 66px;
                    border-collapse: collapse;
                    /* display: inline-block; */
                }

                .one td {
                    width: 13%;
                }

                .two input:not(:first-child) {
                    margin-left: 40px;
                }

                /* info */
                .info {
                    width: 95%;
                    margin: auto;
                    margin-top: 20px;

                }

                .info th {
                    height: 45px;
                    border: 1px solid black;
                    background-color:#f6f6f6;
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

                .btn {
                    width: 160px;
                    height: 50px;
                    background: rgb(253, 253, 253);
                    font-size: 20px;
                    border: 1px solid rgb(206, 205, 205);
                    box-shadow: 5px 5px 2px #888888;
                }

                /* detail */
                .detail {
                    width: 1000px;
                    /* height: 520px; */
                    position: absolute;
                    left: 40%;
                    top: 50%;
                    margin-top: -200px;
                    /* 高度的一半 */
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
                    width:100%;
                    text-align: center;
                    border-collapse: collapse;
                    line-height: 30px;
                }
                .footbtn{
                    width: 100%;
                    height: 80px;
                }
                .footbtn tr{
                    line-height: 60px;
                }
                .footbtn td{
                    width: 25%;
                  
                }
            </style>
        </head>

        <body>
            <efw:Part path="information_inputdialog.jsp"/> 
            <div>
                <div class="head">
                    <div class="hleft">
                        <h1 style="height: 60px;line-height: 60px;margin-left:40px;">SmartInfo 2.0</h1>
                    </div>
                    <div class="hright">
                        <div class="hright_l">
                            <p>店舗ID：<span>未选择</span></p>
                            <p>UserID：<span>XXXX</span></p>
                        </div>
                        <div>


                            <button class="hright_r">ログオフ</button>
                            <button class="hright_r">切換える</button>

                        </div>
                    </div>
                </div>
                <div class="topnav">
                    <p><a href="#">メニュー</a> > マスタ情報管理</p>
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
                                    <td style="width: 6%;">商品番号：</td>
                                    <td style="width: 12%;">
                                        <select style="width: 240px;height:42px;">
                                        </select>
                                    </td>
                                    <td style="width: 7%;">キーワード：</td>
                                    <td style="width: 12%;">
                                        <input type="text" style="width:  240px;height: 42px;"></input>
                                    </td>

                                    <td style="width: 5%;">表示項目：</td>
                                    <td style="width: 20%;">
                                        <input type="checkbox" name="project" value="ASIN、SKU、LABEL"> ASIN、SKU、LABEL
                                    </td>
                                    <td style="width: 5%;"></td>
                                    <td style="width: 10%;">

                                    </td>
                                    <td style="width: 5%;">

                                    </td>

                                </tr>
                            </tbody>
                        </table>

                    </div>


                    <div class="info three">
                        <table style=" border-collapse:collapse; text-align: center;width: 100%;word-break: break-all;">
                            <thead>
                                <tr>

                                    <th style="width: 6%;">操作</th>
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
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </body>

        </html>
