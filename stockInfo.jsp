<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>在庫情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <style>
                /* c_query */
                .c_query {
                    width: var(--width);
                    /* height: 216px; */
                }

                .c_q_nav {
                    width: 100%;
                    line-height: 55px;
                    border-collapse: collapse;
                }

                .one {
                    margin-top: 10px;
                }

                .one td {
                    width: 13%;
                }

                .one td button {
                    float: right;
                }


                .three table {
                    border-collapse: collapse;
                    text-align: center;
                    width: 1824px;
                    word-break: break-all;
                }

                .three td {
                    height: 65px;
                }

                /* info */
                .info {
                    width: 95%;
                    margin: auto;
                    height: 750px;
                    overflow: auto;
                }

                .table_btn td {
                    width: 9%;
                }

                .info th {
                    height: 45px;
                    border: 1px solid black;
                    background-color: #f6f6f6;
                }



                .info div {
                    width: 100px;
                    height: 30px;
                    border: 1px solid whitesmoke;
                    border-radius: 20px;
                    box-shadow: 2px 2px 1px #888888;
                }

                .send input:not(:first-child) {
                    margin-left: 20px;
                }
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
                <div class="c_query">
                    <div style="width: 95%;margin: auto; ">
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
                                    <td><button>検索</button></td>
                                    <td><button>更新</button></td>
                                    <td><button>出力</button></td>
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



                    <div class="c_detail">
                        <table class="table_detail" style="table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 70px;">操作</th>
                                    <th style="width: 140px">商品種別</th>
                                    <th style="width: 80px;">商品<br>管理番号</th>

                                    <th style="width: 70px;">親子区分</th>
                                    <th style="width: 160px;">分類①</th>
                                    <th style="width: 160px;">分類②</th>

                                    <th style="width: 120px;">ASIN番号</th>
                                    <th style="width: 150px;">SKU番号</th>
                                    <th style="width: 120px">LABEL番号</th>

                                    <th style="width: 120px;">FBA在庫</th>
                                    <th style="width: 120px;">FBM在庫</th>
                                    <th style="width: 120px">途中<br>（入庫）</th>
                                    
                                    <th style="width: 120px;">LOCAL<br>在庫</th>
                                    <th style="width: 150px;">途中<br>（仕入）</th>                           
                                    <th style="width: 120px;">在庫合計<br>（販売中）</th>

                                    <th style="width: 150px;">在庫合計<br>（予備）</th>
                                    <th style="width: 120px">在庫合計<br>（全体）</th>
                                    <th style="width: 306px;">販売数量<br>（3日/7日/30日/60日/90日/180日/360日）</th>
                                   
                                    <th style="width: 120px;">販売数量<br>（日平均値）</th>
                                    <th style="width: 150px;">販売可能期間<br>（販売中）</th>
                                    <th style="width: 150px;">販売可能期間<br>（全体）</th>
                                    
                                    <th style="width: 120px">推奨納品数量</th>
                                    <th style="width: 120px">推奨仕入数量</th>
                                    <th style="width: 800px">商品名称</th>

                                </tr>
                            </thead>
                            <tbody style="text-align: center;">
                                <tr>
                                    <td><input type="checkbox" name="choice"></input></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="c">232</td>
                                    <td class="r">22</td>
                                    <td class="r">22</td>
                              
                                    <td class="r"><input type="text"></input></td>
                                    <td class="r">10</td>

                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="r">224</td>

                                    <td class="r">0/0/0/0/1</td>
                                    <td class="r">0.02</td>
                                    <td class="r">9900</td>

                                    <td class="r">15300</td>
                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア
                                        ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>

                                </tr>     <tr>
                                    <td><input type="checkbox" name="choice"></input></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="c">232</td>
                                    <td class="r">22</td>
                                    <td class="r">22</td>
                              
                                    <td class="r"><input type="text"></input></td>
                                    <td class="r">10</td>

                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="r">224</td>

                                    <td class="r">0/0/0/0/1</td>
                                    <td class="r">0.02</td>
                                    <td class="r">9900</td>

                                    <td class="r">15300</td>
                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア
                                        ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>

                                </tr>     <tr>
                                    <td><input type="checkbox" name="choice"></input></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="c">232</td>
                                    <td class="r">22</td>
                                    <td class="r">22</td>
                              
                                    <td class="r"><input type="text"></input></td>
                                    <td class="r">10</td>

                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="r">224</td>

                                    <td class="r">0/0/0/0/1</td>
                                    <td class="r">0.02</td>
                                    <td class="r">9900</td>

                                    <td class="r">15300</td>
                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア
                                        ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>

                                </tr>     <tr>
                                    <td><input type="checkbox" name="choice"></input></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="c">232</td>
                                    <td class="r">22</td>
                                    <td class="r">22</td>
                              
                                    <td class="r"><input type="text"></input></td>
                                    <td class="r">10</td>

                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="r">224</td>

                                    <td class="r">0/0/0/0/1</td>
                                    <td class="r">0.02</td>
                                    <td class="r">9900</td>

                                    <td class="r">15300</td>
                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア
                                        ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>

                                </tr>     <tr>
                                    <td><input type="checkbox" name="choice"></input></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="c">232</td>
                                    <td class="r">22</td>
                                    <td class="r">22</td>
                              
                                    <td class="r"><input type="text"></input></td>
                                    <td class="r">10</td>

                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="r">224</td>

                                    <td class="r">0/0/0/0/1</td>
                                    <td class="r">0.02</td>
                                    <td class="r">9900</td>

                                    <td class="r">15300</td>
                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア
                                        ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>

                                </tr>     <tr>
                                    <td><input type="checkbox" name="choice"></input></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="c">232</td>
                                    <td class="r">22</td>
                                    <td class="r">22</td>
                              
                                    <td class="r"><input type="text"></input></td>
                                    <td class="r">10</td>

                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="r">224</td>

                                    <td class="r">0/0/0/0/1</td>
                                    <td class="r">0.02</td>
                                    <td class="r">9900</td>

                                    <td class="r">15300</td>
                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア
                                        ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>

                                </tr>     <tr>
                                    <td><input type="checkbox" name="choice"></input></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="c">232</td>
                                    <td class="r">22</td>
                                    <td class="r">22</td>
                              
                                    <td class="r"><input type="text"></input></td>
                                    <td class="r">10</td>

                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="r">224</td>

                                    <td class="r">0/0/0/0/1</td>
                                    <td class="r">0.02</td>
                                    <td class="r">9900</td>

                                    <td class="r">15300</td>
                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア
                                        ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>

                                </tr>     <tr>
                                    <td><input type="checkbox" name="choice"></input></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="c">232</td>
                                    <td class="r">22</td>
                                    <td class="r">22</td>
                              
                                    <td class="r"><input type="text"></input></td>
                                    <td class="r">10</td>

                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="r">224</td>

                                    <td class="r">0/0/0/0/1</td>
                                    <td class="r">0.02</td>
                                    <td class="r">9900</td>

                                    <td class="r">15300</td>
                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア
                                        ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>

                                </tr>     <tr>
                                    <td><input type="checkbox" name="choice"></input></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="c">232</td>
                                    <td class="r">22</td>
                                    <td class="r">22</td>
                              
                                    <td class="r"><input type="text"></input></td>
                                    <td class="r">10</td>

                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="r">224</td>

                                    <td class="r">0/0/0/0/1</td>
                                    <td class="r">0.02</td>
                                    <td class="r">9900</td>

                                    <td class="r">15300</td>
                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア
                                        ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>

                                </tr>     <tr>
                                    <td><input type="checkbox" name="choice"></input></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="c">232</td>
                                    <td class="r">22</td>
                                    <td class="r">22</td>
                              
                                    <td class="r"><input type="text"></input></td>
                                    <td class="r">10</td>

                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="r">224</td>

                                    <td class="r">0/0/0/0/1</td>
                                    <td class="r">0.02</td>
                                    <td class="r">9900</td>

                                    <td class="r">15300</td>
                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア
                                        ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>

                                </tr>     <tr>
                                    <td><input type="checkbox" name="choice"></input></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="c">232</td>
                                    <td class="r">22</td>
                                    <td class="r">22</td>
                              
                                    <td class="r"><input type="text"></input></td>
                                    <td class="r">10</td>

                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="r">224</td>

                                    <td class="r">0/0/0/0/1</td>
                                    <td class="r">0.02</td>
                                    <td class="r">9900</td>

                                    <td class="r">15300</td>
                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア
                                        ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>

                                </tr>     <tr>
                                    <td><input type="checkbox" name="choice"></input></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="c">232</td>
                                    <td class="r">22</td>
                                    <td class="r">22</td>
                              
                                    <td class="r"><input type="text"></input></td>
                                    <td class="r">10</td>

                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="r">224</td>

                                    <td class="r">0/0/0/0/1</td>
                                    <td class="r">0.02</td>
                                    <td class="r">9900</td>

                                    <td class="r">15300</td>
                                    <td class="r">34</td>
                                    <td class="r">34</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア
                                        ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>

                                </tr>
                                
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

        </body>

        </html>
