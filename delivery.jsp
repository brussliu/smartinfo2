<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>納品情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <script type="text/javascript" src="js/common.js"></script>
            <style>
                .table_btn td button {
                    width: 100px;
                }
                .hide{
                    display: none;  
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
                 // CTRL+O
                 $(window).keydown(function(e) {
                    
                    if (e.keyCode == 79 && e.ctrlKey) {

                        outputToExcelFile(); 
                    } 
                });

                // 新規
                function add() {
                    Efw('delivery_add');
                }

                // 納品内容
                function content() {
                    var deliveryno = $('input:radio[name="choice"]:checked').val();
                    var state = $('input:radio[name="choice"]:checked').parent().siblings('td').eq(4).text();
                    $('#box_move').prop('checked', false);
                    Efw('delivery_list', { 'deliveryno': deliveryno , 'state' : state});
                }

                // 納品削除
                function deletedelivery() {
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
                function outputFile(obj){
                    var deliveryno = $(obj).html();
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
               
                    $('#text_name').val(deliveryname);
                    if (v == '1.新　規') {
                        $('#btn_content').attr('disabled', false);
                        $('#btn_update').attr('disabled', false);
                        $('#btn_encasement').attr('disabled', false);
                        $('#btn_delete').attr('disabled', false);
                        $('#btn_outputfile').attr('disabled', false);
                        $('#btn_send').attr('disabled', false);
                        $('#btn_receiver').attr('disabled', true);
                        $('#btn_final').attr('disabled', true);

                    } else if (v == '2.発送済') {
                        $('#btn_content').attr('disabled', false);
                        $('#btn_update').attr('disabled', true);
                        $('#btn_encasement').attr('disabled', true);
                        $('#btn_delete').attr('disabled', true);
                        $('#btn_outputfile').attr('disabled', true);
                        $('#btn_send').attr('disabled', true);
                        $('#btn_receiver').attr('disabled', false);
                        $('#btn_final').attr('disabled', false);

                    } else if (v == '3.受領中') {
                        $('#btn_content').attr('disabled', false);
                        $('#btn_update').attr('disabled', true);
                        $('#btn_encasement').attr('disabled', true);
                        $('#btn_delete').attr('disabled', true);
                        $('#btn_outputfile').attr('disabled', true);
                        $('#btn_send').attr('disabled', true);
                        $('#btn_receiver').attr('disabled', false);
                        $('#btn_final').attr('disabled', false);

                    } else if (v == '4.納品済') {
                        $('#btn_content').attr('disabled', false);
                        $('#btn_update').attr('disabled', true);
                        $('#btn_encasement').attr('disabled', true);
                        $('#btn_delete').attr('disabled', true);
                        $('#btn_outputfile').attr('disabled', true);
                        $('#btn_send').attr('disabled', true);
                        $('#btn_receiver').attr('disabled', true);
                        $('#btn_final').attr('disabled', true);

                    } else {
                        $('#btn_content').attr('disabled', true);
                        $('#btn_update').attr('disabled', true);
                        $('#btn_encasement').attr('disabled', true);
                        $('#btn_delete').attr('disabled', true);
                        $('#btn_outputfile').attr('disabled', true);
                        $('#btn_send').attr('disabled', true);
                        $('#btn_receiver').attr('disabled', true);
                        $('#btn_final').attr('disabled', true);

                    }
                }


                function changeColor(){
                 
                 $("#deliverytable").find("tr").each(function () {
                     var tdArr = $(this).children();
                       
                       var state = tdArr.eq(5).html(); 
                       if(state == '4.納品済'){ 
                         $(this).css({ "background": "#e6e6e6" });
                       }

                 })
                }
 

                function to2(state){ 
                    if(state == '1.新　規'){
                        $('#box_move').prop("disabled", false);
                    }else{
                        $('#box_move').prop("disabled", true);
                    }
                    var $table = $("#table_cot");
                    $table.find("tr").each(function() { 
                        var $tdArr =  $(this).children();  

                        if(state == '1.新　規'){
                                
                                // 获取Local1, Local2, 納品数量列的值  
                                var local1 = parseFloat($tdArr.eq(7).text());  
                                var local2 = parseFloat($tdArr.eq(8).text());  
                                var deliveryQuantity = parseFloat($tdArr.eq(9).text());  
                                
                                // 检查Local1, Local2和納品数量的值是否有效  
                                if (!isNaN(local1) && !isNaN(local2) && !isNaN(deliveryQuantity)) {  
                                    // 根据逻辑设置新值  
                                    var newValue;  
                                    if (local1 >= deliveryQuantity) {  
                                        newValue = "";  
                                    } else if (local1 < deliveryQuantity && local2 >= deliveryQuantity - local1) {  
                                        newValue = deliveryQuantity - local1;  
                                    } else if(local1 < deliveryQuantity && local2 < deliveryQuantity - local1){  
                                        newValue = local2; 
                                    }  
                                    if(newValue == 0){
                                        newValue = "";
                                    }
                                    $tdArr.eq(10).text(newValue); 
                                }  
   
                        }else{
                            $tdArr.eq(10).text('-'); 
                        }

                    })
                }
                // 移動必要な項目のみ
                function move(){
                    var isChecked = $('#box_move').is(':checked'); 
                    var $table = $("#table_cot");
                    if(isChecked){
                        $table.find("tr").each(function() { 
                            var $tdArr =  $(this).children(); 
                            var to1 = $tdArr.eq(10).text();
                        
                            if(to1 == ''){
                                $(this).addClass('hide');
                            } 
                        })
                    }else{
                        $table.find("tr").each(function() { 
                            $(this).removeClass('hide');
                        })
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
                    <div class="c_btn">
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
                                    <td style="width: 120px;"><button id="btn_delete" disabled="disabled" onclick="deletedelivery()">納品削除</button>
                                    </td>
                                    <td style="width: 240px;"><button id="btn_outputfile" disabled="disabled"
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

                    <div class="c_condition" style="height: 55px;">
                        <table border="0" style="margin-top: 10px;">
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
                                        <input type="file" id="file_receiverfile"
                                            style="width: 260px; "></input>

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>



                    <div class="c_detail_header" style="overflow: hidden;display: none;" onscroll="scrollHead(this);">
                        <table class="table_detail_header" style="width: 2573px;table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 50px;" id="temp">選択</th>
                                    <th style="width: 155px">納品NO</th>
                                    <th style="width: 300px;" id="tempname">納品名称</th>

                                    <th style="width: 500px;">納品内容</th>
                                    <th style="width: 80px;">数量</th>
                                    <th style="width: 120px;" id="status">ステータス</th>

                                    <th style="width: 120px;">登録日</th>
                                    <th style="width: 120px;">発送日</th>
                                    <th style="width: 120px;">受領日</th>
                                    <th style="width: 120px;">完了日</th>

                                    <th style="width: 140px;">AMZ納品番号</th>
                                    <th style="width: 300px;">AMZ納品名</th>
                                    <th style="width: 160px">AMZ-納品プラン番号</th>
                                    <th style="width: 140px;">AMZ-納品先</th>
                                    <th style="width: 140px;">AMZ-SKU合計</th>
                                    <th style="width: 157px;">AMZ-商品合計数</th>
                                </tr>
                            </thead>
                        </table>
                    </div>

                    <div class="c_detail_content" style="overflow: auto;display: none;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" id="deliverytable"
                            style="width: 2556px;table-layout: fixed;">
                            
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