<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>商品スキャン</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <script type="text/javascript" src="js/common.js"></script>

            <script>

                // 初期化
                function init() {
                    Efw('scan_init');
                }
                // 子画面が閉じる1
                function cancel1() {
                    scan_inputdialog.dialog('close');
                }
                // 子画面が閉じる2
                function cancel2() {
                    scan_inventory_inputdialog.dialog('close');
                }

                // スキャン
                function inputLabel(obj) {

                    if ($(obj).val().length == 10 && $(obj).val().startsWith("X00")) {
                        // 商品情報取得
                        Efw('scan_searchProductInfoByLabel', { "labelno": $(obj).val() });
                    } else {
                        return;
                    }
                }

                // エラー時の声
                function errorMsg() {
                    $("#scanInput").val("");
                    // ダメの音声
                    var audioElement = document.createElement('audio');
                    audioElement.setAttribute('src', 'damei.mp3');
                    audioElement.setAttribute('autoplay', 'autoplay');

                }

                // 更新数量
                function displayToTable(pno, sub1, sub2, asin, sku, label) {

                    var overflg = false;

                    // 増加：1、削減：-1
                    var opttype = parseInt($("input[name='opttype']:checked").val());

                    // 全部行をループする
                    $("#boxinfobody").find("tr").each(function () {

                        var tdArr = $(this).children();

                        var td_asin = tdArr.eq(3).html();
                        var td_sku = tdArr.eq(4).html();

                        // 対象商品の行
                        if (sku == td_sku || asin == td_asin) {
                            tdArr.parent().css("background-color", "pink").siblings().css("background-color","#fffff0");
                            // 数量
                            var td_q = tdArr.eq(6).html().length <= 0 ? 0 : parseInt(tdArr.eq(6).html());

                            // 操作後の数<0の場合
                            if (td_q + opttype < 0) {

                                // 数量を0に設定
                                tdArr.eq(6).html(0);

                                return;
                                // 操作後の数>=0の場合
                            } else {

                                // 操作する（操作後の数量を箱列に反映）
                                tdArr.eq(6).html(td_q + opttype);
                                var audioElement = document.createElement('audio');
                                audioElement.setAttribute('src', 'facai.mp3');
                                audioElement.setAttribute('autoplay', 'autoplay');

                                // 処理終了フラグ
                                overflg = true;
                                return;
                            }
                        }
                    });

                    // 処理終了の場合
                    if (overflg) {
                        $("#scanInput").val("");
                        return;// 処理終了
                    }

                    // 削減の場合、対象商品が表示されていない場合、処理終了する
                    if (opttype < 0) {
                        errorMsg();
                        return;// 処理終了
                    }

                    $("#boxinfobody tr").css("background-color", "#fffff0");
                    // 未表示の商品を新規する
                    var resultHTML =
                        "<tr class='tr_pink'>" +
                        "<td style='width: 90px;'>" + pno + "</td>" +    // 商品管理番号
                        "<td style='width: 160px;'>" + sub1 + "</td>" +  // 分類①
                        "<td style='width: 160px;'>" + sub2 + "</td>" +  // 分類②
                        "<td style='width: 120px;'>" + asin + "</td>" +  // ASIN
                        "<td style='width: 150px;'>" + sku + "</td>" +   // SKU
                        "<td style='width: 120px;'>" + label + "</td>" + // LABEL
                        "<td style='width: 80px;'>1</td>" +              // 数量
                        "</tr>";

                    $("#boxinfobody").append(resultHTML);
                    var audioElement = document.createElement('audio');
                    audioElement.setAttribute('src', 'facai.mp3');
                    audioElement.setAttribute('autoplay', 'autoplay');

                    $("#scanInput").val("");

                }

                function add() {
                    $('#opt').val('new')
                    // リストNO
                    $('#td_no').html('')
                    // 名称：
                    $('#text_name').val('')
                    // スキャン
                    $('#scanInput').val('')
                    // 操作
                    $("input[name='opttype']:radio[value='1']").attr('checked', 'true');
                    // 行
                    $('#boxinfobody').find("tr").remove()

                    scan_inputdialog.dialog('open');
                }

                function save() {
                    var  opt = $('#opt').val();
                    if( opt == 'new'){
                        var   listno = '';
                    }
                    if( opt == 'update'){
                        var   listno = $('input:radio[name="choice"]:checked').val();
                    }
                 
                    var tableArr = new Array();

                    $("#boxinfobody").find("tr").each(function () {
                        var tdArr = $(this).children();
                        // var productno = tdArr.eq(0).html();
                        // var sub1 = tdArr.eq(1).html();
                        // var sub2 = tdArr.eq(2).html();
                        // var asin = tdArr.eq(3).html();
                        // var sku = tdArr.eq(4).html();
                        var label = tdArr.eq(5).html();
                        var num = tdArr.eq(6).html();

                        var jsons = JSON.stringify({ "label": label, "num": num });
                        tableArr.push(jsons);

                    });
                    Efw('scan_save', { "tableArr": tableArr, "listno": listno });
                }

                // 削除ボタン押下
                function del() {
                    var listno = $('input:radio[name="choice"]:checked').val();
                    Efw('scan_del', { "listno": listno });

                }

                function choice(val) {
                    if (val == 'init') {
                        $('#btn_update').attr('disabled', true);
                        $('#btn_del').attr('disabled', true);
                        $('#btn_instorage').attr('disabled', true);
                    } else {
                        $('#btn_update').attr('disabled', false);
                        $('#btn_del').attr('disabled', false);
                        $('#btn_instorage').attr('disabled', false);
                    }
                }

                function update() {
                    $('#opt').val('update')
                    var listno = $('input:radio[name="choice"]:checked').val();
                    Efw('scan_update', { "listno": listno });
                }
                // 入库
                function instorage() { 
                    var listno = $('input:radio[name="choice"]:checked').val();
                    Efw('scan_instorage', { "listno": listno });
                }

                function inventory() {
                    //商品管理番号
                    $('#select_productno').get(0).selectedIndex = 0;
                    // リストNO
                    $('#select_listno').get(0).selectedIndex = 0;
                    $("#select_listno").attr("disabled", true);
                    
                    $('#inventoryObjectTable').html('');
                    $('#inventoryReturnTable').html('');
                    // リスト名称
                    $('#td_name').html('');
                    // 合計数量
                    $('#td_num').html('');
                    // 在庫更新
                    $("#btn_localupdate").attr("disabled", true);
                    
                    scan_inventory_inputdialog.dialog('open');
                    
                }

                function changeColor() {
                     $("#scantable").find("tr").each(function () {
                  
                        var tdArr = $(this).children();

                        var state = tdArr.eq(5).html();

                        if (state == '2.棚卸済') {
                            $(this).css({ "background": "#e6e6e6" });
                        }
                    });

                }

                // 商品管理番号、分類１、分類２変更
                function changeProduct(val) {

                    Efw('scan_queryproductsub', { 'opt': val });

                }
            
                function localupdate(){
                    var objectArray = new Array();
                    var insertArray = new Array();

                    $("#inventoryObjectTable").find("tr").each(function () {
                       var s = $(this).hasClass('tr_pink');
                       if(s){
                            //  获取变红的tr 添加进 insertArray 数组
                            var tdArr = $(this).children();
                            var productno = tdArr.eq(0).html();
                            var sub1 = tdArr.eq(1).html();
                            var sub2 = tdArr.eq(2).html();
                            var asin = tdArr.eq(3).html();
                            var sku = tdArr.eq(4).html();
                            var label = tdArr.eq(5).html();
                            var inventorynum = tdArr.eq(7).html();

                            var jsons = JSON.stringify({ "productno": productno,"sub1": sub1,"sub2": sub2,"asin": asin,"sku": sku,"label": label, "inventorynum": inventorynum });
                            insertArray.push(jsons);

                       }else{
                             // 获取未变红的TR  添加进 objectArray 数组
                            var tdArr = $(this).children();
                            var productno = tdArr.eq(0).html();
                            var sub1 = tdArr.eq(1).html();
                            var sub2 = tdArr.eq(2).html();
                            var asin = tdArr.eq(3).html();
                            var sku = tdArr.eq(4).html();
                            var label = tdArr.eq(5).html();
                            var inventorynum = tdArr.eq(7).html();

                            var jsons = JSON.stringify({ "productno": productno,"sub1": sub1,"sub2": sub2,"asin": asin,"sku": sku,"label": label, "inventorynum": inventorynum });
                            objectArray.push(jsons);
                       }
                    });
                    Efw('scan_localupdate', { "insertArray": insertArray, "objectArray": objectArray });

                }
                 // CTRL+O
                 $(window).keydown(function(e) {
                    
                    if (e.keyCode == 79 && e.ctrlKey) {

                        outputToExcelFile(); 
                    } 
                });

            </script>
            <style>
                .tr_pink {
                    background-color: pink;
                }
            </style>

        </head>

        <body onload="init();">
            <efw:Part path="scan_inputdialog.jsp" />
            <efw:Part path="scan_inventory_inputdialog.jsp" />
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
                    <p><a href="menu.jsp">メニュー</a> > 商品スキャン</p>
                </div>
                <div class="content">
                    <div class="c_btn" style="border-bottom: 1px solid black;">
                        <table class="table_btn" style="margin-bottom: 5px;">
                            <tbody>
                                <tr>
                                    <td> </td> 
                                    <td style="width: 200px;"><button id="btn_new" onclick="add()">新規</button></td>
                                    <td style="width: 200px;"><button id="btn_update" onclick="update()"
                                            disabled>更新</button></td>
                                    <td style="width: 200px;"><button id="btn_inventory" onclick="inventory()"
                                            >棚卸</button>
                                    </td>
                                    <td style="width: 200px;"><button id="btn_instorage" onclick="instorage()"
                                        disabled>入庫</button>
                                     </td>
                                    <td style="width: 200px;"><button id="btn_del" onclick="del()" disabled>削除</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="c_detail_header" style="overflow: hidden;">
                        <table class="table_detail_header" style="table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 50px;">選択</th>
                                    <th style="width: 160px;">リストNO</th>
                                    <th style="width: 250px;">リスト名称</th>
                                    <th style="width: 400px;">リスト内容</th>
                                    <th style="width: 150px;">数量合計</th>
                                    <th style="width: 150px;">ステータス</th>

                                </tr>
                            </thead>
                        </table>
                    </div>

                    <div class="c_detail_content" style="overflow: auto;height: 673px;width:1193px; margin-left:48px;">
                        <table id="scantable" class="table_detail_content" style="table-layout: fixed;">
                          
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