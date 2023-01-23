<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>データ導入</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css"/>
            <script>
                function searchimportinfo(){

                    Efw('import_initimport');
                }

                function reorganizeFile(){
                    Efw('import_checkfile');
                }

                function doReorganizeConfirm(flg){

                    if(flg == 1){

                        var m = "既に識別したファイルを上書きしますか？\n" +
                                "「はい」押下する場合、上書きし、ファイルを識別直します。\n" +
                                "「いいえ」押下する場合、ファイルを削除して、再度ファイル識別してください。";
                        var r = confirm(m);

                        if(!r){
                            return;
                        }
                    }

                    alert("OK");
                    Efw('import_reorganizefile');
                }

                function importFile(){
                    Efw('import_importfile');
                }

                function setInit1(objectname,importdate,importcount){
                    $("#"+objectname + "_importtime").html(importdate);
                    $("#"+objectname + "_importcount").html(importcount);
                }

                function setInit2(objectname,importfilename,reorganizetime,reorganizecount){

                    // <td class="td5" id="file02_reorganizetime">2023-01-12 18:32:17 </td>
                    //             <td class="td6" id="file02_reorganizecount">999件</td>
                    //             <td class="td6" id="file02_importtime">2023-01-12 18:32:17 </td>
                    //             <td class="td6" id="file02_importcount">999件</td>

                    $("#"+objectname + "_filename").html(importfilename);
                    $("#"+objectname + "_reorganizetime").html(reorganizetime);
                    $("#"+objectname + "_reorganizecount").html(reorganizecount);
                }
            </script>
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
                    height: 32px;
                }
            </style>
        </head>

        <body onload="searchimportinfo();">
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
                    <p><a href="menu.jsp">メニュー</a> >データ導入</p>
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
                                    <td style="width: 200px;"><button id="btnReorganize" onclick="reorganizeFile();">ファイル識別</button></td>
                                    <td style="width: 200px;"><button id="btnImport" onclick="importFile();" disabled="disabled">データ取込</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_detail">
                        <table class="table_detail" style="font-size: 14px;">
                            <thead>
                            <tr class="header">
                                <th class="vh"></th>
                                <th class="vh"></th>
                                <th class="vh"></th>
                                <th class="vh"></th>
                                <th colspan="2" style="background-color: pink;">今回未導入</th>
                                <th colspan="2" style="background-color: cornflowerblue;">前回導入済み</th>
                            </tr>
                            <tr class="header">
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
                            <tr>
                                <td class="td1">1</td>
                                <td class="td2">すべての出品商品のレポート</td>
                                <td class="td3">1回／日</td>
                                <td class="td4" id="file01_filename"></td>
                                <td class="td5" id="file01_reorganizetime">-</td>
                                <td class="td6" id="file01_reorganizecount">-</td>
                                <td class="td6" id="file01_importtime">-</td>
                                <td class="td6" id="file01_importcount">-</td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">2</td>
                                <td class="td2">全注文レポート</td>
                                <td class="td3">1回／日</td>
                                <td class="td4" id="file02_filename"></td>
                                <td class="td5" id="file02_reorganizetime">-</td>
                                <td class="td6" id="file02_reorganizecount">-</td>
                                <td class="td6" id="file02_importtime">-</td>
                                <td class="td6" id="file02_importcount">-</td>
                            </tr>
                            <tr class="datatr" style="background-color: rgb(230, 101, 101);">
                                <td class="td1">3</td>
                                <td class="td2">FBA在庫レポート</td>
                                <td class="td3">1回／日</td>
                                <td class="td4" id="file03_filename"></td>
                                <td class="td5" id="file03_reorganizetime">-</td>
                                <td class="td6" id="file03_reorganizecount">-</td>
                                <td class="td6" id="file03_importtime">-</td>
                                <td class="td6" id="file03_importcount">-</td>
                            </tr>
                            <tr class="datatr" style="background-color: rgb(230, 101, 101);">
                                <td class="td1">4</td>
                                <td class="td2">ペイメントレポート</td>
                                <td class="td3">1回／日</td>
                                <td class="td4" id="file04_filename"></td>
                                <td class="td5" id="file04_reorganizetime">-</td>
                                <td class="td6" id="file04_reorganizecount">-</td>
                                <td class="td6" id="file04_importtime">-</td>
                                <td class="td6" id="file04_importcount">-</td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">5</td>
                                <td class="td2">FBA未出荷レポート</td>
                                <td class="td3">随時</td>
                                <td class="td4" id="file05_filename"></td>
                                <td class="td5" id="file05_reorganizetime">-</td>
                                <td class="td6" id="file05_reorganizecount">-</td>
                                <td class="td6" id="file05_importtime">-</td>
                                <td class="td6" id="file05_importcount">-</td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">6</td>
                                <td class="td2">Qoo10未出荷レポート</td>
                                <td class="td3">随時</td>
                                <td class="td4" id="file06_filename"></td>
                                <td class="td5" id="file06_reorganizetime">-</td>
                                <td class="td6" id="file06_reorganizecount">-</td>
                                <td class="td6" id="file06_importtime">-</td>
                                <td class="td6" id="file06_importcount">-</td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">7</td>
                                <td class="td2">日付別_売上およびトラフィック</td>
                                <td class="td3">？？？</td>
                                <td class="td4" id="file07_filename"></td>
                                <td class="td5" id="file07_reorganizetime">-</td>
                                <td class="td6" id="file07_reorganizecount">-</td>
                                <td class="td6" id="file07_importtime">-</td>
                                <td class="td6" id="file07_importcount">-</td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">8</td>
                                <td class="td2">日付別_詳細ページ 売上・トラフィック</td>
                                <td class="td3">？？？</td>
                                <td class="td4" id="file08_filename"></td>
                                <td class="td5" id="file08_reorganizetime">-</td>
                                <td class="td6" id="file08_reorganizecount">-</td>
                                <td class="td6" id="file08_importtime">-</td>
                                <td class="td6" id="file08_importcount">-</td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">9</td>
                                <td class="td2">日付別_パフォーマンス</td>
                                <td class="td3">？？？</td>
                                <td class="td4" id="file09_filename"></td>
                                <td class="td5" id="file09_reorganizetime">-</td>
                                <td class="td6" id="file09_reorganizecount">-</td>
                                <td class="td6" id="file09_importtime">-</td>
                                <td class="td6" id="file09_importcount">-</td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">10</td>
                                <td class="td2">ASIN別_詳細ページ 売上・トラフィック</td>
                                <td class="td3">？？？</td>
                                <td class="td4" id="file10_filename"></td>
                                <td class="td5" id="file10_reorganizetime">-</td>
                                <td class="td6" id="file10_reorganizecount">-</td>
                                <td class="td6" id="file10_importtime">-</td>
                                <td class="td6" id="file10_importcount">-</td>
                            </tr>
                            <tr class="datatr" style="background-color: rgb(230, 101, 101);">
                                <td class="td1">11</td>
                                <td class="td2">FBA在庫出荷レポート</td>
                                <td class="td3">1回／週</td>
                                <td class="td4" id="file11_filename"></td>
                                <td class="td5" id="file11_reorganizetime">-</td>
                                <td class="td6" id="file11_reorganizecount">-</td>
                                <td class="td6" id="file11_importtime">-</td>
                                <td class="td6" id="file11_importcount">-</td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">12</td>
                                <td class="td2">出荷レポート</td>
                                <td class="td3">1回／週</td>
                                <td class="td4" id="file12_filename"></td>
                                <td class="td5" id="file12_reorganizetime">-</td>
                                <td class="td6" id="file12_reorganizecount">-</td>
                                <td class="td6" id="file12_importtime">-</td>
                                <td class="td6" id="file12_importcount">-</td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">13</td>
                                <td class="td2">手数料見積り額レポート</td>
                                <td class="td3">1回／週</td>
                                <td class="td4" id="file13_filename"></td>
                                <td class="td5" id="file13_reorganizetime">-</td>
                                <td class="td6" id="file13_reorganizecount">-</td>
                                <td class="td6" id="file13_importtime">-</td>
                                <td class="td6" id="file13_importcount">-</td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">14</td>
                                <td class="td2">在庫保管手数料レポート</td>
                                <td class="td3">月初</td>
                                <td class="td4" id="file14_filename"></td>
                                <td class="td5" id="file14_reorganizetime">-</td>
                                <td class="td6" id="file14_reorganizecount">-</td>
                                <td class="td6" id="file14_importtime">-</td>
                                <td class="td6" id="file14_importcount">-</td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">15</td>
                                <td class="td2">長期在庫保管手数料請求額レポート</td>
                                <td class="td3">月初</td>
                                <td class="td4" id="file15_filename"></td>
                                <td class="td5" id="file15_reorganizetime">-</td>
                                <td class="td6" id="file15_reorganizecount">-</td>
                                <td class="td6" id="file15_importtime">-</td>
                                <td class="td6" id="file15_importcount">-</td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">16</td>
                                <td class="td2">返品レポート</td>
                                <td class="td3">1回／月</td>
                                <td class="td4" id="file16_filename"></td>
                                <td class="td5" id="file16_reorganizetime">-</td>
                                <td class="td6" id="file16_reorganizecount">-</td>
                                <td class="td6" id="file16_importtime">-</td>
                                <td class="td6" id="file16_importcount">-</td>
                            </tr>
                            <tr class="datatr">
                                <td class="td1">17</td>
                                <td class="td2">返送推奨レポート</td>
                                <td class="td3">1回／月</td>
                                <td class="td4" id="file17_filename"></td>
                                <td class="td5" id="file17_reorganizetime">-</td>
                                <td class="td6" id="file17_reorganizecount">-</td>
                                <td class="td6" id="file17_importtime">-</td>
                                <td class="td6" id="file17_importcount">-</td>
                            </tr>
                            <tr class="datatr" style="border-bottom: 1px solid black;">
                                <td class="td1">18</td>
                                <td class="td2">返送所有権の放棄依頼の詳細レポート</td>
                                <td class="td3">1回／月</td>
                                <td class="td4" id="file18_filename"></td>
                                <td class="td5" id="file18_reorganizetime">-</td>
                                <td class="td6" id="file18_reorganizecount">-</td>
                                <td class="td6" id="file18_importtime">-</td>
                                <td class="td6" id="file18_importcount">-</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

        </body>

        </html>