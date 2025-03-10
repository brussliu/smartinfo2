<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>在庫情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <link href="favicon.ico" rel="icon" type="image/x-icon" />
            <script type="text/javascript" src="js/common.js"></script>
            <script>
                function scrollHead(obj) {

                    var p = $(obj).get(0).scrollLeft;
                    $(".c_detail_header").get(0).scrollLeft = p;

                }
                function init() {
                    Efw('stockinfo_init');
                }

                 // CTRL+O
                 $(window).keydown(function(e) {
                    
                    if (e.keyCode == 79 && e.ctrlKey) {

                        outputToExcelFile(); 
                    } 
                });

                // 检索
                function searchstockinfo() {
                    var producttypeArr = new Array();
                    $('#checkbox_producttype input:checkbox:checked').each(function (index, item) {
                        producttypeArr.push($(this).val());
                    });

                    var keywordArr = new Array();
                    var text_keyword =$("#text_keyword").val()
                    keywordArr = text_keyword.split(' ') 

                    Efw('stockinfo_search', { 'producttypeArr': producttypeArr,'keywordArr':keywordArr});
                }

                // 选中当前数据，编辑LOCAL在庫
                function check(val) {
                    // 途中（納品）
                    var span_put = $(val).parent().next().next().next().next().next().next().next().next().next().next().next().next().next().next().children();
                    var put = $(val).parent().next().next().next().next().next().next().next().next().next().next().next().next().next().next();
                    
                    // LOCAL1
                    var span_local1 = $(val).parent().next().next().next().next().next().next().next().next().next().next().next().next().next().next().next().children();
                    var local1 = $(val).parent().next().next().next().next().next().next().next().next().next().next().next().next().next().next().next();
                    // LOCAL2
                    var span_local2 = $(val).parent().next().next().next().next().next().next().next().next().next().next().next().next().next().next().next().next().children();
                    var local2 = $(val).parent().next().next().next().next().next().next().next().next().next().next().next().next().next().next().next().next();
                    
                    // 途中（仕入）
                    var span_purchase = $(val).parent().next().next().next().next().next().next().next().next().next().next().next().next().next().next().next().next().next().children();
                    var purchase = $(val).parent().next().next().next().next().next().next().next().next().next().next().next().next().next().next().next().next().next();
                    
                    if ($(val).is(':checked')) {
                        if (span_put.html() != "" && span_put.html() != null && span_put.html() != '0') {
                            span_put.css("display", "none");
                            var sp = span_put.html() =="null"?"":span_put.html()
                            put.append('<input type="text" class="text_put"value="' + sp + '"style="width:60px;height: 30px;"></input>')
                            put.data("text", "1");
                        }
                        if (span_purchase.html() != "" && span_purchase.html() != null && span_purchase.html() != '0') {
                            span_purchase.css("display", "none");
                            var sp2 = span_purchase.html() =="null"?"":span_purchase.html() 
                            purchase.append('<input type="text" class="text_purchase"value="' + sp2  + '"style="width:60px;height: 30px;"></input>')
                            purchase.data("text", "1");
                        }
                        span_local1.css("display", "none");
                        var sp3 = span_local1.html() =="null"?"":span_local1.html() 
                        local1.append('<input type="text" class="text_local1" value="' + sp3 + '"style="width:60px;height: 30px;"></input>')
                       
                        span_local2.css("display", "none");
                        var sp4 = span_local2.html() =="null"?"":span_local2.html() 
                        local2.append('<input type="text" class="text_local2" value="' + sp4 + '"style="width:60px;height: 30px;"></input>')

                    } else {
                        span_put.css("display", "block");
                        span_local1.css("display", "block");
                        span_local2.css("display", "block");
                        span_purchase.css("display", "block");
                        $(".text_put").remove();
                        $(".text_local1").remove();
                        $(".text_local2").remove();
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
                            var asin = tdArr.eq(7).html();
                            // SKU番号
                            var sku = tdArr.eq(8).html();
                            // LOCAL1在庫
                            var local1 = tdArr.eq(15).children().next().val();
                            // LOCAL2在庫
                            var local2 = tdArr.eq(16).children().next().val();
                            // 商品種別
                            var producttype = tdArr.eq(2).children().html();
                            // 商品管理番号
                            var productno = tdArr.eq(3).html();
                            // 親子区分
                            var preproduct = tdArr.eq(4).html();
                            // 分類①
                            var productsub1 = tdArr.eq(5).children().html();
                            // 分類②
                            var productsub2 = tdArr.eq(6).children().html();

                            var localArr = new Array();

                            localArr.push(parseInt(flg));
                            localArr.push(sku);
                            localArr.push(asin);

                            localArr.push(parseInt(local1 == null?0:local1));

                            localArr.push(producttype);
                            localArr.push(productno);

                            localArr.push(preproduct);
                            localArr.push(productsub1);
                            localArr.push(productsub2);
                            
                            //途中（入庫）
                            var put = tdArr.eq(14);
                            if (put.data("text") != "undefined") {
                                var putval = tdArr.eq(14).children().next().val();
                                
                                localArr.push(parseInt(putval == 'null'?0:putval));
                            }else{
                                localArr.push(null);
                            }
                            
                            // 途中（仕入）
                            var purchase = tdArr.eq(17);
                            if (purchase.data("text") != "undefined") {
                                var purchaseval = tdArr.eq(17).children().next().val();
                                localArr.push(parseInt(purchaseval == 'null'?0:purchaseval));
                            }else{
                                localArr.push(null);
                            }
                             
                            localArr.push(parseInt(local2 == null?0:local2));
                            alllocalArr.push(localArr);
                        }

                    });

                    if (alllocalArr.length > 0) {
                        Efw('stockinfo_update', { 'alllocalArr': alllocalArr });
                    }

                }

                // 出力（１：納品出力　２：仕入出力）
                function output(val) {
                    
                    Efw('stockinfo_output', { 'exl': val });
                }

         
                
                function changeColor() {

                    var oyflg = false;
                    var oldproductno = "";

                    $("#stocktable").find("tr").each(function () {

                        var tdArr = $(this).children();

                        // 商品管理番号
                        var newproductno = tdArr.eq(3).html();
                        // 親子区分
                        var productkinds = tdArr.eq(4).html();

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

                        
                        // 仕入中止
                        if($(this).children().eq(1).children().html() == '止' || $(this).children().eq(1).children().html() == '削除済'){ 
                            $(this).css({ "background": "rgb(200,200,200)" }) 
                            $(this).children().eq(0).css({ "background": "rgb(200,200,200)" })
                            $(this).children().eq(1).css({"color" : "red"}) 
                        }
                    });
                }
           
 
                // 推奨数量入り
                function changeRecommend(val){
                   
                   var item = $(val).is(':checked');
                   
                    if(item==true){
                        $('#text_date').val(30)
                        $('#text_date').attr ("disabled",false);
                        
                  
                    }else{
                        $('#text_date').val('')
                        $('#text_date').attr ("disabled",true);
                    }
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
                    <div class="c_condition" style="height: 78px;">
                        <table>
                            <tbody>
                                <tr>
                                    <td style="width: 120px;font-weight: bold;">&nbsp;&nbsp;商品分類：</td>
                                    <td id="checkbox_producttype"></td>
                                    <td  style="width: 100px;font-weight: bold;">&nbsp;&nbsp;仕入先：</td>
                                    <td >
                                        <select style="width: 130px;height:30px;border-style: solid;" id="opt_purchase">
                                            <option value=""></option> 
                                            <option value="01">01.恩氏製衣</option>
                                            <option value="02">02.両匹狼</option>
                                            <option value="03">03.星峰製衣</option>
                                            <option value="99">99.その他</option>
                                        </select>
                                    </td>
                                    <td style="width: 250px;">
                                        <input type="checkbox" id="conceal" value="1" style="margin-left: 30px;">
                                        削除データも表示
                                    </td>
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
                                    <td style="width: 110px;font-weight: bold;">出力区分：</td>
                                    <td style="width: 150px;">
                                        <input type="checkbox" id="checkbox_recommend" value="1" onchange="changeRecommend(this)"> 推奨数量入り
                                    </td>
                                    <td style="width: 150px;">
                                        日数 <input type="text" style="width: 50px;height: 30px;" id="text_date" value="" disabled></input>
                                    </td>
                                    <td style="width: 550px;font-weight: bold;">
                                        数量範囲： <select id="select_item" style="width: 200px;height: 30px;">
                                        <option value=""></option>
                                        <option value="FBA在庫">FBA在庫</option>
                                        <option value="FBM在庫">FBM在庫</option>
                                        <option value="途中在庫_入庫">途中（入庫）</option>
                                        <option value="LOCAL在庫_1">LOCAL1在庫</option>
                                        <option value="LOCAL在庫_2">LOCAL2在庫</option>
                                        <option value="途中在庫_仕入">途中（仕入）</option>
                                        <option value="販売数量（直近３日間）">販売数量（直近３日間）</option>
                                        <option value="販売数量（直近７日間）">販売数量（直近７日間）</option>
                                        <option value="販売数量（直近３０日間）">販売数量（直近３０日間）</option>
                                        <option value="販売数量（直近６０日間）">販売数量（直近６０日間）</option>
                                        <option value="販売数量（直近９０日間）">販売数量（直近９０日間）</option>
                                        <option value="販売数量（直近１８０日間）">販売数量（直近１８０日間）</option>
                                        <option value="販売数量（直近３６０日間）">販売数量（直近３６０日間）</option>
                                        <option value="販売可能期間（販売中）">販売可能期間（販売中）</option>
                                        <option value="販売可能期間（全体）">販売可能期間（全体）</option>
                                        <option value="推奨納品数量">推奨納品数量</option>
                                        <option value="推奨仕入数量">推奨仕入数量</option>
                                         
                                    </select>
                                        <input id="text_minNum" type="text" style="width: 60px;height: 30px;margin-left: 10px;"></input><span style="text-align: center;margin: 0 5px;"> ~ </span>
                                        <input id="text_maxNum" type="text" style="width: 60px;height: 30px;"></input>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_detail_header" style="overflow: hidden;display: none;">
                        <table class="table_detail_header" style="width: 2937px;table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 50px;">操作</th>
                                    <th style="width: 50px;">STR</th>
                                    <th style="width: 140px">商品種別</th>
                                    <th style="width: 80px;">商品<br>管理番号</th>

                                    <th style="width: 70px;">親子区分</th>
                                    <th style="width: 160px;">分類①</th>
                                    <th style="width: 160px;">分類②</th>

                                    <th style="width: 120px;">ASIN番号</th>
                                    <th style="width: 150px;">SKU番号</th>
                                    <th style="width: 120px">LABEL番号</th> 
                                    <th style="width: 120px;">仕入先</th>

                                    <th style="width: 80px;">发送方式</th>
                                    <th style="width: 80px;">FBA在庫</th>
                                    <th style="width: 80px;">FBM在庫</th>

                                    <th style="width: 80px;">途中<br>（入庫）</th>
                                    <th style="width: 80px;">LOCAL1<br>在庫</th>
                                    <th style="width: 80px;">LOCAL2<br>在庫</th>
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
                        <table class="table_detail_content" style="width: 2920px;table-layout: fixed;" id="stocktable">
                           
                        </table>
                    </div>

                </div>
            </div>

        </body>
        <script>
            $(document).ready(function() {

                // 获取屏幕宽度
                var screenWidth = window.screen.width;

                // 获取屏幕高度
                var screenHeight = window.screen.height;

                // 获取屏幕可用工作区宽度（不包括任务栏等）
                var screenAvailableWidth = window.screen.availWidth;

                // 获取屏幕可用工作区高度（不包括任务栏等）
                var screenAvailableHeight = window.screen.availHeight;


                //alert(screenWidth);
                //alert(screenHeight);
                //alert(screenAvailableWidth);
                //alert(screenAvailableHeight);

                var h0 = $(document).height();
                

                var h1 = $(".head").height();
                var h2 = $(".topnav").height();
                var h3 = $(".c_btn").height();
                var h4 = $(".c_condition").height();
                var h5 = $(".c_detail_header").height();

                var h6 = h0 - h1 - h2 - h3 - h4 - h5 - 30 -120;

                // alert("h0:"+h0);
                // alert("h1:"+h1);
                // alert("h2:"+h2);
                // alert("h3:"+h3);
                // alert("h4:"+h4);
                // alert("h5:"+h5);

                // alert("h6:"+h6);
                $(".c_detail_content").height(h6);
                //alert(h4);

            });
        </script>
        </html>