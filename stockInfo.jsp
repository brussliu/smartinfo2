<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>在庫情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css"/>
            <style>
     
            </style>
        </head>

        <body>
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
                <p><a href="menu.jsp">メニュー</a> >在庫情報管理</p>
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
                                <td style="width: 200px;"><button id="searchbtn" onclick="" >検索</button></td>
                                <td style="width: 200px;"><button id="searchbtn" onclick="" >更新</button></td>
                                <td style="width: 200px;"><button id="searchbtn" onclick="" >出力</button></td>
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

            
        </body>

        </html>