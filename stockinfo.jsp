<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>在庫情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <script>
                function scrollHead(obj) {

                    var p = $(obj).get(0).scrollLeft;
                    $(".c_detail_header").get(0).scrollLeft = p;

                }
                function init() {
                    Efw('stockinfo_init');
                }

                // 检索
                function searchstockinfo() {
                    var producttypeArr = new Array();
                    $('#checkbox_producttype input:checkbox:checked').each(function (index, item) {
                        producttypeArr.push($(this).val());
                    });

                    // var send = new Array();
                    // $('#checkbox_send input:checkbox:checked').each(function (index, item) {
                    //     send.push($(this).val());
                    // });
                    Efw('stockinfo_search', { 'producttypeArr': producttypeArr});
                }

                // 选中当前数据，编辑LOCAL在庫
                function check(val) {
                    // 途中（納品）
                    var span_put = $(val).parent().next().next().next().next().next().next().next().next().next().next().next().next().children();
                    var put = $(val).parent().next().next().next().next().next().next().next().next().next().next().next().next();
                    // 途中（LOCAL）
                    var span_local = $(val).parent().next().next().next().next().next().next().next().next().next().next().next().next().next().children();
                    var local = $(val).parent().next().next().next().next().next().next().next().next().next().next().next().next().next();
                    // 途中（仕入）
                    var span_purchase = $(val).parent().next().next().next().next().next().next().next().next().next().next().next().next().next().next().children();
                    var purchase = $(val).parent().next().next().next().next().next().next().next().next().next().next().next().next().next().next();

                    if ($(val).is(':checked')) {
                        if (span_put.html() != "" && span_put.html() != null && span_put.html() != '0') {
                            span_put.css("display", "none");
                            put.append('<input type="text" class="text_put"value="' + span_put.html() + '"style="width:60px;height: 30px;"></input>')
                            put.data("text", "1");
                        }
                        if (span_purchase.html() != "" && span_purchase.html() != null && span_purchase.html() != '0') {
                            span_purchase.css("display", "none");
                            purchase.append('<input type="text" class="text_purchase"value="' + span_purchase.html() + '"style="width:60px;height: 30px;"></input>')
                            purchase.data("text", "1");
                        }
                        span_local.css("display", "none");
                        local.append('<input type="text" class="text_local"value="' + span_local.html() + '"style="width:60px;height: 30px;"></input>')

                    } else {
                        span_put.css("display", "block");
                        span_local.css("display", "block");
                        span_purchase.css("display", "block");
                        $(".text_put").remove();
                        $(".text_local").remove();
                        $(".text_purchase").remove();
                    }
                }

                // 更新
                function updatestock() {

                    var alllocalArr = new Array();

                    $("#stocktable").find("tr").each(function () {

                        var tdArr = $(this).children();

                        var checkbox = tdArr.eq(0).children().get(0);

                        if (checkbox != undefined && checkbox.checked) {

                            // 暫定フラグ
                            var flg = tdArr.eq(0).children().eq(1).val();
                            // ASIN番号
                            var asin = tdArr.eq(6).html();
                            // SKU番号
                            var sku = tdArr.eq(7).html();
                            // LOCAL在庫
                            var local = tdArr.eq(13).children().next().val();
                            // 商品種別
                            var producttype = tdArr.eq(1).children().html();
                            // 商品管理番号
                            var productno = tdArr.eq(2).html();
                            // 親子区分
                            var preproduct = tdArr.eq(3).html();
                            // 分類①
                            var productsub1 = tdArr.eq(4).children().html();
                            // 分類②
                            var productsub2 = tdArr.eq(5).children().html();

                            var localArr = new Array();

                            localArr.push(flg);
                            localArr.push(sku);
                            localArr.push(asin);
                            localArr.push(local);
                            localArr.push(producttype);
                            localArr.push(productno);
                            localArr.push(preproduct);
                            localArr.push(productsub1);
                            localArr.push(productsub2);

                            //途中（入庫）
                            var put = tdArr.eq(12);
                            if (put.data("text") != "undefined") {
                                var putval = tdArr.eq(12).children().next().val();
                                localArr.push(putval);
                            }else{
                                localArr.push(null);
                            }

                            // 途中（仕入）
                            var purchase = tdArr.eq(14);
                            if (purchase.data("text") != "undefined") {
                                var purchaseval = tdArr.eq(15).children().next().val();
                                localArr.push(purchaseval);
                            }else{
                                localArr.push(null);
                            }

                            alllocalArr.push(localArr);

                        }

                    });

                    if (alllocalArr.length > 0) {
                        Efw('stockinfo_update', { 'alllocalArr': alllocalArr });
                    }

                }

                // 出力（１：納品出力　２：仕入出力）
                function output(val) {
                    console.log("outputdeliver");
                    Efw('stockinfo_output', { 'exl': val });
                }

                // // 输出仕入EXCEL
                // function outputreceiving(val) {
                //     console.log("outputreceiving");
                //     Efw('stockinfo_output', { 'exl': val });
                // }
                
                function changeColor() {

                    var oyflg = false;
                    var oldproductno = "";

                    $("#stocktable").find("tr").each(function () {

                        var tdArr = $(this).children();

                        // 商品管理番号
                        var newproductno = tdArr.eq(2).html();
                        // 親子区分
                        var productkinds = tdArr.eq(3).html();

                        var flg = false;
                        if (newproductno != oldproductno) {
                            flg = true;
                        }
                        // 商品管理番号変わる
                        if (flg) {
                            oyflg = false;
                        }

                        if (productkinds == "親商品") {
                            // sl：清空操作格
                            tdArr.eq(0).html('');
                            // 行の色を変更
                            $(this).css({ "background": "rgb(153,217,234)" });
                            oyflg = true;
                        }

                        if (productkinds == "子商品") {

                            // チェックボックス列の色を変更
                            if (oyflg) {
                                $(this).css({ "background": "rgb(210,255,255)" });
                                tdArr.eq(0).css({ "background": "rgb(153,217,234)" });
                            } else {
                                $(this).css({ "background": "rgb(255,255,240)" });
                            }
                        }
                        oldproductno = newproductno;


                    });
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
                    <p><a href="menu.jsp">メニュー</a> > 在庫情報管理</p>
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
                                    <td style="width: 200px;"><button onclick="output('1')">納品出力</button></td>
                                    <td style="width: 200px;"><button onclick="output('2')">仕入出力</button></td>
                                    <td style="width: 200px;"><button onclick="updatestock()">更新</button></td>
                                    <td style="width: 200px;"><button onclick="searchstockinfo()">検索</button></td>
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
                              
                                    <td style="width: 110px;font-weight: bold;">発送方式：</td>
                                    <td style="width: 180px;" id="checkbox_send">
                                        <input type="checkbox" value="FBA" id="shippingway_fba"> FBA
                                        &ensp; <input type="checkbox" value="FBM" id="shippingway_fbm"> FBM

                                    </td>
                                    <td style="width: 110px;font-weight: bold;">
                                        <!-- 表示項目： -->
                                    </td>
                                    <td style="width: 350px;">
                                        <!-- <input type="checkbox" id="checkbox_ASL" value="ASIN、SKU、LABEL" checked>
                                        ASIN、SKU、LABEL
                                        &nbsp;
                                        <input type="checkbox" id="checkbox_productname" value="商品名称" checked> 商品名称 -->
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_detail_header" style="overflow: hidden;display: none;">
                        <table class="table_detail_header" style="width: 2685px;table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 50px;">操作</th>
                                    <th style="width: 140px">商品種別</th>
                                    <th style="width: 80px;">商品<br>管理番号</th>

                                    <th style="width: 70px;">親子区分</th>
                                    <th style="width: 160px;">分類①</th>
                                    <th style="width: 160px;">分類②</th>

                                    <th style="width: 120px;">ASIN番号</th>
                                    <th style="width: 150px;">SKU番号</th>
                                    <th style="width: 120px">LABEL番号</th>
                                    <!-- <th style="width: 817px;">商品名称</th> -->

                                    <th style="width: 80px;">发送方式</th>
                                    <th style="width: 80px;">FBA在庫</th>
                                    <th style="width: 80px;">FBM在庫</th>

                                    <th style="width: 80px;">途中<br>（入庫）</th>
                                    <th style="width: 80px;">LOCAL<br>在庫</th>
                                    <th style="width: 80px;">途中<br>（仕入）</th>

                                    <th style="width: 80px;">在庫合計<br>（販売中）</th>
                                    <th style="width: 80px;">在庫合計<br>（予備）</th>
                                    <th style="width: 80px;">在庫合計<br>（全体）</th>

                                    <th style="width: 350px;">販売数量<br>（3日/7日/30日/60日/90日/180日/360日）</th>
                                    <th style="width: 100px;">販売数量<br>（日平均値）</th>
                                    <th style="width: 100px;">販売可能期間<br>（販売中）</th>

                                    <th style="width: 100px;">販売可能期間<br>（全体）</th>
                                    <th style="width: 100px;">推奨納品数量</th>
                                    <th style="width: 117px;">推奨仕入数量</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="c_detail_content" style="overflow: auto;display: none;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" style="width: 2668px;table-layout: fixed;" id="stocktable">
                            <tbody>
                                <!-- 
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this)"
                                            name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">number(W001)</td>

                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>

                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 817px;" class="l"><span>【Smart-Bear】P002 キッズ服 Tシ </span></td>

                                    <td style="width: 80px;" class="c">fma</td>
                                    <td style="width: 80px;" class="r"><span class="r5">1</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">2</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">3</span></td>

                                    <td style="width: 80px;" class="c"><span>{lsssscal}</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">4</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">5</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">6</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">7</span></td>
                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>

                                    <td style="width: 100px;" class="r"><span class="r5">8.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                </tr> 
                                -->
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

        </body>

        </html>