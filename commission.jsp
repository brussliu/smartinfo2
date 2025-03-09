<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>手数料見積情報管理</title>
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
                 // CTRL+O
                 $(window).keydown(function(e) {
                  
                    if (e.keyCode == 79 && e.ctrlKey) {

                        outputToExcelFile(); 
                    } 
                });      
                
                function typeDistinction(){
                    var $table = $("#commissiontable");
                    // 最小值映射
                    var minnum =  new Array();
                    // 番号数组-记录行号
                    var minnumMap = new Map();
                    // 每个番号数组第一行
                    var index = 0;

                    $table.find("tr").each(function() {
                        var $row = $(this);
                        // 商品管理番号
                        var productno = $row.find("td:eq(2)").text().trim();
                        // 配送代行手数料区分
                        var type = $row.find("td:eq(12)").text().trim(); 
                        // 配送代行手数料見積額
                        var num = isNaN(parseFloat($row.find("td:eq(13)").text().trim()))? 0 :parseFloat($row.find("td:eq(13)").text().trim());
                        // 行号
                        var col = parseInt($row.find("td:eq(0)").text().trim()) - 1; 
                    
                        if(index == 0){
                            if(type != 'FBM-01'){
                             
                                minnum[0] = col;
                                minnum[1] = num;
                                minnumMap.set(minnum[0] ,minnum[1]);
                                
                            }
                           
                        }else{
                             // 如果当前行是新类型（与上一行类型不同），添加粗线下划线
                                if ( productno != $row.next().find("td:eq(2)").text().trim()) {
                                        $row.css("border-bottom","2px solid black");
                                        if(type != 'FBM-01'){
                                            // 当前行的数大于最小值
                                            if(num >=  minnum[1]){
                                                minnumMap.set(col,num);
                                            }else{
                                                // 当前行小于最小值，替换
                                                minnumMap.set(minnum[0] , minnum[1]);

                                            }
                                        }
                                        // 选出除最小值外的数据
                                        let newMap = new Map();  
                                        minnumMap.forEach(function(value , key) { 
                                            if (value !== minnum[1]) {  
                                                newMap.set(key, value);  
                                            }  
                                        });
                                        // 除最小值外的变色
                                        newMap.forEach(function(value , key) { 
                                            $('#commissiontable tr').eq(key).find('td:nth-child(13) , td:nth-child(14)').css('background-color', 'yellow');
                                            
                                        });
                                        minnumMap.clear(); 
                                        minnum = [];
                                        index = -1;
                                }else{
                                    if(type != 'FBM-01'){
                                        // 当前行的数大于最小值
                                        if(num >=  minnum[1]){
                                            minnumMap.set(col,num);
                                        }else{
                                            // 当前行小于最小值，替换
                                            minnumMap.set(minnum[0] , minnum[1]);
                                            minnum = [];
                                            minnum[0] = col;
                                            minnum[1] = num; 
                                        }
                                    }
                                }
                        }
                       
                        // 数组行号+1
                        index++;
                     
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
                                    <td style="width: 120px;"><a target="_blank" href="https://sellercentral.amazon.co.jp/help/hub/reference/200336920">販売手数料金</a></td>
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