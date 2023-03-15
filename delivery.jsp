<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>納品情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <style>
                .table_btn td button {
                    width: 100px;
                }
            </style>
            <script>

                function scrollHead(obj) {
                    var p = $(obj).get(0).scrollLeft;
                    $(".c_detail_header").get(0).scrollLeft = p;
                }

                // 初期化
                function init() {
                    Efw('delivery_init');
                }

                // 新規
                function add() {
                    Efw('delivery_add');
                }

                // 納品内容
                function content() {
                    var deliveryno = $('input:radio[name="choice"]:checked').val();
                    Efw('delivery_list', { 'deliveryno': deliveryno });
                }

                // 納品削除
                function deletepurchase() {
                    var deliveryno = $('input:radio[name="choice"]:checked').val();
                    Efw('delivery_delete', { 'deliveryno': deliveryno });
                }

                // 納品更新
                function update() {
                    var deliveryno = $('input:radio[name="choice"]:checked').val();
                    Efw('delivery_update', { 'deliveryno': deliveryno });
                }

                // 納品作成用ファイル出力
                function outputdeliveryfile() {
                    var deliveryno = $('input:radio[name="choice"]:checked').val();
                    Efw('delivery_outputdeliveryfile', { "deliveryno": deliveryno });
                }

                // 箱詰め
                function box() {
                    var deliveryno = $('input:radio[name="choice"]:checked').val();
                    Efw('delivery_box', { "deliveryno": deliveryno });
                }

                // 納品発送
                function send() {
                    var deliveryno = $('input:radio[name="choice"]:checked').val();
                    Efw('delivery_send', { "deliveryno": deliveryno });
                }

                // 納品NOリンク押下
                function outputFile(){
                    var deliveryno = $('input:radio[name="choice"]:checked').val();
                    Efw('delivery_output', { "deliveryno": deliveryno });
                }

                //納品受取
                function receive() {
                    var deliveryno = $('input:radio[name="choice"]:checked').val();
                    Efw('delivery_receive', { "deliveryno": deliveryno });
                }

                // 納品完了
                function final() {
                    var deliveryno = $('input:radio[name="choice"]:checked').val();
                    Efw('delivery_complete', { "deliveryno": deliveryno });
                }

                // ボタン状態初期化
                function choice(val) {
                    // 納品名称
                    var deliveryname = $(val).parent().next().next().children().html();
                    // ステータス
                    var v = $(val).parent().next().next().next().next().next().html();
                    // 仕入NO
                    var tempno = $(val).parent().next().children().html();
                    $('#temp').data("temp", tempno);
                    $('#text_name').val(deliveryname);
                    $('#status').data("type", v);
                    if (v == '1.新　規') {
                        $('#btn_content').attr('disabled', false);
                        $('#btn_update').attr('disabled', false);
                        $('#btn_encasement').attr('disabled', false);
                        $('#btn_delete').attr('disabled', false);
                        $('#btn_send').attr('disabled', false);

                    } else if (v == '2.発送済') {
                        $('#btn_content').attr('disabled', false);
                        $('#btn_update').attr('disabled', true);
                        $('#btn_encasement').attr('disabled', true);
                        $('#btn_delete').attr('disabled', true);
                        $('#btn_send').attr('disabled', true);

                    } else if (v == '3.受領中') {
                        $('#btn_content').attr('disabled', false);
                        $('#btn_update').attr('disabled', true);
                        $('#btn_encasement').attr('disabled', true);
                        $('#btn_delete').attr('disabled', true);
                        $('#btn_send').attr('disabled', true);

                    } else if (v == '4.納品済') {
                        $('#btn_content').attr('disabled', false);
                        $('#btn_update').attr('disabled', true);
                        $('#btn_encasement').attr('disabled', true);
                        $('#btn_delete').attr('disabled', true);
                        $('#btn_send').attr('disabled', true);

                    } else {
                        $('#btn_content').attr('disabled', true);
                        $('#btn_update').attr('disabled', true);
                        $('#btn_encasement').attr('disabled', true);
                        $('#btn_delete').attr('disabled', true);
                        $('#btn_send').attr('disabled', true);

                    }
                }

                // 受領ファイル添付
                function view(val) {
                    var v = $(val).val();
                    if (v != null && v != '') {
                        $('#btn_receiver').attr('disabled', false);
                        $('#btn_final').attr('disabled', false);
                    }
                }



            </script>
        </head>

        <body onload="init();">
            <efw:Part path="delivery_content_inputdialog.jsp" />
            <efw:Part path="delivery_box_inputdialog.jsp" />
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
                    <p><a href="menu.jsp">メニュー</a> > 納品情報管理</p>
                </div>
                <div class="content">
                    <div style="width: 95%;margin: auto; ">
                        <table class="table_btn">
                            <tbody>
                                <tr>
                                    <td></td>

                                    <td></td>

                                    <td style="width: 120px;"><button id="btn_new" onclick="add()">新規</button></td>
                                    <td style="width: 120px;"><button id="btn_content" disabled="disabled"
                                            onclick="content()">納品内容</button></td>
                                    <td style="width: 120px;"><button id="btn_update" onclick="update()"
                                            disabled="disabled">納品更新</button></td>
                                         
                                    <td style="width: 120px;"><button id="btn_encasement" disabled="disabled"
                                            onclick="box()">箱詰め</button></td>
                                    <td style="width: 120px;"><button id="btn_delete" disabled="disabled">納品削除</button>
                                    </td>
                                    <td style="width: 240px;"><button id="outputfile" disabled
                                            onclick="outputdeliveryfile();" style="width: 220px;">納品作成用ファイル出力</button>
                                    </td>
                                    <td style="width: 120px;"><button id="btn_send" onclick="send()"
                                            disabled="disabled">納品発送</button>
                                    </td>
                                    <td style="width: 120px;"><button id="btn_receiver" onclick="receive()"
                                            disabled="disabled">納品受領</button></td>
                                    <td style="width: 120px;"><button id="btn_final" onclick="final()"
                                            disabled="disabled">納品完了</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="c_condition" style="height: 45px;">
                        <table border="0">
                            <tbody>
                                <tr>
                                    <td style="width: 120px;font-weight: bold;">&nbsp;&nbsp;納品名称：</td>
                                    <td style="width: 240px;">
                                        <input type="text" id="text_name"
                                            style="width: 180px;height:30px;border-style: solid;">
                                    </td>
                                    <td style="width: 142px;font-weight: bold;">納品ファイル：</td>
                                    <td style="width: 320px;">
                                        <input type="file" id="file_deliveryfile" style="width: 260px; "></input>

                                    </td>
                                    <td style="width: 142px;font-weight: bold;">受領ファイル：</td>
                                    <td style="width: 320px;">
                                        <input type="file" id="file_receiverfile" onchange="view(this)"
                                            style="width: 260px; "></input>

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>



                    <div class="c_detail_header" style="overflow: hidden;display: none;" onscroll="scrollHead(this);">
                        <table class="table_detail_header" style="width: 2054px;table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 50px;" id="temp">選択</th>
                                    <th style="width: 155px">納品NO</th>
                                    <th style="width: 200px;" id="tempname">納品名称</th>

                                    <th style="width: 352px;">納品内容</th>
                                    <th style="width: 50px;">数量</th>
                                    <th style="width: 120px;" id="status">ステータス</th>

                                    <th style="width: 100px;">登録日</th>

                                    <th style="width: 100px;">発送日</th>
                                    <th style="width: 100px;">受領日</th>
                                    <th style="width: 100px;">完了日</th>

                                    <th style="width: 140px">AMZ納品番号</th>
                                    <th style="width: 200px;">AMZ納品名</th>
                                    <th style="width: 160px">AMZ-納品プラン番号</th>
                                    <th style="width: 400px;">AMZ-納品先</th>
                                    <th style="width: 140px;">AMZ-SKU合計</th>
                                    <th style="width: 140px;">AMZ-商品合計数</th>
                                </tr>
                            </thead>
                        </table>
                    </div>

                    <div class="c_detail_content" style="overflow: auto;display: none;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" id="deliverytable"
                            style="width: 2037px;table-layout: fixed;">

                            <tr>
                                <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                <td style="width: 155px" class="l a"><span class="l5"
                                        onclick="delivery_content_inputdialog.dialog('open');">20230118-151418</span>
                                </td>
                                <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>

                                <td style="width: 352px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                <td style="width: 120px;" class="c">2:钠品凳送</td>

                                <td style="width: 100px;" class="c"></td>
                                <td style="width: 100px;" class="c">2023/01/18</td>
                                <td style="width: 100px;" class="c">2023/01/18</td>
                                <td style="width: 100px;" class="c">2023/01/18</td>

                                <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                                <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                <td style="width: 160px;" class="c">FBA15D9WH51X</td>
                                <td style="width: 400px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                <td style="width: 140px;" class="r"><span class="r5">33</span></td>
                                <td style="width: 140px;" class="r"><span class="r5">33</span></td>
                            </tr>

                        </table>
                    </div>
                </div>
            </div>

        </body>

        </html>