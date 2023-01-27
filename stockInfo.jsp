<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>在庫情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <script>
                function scrollHead(obj){

                    var p = $(obj).get(0).scrollLeft;
                    $(".c_detail_header").get(0).scrollLeft = p;

                }
            </script>
            <style>

            </style>
        </head>

        <body>
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
                                    <td></td>
                                    <td style="width: 200px;"><button>検索</button></td>
                                    <td style="width: 200px;"><button>更新</button></td>
                                    <td style="width: 200px;"><button>出力</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_condition"style="height: 70px;">
                        <table>
                            <tbody>
                                <tr>
                                    <td style="width: 120px;font-weight: bold;">&nbsp;&nbsp;商品分類：</td>
                                    <td>
                                        &nbsp;<input type="checkbox" name="rain" value="レインコート" checked> レインコート
                                        &nbsp;<input type="checkbox" name="type" value="靴下" checked> 靴下
                                        &nbsp;<input type="checkbox" name="rain" value="レインコート" checked> レインコート
                                        &nbsp;<input type="checkbox" name="type" value="靴下" checked> 靴下
                                        &nbsp;<input type="checkbox" name="rain" value="レインコート" checked> レインコート
                                        &nbsp;<input type="checkbox" name="type" value="靴下" checked> 靴下
                                        &nbsp;<input type="checkbox" name="rain" value="レインコート" checked> レインコート
                                        &nbsp;<input type="checkbox" name="type" value="靴下" checked> 靴下
                                        &nbsp;<input type="checkbox" name="rain" value="レインコート" checked> レインコート
                                        &nbsp;<input type="checkbox" name="type" value="靴下" checked> 靴下
                                        &nbsp;<input type="checkbox" name="rain" value="レインコート" checked> レインコート
                                        &nbsp;<input type="checkbox" name="type" value="靴下" checked> 靴下
                                    </td>
                                </tr>
                            </tbody>
                        </table>


                        <table border="0">
                            <tbody>
                                <tr>
                                    <td style="width: 120px;font-weight: bold;">&nbsp;&nbsp;商品番号：</td>
                                    <td style="width: 140px;">
                                        <select style="width: 100px;height:30px;border-style: solid;">
                                            <option>W001</option>
                                        </select>
                                    </td>
                                    <td style="width: 120px;font-weight: bold;">キーワード：</td>
                                    <td style="width: 190px;">
                                        <input type="text" style="width: 150px;height: 30px;"></input>
                                    </td>
                                    <td style="width: 110px;font-weight: bold;">表示項目：</td>
                                    <td style="width: 350px;">
                                        <input type="checkbox" value="ASIN、SKU、LABEL"> ASIN、SKU、LABEL
                                        &nbsp;
                                        <input type="checkbox" value="商品名称"> 商品名称
                                    </td>
                                    <td style="width: 110px;font-weight: bold;">発送方式：</td>
                                    <td style="width: 180px;">
                                        <input type="checkbox" value="FBA" checked> FBA
                                        &ensp; <input type="checkbox" value="FBM"> FBM
                                      
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_detail_header" style="overflow: hidden;">
                        <table class="table_detail_header" style="width: 2597px;table-layout: fixed;">
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

                                    <th style="width: 80px;">FBA在庫</th>
                                    <th style="width: 80px;">FBM在庫</th>
                                    <th style="width: 80px">途中<br>（入庫）</th>
                                    <th style="width: 80px;">LOCAL<br>在庫</th>
                                    <th style="width: 80px;">途中<br>（仕入）</th>                           
                                    <th style="width: 80px;">在庫合計<br>（販売中）</th>
                                    <th style="width: 80px;">在庫合計<br>（予備）</th>
                                    <th style="width: 80px">在庫合計<br>（全体）</th>

                                    <th style="width: 320px;">販売数量<br>（3日/7日/30日/60日/90日/180日/360日）</th>
                                   
                                    <th style="width: 100px;">販売数量<br>（日平均値）</th>
                                    <th style="width: 100px;">販売可能期間<br>（販売中）</th>
                                    <th style="width: 100px;">販売可能期間<br>（全体）</th>
                                    <th style="width: 100px">推奨納品数量</th>
                                    <th style="width: 117px">推奨仕入数量</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="c_detail_content" style="overflow: auto;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" style="width: 2580px;table-layout: fixed;">
                            <tbody>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input></td>
                                    <td style="width: 140px" class="l"><span class="l5">01:レインコート</span></td>
                                    <td style="width: 80px;" class="c">W001</td>
                                    <td style="width: 70px;" class="c">親商品</td>
                                    <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                    <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                    <td style="width: 120px;" class="c">B089WGVH9V</td>
                                    <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                    <td style="width: 120px;" class="c">X000UXRHRV</td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                              
                                    <td style="width: 80px;" class="c"><input type="text" style="width:50px;height: 30px;"></input></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 80px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 320px;" class="r">999 / 999 / 999 / 999 / 999 / 999 / 999</td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999.99</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>

                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                    <td style="width: 100px;" class="r"><span class="r5">9999</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

        </body>

        </html>
