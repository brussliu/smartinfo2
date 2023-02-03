<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>SmartInfo 2.0</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <script>
                function scrollHead(obj) {

                    var p = $(obj).get(0).scrollLeft;
                    $(".c_detail_header").get(0).scrollLeft = p;

                }
                function init() {
                    Efw('masterinfo_init');
                }

                function searchmasterinfo() {

                    var productdivArr = new Array();

                    $('#producttype input:checkbox:checked').each(function (index, item) {
                        productdivArr.push($(this).val());
                    });

                    var displayflg2 = "0";
                    $('#displayitem input:checkbox:checked').each(function (index, item) {

                        if ($(this).val() == 'ASIN、SKU、LABEL') {
                            displayflg2 = "1";
                        }

                    });

                  
                    Efw('masterinfo_search', { 'producttype': productdivArr, 'displayflg2': displayflg2 });
                }
            </script>

            <style>

            </style>
        </head>

        <body onload="init();">
            <efw:Part path="masterinfo_inputdialog.jsp" />
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
                    <p><a href="menu.jsp">メニュー</a> >マスタ情報管理</p>
                </div>
                <div class="content">
                    <div class="c_btn">
                        <table class="table_btn">
                            <tbody>
                                <tr>
                                    <td style="font-weight: bold;color: maroon">【検索条件】</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td style="width: 200px;"><button id="insert">新规</button></td>
                                    <td style="width: 200px;"><button id="searchbtn"onclick="searchmasterinfo()">検索</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_condition" style="height: 70px;">
                        <table>
                            <tbody>
                                <tr>
                                    <td style="width: 120px;font-weight: bold;">&nbsp;&nbsp;商品分類：</td>
                                    <td id="producttype">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <table>
                            <tbody>
                                <tr>
                                    <td style="width: 120px;font-weight: bold;">&nbsp;&nbsp;商品番号：</td>
                                    <td style="width: 140px;">
                                        <select style="width: 100px;height:30px;border-style: solid;" id="productno">
                                            <option value=""></option>
                                            <option value="マスタ未登録">マスタ未登録</option>
                                        </select>
                                    </td>
                                    <td style="width: 120px;font-weight: bold;">キーワード：</td>
                                    <td style="width: 190px;">
                                        <input type="text" style="width: 150px;height: 30px;" id="keyword"></input>
                                    </td>
                                    <td style="width: 120px;font-weight: bold;">表示項目：</td>
                                    <td style="width: 250px;">
                                        <input type="checkbox" value="ASIN、SKU、LABEL" checked> ASIN、SKU、LABEL
                                    </td>

                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_detail_header" style="overflow: hidden;">
                        <table class="table_detail_header" style="width: 2164px;table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 70px;">操作</th>
                                    <th style="width: 140px;">商品種別</th>
                                    <th style="width: 80px;">商品<br>管理番号</th>
                                    <th style="width: 70px;">親子区分</th>
                                    <th style="width: 160px;">分類①</th>
                                    <th style="width: 160px;">分類②</th>
                                    <th style="width: 120px;">ASIN番号</th>
                                    <th style="width: 150px;">SKU番号</th>
                                    <th style="width: 120px;">LABEL番号</th>
                                    <th style="width: 80px;">仕入価格</th>
                                    <th style="width: 160px;">FBA発送方式</th>
                                    <th style="width: 817px;">商品名称</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="c_detail_content" style="overflow: auto;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" style="width: 2147px;table-layout: fixed;"  id="stocktable">
                          
                                <tr>
                                    <td style="width: 70px;" class="c"><button class="btn" id="update"
                                            onclick="masterinfo_inputdialog.dialog('open');">更新</button></td>
                                    <td style="width: 140px;" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999.00</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">A:クリックポスト</span></td>
                                    <td style="width: 800px;" class="l"><span>【Smart-Bear】P002 キッズ服 Tシ </span></td>
                                </tr>

                
                        </table>
                    </div>

                </div>
            </div>
        </body>

        </html>