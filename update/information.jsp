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

                .tform {
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

                .d2 input {
                    width: 120px;
                    height: 30px;
                }

                /* .d2 td {
                    width: 150px;

                } */

                th {
                    height: 45px;
                    border: 1px solid black;
                }

                td {
                    height: 40px;
                }

                tbody button {
                    width: 100px;
                    height: 30px;
                    border: 1px solid whitesmoke;
                    border-radius: 20px;
                    box-shadow: 2px 2px 1px #888888;
                }

                .detail {
                    width: 1000px;
                    height: 600px;
                    position: absolute;
                    left: 40%;
                    top: 50%;
                    margin-top: -200px;
                    /* 高度的一半 */
                    margin-left: -300px;
                    background: #ffffff;
                    border: 1px solid black;
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
                    <p><a href="#">メニュー</a> > マスタ情報管理</p>
                </div>
                <div class="c_query">
                    <form class="tform">
                        <table
                            style="width: 88%;height: 212px;line-height: 106px; border-collapse:collapse;display: inline-block;">
                            <tbody>
                                <tr>
                                    <td style="width: 8%;">商品分類：</td>
                                    <td style="width: 10%;">
                                        <input type="radio" name="type" value="レインコート" checked>レインコート
                                    </td>
                                    <td>
                                        <input type="radio" name="type" value="靴下">靴下
                                    </td>
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
                                    <td style="width: 8%;">表示項目：</td>
                                    <td style="width: 15%;">
                                        <input type="checkbox" name="project"
                                            value="&nbsp;ASIN、SKU、LABEL">ASIN、SKU、LABEL
                                    </td>
                                    <td style="width: 8%;"></td>
                                    <td style="width: 8%;"></td>

                                </tr>
                            </tbody>
                        </table>
                        <input type="submit" style="width: 178px;height: 83px;float: right;    margin-top: 52px; background: rgb(253, 253, 253);
                            font-size: 20px;border:1px solid rgb(206, 205, 205);box-shadow:5px 5px 2px #888888;"
                            value="検索"></input>
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
                                    <th style="width: 4%;">仕入価格</th>
                                    <th style="width: 6%;">FBA発送方式</th>
                                    <th style="width: 10%;">商品名称</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><button>更新</button></td>
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
                                    <td>XXXXXX</td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                    <div class="detail">
                        <div>

                            <h2 style="background-color: #b2b2f0;color: aliceblue;">マスタ詳細情報</h2>

                        </div>
                        <div style="width: 95%;height: 85%;margin: 20px;">
                            <form>
                                <table width="50%" style="text-align: center;">
                                    <thead>
                                        <tr>
                                            <th>ASIN番号</th>
                                            <th>SKU番号</th>
                                            <th>LABEL番号</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>XXX</td>
                                            <td>XXX</td>
                                            <td>XXX</td>
                                        </tr>
                                    </tbody>
                                </table>

                                <table class="d2" width="100%" id="d2">
                                    <tbody>
                                        <tr>
                                            <td style="width: 12%;">商品種別 </td>
                                            <td style="width: 18%;">
                                                <select style="width: 120px;height: 30px;">
                                                    <option value=""></option>
                                                </select>
                                            </td>
                                            <td style="width:18%;"><input type="text"></input></td>
                                            <td style="width:12%;"></td>
                                            <td style="width:12%;"></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td style="width: 6%;">商品管理番号</td>
                                            <td>
                                                <select style="width: 120px;height: 30px;">

                                                </select>
                                            </td>
                                            <td><input type="text"></input></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                親子区分
                                            </td>
                                            <td>親商品</td>
                                            <td>子商品</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                分類①
                                            </td>
                                            <td>-</td>
                                            <td><input type="text"></input></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                分類②
                                            </td>
                                            <td>-</td>
                                            <td><input type="text"></input></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>仕入価格</td>
                                            <td>-</td>
                                            <td><input type="text"></input></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                商品名称
                                            </td>
                                            <td colspan="4"> <input type="text" style="width: 720px;"></input></td>
                                        </tr>
                                        <tr style="height: 80px;line-height: 80px;">
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td><button class="btn">保存</button></td>
                                            <td><button class="btn">キャンセル</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </body>

        </html>