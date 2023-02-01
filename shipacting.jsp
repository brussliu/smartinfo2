<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>代行発送情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <script>
                function scrollHead(obj) {

                    var p = $(obj).get(0).scrollLeft;
                    $(".c_detail_header").get(0).scrollLeft = p;

                }


            </script>
            <style>
          

                .btn {
                    float: right;
                    width: 170px;
                    height: 40px;
                    background: rgb(240, 240, 240);
                    font-size: 16px;
                    border: 1px solid rgb(206, 205, 205);
                    box-shadow: 2px 2px 2px #888888;
                    cursor: pointer;
                }
                .l span{
                    margin-left: 5px;
                }
                .r span{
                    margin-right: 5px;
                }
            </style>
        </head>

        <body>
            <efw:Part path="shipacting_inputdialog.jsp" />
        
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
                    <p><a href="menu.jsp">メニュー</a> > 代行発送情報管理</p>
                </div>
                <div class="content">
                    <div class="c_btn" style="border-bottom: 1px solid black;">
                        <table class="table_btn" style="margin-bottom: 5px;">
                            <tbody>
                                <tr>
                                    <td> </td>
                                    <td> </td>
                                    <td> </td>
                                    <td style="width: 200px;"><button  onclick="shipacting_inputdialog.dialog('open');">新規</button></td>
                                    <td style="width: 200px;"><button >更新</button></td>
                                    <td style="width: 200px;"><button >削除</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_detail_header" style="overflow: hidden;" onscroll="scrollHead(this);">
                        <table class="table_detail_header" style="width: 2037px;table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 50px;">選択</th>
                                    <th style="width: 135px">管理番号</th>
                                    <th style="width: 85px;">ステータス</th>

                                    <th style="width: 100px;">発送費用（円）</th>
                                    <th style="width: 100px;">発送費用（元）</th>
                                    <th style="width: 100px;">郵便番号</th>

                                    <th style="width: 350px;">住所</th>
                                    <th style="width: 100px;">名前</th>
                                    <th style="width: 130px">電話番号</th>

                                    <th style="width: 200px;">発送内容</th>
                                    <th style="width: 60px;">数量</th>
                                    <th style="width: 180px;">発送方式</th>

                                    <th style="width: 180px">備考</th>
                                    <th style="width: 120px;">追跡番号</th>


                                </tr>

                            </thead>
                        </table>
                    </div>
                    <div class="c_detail_content" style="overflow: auto;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" style="width: 2037px;table-layout: fixed;">
                            <tbody>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 135px" class="l"><span class="l5">20230110-190400</span></td>
                                    <td style="width: 85px;" class="c"><span>已发送</span></td>

                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>111-1111</span></td>

                                    <td style="width: 350px;" class="l">
                                        <span>神奈川県</span><br>
                                        <span>横浜市泉区緑園4-1-2</span><br>
                                        <span>緑園都市耳鼻咽喉科 酒井医院</span>
                                    </td>
                                    <td style="width: 100px;" class="l"><span>阿部きよ子</span></td>
                                    <td style="width: 130px;" class="l"><span>09026331119204</span></td>

                                    <td style="width: 200px;" class="l"><span>鹰标（一对）银</span></td>
                                    <td style="width: 60px;" class="r"><span>9999</span></td>
                           

                                    <td style="width: 180px;" class="l"><span >クリックポスト</span></td>
                                    <td style="width: 180px;" class="r"><span>5.12</span></td>
                                    <td style="width: 120px;" class="r"><span >628716566505</span></td>

                                </tr>  <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 135px" class="l"><span class="l5">20230110-190400</span></td>
                                    <td style="width: 85px;" class="c"><span>已发送</span></td>

                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>111-1111</span></td>

                                    <td style="width: 350px;" class="l">
                                        <span>神奈川県</span><br>
                                        <span>横浜市泉区緑園4-1-2</span><br>
                                        <span>緑園都市耳鼻咽喉科 酒井医院</span>
                                    </td>
                                    <td style="width: 100px;" class="l"><span>阿部きよ子</span></td>
                                    <td style="width: 130px;" class="l"><span>09026331119204</span></td>

                                    <td style="width: 200px;" class="l"><span>鹰标（一对）银</span></td>
                                    <td style="width: 60px;" class="r"><span>9999</span></td>
                           

                                    <td style="width: 180px;" class="l"><span >クリックポスト</span></td>
                                    <td style="width: 180px;" class="r"><span>5.12</span></td>
                                    <td style="width: 120px;" class="r"><span >628716566505</span></td>

                                </tr>  <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 135px" class="l"><span class="l5">20230110-190400</span></td>
                                    <td style="width: 85px;" class="c"><span>已发送</span></td>

                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>111-1111</span></td>

                                    <td style="width: 350px;" class="l">
                                        <span>神奈川県</span><br>
                                        <span>横浜市泉区緑園4-1-2</span><br>
                                        <span>緑園都市耳鼻咽喉科 酒井医院</span>
                                    </td>
                                    <td style="width: 100px;" class="l"><span>阿部きよ子</span></td>
                                    <td style="width: 130px;" class="l"><span>09026331119204</span></td>

                                    <td style="width: 200px;" class="l"><span>鹰标（一对）银</span></td>
                                    <td style="width: 60px;" class="r"><span>9999</span></td>
                           

                                    <td style="width: 180px;" class="l"><span >クリックポスト</span></td>
                                    <td style="width: 180px;" class="r"><span>5.12</span></td>
                                    <td style="width: 120px;" class="r"><span >628716566505</span></td>

                                </tr>  <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 135px" class="l"><span class="l5">20230110-190400</span></td>
                                    <td style="width: 85px;" class="c"><span>已发送</span></td>

                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>111-1111</span></td>

                                    <td style="width: 350px;" class="l">
                                        <span>神奈川県</span><br>
                                        <span>横浜市泉区緑園4-1-2</span><br>
                                        <span>緑園都市耳鼻咽喉科 酒井医院</span>
                                    </td>
                                    <td style="width: 100px;" class="l"><span>阿部きよ子</span></td>
                                    <td style="width: 130px;" class="l"><span>09026331119204</span></td>

                                    <td style="width: 200px;" class="l"><span>鹰标（一对）银</span></td>
                                    <td style="width: 60px;" class="r"><span>9999</span></td>
                           

                                    <td style="width: 180px;" class="l"><span >クリックポスト</span></td>
                                    <td style="width: 180px;" class="r"><span>5.12</span></td>
                                    <td style="width: 120px;" class="r"><span >628716566505</span></td>

                                </tr>  <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 135px" class="l"><span class="l5">20230110-190400</span></td>
                                    <td style="width: 85px;" class="c"><span>已发送</span></td>

                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>111-1111</span></td>

                                    <td style="width: 350px;" class="l">
                                        <span>神奈川県</span><br>
                                        <span>横浜市泉区緑園4-1-2</span><br>
                                        <span>緑園都市耳鼻咽喉科 酒井医院</span>
                                    </td>
                                    <td style="width: 100px;" class="l"><span>阿部きよ子</span></td>
                                    <td style="width: 130px;" class="l"><span>09026331119204</span></td>

                                    <td style="width: 200px;" class="l"><span>鹰标（一对）银</span></td>
                                    <td style="width: 60px;" class="r"><span>9999</span></td>
                           

                                    <td style="width: 180px;" class="l"><span >クリックポスト</span></td>
                                    <td style="width: 180px;" class="r"><span>5.12</span></td>
                                    <td style="width: 120px;" class="r"><span >628716566505</span></td>

                                </tr>  <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 135px" class="l"><span class="l5">20230110-190400</span></td>
                                    <td style="width: 85px;" class="c"><span>已发送</span></td>

                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>111-1111</span></td>

                                    <td style="width: 350px;" class="l">
                                        <span>神奈川県</span><br>
                                        <span>横浜市泉区緑園4-1-2</span><br>
                                        <span>緑園都市耳鼻咽喉科 酒井医院</span>
                                    </td>
                                    <td style="width: 100px;" class="l"><span>阿部きよ子</span></td>
                                    <td style="width: 130px;" class="l"><span>09026331119204</span></td>

                                    <td style="width: 200px;" class="l"><span>鹰标（一对）银</span></td>
                                    <td style="width: 60px;" class="r"><span>9999</span></td>
                           

                                    <td style="width: 180px;" class="l"><span >クリックポスト</span></td>
                                    <td style="width: 180px;" class="r"><span>5.12</span></td>
                                    <td style="width: 120px;" class="r"><span >628716566505</span></td>

                                </tr>  <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 135px" class="l"><span class="l5">20230110-190400</span></td>
                                    <td style="width: 85px;" class="c"><span>已发送</span></td>

                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>111-1111</span></td>

                                    <td style="width: 350px;" class="l">
                                        <span>神奈川県</span><br>
                                        <span>横浜市泉区緑園4-1-2</span><br>
                                        <span>緑園都市耳鼻咽喉科 酒井医院</span>
                                    </td>
                                    <td style="width: 100px;" class="l"><span>阿部きよ子</span></td>
                                    <td style="width: 130px;" class="l"><span>09026331119204</span></td>

                                    <td style="width: 200px;" class="l"><span>鹰标（一对）银</span></td>
                                    <td style="width: 60px;" class="r"><span>9999</span></td>
                           

                                    <td style="width: 180px;" class="l"><span >クリックポスト</span></td>
                                    <td style="width: 180px;" class="r"><span>5.12</span></td>
                                    <td style="width: 120px;" class="r"><span >628716566505</span></td>

                                </tr>  <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 135px" class="l"><span class="l5">20230110-190400</span></td>
                                    <td style="width: 85px;" class="c"><span>已发送</span></td>

                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>111-1111</span></td>

                                    <td style="width: 350px;" class="l">
                                        <span>神奈川県</span><br>
                                        <span>横浜市泉区緑園4-1-2</span><br>
                                        <span>緑園都市耳鼻咽喉科 酒井医院</span>
                                    </td>
                                    <td style="width: 100px;" class="l"><span>阿部きよ子</span></td>
                                    <td style="width: 130px;" class="l"><span>09026331119204</span></td>

                                    <td style="width: 200px;" class="l"><span>鹰标（一对）银</span></td>
                                    <td style="width: 60px;" class="r"><span>9999</span></td>
                           

                                    <td style="width: 180px;" class="l"><span >クリックポスト</span></td>
                                    <td style="width: 180px;" class="r"><span>5.12</span></td>
                                    <td style="width: 120px;" class="r"><span >628716566505</span></td>

                                </tr>  <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 135px" class="l"><span class="l5">20230110-190400</span></td>
                                    <td style="width: 85px;" class="c"><span>已发送</span></td>

                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>111-1111</span></td>

                                    <td style="width: 350px;" class="l">
                                        <span>神奈川県</span><br>
                                        <span>横浜市泉区緑園4-1-2</span><br>
                                        <span>緑園都市耳鼻咽喉科 酒井医院</span>
                                    </td>
                                    <td style="width: 100px;" class="l"><span>阿部きよ子</span></td>
                                    <td style="width: 130px;" class="l"><span>09026331119204</span></td>

                                    <td style="width: 200px;" class="l"><span>鹰标（一对）银</span></td>
                                    <td style="width: 60px;" class="r"><span>9999</span></td>
                           

                                    <td style="width: 180px;" class="l"><span >クリックポスト</span></td>
                                    <td style="width: 180px;" class="r"><span>5.12</span></td>
                                    <td style="width: 120px;" class="r"><span >628716566505</span></td>

                                </tr>  <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 135px" class="l"><span class="l5">20230110-190400</span></td>
                                    <td style="width: 85px;" class="c"><span>已发送</span></td>

                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>111-1111</span></td>

                                    <td style="width: 350px;" class="l">
                                        <span>神奈川県</span><br>
                                        <span>横浜市泉区緑園4-1-2</span><br>
                                        <span>緑園都市耳鼻咽喉科 酒井医院</span>
                                    </td>
                                    <td style="width: 100px;" class="l"><span>阿部きよ子</span></td>
                                    <td style="width: 130px;" class="l"><span>09026331119204</span></td>

                                    <td style="width: 200px;" class="l"><span>鹰标（一对）银</span></td>
                                    <td style="width: 60px;" class="r"><span>9999</span></td>
                           

                                    <td style="width: 180px;" class="l"><span >クリックポスト</span></td>
                                    <td style="width: 180px;" class="r"><span>5.12</span></td>
                                    <td style="width: 120px;" class="r"><span >628716566505</span></td>

                                </tr>  <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 135px" class="l"><span class="l5">20230110-190400</span></td>
                                    <td style="width: 85px;" class="c"><span>已发送</span></td>

                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>111-1111</span></td>

                                    <td style="width: 350px;" class="l">
                                        <span>神奈川県</span><br>
                                        <span>横浜市泉区緑園4-1-2</span><br>
                                        <span>緑園都市耳鼻咽喉科 酒井医院</span>
                                    </td>
                                    <td style="width: 100px;" class="l"><span>阿部きよ子</span></td>
                                    <td style="width: 130px;" class="l"><span>09026331119204</span></td>

                                    <td style="width: 200px;" class="l"><span>鹰标（一对）银</span></td>
                                    <td style="width: 60px;" class="r"><span>9999</span></td>
                           

                                    <td style="width: 180px;" class="l"><span >クリックポスト</span></td>
                                    <td style="width: 180px;" class="r"><span>5.12</span></td>
                                    <td style="width: 120px;" class="r"><span >628716566505</span></td>

                                </tr>  <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 135px" class="l"><span class="l5">20230110-190400</span></td>
                                    <td style="width: 85px;" class="c"><span>已发送</span></td>

                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>111-1111</span></td>

                                    <td style="width: 350px;" class="l">
                                        <span>神奈川県</span><br>
                                        <span>横浜市泉区緑園4-1-2</span><br>
                                        <span>緑園都市耳鼻咽喉科 酒井医院</span>
                                    </td>
                                    <td style="width: 100px;" class="l"><span>阿部きよ子</span></td>
                                    <td style="width: 130px;" class="l"><span>09026331119204</span></td>

                                    <td style="width: 200px;" class="l"><span>鹰标（一对）银</span></td>
                                    <td style="width: 60px;" class="r"><span>9999</span></td>
                           

                                    <td style="width: 180px;" class="l"><span >クリックポスト</span></td>
                                    <td style="width: 180px;" class="r"><span>5.12</span></td>
                                    <td style="width: 120px;" class="r"><span >628716566505</span></td>

                                </tr>  <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 135px" class="l"><span class="l5">20230110-190400</span></td>
                                    <td style="width: 85px;" class="c"><span>已发送</span></td>

                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>111-1111</span></td>

                                    <td style="width: 350px;" class="l">
                                        <span>神奈川県</span><br>
                                        <span>横浜市泉区緑園4-1-2</span><br>
                                        <span>緑園都市耳鼻咽喉科 酒井医院</span>
                                    </td>
                                    <td style="width: 100px;" class="l"><span>阿部きよ子</span></td>
                                    <td style="width: 130px;" class="l"><span>09026331119204</span></td>

                                    <td style="width: 200px;" class="l"><span>鹰标（一对）银</span></td>
                                    <td style="width: 60px;" class="r"><span>9999</span></td>
                           

                                    <td style="width: 180px;" class="l"><span >クリックポスト</span></td>
                                    <td style="width: 180px;" class="r"><span>5.12</span></td>
                                    <td style="width: 120px;" class="r"><span >628716566505</span></td>

                                </tr>  <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 135px" class="l"><span class="l5">20230110-190400</span></td>
                                    <td style="width: 85px;" class="c"><span>已发送</span></td>

                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>111-1111</span></td>

                                    <td style="width: 350px;" class="l">
                                        <span>神奈川県</span><br>
                                        <span>横浜市泉区緑園4-1-2</span><br>
                                        <span>緑園都市耳鼻咽喉科 酒井医院</span>
                                    </td>
                                    <td style="width: 100px;" class="l"><span>阿部きよ子</span></td>
                                    <td style="width: 130px;" class="l"><span>09026331119204</span></td>

                                    <td style="width: 200px;" class="l"><span>鹰标（一对）银</span></td>
                                    <td style="width: 60px;" class="r"><span>9999</span></td>
                           

                                    <td style="width: 180px;" class="l"><span >クリックポスト</span></td>
                                    <td style="width: 180px;" class="r"><span>5.12</span></td>
                                    <td style="width: 120px;" class="r"><span >628716566505</span></td>

                                </tr>  <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 135px" class="l"><span class="l5">20230110-190400</span></td>
                                    <td style="width: 85px;" class="c"><span>已发送</span></td>

                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>111-1111</span></td>

                                    <td style="width: 350px;" class="l">
                                        <span>神奈川県</span><br>
                                        <span>横浜市泉区緑園4-1-2</span><br>
                                        <span>緑園都市耳鼻咽喉科 酒井医院</span>
                                    </td>
                                    <td style="width: 100px;" class="l"><span>阿部きよ子</span></td>
                                    <td style="width: 130px;" class="l"><span>09026331119204</span></td>

                                    <td style="width: 200px;" class="l"><span>鹰标（一对）银</span></td>
                                    <td style="width: 60px;" class="r"><span>9999</span></td>
                           

                                    <td style="width: 180px;" class="l"><span >クリックポスト</span></td>
                                    <td style="width: 180px;" class="r"><span>5.12</span></td>
                                    <td style="width: 120px;" class="r"><span >628716566505</span></td>

                                </tr>  <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 135px" class="l"><span class="l5">20230110-190400</span></td>
                                    <td style="width: 85px;" class="c"><span>已发送</span></td>

                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>111-1111</span></td>

                                    <td style="width: 350px;" class="l">
                                        <span>神奈川県</span><br>
                                        <span>横浜市泉区緑園4-1-2</span><br>
                                        <span>緑園都市耳鼻咽喉科 酒井医院</span>
                                    </td>
                                    <td style="width: 100px;" class="l"><span>阿部きよ子</span></td>
                                    <td style="width: 130px;" class="l"><span>09026331119204</span></td>

                                    <td style="width: 200px;" class="l"><span>鹰标（一对）银</span></td>
                                    <td style="width: 60px;" class="r"><span>9999</span></td>
                           

                                    <td style="width: 180px;" class="l"><span >クリックポスト</span></td>
                                    <td style="width: 180px;" class="r"><span>5.12</span></td>
                                    <td style="width: 120px;" class="r"><span >628716566505</span></td>

                                </tr>  <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 135px" class="l"><span class="l5">20230110-190400</span></td>
                                    <td style="width: 85px;" class="c"><span>已发送</span></td>

                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>111-1111</span></td>

                                    <td style="width: 350px;" class="l">
                                        <span>神奈川県</span><br>
                                        <span>横浜市泉区緑園4-1-2</span><br>
                                        <span>緑園都市耳鼻咽喉科 酒井医院</span>
                                    </td>
                                    <td style="width: 100px;" class="l"><span>阿部きよ子</span></td>
                                    <td style="width: 130px;" class="l"><span>09026331119204</span></td>

                                    <td style="width: 200px;" class="l"><span>鹰标（一对）银</span></td>
                                    <td style="width: 60px;" class="r"><span>9999</span></td>
                           

                                    <td style="width: 180px;" class="l"><span >クリックポスト</span></td>
                                    <td style="width: 180px;" class="r"><span>5.12</span></td>
                                    <td style="width: 120px;" class="r"><span >628716566505</span></td>

                                </tr>  <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 135px" class="l"><span class="l5">20230110-190400</span></td>
                                    <td style="width: 85px;" class="c"><span>已发送</span></td>

                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>999999.99</span></td>
                                    <td style="width: 100px;" class="r"><span>111-1111</span></td>

                                    <td style="width: 350px;" class="l">
                                        <span>神奈川県</span><br>
                                        <span>横浜市泉区緑園4-1-2</span><br>
                                        <span>緑園都市耳鼻咽喉科 酒井医院</span>
                                    </td>
                                    <td style="width: 100px;" class="l"><span>阿部きよ子</span></td>
                                    <td style="width: 130px;" class="l"><span>09026331119204</span></td>

                                    <td style="width: 200px;" class="l"><span>鹰标（一对）银</span></td>
                                    <td style="width: 60px;" class="r"><span>9999</span></td>
                           

                                    <td style="width: 180px;" class="l"><span >クリックポスト</span></td>
                                    <td style="width: 180px;" class="r"><span>5.12</span></td>
                                    <td style="width: 120px;" class="r"><span >628716566505</span></td>

                                </tr>   
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </body>

        </html>