<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>仕入情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <script>

                function scrollHead(obj) {
                    var p = $(obj).get(0).scrollLeft;
                    $(".c_detail_header").get(0).scrollLeft = p;
                }

                function init() {
                    Efw('purchase_init');
                }

                function add() {

                    // 仕入NO
                    $('#td_no').html("-");
                    // 仕入名称
                    $('#text_purchase').val("");
                    // 発送方式
                    $('#opt_ship').get(0).selectedIndex = 0;
                    // 登録日
                    $('#date_entrydate').html('-');
                    // 発送日１
                    $('#date_forwarddate1').val("");
                    // 発送日２
                    $('#date_forwarddate2').val("");
                    // 完了日
                    $('#date_completiondate').val("");
                    // 商品費用
                    $('#number_productamountRMB').val("");
                    // 商品費用（通貨）
                    $('#opt_monetaryunit1').get(0).selectedIndex = 0;
                    // 商品費用（変換後）
                    $('#number_productamountRY').html("");
                    // 物流費用
                    $('#number_shipamountRMB').val("");
                    // 物流費用（通貨）
                    $('#opt_monetaryunit2').get(0).selectedIndex = 0;
                    // 物流費用（変換後）
                    $('#number_shipamountRY').html("");
                    // 税金
                    $('#number_faxamountRMB').val("");
                    // 税金（通貨）
                    $('#opt_monetaryunit3').get(0).selectedIndex = 0;
                    // 税金（変換後）
                    $('#number_faxamountRY').html("");
                    // 為替レート
                    $('#number_rate').val("5.1");
                    // 合計
                    $('#text_totalRMB').html("");
                    // 合計（変換後）
                    $('#text_totalRY').html("");
                    // 仕入内容
                    $('#file_proContent').val("");
                    // 追跡番号
                    $('#text_track').val("");
                    // 添付ファイル
                    $('#file_acces').val("");
                    // 添付ファイル名称
                    $('#text_filename').val("");
                    // 添付ファイルエリア
                    $('#purchasediv').css('display', 'none');
                    // 添付ファイル用仕入NO
                    // $('#purchaseno').val("");
                    // 添付ファイル表示区域
                    $('#filetable').html("");

                    // var curTime = new Date().format("yyyyMMdd-HHmmss");
                    // $('#purchaseno').val(curTime);
                    // 操作区分
                    $('#opt').val('new');

                    purchase_detail_inputdialog.dialog('open');

                }

                // 更新
                function update() {

                    // 添付ファイル区域
                    $('#purchasediv').css('display', 'inline-block');

                    // 操作区分
                    $('#opt').val('update');

                    var purchaseno = $('input:radio[name="choice"]:checked').val();
                    Efw('purchase_update', { "purchaseno": purchaseno });

                }

                // 保存
                function save() {
                    // var state = $('#btn_update').data("state");
                    Efw('purchase_save');
                }

                // ラジオボタン選択（ボタン活性化設定）
                function choice(val) {

                    // ステータス
                    var v = $(val).parent().next().next().next().next().next().next().next().html();

                    if (v == '1.新　規') {
                        $('#btn_content').attr('disabled', false);
                        $('#btn_update').attr('disabled', false);
                        $('#btn_delete').attr('disabled', false);
                        $('#btn_send').attr('disabled', false);
                        $('#btn_collection').attr('disabled', false);
                    } else if (v == '2.発送済') {
                        $('#btn_content').attr('disabled', false);
                        $('#btn_update').attr('disabled', false);
                        $('#btn_delete').attr('disabled', true);
                        $('#btn_send').attr('disabled', true);
                        $('#btn_collection').attr('disabled', false);
                    } else if (v == '3.仕入済') {
                        $('#btn_content').attr('disabled', false);
                        $('#btn_update').attr('disabled', false);
                        $('#btn_delete').attr('disabled', true);
                        $('#btn_send').attr('disabled', true);
                        $('#btn_collection').attr('disabled', true);
                    } else {
                        $('#btn_content').attr('disabled', true);
                        $('#btn_update').attr('disabled', true);
                        $('#btn_delete').attr('disabled', true);
                        $('#btn_send').attr('disabled', true);
                        $('#btn_collection').attr('disabled', true);
                    }
                }

                // 削除
                function deletepurchase() {
                    var no = $('input:radio[name="choice"]:checked').val();
                    Efw('purchase_delete', { 'no': no });
                }

                // 子画面が閉じる
                function cel() {
                    purchase_detail_inputdialog.dialog('close');
                }

                // 仕入内容
                function opencontentdialog() {
                    var purchaseno = $('input:radio[name="choice"]:checked').val();
                    Efw('purchase_list', { "purchaseno": purchaseno });
                }

                // 仕入発送
                function send() {
                    var purchaseno = $('input:radio[name="choice"]:checked').val();
                    Efw('purchase_send', { "purchaseno": purchaseno });
                }

                // 仕入受取
                function finish() {
                    var purchaseno = $('input:radio[name="choice"]:checked').val();
                    Efw('purchase_receive', { "purchaseno": purchaseno });
                }

                // ファイルアップロード
                function upload() {
                    // var purchaseno= $('#td_no').html();
                    Efw('purchase_upload');
                }

                // 添付ファイルリスト
                function showFileList(purchaseno) {

                    Efw('purchase_showfilelist', { "purchaseno": purchaseno });
                }

                // 添付ファイル削除
                function delfile(filename) {
                    var purchaseno = $('#td_no').html();
                    Efw('purchase_delfile', { "filename": filename, "purchaseno": purchaseno });
                }


                // // new初始化
                // function newdialog() {
                //     $('#td_no').html("-");
                //     $('#text_purchase').val("");
                //     $('#opt_ship').get(0).selectedIndex = 0;
                //     $('#date_entrydate').html('-');
                //     $('#date_forwarddate1').val("");
                //     $('#date_forwarddate2').val("");
                //     $('#date_completiondate').val("");
                //     $('#number_productamountRMB').val("");
                //     $('#opt_monetaryunit1').get(0).selectedIndex = 0;
                //     $('#number_productamountRY').html("");
                //     $('#number_shipamountRMB').val("");
                //     $('#opt_monetaryunit2').get(0).selectedIndex = 0;
                //     $('#number_shipamountRY').html("");
                //     $('#number_faxamountRMB').val("");
                //     $('#opt_monetaryunit3').get(0).selectedIndex = 0;
                //     $('#number_faxamountRY').html("");
                //     $('#number_rate').val("");
                //     $('#text_totalRMB').html("");
                //     $('#text_totalRY').html("");
                //     $('#file_proContent').val("");
                //     $('#text_track').val("");
                //     $('#file_acces').val("");
                //     $('#text_filename').val("");
                //     // 上传NO
                //     $('#purchasediv').css('display', 'none');
                //     $('#purchaseno').val("");
                //     $('#filetable').html("");
                // }


                // 汇率转换
                function Xchanger() {
                    //為替レート取得
                    var exchange = $("#number_rate").val();
                    //商品費用
                    var productamountRMB = $("#number_productamountRMB").val();
                    // 输入为空，转换的值则为空
                    if (productamountRMB == null || productamountRMB == "") {
                        $("#number_productamountRY").html("");
                    }
                    //商品費用货币单位
                    var monetaryunit1 = $("#opt_monetaryunit1").val();
                    // 货币单位为CNY时
                    if (monetaryunit1 == "CNY" && exchange != null && exchange != "" && productamountRMB != null && productamountRMB != "") {
                        $("#number_productamountRY").html((productamountRMB / exchange * 100).toFixed(2) + " 円");
                    }
                    // 货币单位为JPY时
                    if (monetaryunit1 == "JPY" && exchange != null && exchange != "" && productamountRMB != null && productamountRMB != "") {
                        $("#number_productamountRY").html((productamountRMB * exchange / 100).toFixed(2) + " 元");
                    }

                    //物流費用
                    var shipamountRMB = $("#number_shipamountRMB").val();
                    if (shipamountRMB == null || shipamountRMB == "") {
                        $("#number_shipamountRY").html("");
                    }
                    //物流費用货币单位
                    var monetaryunit2 = $("#opt_monetaryunit2").val();
                    if (monetaryunit2 == "CNY" && exchange != null && exchange != "" && shipamountRMB != null && shipamountRMB != "") {

                        $("#number_shipamountRY").html((shipamountRMB / exchange * 100).toFixed(2) + " 円");
                    }
                    if (monetaryunit2 == "JPY" && exchange != null && exchange != "" && shipamountRMB != null && shipamountRMB != "") {

                        $("#number_shipamountRY").html((shipamountRMB * exchange / 100).toFixed(2) + " 元");
                    }

                    //税金
                    var faxamountRMB = $("#number_faxamountRMB").val();
                    if (faxamountRMB == null || faxamountRMB == "") {
                        $("#number_faxamountRY").html("");
                    }
                    //税金货币单位
                    var monetaryunit3 = $("#opt_monetaryunit3").val();
                    if (monetaryunit3 == "CNY" && exchange != null && exchange != "" && faxamountRMB != null && faxamountRMB != "") {

                        $("#number_faxamountRY").html((faxamountRMB / exchange * 100).toFixed(2) + " 円");
                    }
                    if (monetaryunit3 == "JPY" && exchange != null && exchange != "" && faxamountRMB != null && faxamountRMB != "") {

                        $("#number_faxamountRY").html((faxamountRMB * exchange / 100).toFixed(2) + " 元");
                    }

                    // 合计
                    var rmb1 = 0;
                    var rmb2 = 0;
                    var rmb3 = 0;
                    var jpy1 = 0;
                    var jpy2 = 0;
                    var jpy3 = 0;
                    if (monetaryunit1 == "CNY") {//判断单位，记录值
                        rmb1 = Number(productamountRMB);
                        jpy1 = isNULL($("#number_productamountRY").html());
                    } else {
                        rmb1 = isNULL($("#number_productamountRY").html());
                        jpy1 = Number(productamountRMB);
                    }
                    if (monetaryunit2 == "CNY") {
                        rmb2 = Number(shipamountRMB);
                        jpy2 = isNULL($("#number_shipamountRY").html());
                    } else {
                        rmb2 = isNULL($("#number_shipamountRY").html());
                        jpy2 = Number(shipamountRMB);
                    }
                    if (monetaryunit3 == "CNY") {
                        rmb3 = Number(faxamountRMB);
                        jpy3 = isNULL($("#number_faxamountRY").html());
                    } else {
                        rmb3 = isNULL($("#number_faxamountRY").html());
                        jpy3 = Number(faxamountRMB);
                    }
                    //记录rmb和jpy总和  
                    var rmbmoney = rmb1 + rmb2 + rmb3;
                    var jpymoney = jpy1 + jpy2 + jpy3;
                    $("#text_totalRMB").html(rmbmoney.toFixed(2) + '元');
                    $("#text_totalRY").html(jpymoney.toFixed(2) + '円');
                }

                // 判断转换的值是否为空
                function isNULL(val) {
                    if (val == null || val == '') {
                        return 0;
                    } else {

                        return Number(val.slice(0, -1));
                    }

                }

                // 仕入NOリンク押下
                function outputFile() {
                    var purchaseno = $('input:radio[name="choice"]:checked').val();
                    Efw('purchase_output', { "purchaseno": purchaseno });
                }
            </script>
            <style>
                .table_btn td button {
                    width: 100px;
                }
            </style>
        </head>

        <body onload="init();">
            <efw:Part path="purchase_content_inputdialog.jsp" />
            <efw:Part path="purchase_detail_inputdialog.jsp" />
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
                    <p><a href="menu.jsp">メニュー</a> > 仕入情報管理</p>
                </div>
                <div class="content">
                    <div class="c_btn" style="border-bottom: 1px solid black;">
                        <table class="table_btn" style="margin-bottom: 5px;">
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td style="width: 120px;"><button id="btn_new" onclick="add()">新規</button></td>
                                    <td style="width: 120px;"><button id="btn_content" disabled="disabled"
                                            onclick="opencontentdialog()">仕入内容</button></td>
                                    <td style="width: 120px;"><button id="btn_update" onclick="update()"
                                            disabled="disabled">仕入更新</button></td>
                                    <td style="width: 120px;"><button id="btn_delete" onclick="deletepurchase()"
                                            disabled="disabled">仕入削除</button></td>
                                    <td style="width: 120px;"><button id="btn_send" onclick="send()"
                                            disabled="disabled">仕入発送</button></td>
                                    <td style="width: 120px;"><button id="btn_collection" onclick="finish()"
                                            disabled="disabled">仕入受取</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_detail_header" style="overflow: hidden;display: none;" onscroll="scrollHead(this);">
                        <table class="table_detail_header" style="width: 2054px;table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 50px;" rowspan="2" id="temp">選択</th>
                                    <th style="width: 155px" rowspan="2">仕入NO</th>
                                    <th style="width: 200px;" rowspan="2">仕入名称</th>

                                    <th style="width: 200px;" rowspan="2">仕入内容</th>
                                    <th style="width: 100px;" rowspan="2">仕入区分</th>
                                    <th style="width: 50px;" rowspan="2">数量</th>
                                    <th style="width: 100px;" rowspan="2">金額</th>
                                    <th style="width: 120px;" rowspan="2">ステータス</th>

                                    <th style="width: 150px;" rowspan="2">登録日</th>
                                    <th style="width: 150px" rowspan="2">発送日</th>
                                    <th style="width: 150px;" rowspan="2">受取日</th>
                                    <th style="width: 150px;" rowspan="2">完了日</th>

                                    <th style="width: 150px;" rowspan="2">発送方式</th>
                                    <th style="width: 80px" rowspan="2">為替レート</th>

                                    <th style="width: 120px;" class="l"><span class="l5">商品費用</span></th>
                                    <th style="width: 120px;" class="l"><span class="l5">物流費用</span></th>
                                    <th style="width: 120px;" class="l"><span class="l5">税金</span></th>
                                    <th style="width: 137px;" class="l"><span class="l5">合計</span></th>

                                </tr>
                                <tr class="header">
                                    <th class="l"><span class="l5">商品費用（円）</span></th>
                                    <th class="l"><span class="l5">物流費用（円）</span></th>
                                    <th class="l"><span class="l5">税金（円）</span></th>
                                    <th class="l"><span class="l5">合計（円）</span></th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="c_detail_content" style="overflow: auto;display: none;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" id="purchasetable"
                            style="width: 2037px;table-layout: fixed;">

                            <tr>
                                <td style="width: 50px;" rowspan="2" class="c"><input type="radio"
                                        name="choice"></input></td>
                                <td style="width: 155px" rowspan="2" class="l"><span class="l5 a"
                                        onclick="purchase_detail_inputdialog.dialog('open')">20230118-151418</span>
                                </td>
                                <td style="width: 200px;" rowspan="2" class="l"><span class="l5">20230112-レインコート</span>
                                </td>

                                <td style="width: 200px;" rowspan="2" class="l"><span class="l5">XXXXXXXXXXXXXX</span>
                                </td>
                                <td style="width: 50px;" rowspan="2" class="r"><span class="r5">70</span></td>
                                <td style="width: 100px;" rowspan="2" class="r"><span class="r5">999999.99</span>
                                </td>
                                <td style="width: 120px;" rowspan="2" class="c">2:钠品凳送</td>

                                <td style="width: 100px;" rowspan="2" class="c">2023/01/18</td>
                                <td style="width: 100px;" rowspan="2" class="c">2023/01/18</td>
                                <td style="width: 100px;" rowspan="2" class="c">2023/01/18</td>
                                <td style="width: 100px;" rowspan="2" class="c">2023/01/18</td>

                                <td style="width: 150px;" rowspan="2" class="l"><span class="l5">2：海運（呉）</span></td>
                                <td style="width: 80px;" rowspan="2" class="r"><span class="r5">5.12</span></td>

                                <td style="width: 120px;" class="r"><span class="r5">999999.99元</span></td>
                                <td style="width: 120px;" class="r"><span class="r5">999999.99元</span></td>
                                <td style="width: 120px;" class="r"><span class="r5">999999.99元</span></td>
                                <td style="width: 120px;" class="r"><span class="r5">999999.99元</span></td>
                            </tr>
                            <tr>
                                <td class="r"><span class="r5">999999.99円</span></td>
                                <td class="r"><span class="r5">999999.99円</span></td>
                                <td class="r"><span class="r5">999999.99円</span></td>
                                <td class="r"><span class="r5">999999.99円</span></td>
                            </tr>


                        </table>
                    </div>
                </div>
            </div>

        </body>

        </html>