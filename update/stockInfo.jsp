<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>在庫情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css"/>
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
                .one{
                    margin-top: 10px;
                }
                .one td{
                    width: 13%;
                }
                .one td button{
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
                .table_btn td{
                    width: 13%;
                }
                .info th {
                    height: 45px;
                    border: 1px solid black;
                    background-color:#f6f6f6;
                }

                

                .info div {
                    width: 100px;
                    height: 30px;
                    border: 1px solid whitesmoke;
                    border-radius: 20px;
                    box-shadow: 2px 2px 1px #888888;
                }
                .send input:not(:first-child){
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
                    <p><a href="menu.jsp">メニュー</a> > 在庫情報管理</p>
                </div>
                <div class="c_query">
                    <div class="c_btn">
                        <table class="table_btn">
                            <tbody>
                                <tr >
                                    <td style="font-weight: bold;">【検索条件】</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><button >検索</button></td>
                                    <td><button >更新</button></td>
                                    <td><button >出力</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_condition" style="height: 70px;">
                       
                        <table >
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
                                    <td style="width: 360px;">
                                        <input type="checkbox" value="ASIN、SKU、LABEL"> ASIN、SKU、LABEL
                                        &nbsp; <input type="checkbox" value="商品名称"> 商品名称

                                    </td>
                                    <td style="width: 120px;">発送方式：</td>
                                    <td style="width: 320px;">
                                        <input type="checkbox"   value="FBA" checked> FBA
                                 &nbsp; <input type="checkbox"   value="FBM"> FBM

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
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                               
                                </tr>
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
                                    <td class="l">【Smart-Bear】P002 キッズ服 Tシャツ ズボン 男の子 女の子 パジャマ 前開きキッズ 部屋着 寝間着ルームウェア ホームサービス ベビー 長袖 ボタン トップス ショートパンツ 上下セット服 子供 春 秋 冬 七五三 誕生日 新年 (110cm, 肌色恐竜柄)</td>
                               
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

        </body>

        </html>
