<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>在庫保管手数料管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <script>
                function scrollHead(obj) {

                    var p = $(obj).get(0).scrollLeft;
                    $(".c_detail_header").get(0).scrollLeft = p;

                }
                function init() {
                    Efw('stockcommission_init');
                }

                // 检索
                function searchstockcommission() {
                    var producttypeArr = new Array();
                    $('#checkbox_producttype input:checkbox:checked').each(function (index, item) {
                        producttypeArr.push($(this).val());
                    });

                   
                    Efw('stockcommission_search', { 'producttypeArr': producttypeArr});
                }
 
           </script>
            <style>
                .parents{
                    height: 40px;
                }
                .parents th{
                    border:0px
                }
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
                    <p><a href="menu.jsp">メニュー</a> > 在庫保管手数料管理</p>
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
                                    <td></td>
                                    <td></td>
                                     <td style="width: 200px;"><button onclick="searchstockcommission()">検索</button></td>
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
                                            <option value="マスタ未登録">マスタ未登録</option>
                                        </select>
                                    </td>
                                    <td style="width: 120px;font-weight: bold;">キーワード：</td>
                                    <td style="width: 220px;">
                                        <input type="text" style="width: 200px;height: 30px;" id="text_keyword"></input>
                                    </td>
                                    <td style="width: 80px;font-weight: bold;">年月：</td>
                                    <td style="width: 220px;">
                                        <select  id="opt_yearmonth" style="width: 130px;height:30px;border-style: solid;">
                                            <option value=""></option>
                                            <option value="マスタ未登録">マスタ未登録</option>
                                    </select>
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_detail_header" style="overflow: hidden;">
                        <table class="table_detail_header" style="width: 2644px;table-layout: fixed;">
                            <thead>
                                <tr class="parents" >
                                    <th style="width: 51px;"></th>
                                    <th style="width: 140px"></th>
                                    <th style="width: 141px"></th>
                                    <th style="width: 81px;"></th>
                                    <th style="width: 161px;"></th>
                                    <th style="width: 161px;"></th>

                                    <th style="width: 121px;"></th>
                                    <th style="width: 150px;"></th>
                                    <th style="width: 121px"></th>

                                    <th style="width: 81px;"></th>
                                    <th style="width: 81px;"></th>
                                    <th style="width: 81px;"></th>
                                    <th style="width: 81px;"></th>
                                    <th style="width: 81px;"></th>
                                    <th style="width: 81px;"></th>
                                    <th style="width: 80px;"></th>
                                    <!-- <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>

                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th> -->
                                    <th colspan="4"  style="width: 460px; border: 1px solid black;">通常在庫</th>
                                    <th colspan="4" style=" width: 440px;border: 1px solid black;">長期在庫</th>
                                </tr>
                                <tr class="header">
                                    <th style="width: 50px;">操作</th>
                                    <th style="width: 140px">年月</th>
                                    <th style="width: 140px">商品種別</th>
                                    <th style="width: 80px;">商品<br>管理番号</th>
                                    <th style="width: 160px;">分類①</th>
                                    <th style="width: 160px;">分類②</th>

                                    <th style="width: 120px;">ASIN番号</th>
                                    <th style="width: 150px;">SKU番号</th>
                                    <th style="width: 120px">LABEL番号</th>

                                    <th style="width: 80px;">国</th>
                                    <th style="width: 80px;">倉庫</th>
                                    <th style="width: 80px;">長さ</th>
                                    <th style="width: 80px;">幅</th>
                                    <th style="width: 80px;">高さ</th>
                                    <th style="width: 80px;">重量</th>
                                    <th style="width: 80px;">体積</th>

                                    <th style="width: 120px;">カテゴリ</th>
                                    <th style="width: 140px;">商品サイズ区分</th>
                                    <th style="width: 120px;">在庫保管<br>手数料見積額</th>
                                    <th style="width: 80px;">奨励金額</th>

                                    <th style="width: 120px;">対象期間</th>
                                    <th style="width: 120px;">請求手数料率</th>
                                    <th style="width: 120px;">請求対象在庫数</th>
                                    <th style="width: 80px;">請求金額</th>
                                    
                                    </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="c_detail_content" style="overflow: auto;display: display;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" style="width: 2628px;table-layout: fixed;" id="stockcommissiontable">
                            <tbody>
                                
                                <tr>
                                    <td style="width: 50px;" class="c"></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    <td style="width: 139px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">number(W001)</td>
                                    <td style="width: 161px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>

                                    <td style="width: 121px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 81px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 78px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 114px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 113px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 114px;" class="r">999999</td>
                                    <td style="width: 112px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 108px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 108px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 109px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 106px;" class="r"><span class="r5">999999</span></td>

                                </tr> 
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="c">2023/09/09</td>
                                    
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    
                                    <td style="width: 80px;" class="c">china</td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="c"><span>999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 140px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r">999999</td>

                                    <td style="width: 80px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>

                                    <td style="width: 120px;" class="r"><span class="r5">999999</span></td>
                                    <td style="width: 97px;" class="r"><span class="r5">999999</span></td>

                                </tr> 
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

        </body>

        </html>