<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>発送情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <script>
                function scrollHead(obj) {

                    var p = $(obj).get(0).scrollLeft;
                    $(".c_detail_header").get(0).scrollLeft = p;

                }


            </script>
            <style>
                .table_btn td button{
                    width: 150px;
                }
                /* .table_btn td{
                    width: 10%;
                }
                .btn {
                    float: right;
                    width: 170px;
                    height: 40px;
                    background: rgb(240, 240, 240);
                    font-size: 16px;
                    border: 1px solid rgb(206, 205, 205);
                    box-shadow: 2px 2px 2px #888888;
                    cursor: pointer;
                }
                .l span{
                    margin-left: 5px;
                }
                .r span{
                    margin-right: 5px;
                }
                .table_detail_content td input[type="text"]{
                    width: 150px;
                    height: 30px;
                } */
            </style>
        </head>

        <body>
            <efw:Part path="sending_inputdialog.jsp" />
            <efw:Part path="sending_list_inputdialog.jsp" />
        
            <div>
                <div class="head">
                    <div class="hleft">
                        <h1 style="height: 80px;line-height: 80px;margin-left:40px;">SmartInfo 2.0</h1>
                    </div>
                    <div class="hright">
                        <table style="float: right;width: 100%;color: aliceblue;">
                            <tr>
                                <td>
                                    <button class="hright_r"
                                        onclick="Efw('common_menu_goto',{page:'login.jsp'})">ログオフ</button>
                                    <button class="hright_r"
                                        onclick="Efw('common_menu_goto',{page:'shoplist.jsp'})">切替</button>
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
                    <p><a href="menu.jsp">メニュー</a> > 発送情報管理</p>
                </div>
                <div class="content">
                    <div class="c_btn" style="border-bottom: 1px solid black;">
                        <table class="table_btn" style="margin-bottom: 5px;">
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td style="width: 170px;" onclick="sending_list_inputdialog.dialog('open');"><button >商品集計</button></td>
                                    <td style="width: 170px;" onclick="sending_inputdialog.dialog('open');"><button >新規</button></td>
                                    <td style="width: 170px;" onclick="sending_inputdialog.dialog('open');"><button>更新</button></td>
                                    <td style="width: 170px;"><button >追跡番号更新</button></td>
                                    <td style="width: 170px;"><button >ラベル出力</button></td>
                                    <td style="width: 170px;"><button >削除</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_detail_header" style="overflow: hidden;">
                        <table class="table_detail_header" style="width: 2673px;table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 50px;">選択</th>
                                    <th style="width: 130px">区分</th>
                                    <th style="width: 180px;">追跡番号</th>

                                    <th style="width: 120px;">ステータス</th>
                                    <th style="width: 220px;">注文番号</th>
                                    <th style="width: 140px;">注文日時</th>

                                    <th style="width: 300px;">商品</th>
                                    <th style="width: 100px;">数量合計</th>
                                    <th style="width: 100px">金額合計</th>

                                    <th style="width: 100px;">郵便番号</th>
                                    <th style="width: 400px;">届け先住所</th>
                                    <th style="width: 120px;">届け先宛先</th>

                                    <th style="width: 150px">電話番号</th>
                                    <th style="width: 200px;">発送方法</th>
                                    <th style="width: 317px;">備考</th>

                                </tr>

                            </thead>
                        </table>
                    </div>
                    <div class="c_detail_content" style="overflow: auto;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" style="width: 2656px;table-layout: fixed;">
                            <tbody>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 220px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 130px;" class="l"><span class="l5">Paypayフリマ</span></td>
                                    <td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>
                                    <td style="width: 120px;" class="c">発送済</td>
                                    <td style="width: 250px;" class="c">250-1217803-6504627</td>
                                    <td style="width: 140px;" class="c">2021/12/12 12:12:12</td>
                                    <td style="width: 300px;" class="l">
                                        <span class="l5">W001</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span><br>
                                        <span class="l5">xxxxxxxxxxxxxxxx</span>
                                    </td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">999999 円</span></td>
                                    <td style="width: 100px;" class="c">999-9999</td>
                                    <td style="width: 400px;" class="l">
                                        <span class="l5">神奈川県</span><br>
                                        <span class="l5">横浜市泉区緑園4-1-2</span><br>
                                        <span class="l5">緑園都市耳鼻咽喉科 酒井医院緑園都市耳鼻咽喉科</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">田中 一郎</span></td>
                                    <td style="width: 150px;" class="l"><span class="l5">080-9999-9999</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">XXXXXXX</span></td>
                                    <td style="width: 300px;" class="l"><span class="l5">XXXXXXX</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </body>

        </html>