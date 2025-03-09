<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>代行発送情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <link href="favicon.ico" rel="icon" type="image/x-icon" />
            <script type="text/javascript" src="js/common.js"></script>
            <script>
                function scrollHead(obj) {

                    var p = $(obj).get(0).scrollLeft;
                    $(".c_detail_header").get(0).scrollLeft = p;

                }

                // 画面初期化
                function init() {
                    Efw('shipacting_init');
                }
                  // CTRL+O
                  $(window).keydown(function(e) {
                    
                    if (e.keyCode == 79 && e.ctrlKey) {

                        outputToExcelFile(); 
                    } 
                });


                // 子画面が閉じる
                function cancel() {
                    shipacting_inputdialog.dialog('close');
                }
                function choice(val) {
                    var status = $(val).parent().next().next().html();
                    var pay = $(val).parent().next().next().next().html();

                    if (val != null && val !='') {
                        if(status == '1.新　規' ){ 
                            $('#btn_update').attr('disabled', false);
                            $('#btn_del').attr('disabled', false);
                            
                        }else{
                       
                            $('#btn_del').attr('disabled', true);  
                            Efw('shipacting_choice',{"opt":'update'});                 
                        }
                       
                        
                        if(pay == '1.未支払'){
                             
                            Efw('shipacting_choice',{"opt":'pay'});

                        }else{
                            $('#btn_pay').attr('disabled', true); 
                        }

                    }else {
                        $('#btn_update').attr('disabled', true);
                        $('#btn_del').attr('disabled', true);
                        $('#btn_pay').attr('disabled', true);  
                    }

                    
                }

                function add() {
                    $('#opt').val('new');

                    // 管理番号
                    $('#td_no').html('');
                    // img
                    $('#img_pic').attr('src', 'img/wz.png');
                    // 発送商品
                    $('#select_sendProduct').get(0).selectedIndex = 0;
                    // 数量
                    $('#text_num').val('');
                    // 郵便番号
                    $('#text_postal').val('');
                    // 住所①
                    $('#text_address1').val('');
                    // 住所②
                    $('#text_address2').val('');
                    // 住所③
                    $('#text_address3').val('');
                    // 名前
                    $('#text_name').val('');
                    // 電話番号
                    $('#text_tel').val('');
                    // 備考
                    $('#text_remarks').val('');
                    // 発送方法
                    $('#select_sendMethod').get(0).selectedIndex = 0;
                    // 発送費用-jp
                    $('#text_jpMoney').val('');
                    // 発送費用-cn
                    $('#text_cnMoney').val('');
                    // 追跡番号
                    $('#text_track').val('');
                    $('.borbom').css('display','none');
                    $('.bortop').css('display','none');
                    $('.btn-1002_01').css('display','none');
                    shipacting_inputdialog.dialog('open');
                }

                // 检索发送商品图片
                function queryPic() {

                    Efw('shipacting_queryPic');
                }

                function save() {

                    Efw('shipacting_save');
                }

                function update() {
                    var no = $('input:radio[name="choice"]:checked').val();
                    $('#opt').val('update');
                    Efw('shipacting_update', { "no": no });
                }

                function del() {
                    var no = $('input:radio[name="choice"]:checked').val();
                    Efw('shipacting_delete', { "no": no });
                }

                function acceptance() {
                    Efw('shipacting_acceptance');
                }

                function changeColor() {

                    $("#shipactingtable").find("tr").each(function () {
                        var tdArr = $(this).children();
                        // ステータス
                        var state = tdArr.eq(2).html();
                        // 
                        var pay = tdArr.eq(3).html();
                        if (state == '1.新　規' || state == '2.受入済') {
                            $(this).children().eq(2).css({ "background": "#99d9ea" });
                        }
                        if (state == '3.発送済' && pay == '2.支払済') {
                            $(this).css({ "background": "#e6e6e6" });      
                        }
                        if (pay == '1.未支払') {
                            $(this).children().eq(3).css({ "background": "rgb(230, 101, 101)" });     
                        }                        
                    });

                }
            
                function pay(){

                    var no = $('input:radio[name="choice"]:checked').val();
                    Efw('shipacting_pay', { "no": no });
                }
            </script>
            <style>
            </style>
        </head>

        <body onload="init();">
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
                    <p><a href="menu.jsp">メニュー</a> > 代行発送情報管理</p>
                </div>
                <div class="content">
                    <div class="c_btn" style="border-bottom: 1px solid black;">
                        <table class="table_btn" style="margin-bottom: 5px;">
                            <tbody>
                                <tr>
                                    <td> </td>
                                    <td> </td>
                                    <td style="width: 200px;"><button class="btn-1001_04"  disabled
                                         onclick="pay()"  id="btn_pay">支払</button> </td>
                                    <td style="width: 200px;"><button onclick="add()"  id="btn_new">新規</button> </td>
                                    <td style="width: 200px;"><button onclick="update()" disabled id="btn_update" >更新</button></td>
                                    <td style="width: 200px;"><button onclick="del()" disabled id="btn_del" >削除</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_detail_header" style="overflow: hidden;">
                        <table class="table_detail_header" style="width: 2084px;table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 50px;">選択</th>
                                    <th style="width: 155px">管理番号</th>
                                    <th style="width: 85px;">ステータス</th>
                                    <th style="width: 85px;">支払状態</th>

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
                                    <th style="width: 167px;">追跡番号</th>


                                </tr>

                            </thead>
                        </table>
                    </div>
                    <div class="c_detail_content" style="overflow: auto;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" id="shipactingtable"
                            style="width: 2067px;table-layout: fixed;">
                          
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