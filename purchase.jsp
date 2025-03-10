<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>仕入情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <link href="favicon.ico" rel="icon" type="image/x-icon" />
            <script type="text/javascript" src="js/common.js"></script>
            <script>

                $(function () {
                    $(".date").datepicker({
                        dateFormat: 'yy/mm/dd'
                    });
                });


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
                    // 仕入内容
                    $('#file_proContent').val("");
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
                        $('#btn_addpurchase').attr('disabled', false);
                        $('#btn_ivfile').attr('disabled', false);
                    } else if (v == '2.発送済') {
                        $('#btn_content').attr('disabled', false);
                        $('#btn_update').attr('disabled', false);
                        $('#btn_delete').attr('disabled', true);
                        $('#btn_send').attr('disabled', true);
                        $('#btn_collection').attr('disabled', false);
                        $('#btn_addpurchase').attr('disabled', true);
                        $('#btn_ivfile').attr('disabled', false);
                    } else if (v == '3.仕入済') {
                        $('#btn_content').attr('disabled', false);
                        $('#btn_update').attr('disabled', false);
                        $('#btn_delete').attr('disabled', true);
                        $('#btn_send').attr('disabled', true);
                        $('#btn_collection').attr('disabled', true);
                        $('#btn_addpurchase').attr('disabled', true);
                        $('#btn_ivfile').attr('disabled', false);
                    } else {
                        $('#btn_content').attr('disabled', true);
                        $('#btn_update').attr('disabled', true);
                        $('#btn_delete').attr('disabled', true);
                        $('#btn_send').attr('disabled', true);
                        $('#btn_collection').attr('disabled', true);
                        $('#btn_addpurchase').attr('disabled', true);
                        $('#btn_ivfile').attr('disabled', true);
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

                    if (exchange == null || exchange == "" || exchange == '0') {
                        $("#number_productamountRY").html('');
                        $("#number_shipamountRY").html('');
                        $("#number_faxamountRY").html('');
                        $("#text_totalRMB").html('');
                        $("#text_totalRY").html('');

                    }
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
                function outputFile(obj) {
                    var purchaseno = $(obj).html();
                    Efw('purchase_output', { "purchaseno": purchaseno });
                }

                // 資料ダウンロード
                function down(val) {
                    var f = $(val).html();
                    var no = $(val).parent().parent().parent().children().next().children().html();
                    var filearray = f.split('.');
                    var file = filearray[0];
                    var suffix = filearray[1];

                    Efw('purchase_down', { "purchaseno": no, "filename": file, "suffix": suffix });
                }

                function changeColor() {

                    var color = "";

                    $("#purchasetable").find("tr").each(function () {

                        var tdArr = $(this).children();
                        var state = tdArr.eq(7).html();

                        if (state == '3.仕入済') {
                            $(this).css({ "background": "#E6E6E6" });
                            color = "#E6E6E6";
                            
                        }else if (state == '2.発送済') {
                            $(this).css({ "background": "#E1FFFF" });
                            color = "#E1FFFF";
                        }else if (state == '1.新　規') {
                            $(this).css({ "background": "#FFFFE1" });
                            color = "#FFFFE1";
                        }else if(color != ""){
                            $(this).css({ "background": color });
                            color = "";
                        }

                    })
                }

                // 仕入ファイル
                function addpurchase(){
                    var purchaseno = $('input:radio[name="choice"]:checked').val(); 
                    Efw('purchase_doc', { "purchaseno": purchaseno });
                }
                // ivfile
                function ivfile() {
                    var purchaseno = $('input:radio[name="choice"]:checked').val();
                    Efw('purchase_ivfile', { "purchaseno": purchaseno });
                }
                // CTRL+O
                $(window).keydown(function(e) {
                    
                    if (e.keyCode == 79 && e.ctrlKey) {

                        outputToExcelFile(); 
                    } 
                });

            </script>
            <style>
                .table_btn td button {
                    width: 100px;
                }

                .c_detail_content ul {
                    padding: 0;
                    overflow: auto;

                }

                .c_detail_content ul li {

                    line-height: 20px;
                    list-style: disc;
                    list-style-type: disc;
                    overflow: auto;
                    list-style-position: inside;
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
                    <div class="c_btn">
                        <table class="table_btn" style="margin-bottom: 5px;">
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td> 
                                   
                                    <td style="width: 120px;"><button id="btn_new" onclick="add()">新規</button></td>
                                    <td style="width: 120px;"><button id="btn_content" disabled="disabled"
                                            onclick="opencontentdialog()">仕入内容</button></td>
                                    <td style="width: 120px;"><button id="btn_update" onclick="update()"
                                            disabled="disabled">仕入更新</button></td> 
                                    <td style="width: 170px;"><button id="btn_ivfile" onclick="ivfile()"
                                            disabled="disabled" style="width: 150px;">IVファイル</button></td>
                                    <td style="width: 170px;"><button id="btn_addpurchase" onclick="addpurchase()"
                                            disabled="disabled" style="width: 150px;">仕入ファイル</button></td>
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
                        <table class="table_detail_header" style="width: 2606px;table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 50px;" rowspan="2" id="temp">選択</th>
                                    <th style="width: 155px" rowspan="2">仕入NO</th>
                                    <th style="width: 300px;" rowspan="2">仕入名称</th>

                                    <th style="width: 500px;" rowspan="2">仕入内容</th>
                                    <th style="width: 100px;" rowspan="2">仕入区分</th>
                                    <th style="width: 80px;" rowspan="2">数量</th>
                                    <th style="width: 100px;" rowspan="2">金額</th>
                                    <th style="width: 100px;" rowspan="2">ステータス</th>

                                    <th style="width: 120px;" rowspan="2">登録日</th>
                                    <th style="width: 120px" rowspan="2">発送日①</th>
                                    <th style="width: 120px;" rowspan="2">発送日②</th>
                                    <th style="width: 120px;" rowspan="2">完了日</th>

                                    <th style="width: 150px;" rowspan="2">発送方式</th>
                                    <th style="width: 150px;" rowspan="2">追跡番号</th>
                                    <th style="width: 80px" rowspan="2">為替レート</th>

                                    <th style="width: 120px;" class="l"><span class="l5">商品費用</span></th>
                                    <th style="width: 120px;" class="l"><span class="l5">物流費用</span></th>
                                    <th style="width: 120px;" class="l"><span class="l5">税金</span></th>
                                    <th style="width: 120px;" class="l"><span class="l5">合計</span></th>
                                    <th style="width: 267px;" rowspan="2">資料</th>
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
                            style="width: 2589px;table-layout: fixed;">
 
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