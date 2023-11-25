<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>商品別広告情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
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
 
           
           </script>
            <style>

            </style>
        </head>

        <body >
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
                    <div class="c_condition" style="height: 80px;">
                        <table>
                            <tbody>
                                <tr>
                                    <td style="width: 160px;font-weight: bold; ">
                                        <input type="radio" checked  name="opttype" value="1" style="margin-left: 10px;">&nbsp;&nbsp;概要</input>
                                        <input type="radio"  name="opttype" value="2">&nbsp;&nbsp;詳細</input>
                                    </td> 
                                </tr>
                            </tbody>
                        </table>
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
                                    <td style="width: 60px;font-weight: bold;">年月：</td>
                                    <td style="width: 220px;">
                                        <select id="opt_productno" style="width: 130px;height:30px;border-style: solid;">
                                                <option value=""></option>
                                                <option value="">2023年08月</option>
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
                        <table class="table_detail_header" style="table-layout: fixed; ">
                            <thead>
                                <tr class="header">
                                    <th style="width: 120px;">年月</th>
                                    <th style="width: 140px">商品種別</th>
                                    <th style="width: 75px;">商品<br>管理番号</th>

                                    <th style="width: 200px;">分類</th>

                                    <!-- <th style="width: 140px;">ASIN番号<br>SKU番号<br>LABEL番号</th> -->
                                    <th style="width: 120px;">ASIN番号</th>
                                    <th style="width: 120px;">SKU番号</th>
                                    <th style="width: 120px;">LABEL番号</th>

                                    <th style="width: 120px;">キャンペーン名</th>
                                    <th style="width: 120px;">広告グループ名</th>
                                    <th style="width: 120px;">インプレッション</th>
                                    <th style="width: 120px;">クリック</th>
                                    <th style="width: 120px;">広告費用</th>
                                    <!-- <th style="width: 90px;">販売価格</th>
                                    <th style="width: 100px;">販売手数料率</th>
                                    <th style="width: 100px;">販売手数料<br>見積額</th>

                                    <th style="width: 100px;">配送代行<br>手数料区分</th>
                                    <th style="width: 100px;">配送代行<br>手数料見積額 </th>
                                    <th style="width: 100px;">手数料<br>見積合計</th>
                                    
                                    <th style="width: 90px;">仕入価格</th>
                                    <th style="width: 105px;">粗利益<br>見積合計</th> -->

                                    </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="c_detail_content" style="overflow: auto;display: display;width: 1550px; margin-left:48px;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" style="table-layout: fixed;" id="advertisingtable">
                            <tbody>
                                <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr>

                                    <tr >
                                        <td style="width: 120px;"class="c">2023年08月</td>
                                        <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                        <td style="width: 75px;"class="c">	T001</td>
    
                                        <td style="width: 200px;" >イエロー
                                            S</td>
    
                                         <td style="width: 120px;"class="c">B077TZR4R8</td>
                                        <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                        <td style="width: 120px;"class="c">X000RJ2QFV</td>
    
                                        <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                        <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                        <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                        <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                        <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 
    
                                        </tr> <tr >
                                            <td style="width: 120px;"class="c">2023年08月</td>
                                            <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                            <td style="width: 75px;"class="c">	T001</td>
        
                                            <td style="width: 200px;" >イエロー
                                                S</td>
        
                                             <td style="width: 120px;"class="c">B077TZR4R8</td>
                                            <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                            <td style="width: 120px;"class="c">X000RJ2QFV</td>
        
                                            <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                            <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                            <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                            <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                            <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 
        
                                            </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                        <td style="width: 120px;"class="c">2023年08月</td>
                                        <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                        <td style="width: 75px;"class="c">	T001</td>
    
                                        <td style="width: 200px;" >イエロー
                                            S</td>
    
                                         <td style="width: 120px;"class="c">B077TZR4R8</td>
                                        <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                        <td style="width: 120px;"class="c">X000RJ2QFV</td>
    
                                        <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                        <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                        <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                        <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                        <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 
    
                                        </tr> <tr >
                                            <td style="width: 120px;"class="c">2023年08月</td>
                                            <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                            <td style="width: 75px;"class="c">	T001</td>
        
                                            <td style="width: 200px;" >イエロー
                                                S</td>
        
                                             <td style="width: 120px;"class="c">B077TZR4R8</td>
                                            <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                            <td style="width: 120px;"class="c">X000RJ2QFV</td>
        
                                            <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                            <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                            <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                            <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                            <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 
        
                                            </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                        <td style="width: 120px;"class="c">2023年08月</td>
                                        <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                        <td style="width: 75px;"class="c">	T001</td>
    
                                        <td style="width: 200px;" >イエロー
                                            S</td>
    
                                         <td style="width: 120px;"class="c">B077TZR4R8</td>
                                        <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                        <td style="width: 120px;"class="c">X000RJ2QFV</td>
    
                                        <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                        <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                        <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                        <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                        <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 
    
                                        </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr> <tr >
                                    <td style="width: 120px;"class="c">2023年08月</td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 75px;"class="c">	T001</td>

                                    <td style="width: 200px;" >イエロー
                                        S</td>

                                     <td style="width: 120px;"class="c">B077TZR4R8</td>
                                    <td style="width: 120px;"class="c">G3-7VTX-A8HN</td>
                                    <td style="width: 120px;"class="c">X000RJ2QFV</td>

                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="l"><span class="l5">XXXXXXXXXXXXX</span></td>
                                    <td style="width: 120px;" class="r"><span class="r5"></span>>XXXXXXXXXXXXX</span></td> 

                                    </tr>
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