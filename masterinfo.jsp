<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>SmartInfo 2.0</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css"/>

            <style>
      
                /* .c_q_nav {
                    width: 100%;
                    line-height: 55px;
                    border-collapse: collapse;

                } */

                /* .one {
                    margin-top: 10px;
                }

                .one td {
                    width: 13%;
                }

                .one td button {
                    float: right;
                } */

                /* .two input:not(:first-child) {
                    margin-left: 40px;
                } */

                /* .three table {
                    border-collapse: collapse;
                    text-align: center;
                    width: 1824px;
                    white-space:nowrap;three
                    overflow: auto;
                }
                .three td:last-child{
                    table-layout: auto;
                } */
                /* info */
                /* .info {
                    width: 1824px;
                    margin: auto;
               
                    overflow: auto;
                    height: 750px;
                } */

                /* .info th {
                    height: 45px;
                    border: 1px solid black;
                    background-color: #f6f6f6;
                }

                .info .btn {
                    width: 60px;
                    font-size: 16px;
                } */

                /* .three td {
                    height: 65px;
                } */

                /* .info div {
                    width: 100px;
                    height: 30px;
                    border: 1px solid whitesmoke;
                    border-radius: 20px;
                    box-shadow: 2px 2px 1px #888888;
                } */
 

                /* detail */
                /* .detail {
                    width: 1000px;
                    position: absolute;
                    left: 40%;
                    top: 50%;
                    margin-top: -200px;
                    margin-left: -300px;
                    background: #ffffff;
                    border: 1px solid black;

                }

                .d2 {
                    margin-top: 20px;
                    border-top: 1px solid black;
                    padding-top: 20px;
                }

                .d2 tr {
                    line-height: 40px;
                }

                .d2 select {
                    width: 140px;
                    height: 30px;
                }

                .d2 input {
                    width: 140px;
                    height: 30px;
                } */

                /* input[type="text"] {
                    border: 1px solid black;
                } */


                /* number */
                /* .number {
                    width: 100%;
                    text-align: center;
                    border-collapse: collapse;
                    line-height: 30px;
                }

                .footbtn {
                    width: 100%;
                    height: 80px;
                }

                .footbtn tr {
                    line-height: 60px;
                }

                .footbtn td {
                    width: 25%;

                } */
            </style>
        </head>

        <body>
            <efw:Part path="masterinfo_inputdialog.jsp" />
            <div>
                <div class="head">
                    <div class="hleft">
                        <h1 style="height: 80px;line-height: 80px;margin-left:40px;">SmartInfo 2.0</h1>
                    </div>
                    <div class="hright">
                        <div class="hright_l">
                            <p>店舗ID：<span id="shopid">未选择</span></p>
                            <p>UserID：<span id="userid">XXXX</span></p>
                        </div>
                        <div>
                            <button class="hright_r" onclick="Efw('common_menu_goto',{page:'login.jsp'})">ログオフ</button>
                            <button class="hright_r" onclick="Efw('common_menu_goto',{page:'shoplist.jsp'})">切替</button>
                        </div>
                    </div>  
                </div>
                <div class="topnav">
                    <p><a href="menu.jsp">メニュー</a> >マスタ情報管理</p>
                </div>
                <div class="content">
                    <div class="c_btn">
                        <table class="table_btn">
                            <tbody>
                                <tr>
                                    <td style="font-weight: bold;">【検索条件】</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td style="width: 200px;"><button id="searchbtn" onclick="" >検索</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_condition" style="height: 70px;">
                        <table>
                            <tbody>
                                <tr>
                                    <td style="width: 120px;">&nbsp;&nbsp;商品分類：</td>
                                    <td >
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
                        <table>
                            <tbody>
                                <tr>
                                    <td style="width: 120px;">&nbsp;&nbsp;商品番号：</td>
                                    <td style="width: 140px;">
                                        <select style="width: 100px;height:30px;border-style: solid;" >
                                            <option>W001</option>
                                        </select>
                                    </td>
                                    <td style="width: 120px;">キーワード：</td>
                                    <td style="width: 190px;">
                                        <input type="text" style="width: 150px;height: 30px;"></input>
                                    </td>
                                    <td style="width: 120px;">表示項目：</td>
                                    <td style="width: 250px;">
                                        <input type="checkbox" value="ASIN、SKU、LABEL"> ASIN、SKU、LABEL
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
                                    <th style="width: 140px;">商品種別</th>
                                    <th style="width: 80px;">商品<br>管理番号</th>
                                    <th style="width: 70px;">親子区分</th>
                                    <th style="width: 160px;">分類①</th>
                                    <th style="width: 160px;">分類②</th>
                                    <th style="width: 120px;">ASIN番号</th>
                                    <th style="width: 150px;">SKU番号</th>
                                    <th style="width: 120px;">LABEL番号</th>
                                    <th style="width: 80px;">仕入価格</th>
                                    <th style="width: 160px;">FBA発送方式</th>
                                    <th style="width: 800px;">商品名称</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="c"><button class="btn" id="update" onclick="masterinfo_inputdialog.dialog('open');">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                                <tr>
                                    <td class="c"><button class="btn" id="update">更新</button></td>
                                    <td class="l">01:レインコート</td>
                                    <td class="c">W001</td>
                                    <td class="c">親商品</td>
                                    <td class="l">イエローライオン</td>
                                    <td class="l">28 内寸18.5cm</td>
                                    <td class="c">B089WGVH9V</td>
                                    <td class="c">H2-E3RM-NID1</td>
                                    <td class="c">X000UXRHRV</td>
                                    <td class="r">999.00</td>
                                    <td class="l">A:クリックポスト</td>
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </body>

        </html>