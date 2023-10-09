<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>手数料見積情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <script>
                function scrollHead(obj) {

                    var p = $(obj).get(0).scrollLeft;
                    $(".c_detail_header").get(0).scrollLeft = p;

                }
                function init() {
                    Efw('commission_init');
                }

                // 检索
                function searchcommission() {
                    var producttypeArr = new Array();
                    $('#checkbox_producttype input:checkbox:checked').each(function (index, item) {
                        producttypeArr.push($(this).val());
                    });

                   
                    Efw('commission_search', { 'producttypeArr': producttypeArr});
                }
 
           
           </script>
            <style>

            </style>
        </head>

        <body onload="init();">
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
                                <td style="text-align: right;padding-right: 20px;" id="sessioninfo">
                                    店舗ID：<span id="shopid" style="font-weight: bold;color: yellow;">未选择</span>
                                    &nbsp;&nbsp;&nbsp;
                                    UserID：<span id="userid" style="font-weight: bold;color: yellow;">XXXX</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="topnav">
                    <p><a href="menu.jsp">メニュー</a> > 手数料見積情報管理</p>
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
                                    <td></td>
                                    <td></td>
                                    <td style="width: 120px;"><a target="_blank" href="https://sellercentral.amazon.co.jp/help/hub/reference/201112670">販売手数料金</a></td>
                                    <td style="width: 120px;"><a target="_blank" href="https://sellercentral.amazon.co.jp/help/hub/reference/201112670">配送代行費用</a></td>
                                    <td style="width: 200px;"><button onclick="searchcommission()">検索</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_condition" style="height: 70px;">
                        <table>
                            <tbody>
                                <tr>
                                    <td style="width: 120px;font-weight: bold;">&nbsp;&nbsp;商品分類：</td>
                                    <td id="checkbox_producttype"></td>
                                </tr>
                            </tbody>
                        </table>

                        <table border="0">
                            <tbody>
                                <tr>
                                    <td style="width: 120px;font-weight: bold;">&nbsp;&nbsp;商品番号：</td>
                                    <td style="width: 150px;">
                                        <select id="opt_productno"
                                            style="width: 130px;height:30px;border-style: solid;">
                                            <option value=""></option>
                                        </select>
                                    </td>
                                    <td style="width: 120px;font-weight: bold;">キーワード：</td>
                                    <td style="width: 220px;">
                                        <input type="text" style="width: 200px;height: 30px;" id="text_keyword"></input>
                                    </td>
                                    <td style="width: 120px;font-weight: bold;">為替レート：</td>
                                    <td style="width: 220px;">
                                        <input type="number" style="width: 150px;height: 30px;" id="text_exchange"  value="5.00"></input>
                                    </td>
                                    <td style="width: 120px;"></td>
                                    <td style="width: 420px;"></td>
                                    <td style="width: 140px;font-weight: bold;color: #ff0000;">最終更新日：</td>
                                    <td id="td_time" style="color :#ff0000;"></td>
                                
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_detail_header" style="overflow: hidden;">
                        <table class="table_detail_header" style="table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 50px;">序号</th>
                                    <th style="width: 140px">商品種別</th>
                                    <th style="width: 75px;">商品<br>管理番号</th>

                                    <th style="width: 200px;">分類</th>

                                    <th style="width: 140px;">ASIN番号<br>SKU番号<br>LABEL番号</th>

                                    <th style="width: 90px;">長さ</th>
                                    <th style="width: 90px;">幅</th>
                                    <th style="width: 90px;">高さ</th>
                                    <th style="width: 90px;">重量</th>

                                    <th style="width: 90px;">販売価格</th>
                                    <th style="width: 100px;">販売手数料率</th>
                                    <th style="width: 100px;">販売手数料<br>見積額</th>

                                    <th style="width: 100px;">配送代行<br>手数料区分</th>
                                    <th style="width: 100px;">配送代行<br>手数料見積額 </th>
                                    <th style="width: 100px;">手数料<br>見積合計</th>
                                    
                                    <th style="width: 90px;">仕入価格</th>
                                    <th style="width: 105px;">粗利益<br>見積合計</th>

                                    </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="c_detail_content" style="overflow: auto;display: display;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" style="table-layout: fixed;" id="commissiontable">
                            <tbody>
                                
                                <!-- <tr>
                                    <td style="width: 50px;" class="c"></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">number(W001)</td>

                                    
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>

                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                 

                                    <td style="width: 80px;" class="c">999999</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="c"><span>999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>                               
                                </tr>  -->
                               
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

        </body>

        </html>