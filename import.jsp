<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>データ導入</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css"/>
            <style>

                /* table */
                .table_detail .vh {
                    visibility: hidden;
                    border: 0;
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
                    height: 40px;
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
                            <button class="hright_r" onclick="Efw('common_menu_goto',{page:'shoplist.jsp'})">切替</button>
                        </div>
                    </div>
                </div>
                <div class="topnav">
                    <p><a href="menu.jsp">メニュー</a> > ファイルを格納してから、ファイル識別ボタンを押下してください。</p>
                </div>
                <div class="content">
                    <div class="c_btn">
                        <table class="table_btn">
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td style="width: 200px;"><button>ファイル識別</button></td>
                                    <td style="width: 200px;"><button>データ取込</button></td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                    <div class="c_detail">
                        <table class="table_detail">
                            <thead>
                            <tr class="datatr">
                                <th class="vh"></th>
                                <th class="vh"></th>
                                <th class="vh"></th>
                                <th class="vh"></th>
                                <th colspan="2" style="background-color: pink;">今回未導入</th>
                                <th colspan="2" style="background-color: cornflowerblue;">前回導入済み</th>
                            </tr>
                            <tr style="height: 40px;">
                                <th style="width:4%;background-color: aquamarine;">No</th>
                                <th style="width:24%;background-color: aquamarine;">ファイル名称</th>
                                <th style="width:6%;background-color: aquamarine;">更新頻度</th>
                                <th style="width:24%;background-color: aquamarine;">導入ファイル名</th>
                                <th style="width:12%;background-color: pink;">導入日時</th>
                                <th style="width:8%;background-color: pink;">導入件数</th>
                                <th style="width:12%;background-color: cornflowerblue;">導入日時</th>
                                <th style="width:8%;background-color: cornflowerblue;">導入件数</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr class="datatr">
                                <td class="td1">1</td>
                                <td class="td2">すべての出品商品のレポート</td>
                                <td class="td3">1回／日</td>
                                <td class="td4"></td>
                                <td class="td5">2023-01-12 18:32:17 </td>
                                <td class="td6"></td>
                                <td class="td6">2023-01-12 18:32:17 </td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">2</td>
                                <td class="td2">全注文レポート</td>
                                <td class="td3">1回／日</td>
                                <td class="td4"> </td>
                                <td class="td5"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr" style="background-color: rgb(230, 101, 101);">
                                <td class="td1">3</td>
                                <td class="td2">FBA在庫レポート</td>
                                <td class="td3">1回／日</td>
                                <td class="td4"> </td>
                                <td class="td5"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr" style="background-color: rgb(230, 101, 101);">
                                <td class="td1">4</td>
                                <td class="td2">ペイメントレポート</td>
                                <td class="td3">1回／日</td>
                                <td class="td4"> </td>
                                <td class="td5"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">5</td>
                                <td class="td2">FBA未出荷レポート</td>
                                <td class="td3">随時</td>
                                <td class="td4"> </td>
                                <td class="td5"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">6</td>
                                <td class="td2">Qoo10未出荷レポート</td>
                                <td class="td3">随時</td>
                                <td class="td4"> </td>
                                <td class="td5"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">7</td>
                                <td class="td2">日付別_売上およびトラフィック</td>
                                <td class="td3">？？？</td>
                                <td class="td4"> </td>
                                <td class="td5"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">8</td>
                                <td class="td2">日付別_詳細ページ 売上・トラフィック</td>
                                <td class="td3">？？？</td>
                                <td class="td4"> </td>
                                <td class="td5"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">9</td>
                                <td class="td2">日付別_パフォーマンス</td>
                                <td class="td3">？？？</td>
                                <td class="td4"> </td>
                                <td class="td5"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">10</td>
                                <td class="td2">ASIN別_詳細ページ 売上・トラフィック</td>
                                <td class="td3">？？？</td>
                                <td class="td4"> </td>
                                <td class="td5"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr" style="background-color: rgb(230, 101, 101);">
                                <td class="td1">11</td>
                                <td class="td2">FBA在庫出荷レポート</td>
                                <td class="td3">1回／週</td>
                                <td class="td4"> </td>
                                <td class="td5"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">12</td>
                                <td class="td2">出荷レポート</td>
                                <td class="td3">1回／週</td>
                                <td class="td4"> </td>
                                <td class="td5"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">13</td>
                                <td class="td2">手数料見積り額レポート</td>
                                <td class="td3">1回／週</td>
                                <td class="td4"> </td>
                                <td class="td5"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">14</td>
                                <td class="td2">在庫保管手数料レポート</td>
                                <td class="td3">月初</td>
                                <td class="td4"> </td>
                                <td class="td5"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">15</td>
                                <td class="td2">長期在庫保管手数料請求額レポート</td>
                                <td class="td3">月初</td>
                                <td class="td4"> </td>
                                <td class="td5"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">16</td>
                                <td class="td2">返品レポート</td>
                                <td class="td3">1回／月</td>
                                <td class="td4"> </td>
                                <td class="td5"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">17</td>
                                <td class="td2">返送推奨レポート</td>
                                <td class="td3">1回／月</td>
                                <td class="td4"> </td>
                                <td class="td5"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr>
                            <tr class="datatr" style="border-bottom: 1px solid black;">
                                <td class="td1">18</td>
                                <td class="td2">返送所有権の放棄依頼の詳細レポート</td>
                                <td class="td3">1回／月</td>
                                <td class="td4"> </td>
                                <td class="td5"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                                <td class="td6"></td>
                            </tr></tbody>
                        </table>
                    </div>
                </div>
            </div>

        </body>

        </html>