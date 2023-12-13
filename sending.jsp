<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>発送情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <script type="text/javascript" src="js/common.js"></script>
            <script>
                function scrollHead(obj) {

                    var p = $(obj).get(0).scrollLeft;
                    $(".c_detail_header").get(0).scrollLeft = p;

                }

                // 画面初期化
                function init() {
                    Efw('sending_init');
                }
                 // CTRL+O
                 $(window).keydown(function(e) {
                    
                    if (e.keyCode == 79 && e.ctrlKey) {

                        outputToExcelFile(); 
                    } 
                });


                // 子画面が閉じる
                function cancel() {
                    sending_inputdialog.dialog('close');
                }

                // 新規ボタン押下
                function add() {

                    // 操作区分
                    $('#opt').val('new');
                    // 区分
                    $('#select_type').get(0).selectedIndex = 4;
                    // 発送方法
                    $('#select_send').get(0).selectedIndex = 0;
                    // 注文番号
                    $('#text_no').val('');
                    // 商品管理番号
                    $('#select_product').get(0).selectedIndex = 0;
                    // 分類１
                    $("#select_sub1 option").remove();
                    $("#select_sub1").append("<option value='' ></option>");
                    $('#select_sub1').get(0).selectedIndex = 0;
                    // 分類２
                    $("#select_sub2 option").remove();
                    $("#select_sub2").append("<option value='' ></option>");
                    $('#select_sub2').get(0).selectedIndex = 0;
                    // 商品名称
                    $('#text_productname').val('');
                    // 数量
                    $('#text_num').val('');
                    // 金額
                    $('#text_money').val('');
                    // 郵便番号
                    $('#text_mail').val('');
                    // 都道府県
                    $('#text_prefecture').val('');
                    // 市区町村
                    $('#text_city').val('');
                    // 住所１
                    $('#text_address1').val('');
                    // 住所２
                    $('#text_address2').val('');
                    // 住所３
                    $('#text_address3').val('');
                    // 住所全部
                    $('#td_addressall').html('');
                    $('#td_addressall').css('border', '0px');
                    // 宛先
                    $('#text_name').val('');
                    // 電話番号
                    $('#text_phone').val('');
                    // 備考
                    $('#text_remark').val('');
                    // 発送内容
                    $('#text_sendcontent').val('');

                    sending_inputdialog.dialog('open');

                }

                // 削除ボタン押下
                function del() {

                    $('#sendingtable input:checkbox:checked').each(function (index, item) {
                        // arr.push($(this).next().val());
                        Efw('sending_del', { "orderno": $(this).next().val() });
                        return;
                    });

                }

                // 商品管理番号、分類１、分類２変更
                function changeProduct(val) {

                    Efw('sending_queryproductsub',{'opt':val} );

                }

                // 更新
                function update() {

                    $('#sendingtable input:checkbox:checked').each(function (index, item) {
                        
                        $('#opt').val('update');
                        $('#td_addressall').css('border', '1px solid black');
                        Efw('sending_update', { "orderno": $(this).next().val() });

                        return;
                    });

                }

                // 追跡番号更新
                function trackingUpdate() {

                    var arr = new Array();

                    $('#sendingtable input:checkbox:checked').each(function (index, item) {
                        var orderno = $(this).next().val();
                        arr.push(orderno);

                        var trackno = $(this).parent().next().next().children().next().val();
                        arr.push(trackno);

                    });

                    if (arr.length > 0) {
                        Efw('sending_trackingupdate', { "arr": arr });
                    }

                }

                // 保存
                function save() {

                    var arr = new Array();
                    $('#sendingtable input:checkbox:checked').each(function (index, item) {
                        arr.push($(this).next().val());
                    });

                    if (arr.length > 0) {
                        Efw('sending_save', { "orderno": arr[0] });
                    }else{
                        Efw('sending_save', { "orderno": "" });
                    }

                }

                // CSVファイル出力
                function outputcsv() {

                    // var arr = new Map();
                    // $('#sendingtable input:checkbox:checked').each(function (index, item) {
                    //     var orderno = $(this).next().val();
                    //     var trackno = $(this).parent().next().next().children().val();
                    //     arr.set(orderno, trackno);
                    // });
                    // if (arr.length > 0) {
                    //     // Efw('sending_trackingupdate', { "arr": arr });
                    // } else {

                    // }

                    Efw('sending_outputcsv');

                }

                // ラベル出力
                function outputlabel() {

                    Efw('sending_outputlabel');
                
                }

                // 商品集計
                function productlist() {
                    Efw('sending_productlist');
                }



                function choice(val) {
                    if (val == '1') {
                        var arr = new Array();
                        $('#sendingtable input:checkbox:checked').each(function (index, item) {
                            arr.push($(this).next().val());
                            var span_trackno = $(this).parent().next().next().children();

                            span_trackno.css("display", "none");
                            span_trackno.parent().append('<input type="text" value="' + span_trackno.html() + '"style="width:170px;height: 30px;"></input>')

                        });
                        $('#sendingtable input:checkbox:not(:checked)').each(function (index, item) {
                            var span_trackno = $(this).parent().next().next().children();
                            span_trackno.css("display", "inline");
                            span_trackno.next().remove()

                        });


                        if (arr.length == 0) {
                            $('#btn_update').attr('disabled', true);
                            $('#btn_del').attr('disabled', true);
                            $('#btn_tracking').attr('disabled', true);
                        } else if (arr.length == 1) {
                            $('#btn_update').attr('disabled', false);
                            $('#btn_del').attr('disabled', false);
                            $('#btn_tracking').attr('disabled', false);
                        } else if (arr.length > 1) {
                            $('#btn_update').attr('disabled', true);
                            $('#btn_del').attr('disabled', true);
                            $('#btn_tracking').attr('disabled', false);
                        }

                    }
                    if (val == '0') {
                        $('#btn_update').attr('disabled', true);
                        $('#btn_del').attr('disabled', true);
                        $('#btn_tracking').attr('disabled', true);
                    }

                }


                function changeColor() {

                    $("#sendingtable").find("tr").each(function () {
                        var tdArr = $(this).children();
                        // 情報整備フラグ
                        var info = tdArr.eq(0).children().next().next().val();

                        if (info != '1') {
                            $(this).css({ "background": "#e66565" });
                        }
                        // ステータス
                        var state = tdArr.eq(3).html();
                        if (state == '2.発送済') {
                            $(this).css({ "background": "#e6e6e6" });
                        }

                    });

                }

                // 情報整備
                function formatInfo() {

                    Efw('sending_format');

                }

            </script>
            <style>
                .table_btn td button {
                    width: 130px;
                }

                .lh {
                    line-height: 20px;
                }
            </style>
        </head>

        <body onload="init();">
            <efw:Part path="sending_inputdialog.jsp" />
            <efw:Part path="sending_list_inputdialog.jsp" />

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
                    <p><a href="menu.jsp">メニュー</a> > 発送情報管理</p>
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
                                    <td style="width: 140px;"><button onclick="productlist()">商品集計</button></td>
                                    <td style="width: 140px;"><button onclick="add()">新規</button></td>
                                    <td style="width: 140px;"><button onclick="update()" id="btn_update" disabled>更新</button></td>
                                    <td style="width: 140px;"><button onclick="del()" id="btn_del" disabled>削除</button></td>
                                    <td style="width: 140px;"><button onclick="formatInfo()">情報整備</button></td>
                                    <td style="width: 300px;"><button onclick="outputcsv()" style="width:280px;">クリックポスト作成用CSV出力</button></td>
                                    <td style="width: 200px;"><button onclick="outputlabel()" style="width:180px;">普通便用ラベル出力</button></td>
                                    <td style="width: 220px;"><button onclick="trackingUpdate()" style="width:200px;" id="btn_tracking" disabled>発送（追跡番号更新）</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_detail_header" style="overflow: hidden;">
                        <table class="table_detail_header" style="width: 3389px;table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 50px;">選択</th>
                                    <th style="width: 130px">区分</th>
                                    <th style="width: 180px;">追跡番号</th>

                                    <th style="width: 120px;">ステータス</th>
                                    <th style="width: 200px;">注文番号</th>
                                    <th style="width: 240px;">注文日時</th>

                                    <th style="width: 600px;">商品</th>
                                    <th style="width: 100px;">数量合計</th>
                                    <!-- <th style="width: 100px">金額合計</th> -->

                                    <th style="width: 100px;">郵便番号</th>
                                    <th style="width: 400px;">届け先住所</th>
                                    <th style="width: 120px;">届け先宛先</th>

                                    <th style="width: 160px">電話番号</th>                        
                                    <th style="width: 240px;">発送日時</th>
                                    <th style="width: 200px;">発送方法</th>
                                    <th style="width: 300px;">備考</th>
                                    <th style="width: 217px;">発送内容</th>
                                </tr>

                            </thead>
                        </table>
                    </div>
                    <div class="c_detail_content" style="overflow: auto;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" style="width: 3372px;table-layout: fixed;"
                            id="sendingtable">
 
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