<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>商品別広告情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <script type="text/javascript" src="js/common.js"></script>
            <script>
                function scrollHead(obj) {

                    var p = $(obj).get(0).scrollLeft;
                    $(".c_detail_header").get(0).scrollLeft = p;

                }
                function init() {
                    Efw('advertising_init'); 
                }

                // 检索
                function searchadvertising() {
                    var producttypeArr = new Array();
                    $('#checkbox_producttype input:checkbox:checked').each(function (index, item) {
                        producttypeArr.push($(this).val());
                    }); 
                    Efw('advertising_search', { 'producttypeArr': producttypeArr});
                }
                 // CTRL+O
                $(window).keydown(function(e) {
                    
                    if (e.keyCode == 79 && e.ctrlKey) {

                        outputToExcelFile(); 
                    } 
                });

                function changeColor() {
  
                        $("#advertisingtable").find("tr").each(function () {

                            var tdArr = $(this).children();
                             
                            // 親子区分
                            var productkinds = tdArr.eq(3).text();  

                            if (productkinds == "親商品") {
                                $(this).css({ "background": "rgb(153,217,234)" });  
                            }     
                            var jpy = parseFloat(tdArr.eq(18).text()); 
                             // ACOS
                             var acos =  parseFloat(tdArr.eq(21).text().replace('%', '')); 
                             if (acos === 999.99 && jpy >= 500) {  
                                    tdArr.parent().css('background-color', 'yellow'); // 条件①  
                                } else if (acos >= 100.00 && acos < 999.99 && jpy >= 1000) {  
                                    tdArr.parent().css('background-color', 'yellow'); // 条件②  
                                } else if (acos >= 50.00 && acos < 100.00 && jpy >= 1500) {  
                                    tdArr.parent().css('background-color', 'yellow'); // 条件③  
                                } else if (acos >= 30.00 && acos < 50.00 && jpy >= 2000) {  
                                    tdArr.parent().css('background-color', 'yellow'); // 条件④  
                                } 

                        });
                }
           </script>
            <style>

            </style>
        </head>

        <body  onload="init();">
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
                    <p><a href="menu.jsp">メニュー</a> > 商品別広告情報管理</p>
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
                                    <td style="width: 200px;"><button onclick="searchadvertising()">検索</button></td>
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
                                </tr>
                            </tbody>
                        </table>

                        <table border="0">
                            <tbody>
                                <tr>
                                    <td style="width: 120px;font-weight: bold;">&nbsp;&nbsp;商品番号：</td>
                                    <td style="width: 150px;">
                                        <select id="opt_productno"  style="width: 130px;height:30px;border-style: solid;">
                                            <option value=""></option>
                                        </select>
                                    </td>
                                    <td style="width: 120px;font-weight: bold;">キーワード：</td>
                                    <td style="width: 220px;">
                                        <input type="text" style="width: 200px;height: 30px;" id="text_keyword"></input>
                                    </td>
                                    <td style="width: 60px;font-weight: bold;">年月：</td>
                                    <td style="width: 200px;">
                                        <select id="opt_yearmonths" style="width: 130px;height:30px;border-style: solid;">
                                                <option value=""></option> 
                                         </select>                                    
                                    </td>
                                    <td style="width: 200px;">
                                        <input type="checkbox" id="checkbox_preproduct" value="1" checked>&nbsp;&nbsp;親商品のみ
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_detail_header" style="overflow: hidden;">
                        <table class="table_detail_header" style="table-layout: fixed; width: 2904px;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 120px;">年月</th>
                                    <th style="width: 140px">商品種別</th>
                                    <th style="width: 80px;">商品<br>管理番号</th>
                                    <th style="width: 80px;">親子区分</th>
                                    <th style="width: 160px;">分類①</th>
                                    <th style="width: 160px;">分類②</th>

                                    <th style="width: 140px;">ASIN番号</th>
                                    <th style="width: 140px;">SKU番号</th>
                                    <th style="width: 140px;">LABEL番号</th>

                                    <th style="width: 120px;">ステータス</th>
                                    <th style="width: 120px;">タイプ</th>
                                    <th style="width: 200px;">スポンサープロダクト<br>広告の利用資格</th>
                                    <th style="width: 120px;">売上(JPY)</th>
                                    <th style="width: 120px;">ROAS</th>

                                    <th style="width: 120px;">コンバージョン率</th>
                                    <th style="width: 140px;">インプレッション数</th> 
                                    <th style="width: 120px;">クリック数</th>
                                    <th style="width: 120px;">クリック率<br>(CTR)</th>

                                    <th style="width: 120px;">広告費<br>(JPY)</th>
                                    <th style="width: 120px;">平均クリック単価<br>(CPC)(JPY)</th>
                                    <th style="width: 120px;">注文</th>
                                    <th style="width: 137px;">ACOS</th>
                                    
                                    </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="c_detail_content" style="overflow: auto;display: display;  margin-left:48px;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" style="table-layout: fixed;width: 2887px;" id="advertisingtable">
                             
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
                if(h4 == undefined){
                    h4 = 0;
                }
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