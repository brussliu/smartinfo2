<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>仕入情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <script>
                function scrollHead(obj) {

                    var p = $(obj).get(0).scrollLeft;
                    $(".c_detail_header").get(0).scrollLeft = p;

                }

     
            </script>
            <style>
                /* c_query */
                .c_query {
                    width: var(--width);
                    /* height: 216px; */
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


                .three table {
                    border-collapse: collapse;
                    text-align: center;
                    width: 1824px;
                    word-break: break-all;
                }

                .three td {
                    height: 65px;
                }

                /* info */
                .info {
                    width: 95%;
                    margin: auto;
                    height: 750px;
                    overflow: auto;
                }

                .table_btn tr td {
                    width: 6%;
                }

                .info th {
                    height: 45px;
                    border: 1px solid black;
                    background-color: #f6f6f6;
                }



                .info div {
                    width: 100px;
                    height: 30px;
                    border: 1px solid whitesmoke;
                    border-radius: 20px;
                    box-shadow: 2px 2px 1px #888888;
                }

                .send input:not(:first-child) {
                    margin-left: 20px;
                }

                .table_btn td button {
                    width: 100px;
                }

                .c {
                    text-align: center;
                }

                .l {
                    text-align: left;
                    /* padding-left: 5px; */
                }

                .l5 {
                    margin-left: 5px;
                }

                .r {
                    text-align: right;
                    /* padding-right: 5px; */
                }

                .r5 {
                    margin-right: 5px;
                }

               
            </style>
        </head>

        <body>
            <efw:Part path="purchase_content_inputdialog.jsp" />
            <efw:Part path="purchase_detail_inputdialog.jsp" />
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
                    <p><a href="menu.jsp">メニュー</a> > 仕入情報管理</p>
                </div>
                <div class="c_query">
                    <div style="width: 95%;margin: auto; ">
                        <table class="table_btn">
                            <tbody>
                                <tr>
                                    <td style="font-weight: bold;color: maroon">【検索条件】</td>

                                    <td></td>
                                    <td></td>
                                    <td></td>

                                    <td></td>
                                    <td></td>
                                    <td></td>

                                    <td></td>
                                    <td></td>
                                    <td><button>新規</button></td>
                                    <td><button onclick="purchase_content_inputdialog.dialog('open');">仕入内容</button></td>
                                    <td><button>仕入更新</button></td>


                                    <td><button>仕入削除</button></td>

                                    <td><button>仕入発送</button></td>
                                    <td><button>仕入受取</button></td>
                                    <td><button>仕入完了</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>



                    <div class="c_detail_header" style="overflow: hidden;" onscroll="scrollHead(this);">
                        <table class="table_detail_header" style="width: 2241px;table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 50px;" rowspan="2">選択</th>
                                    <th style="width: 170px" rowspan="2">仕入NO</th>
                                    <th style="width: 180px;" rowspan="2">仕入名称</th>

                                    <th style="width: 203px;" rowspan="2">仕入内容</th>
                                    <th style="width: 70px;" rowspan="2">数量</th>
                                    <th style="width: 101px;" rowspan="2">金額</th>
                                    <th style="width: 132px;" rowspan="2">ステータス</th>

                                    <th style="width: 132px;" rowspan="2">登録日</th>

                                    <th style="width: 132px" rowspan="2">発送日</th>

                                    <th style="width: 132px;" rowspan="2">受取日</th>
                                    <th style="width: 132px;" rowspan="2">完了日</th>

                                    <th style="width: 140px;" rowspan="2">発送方式</th>
                                    <th style="width: 130px" rowspan="2">為替レート</th>

                                    <th style="width: 130px;" class="l"><span class="l5">商品費用</span></th>
                                    <th style="width: 130px;" class="l"><span class="l5">物流費用</span></th>
                                    <th style="width: 130px" class="l"><span class="l5">税金</span></th>


                                    <th style="width: 147px;" class="l"><span class="l5">合計</span></th>

                                </tr>
                                <tr class="header">
                                    <th class="l"><span class="l5">商品費用（円）</span></th>
                                    <th class="l"><span class="l5">物流費用（円）</span></th>
                                    <th class="l"><span class="l5">税金（円）</span></th>
                                    <th class="l"><span class="l5">合計（円）</span></th>
                                </tr>
                            </thead>
                        </table>
                    </div>

                    <div class="c_detail_content" style="overflow: auto;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" style="width: 2224px;table-layout: fixed;">
                            <tbody>
                                <tr>
                                    <td style="width: 50px;" rowspan="2" class="c"><input type="radio"
                                            name="choice"></input></td>
                                    <td style="width: 170px" rowspan="2" class="l"><span
                                            class="l5 a" onclick="purchase_detail_inputdialog.dialog('open')">20230118-151418</span></td>
                                    <td style="width: 180px;" rowspan="2" class="l"><span
                                            class="l5">20230112-レインコート</span></td>

                                    <td style="width: 203px;" rowspan="2" class="l"><span
                                            class="l5">XXXXXXXXXXXXXX</span></td>
                                    <td style="width: 70px;" rowspan="2" class="r">70</td>
                                    <td style="width: 101px;" rowspan="2" class="c">999999.99</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2:钠品凳送</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 140px;" rowspan="2" class="c">2：海運（呉）</td>

                                    <td style="width: 130px;" rowspan="2" class="c"><span class="l5">5.12</td>

                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>

                                </tr>
                                <tr>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" rowspan="2" class="c"><input type="radio"
                                            name="choice"></input></td>
                                    <td style="width: 170px" rowspan="2" class="l"><span
                                            class="l5 a" onclick="purchase_detail_inputdialog.dialog('open')">20230118-151418</span></td>
                                    <td style="width: 180px;" rowspan="2" class="l"><span
                                            class="l5">20230112-レインコート</span></td>

                                    <td style="width: 203px;" rowspan="2" class="l"><span
                                            class="l5">XXXXXXXXXXXXXX</span></td>
                                    <td style="width: 70px;" rowspan="2" class="r">70</td>
                                    <td style="width: 101px;" rowspan="2" class="c">999999.99</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2:钠品凳送</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 140px;" rowspan="2" class="c">2：海運（呉）</td>

                                    <td style="width: 130px;" rowspan="2" class="c"><span class="l5">5.12</td>

                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>

                                </tr>
                                <tr>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" rowspan="2" class="c"><input type="radio"
                                            name="choice"></input></td>
                                    <td style="width: 170px" rowspan="2" class="l"><span
                                            class="l5 a" onclick="purchase_detail_inputdialog.dialog('open')">20230118-151418</span></td>
                                    <td style="width: 180px;" rowspan="2" class="l"><span
                                            class="l5">20230112-レインコート</span></td>

                                    <td style="width: 203px;" rowspan="2" class="l"><span
                                            class="l5">XXXXXXXXXXXXXX</span></td>
                                    <td style="width: 70px;" rowspan="2" class="r">70</td>
                                    <td style="width: 101px;" rowspan="2" class="c">999999.99</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2:钠品凳送</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 140px;" rowspan="2" class="c">2：海運（呉）</td>

                                    <td style="width: 130px;" rowspan="2" class="c"><span class="l5">5.12</td>

                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>

                                </tr>
                                <tr>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" rowspan="2" class="c"><input type="radio"
                                            name="choice"></input></td>
                                    <td style="width: 170px" rowspan="2" class="l"><span
                                            class="l5 a" onclick="purchase_detail_inputdialog.dialog('open')">20230118-151418</span></td>
                                    <td style="width: 180px;" rowspan="2" class="l"><span
                                            class="l5">20230112-レインコート</span></td>

                                    <td style="width: 203px;" rowspan="2" class="l"><span
                                            class="l5">XXXXXXXXXXXXXX</span></td>
                                    <td style="width: 70px;" rowspan="2" class="r">70</td>
                                    <td style="width: 101px;" rowspan="2" class="c">999999.99</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2:钠品凳送</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 140px;" rowspan="2" class="c">2：海運（呉）</td>

                                    <td style="width: 130px;" rowspan="2" class="c"><span class="l5">5.12</td>

                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>

                                </tr>
                                <tr>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" rowspan="2" class="c"><input type="radio"
                                            name="choice"></input></td>
                                    <td style="width: 170px" rowspan="2" class="l"><span
                                            class="l5 a" onclick="purchase_detail_inputdialog.dialog('open')">20230118-151418</span></td>
                                    <td style="width: 180px;" rowspan="2" class="l"><span
                                            class="l5">20230112-レインコート</span></td>

                                    <td style="width: 203px;" rowspan="2" class="l"><span
                                            class="l5">XXXXXXXXXXXXXX</span></td>
                                    <td style="width: 70px;" rowspan="2" class="r">70</td>
                                    <td style="width: 101px;" rowspan="2" class="c">999999.99</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2:钠品凳送</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 140px;" rowspan="2" class="c">2：海運（呉）</td>

                                    <td style="width: 130px;" rowspan="2" class="c"><span class="l5">5.12</td>

                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>

                                </tr>
                                <tr>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" rowspan="2" class="c"><input type="radio"
                                            name="choice"></input></td>
                                    <td style="width: 170px" rowspan="2" class="l"><span
                                            class="l5 a" onclick="purchase_detail_inputdialog.dialog('open')">20230118-151418</span></td>
                                    <td style="width: 180px;" rowspan="2" class="l"><span
                                            class="l5">20230112-レインコート</span></td>

                                    <td style="width: 203px;" rowspan="2" class="l"><span
                                            class="l5">XXXXXXXXXXXXXX</span></td>
                                    <td style="width: 70px;" rowspan="2" class="r">70</td>
                                    <td style="width: 101px;" rowspan="2" class="c">999999.99</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2:钠品凳送</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 140px;" rowspan="2" class="c">2：海運（呉）</td>

                                    <td style="width: 130px;" rowspan="2" class="c"><span class="l5">5.12</td>

                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>

                                </tr>
                                <tr>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" rowspan="2" class="c"><input type="radio"
                                            name="choice"></input></td>
                                    <td style="width: 170px" rowspan="2" class="l"><span
                                            class="l5 a" onclick="purchase_detail_inputdialog.dialog('open')">20230118-151418</span></td>
                                    <td style="width: 180px;" rowspan="2" class="l"><span
                                            class="l5">20230112-レインコート</span></td>

                                    <td style="width: 203px;" rowspan="2" class="l"><span
                                            class="l5">XXXXXXXXXXXXXX</span></td>
                                    <td style="width: 70px;" rowspan="2" class="r">70</td>
                                    <td style="width: 101px;" rowspan="2" class="c">999999.99</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2:钠品凳送</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 140px;" rowspan="2" class="c">2：海運（呉）</td>

                                    <td style="width: 130px;" rowspan="2" class="c"><span class="l5">5.12</td>

                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>

                                </tr>
                                <tr>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" rowspan="2" class="c"><input type="radio"
                                            name="choice"></input></td>
                                    <td style="width: 170px" rowspan="2" class="l"><span
                                            class="l5 a" onclick="purchase_detail_inputdialog.dialog('open')">20230118-151418</span></td>
                                    <td style="width: 180px;" rowspan="2" class="l"><span
                                            class="l5">20230112-レインコート</span></td>

                                    <td style="width: 203px;" rowspan="2" class="l"><span
                                            class="l5">XXXXXXXXXXXXXX</span></td>
                                    <td style="width: 70px;" rowspan="2" class="r">70</td>
                                    <td style="width: 101px;" rowspan="2" class="c">999999.99</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2:钠品凳送</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 140px;" rowspan="2" class="c">2：海運（呉）</td>

                                    <td style="width: 130px;" rowspan="2" class="c"><span class="l5">5.12</td>

                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>

                                </tr>
                                <tr>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" rowspan="2" class="c"><input type="radio"
                                            name="choice"></input></td>
                                    <td style="width: 170px" rowspan="2" class="l"><span
                                            class="l5 a" onclick="purchase_detail_inputdialog.dialog('open')">20230118-151418</span></td>
                                    <td style="width: 180px;" rowspan="2" class="l"><span
                                            class="l5">20230112-レインコート</span></td>

                                    <td style="width: 203px;" rowspan="2" class="l"><span
                                            class="l5">XXXXXXXXXXXXXX</span></td>
                                    <td style="width: 70px;" rowspan="2" class="r">70</td>
                                    <td style="width: 101px;" rowspan="2" class="c">999999.99</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2:钠品凳送</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 140px;" rowspan="2" class="c">2：海運（呉）</td>

                                    <td style="width: 130px;" rowspan="2" class="c"><span class="l5">5.12</td>

                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>

                                </tr>
                                <tr>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" rowspan="2" class="c"><input type="radio"
                                            name="choice"></input></td>
                                    <td style="width: 170px" rowspan="2" class="l"><span
                                            class="l5 a" onclick="purchase_detail_inputdialog.dialog('open')">20230118-151418</span></td>
                                    <td style="width: 180px;" rowspan="2" class="l"><span
                                            class="l5">20230112-レインコート</span></td>

                                    <td style="width: 203px;" rowspan="2" class="l"><span
                                            class="l5">XXXXXXXXXXXXXX</span></td>
                                    <td style="width: 70px;" rowspan="2" class="r">70</td>
                                    <td style="width: 101px;" rowspan="2" class="c">999999.99</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2:钠品凳送</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 140px;" rowspan="2" class="c">2：海運（呉）</td>

                                    <td style="width: 130px;" rowspan="2" class="c"><span class="l5">5.12</td>

                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>

                                </tr>
                                <tr>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" rowspan="2" class="c"><input type="radio"
                                            name="choice"></input></td>
                                    <td style="width: 170px" rowspan="2" class="l"><span
                                            class="l5 a" onclick="purchase_detail_inputdialog.dialog('open')">20230118-151418</span></td>
                                    <td style="width: 180px;" rowspan="2" class="l"><span
                                            class="l5">20230112-レインコート</span></td>

                                    <td style="width: 203px;" rowspan="2" class="l"><span
                                            class="l5">XXXXXXXXXXXXXX</span></td>
                                    <td style="width: 70px;" rowspan="2" class="r">70</td>
                                    <td style="width: 101px;" rowspan="2" class="c">999999.99</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2:钠品凳送</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 140px;" rowspan="2" class="c">2：海運（呉）</td>

                                    <td style="width: 130px;" rowspan="2" class="c"><span class="l5">5.12</td>

                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>

                                </tr>
                                <tr>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" rowspan="2" class="c"><input type="radio"
                                            name="choice"></input></td>
                                    <td style="width: 170px" rowspan="2" class="l"><span
                                            class="l5 a" onclick="purchase_detail_inputdialog.dialog('open')">20230118-151418</span></td>
                                    <td style="width: 180px;" rowspan="2" class="l"><span
                                            class="l5">20230112-レインコート</span></td>

                                    <td style="width: 203px;" rowspan="2" class="l"><span
                                            class="l5">XXXXXXXXXXXXXX</span></td>
                                    <td style="width: 70px;" rowspan="2" class="r">70</td>
                                    <td style="width: 101px;" rowspan="2" class="c">999999.99</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2:钠品凳送</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 140px;" rowspan="2" class="c">2：海運（呉）</td>

                                    <td style="width: 130px;" rowspan="2" class="c"><span class="l5">5.12</td>

                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>

                                </tr>
                                <tr>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" rowspan="2" class="c"><input type="radio"
                                            name="choice"></input></td>
                                    <td style="width: 170px" rowspan="2" class="l"><span
                                            class="l5 a" onclick="purchase_detail_inputdialog.dialog('open')">20230118-151418</span></td>
                                    <td style="width: 180px;" rowspan="2" class="l"><span
                                            class="l5">20230112-レインコート</span></td>

                                    <td style="width: 203px;" rowspan="2" class="l"><span
                                            class="l5">XXXXXXXXXXXXXX</span></td>
                                    <td style="width: 70px;" rowspan="2" class="r">70</td>
                                    <td style="width: 101px;" rowspan="2" class="c">999999.99</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2:钠品凳送</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 140px;" rowspan="2" class="c">2：海運（呉）</td>

                                    <td style="width: 130px;" rowspan="2" class="c"><span class="l5">5.12</td>

                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>

                                </tr>
                                <tr>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" rowspan="2" class="c"><input type="radio"
                                            name="choice"></input></td>
                                    <td style="width: 170px" rowspan="2" class="l"><span
                                            class="l5 a" onclick="purchase_detail_inputdialog.dialog('open')">20230118-151418</span></td>
                                    <td style="width: 180px;" rowspan="2" class="l"><span
                                            class="l5">20230112-レインコート</span></td>

                                    <td style="width: 203px;" rowspan="2" class="l"><span
                                            class="l5">XXXXXXXXXXXXXX</span></td>
                                    <td style="width: 70px;" rowspan="2" class="r">70</td>
                                    <td style="width: 101px;" rowspan="2" class="c">999999.99</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2:钠品凳送</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 140px;" rowspan="2" class="c">2：海運（呉）</td>

                                    <td style="width: 130px;" rowspan="2" class="c"><span class="l5">5.12</td>

                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>

                                </tr>
                                <tr>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" rowspan="2" class="c"><input type="radio"
                                            name="choice"></input></td>
                                    <td style="width: 170px" rowspan="2" class="l"><span
                                            class="l5 a" onclick="purchase_detail_inputdialog.dialog('open')">20230118-151418</span></td>
                                    <td style="width: 180px;" rowspan="2" class="l"><span
                                            class="l5">20230112-レインコート</span></td>

                                    <td style="width: 203px;" rowspan="2" class="l"><span
                                            class="l5">XXXXXXXXXXXXXX</span></td>
                                    <td style="width: 70px;" rowspan="2" class="r">70</td>
                                    <td style="width: 101px;" rowspan="2" class="c">999999.99</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2:钠品凳送</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 140px;" rowspan="2" class="c">2：海運（呉）</td>

                                    <td style="width: 130px;" rowspan="2" class="c"><span class="l5">5.12</td>

                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>

                                </tr>
                                <tr>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" rowspan="2" class="c"><input type="radio"
                                            name="choice"></input></td>
                                    <td style="width: 170px" rowspan="2" class="l"><span
                                            class="l5 a" onclick="purchase_detail_inputdialog.dialog('open')">20230118-151418</span></td>
                                    <td style="width: 180px;" rowspan="2" class="l"><span
                                            class="l5">20230112-レインコート</span></td>

                                    <td style="width: 203px;" rowspan="2" class="l"><span
                                            class="l5">XXXXXXXXXXXXXX</span></td>
                                    <td style="width: 70px;" rowspan="2" class="r">70</td>
                                    <td style="width: 101px;" rowspan="2" class="c">999999.99</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2:钠品凳送</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 140px;" rowspan="2" class="c">2：海運（呉）</td>

                                    <td style="width: 130px;" rowspan="2" class="c"><span class="l5">5.12</td>

                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>

                                </tr>
                                <tr>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" rowspan="2" class="c"><input type="radio"
                                            name="choice"></input></td>
                                    <td style="width: 170px" rowspan="2" class="l"><span
                                            class="l5 a" onclick="purchase_detail_inputdialog.dialog('open')">20230118-151418</span></td>
                                    <td style="width: 180px;" rowspan="2" class="l"><span
                                            class="l5">20230112-レインコート</span></td>

                                    <td style="width: 203px;" rowspan="2" class="l"><span
                                            class="l5">XXXXXXXXXXXXXX</span></td>
                                    <td style="width: 70px;" rowspan="2" class="r">70</td>
                                    <td style="width: 101px;" rowspan="2" class="c">999999.99</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2:钠品凳送</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 140px;" rowspan="2" class="c">2：海運（呉）</td>

                                    <td style="width: 130px;" rowspan="2" class="c"><span class="l5">5.12</td>

                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>

                                </tr>
                                <tr>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" rowspan="2" class="c"><input type="radio"
                                            name="choice"></input></td>
                                    <td style="width: 170px" rowspan="2" class="l"><span
                                            class="l5 a" onclick="purchase_detail_inputdialog.dialog('open')">20230118-151418</span></td>
                                    <td style="width: 180px;" rowspan="2" class="l"><span
                                            class="l5">20230112-レインコート</span></td>

                                    <td style="width: 203px;" rowspan="2" class="l"><span
                                            class="l5">XXXXXXXXXXXXXX</span></td>
                                    <td style="width: 70px;" rowspan="2" class="r">70</td>
                                    <td style="width: 101px;" rowspan="2" class="c">999999.99</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2:钠品凳送</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>

                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 132px;" rowspan="2" class="c">2023/01/18</td>
                                    <td style="width: 140px;" rowspan="2" class="c">2：海運（呉）</td>

                                    <td style="width: 130px;" rowspan="2" class="c"><span class="l5">5.12</td>

                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>
                                    <td style="width: 130px;" class="l"><span class="l5">999999.99元</span></td>

                                </tr>
                                <tr>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>
                                    <td class="l"><span class="l5">999999.99円</span></td>

                                </tr>
                                

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </body>

        </html>