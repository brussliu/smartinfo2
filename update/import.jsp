<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>データ導入</title>
            <efw:Client />
            <style>
                * {
                    margin: 0;
                }

                .head {
                    width: 100vw;
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
                    margin-right: 3vw;
                    margin-top: 2.5vh;
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
                    width: 100vw;
                    line-height: 4vh;
                    height: 4vh;
                    background: rgb(233, 229, 173);
                }

                .topnav p {
                    text-indent: 2.5em;

                }

                /* content */
                .content {
                    width: 100vw;
                    height: 83vh;
                    overflow: hidden;

                }

                .c_btn {
                    width: 95%;
                    height: 30px;
                    margin: auto;

                    margin-top: 1vh;
                
                }

                .c_btn button {
                    float: right;
                    margin-right: 3vw;
                    width: 140px;
                    height: 30px;
                }

                /* table */
                .vh {
                    visibility: hidden;
                    border: 0;
                }
                th{
                    border: 1px solid black;
                }
                td{
                    /* border-top: 1px solid black; */
                    border-left: 1px solid black;
                    border-right: 1px solid black;
                    border-bottom: 1px dashed black;
                }

                .td1,
                .td3,
                .td5,
                .td6 {
                    text-align: center
                }

                .td2,
                .td4 {
                    padding-left: 10px
                }

                .datatr {
                    height: 30px;
                }
            </style>
        </head>

        <body>
            <div>
                <div class="head">
                    <div class="hleft">
                        <h1 style="margin-top:2.5vh ;margin-left:3vw;">SmartInfo 2.0</h1>
                    </div>
                    <div class="hright">
                        <div class="hright_l">
                            <p>店舗ID：<span>未选择</span></p>
                            <p>UserID：<span>XXXX</span></p>
                        </div>
                        <div>
                            <button class="hright_r">ログオフ</button>
                        </div>
                    </div>
                </div>
                <div class="topnav">
                    <p><a href="#">メニュー</a> > 店舗を選択してください。</p>
                </div>
                <div class="content">
                    <div class="c_btn">
                        <button>ファイル識別</button>
                        <button>データ取込</button>
                    </div>
                    <div style="transform: scale(0.7);margin-top: -100vh;width: 120vw;margin-left:-15vw;">
                        <table  style="width: 110%;margin:3vh auto ;border-collapse:collapse;" >
                            <tr class="datatr">
                                <th class="vh"></th>
                                <th class="vh"></th>
                                <th class="vh"></th>
                                <th class="vh"></th>
                                <th class="" colspan="2">今回未導入</th>
                                <th class="" colspan="2">前回導入済み</th>
                            </tr>
                            <tr style="background-color:#c8ffff ;height: 30px;">
                                <th style="width:4vw">No</th>
                                <th style="width:40vw">ファイル名称</th>
                                <th style="width:8vw">更新頻度</th>
                                <th style="width:40vw;">導入ファイル名</th>
                                <th style="width:20vw">導入日時</th>
                                <th style="width:12vw">導入件数</th>
                                <th style="width:20vw">導入日時</th>
                                <th style="width:12vw">導入件数</th>

                            </tr>
                            <tr class="datatr">
                                <td class="td1">1</td>
                                <td class="td2">すべての出品商品のレポート</td>
                                <td class="td3">1回／日</td>
                                <td class="td4"></td>
                                <td class="td5" id="file01">2023-01-12 18:32:17	</td>
                                <td class="td6"></td>
                                <td class="td6">2023-01-12 18:32:17	</td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">2</td>
                                <td class="td2">全注文レポート</td>
                                <td class="td3">1回／日</td>
                                <td class="td4"> </td>
                                <td class="td5" id="file02"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">3</td>
                                <td class="td2">FBA在庫レポート</td>
                                <td class="td3">1回／日</td>
                                <td class="td4"> </td>
                                <td class="td5" id="file03"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">4</td>
                                <td class="td2">ペイメントレポート</td>
                                <td class="td3">1回／日</td>
                                <td class="td4"> </td>
                                <td class="td5" id="file04"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">5</td>
                                <td class="td2">FBA未出荷レポート</td>
                                <td class="td3">随時</td>
                                <td class="td4"> </td>
                                <td class="td5" id="file05"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">6</td>
                                <td class="td2">Qoo10未出荷レポート</td>
                                <td class="td3">随時</td>
                                <td class="td4"> </td>
                                <td class="td5" id="file06"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">7</td>
                                <td class="td2">日付別_売上およびトラフィック</td>
                                <td class="td3">？？？</td>
                                <td class="td4"> </td>
                                <td class="td5" id="file07"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">8</td>
                                <td class="td2">日付別_詳細ページ 売上・トラフィック</td>
                                <td class="td3">？？？</td>
                                <td class="td4"> </td>
                                <td class="td5" id="file08"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">9</td>
                                <td class="td2">日付別_パフォーマンス</td>
                                <td class="td3">？？？</td>
                                <td class="td4"> </td>
                                <td class="td5" id="file09"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">10</td>
                                <td class="td2">ASIN別_詳細ページ 売上・トラフィック</td>
                                <td class="td3">？？？</td>
                                <td class="td4"> </td>
                                <td class="td5" id="file10"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">11</td>
                                <td class="td2">FBA在庫出荷レポート</td>
                                <td class="td3">1回／週</td>
                                <td class="td4"> </td>
                                <td class="td5" id="file11"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">12</td>
                                <td class="td2">出荷レポート</td>
                                <td class="td3">1回／週</td>
                                <td class="td4"> </td>
                                <td class="td5" id="file12"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">13</td>
                                <td class="td2">手数料見積り額レポート</td>
                                <td class="td3">1回／週</td>
                                <td class="td4"> </td>
                                <td class="td5" id="file13"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">14</td>
                                <td class="td2">在庫保管手数料レポート</td>
                                <td class="td3">月初</td>
                                <td class="td4"> </td>
                                <td class="td5" id="file14"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">15</td>
                                <td class="td2">長期在庫保管手数料請求額レポート</td>
                                <td class="td3">月初</td>
                                <td class="td4"> </td>
                                <td class="td5" id="file15"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">16</td>
                                <td class="td2">返品レポート</td>
                                <td class="td3">1回／月</td>
                                <td class="td4"> </td>
                                <td class="td5" id="file16"></td>
                                <td class="td6"></td> <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">17</td>
                                <td class="td2">返送推奨レポート</td>
                                <td class="td3">1回／月</td>
                                <td class="td4"> </td>
                                <td class="td5" id="file17"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr" style="border-bottom: 1px solid black;">
                                <td class="td1">18</td>
                                <td class="td2">返送所有権の放棄依頼の詳細レポート</td>
                                <td class="td3">1回／月</td>
                                <td class="td4"> </td>
                                <td class="td5" id="file18"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

        </body>

        </html>