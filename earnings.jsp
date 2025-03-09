<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>壳上情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <link href="favicon.ico" rel="icon" type="image/x-icon" />
            <script type="text/javascript" src="js/common.js"></script>
            <script>
                 function scrollHead(obj) {
                    var p = $(obj).get(0).scrollLeft;
                    $(".c_detail_header").get(0).scrollLeft = p;
                }
                 function init(){

                    Efw('earnings_init');
                 }

                 function opendetail( val ){
                 
                    Efw('earnings_openearnings',{"yearmonth" : $(val).html()});

                 }
                 function openPurchase(val){
                  
                     Efw('earning_purchaselist',{"purchaseno" : $(val).html()});
                }
                 // CTRL+O
                 $(window).keydown(function(e) {
                    
                    if (e.keyCode == 79 && e.ctrlKey) {

                        outputToExcelFile(); 
                    } 
                });

            </script>
            <style>
                
            </style>
     
        </head>

        <body  onload="init();">

            <efw:Part path="earnings_detail_inputdialog.jsp" />
            <efw:Part path="earnings_stock_inputdialog.jsp" />
            <efw:Part path="earnings_purchase_inputdialog.jsp" />
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
                    <p><a href="menu.jsp">メニュー</a> > 壳上情報管理</p>
                </div>
                <div class="content">
                    <div class="c_btn" style="border-bottom: 1px solid black;">
                        <table class="table_btn" style="margin-bottom: 5px;">
                            <tbody>
                                <tr>
                                    <td> </td>
                                    <td> </td>
                                    <td> </td>
                                    <td> </td>
                                    <td> </td>
                                    <td style="width: 200px;"><button  onclick="earnings_stock_inputdialog.dialog('open');">在庫計算</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
 
                    <div class="c_detail_header" style="overflow: hidden;" onscroll="scrollHead(this);">
                        <table class="table_detail_header" style="table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 120px;">年月</th>
                                    <th style="width: 80px">注文数量</th>
                                    <th style="width: 110px;">注文粗利益</th>

                                    <th style="width: 100px;">月額登録料</th>
                                    <th style="width: 100px;">広告費用</th>

                                    <th style="width: 100px;">FBA入庫料金</th>
                                    <th style="width: 100px;">FBA保管料金</th>
                                    <th style="width: 100px;">FBA作業料金</th>
                                    <th style="width: 100px;">返品損失金額</th>

                                    <th style="width: 100px">振込金額</th>
                                    <th style="width: 110px;">仕入金額</th>
                                    <th style="width: 100px;">その他支払</th>
                                    <th style="width: 90px;">その他受領</th>

                                    <th style="width: 90px;">代行発送</th>
                                    <th style="width: 110px">純利益</th>
                                    <th style="width: 120px">売上累計</th>
                                    <th style="width: 120px">利益累計</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
 
                    <div class="c_detail_content" style="overflow: auto;height: 673px;"onscroll="scrollHead(this);">
                        <table id="earningstable" class="table_detail_content" style="table-layout: fixed;">
                          
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
