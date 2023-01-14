<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>在庫情報管理</title>
            <efw:Client />
            <style>
                :root {
                    --width: 1920px;
                }

                * {
                    margin: 0;
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
                    height: 216px;
                }

                form {
                    width: 95%;

                    margin: auto;
                    border-bottom: 1px solid black;
                }

                /* info */
                .info {
                    width: 95%;
                    margin: auto;
                    margin-top: 20px;

                }

                th {
                    height: 45px;
                    border: 1px solid black;
                }

                td {
                    height: 40px;
                }

                .info div {
                    width: 100px;
                    height: 30px;
                    border: 1px solid whitesmoke;
                    border-radius: 20px;
                    box-shadow: 2px 2px 1px #888888;
                }

                .btn {
                    width: 130px;
                    height: 50px;


                    background: rgb(253, 253, 253);
                    font-size: 20px;
                    border: 1px solid rgb(206, 205, 205);
                    box-shadow: 5px 5px 2px #888888;
                }
            </style>
        </head>

        <body>
            <div>
                <div class="head">
                    <div class="hleft">
                        <h1 style="height: 60px;line-height: 60px;margin-left:57px;">SmartInfo 2.0</h1>
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
                    <p><a href="#">メニュー</a> > 在庫情報管理</p>
                </div>
                <div class="c_query">
                    <form>
                        <table
                            style="width: 95%;height: 212px;  line-height: 106px; border-collapse:collapse;display: inline-block;">
                            <tbody>
                                <tr>
                                    <td style="width: 8%;">商品分類：</td>
                                    <td style="width: 10%;">
                                        <input type="radio" name="type" value="レインコート" checked>レインコート
                                    </td>
                                    <td>
                                        <input type="radio" name="type" value="靴下">靴下
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><button class="btn">検索</button></td>
                                    <td><button class="btn">更新</button></td>
                                    <td><button class="btn">出力</button></td>
                                </tr>
                                <tr>
                                    <td style="width: 8%;"> 商品番号：</td>
                                    <td style="width: 10%;">
                                        <select style="width: 152px;height:42px;">
                                        </select>
                                    </td>
                                    <td style="width: 8%;">キーワード：</td>
                                    <td style="width: 8%;">
                                        <input type="text" style="width: 152px;height: 42px;"></input>
                                    </td>
                                    <td style="width: 8%;">
                                        発送方式：
                                    </td>
                                    <td style="width: 10%;">
                                        <input type="radio" name="send" value="FBA" checked>FBA
                                        <input type="radio" name="send" value="FBM" style="margin-left:40px">FBM

                                    </td>
                                    <td style="width: 8%;">表示項目：</td>
                                    <td style="width: 10%;">
                                        <input type="checkbox" name="project" value="ASIN、SKU、LABEL">ASIN、SKU、LABEL
                                    </td>
                                    <td style="width: 10%;">
                                        <input type="checkbox" name="project" value="商品名称">商品名称
                                    </td>

                                </tr>
                            </tbody>
                        </table>

                    </form>


                    <div class="info">
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

                                    <th style="width: 10%;">商品名称</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox" name="choice"></input></td>
                                    <td>XXX</td>
                                    <td>XXX</td>
                                    <td>XXX</td>
                                    <td>XXX</td>
                                    <td>XXX</td>
                                    <td>XXX</td>
                                    <td>XXX</td>

                                    <td>XXXXXX</td>
                                    <td>XXXXXX</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

        </body>

        </html>