<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>代行発送商品管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <link href="favicon.ico" rel="icon" type="image/x-icon" />
            <script type="text/javascript" src="js/common.js"></script>

            <script>
                // 商品名称（中国語）
                function display() {
                    var peoductname =
                        $("#text_product").val().replaceAll(' ', '') + " " +
                        $("#text_sub1").val().replaceAll(' ', '') + " " +
                        $("#text_sub2").val().replaceAll(' ', '');

                    $("#td_productname").html(peoductname);
                }
                
                // 画面初期化
                function init() {
                    Efw('shipactingmaster_init');
                }
                 // CTRL+O
                 $(window).keydown(function(e) {
                    
                    if (e.keyCode == 79 && e.ctrlKey) {

                        outputToExcelFile(); 
                    } 
                });


                // 子画面が閉じる
                function cancel() {
                    shipactingmaster_inputdialog.dialog('close');
                }

                // 表示图片
                function showpic(){
                    Efw('shipactingmaster_querypic');
                }

                // new初始化
                function add(){
                    $('#opt').val('new');
                     // 管理番号
                     $('#td_no').html('');
                      // 商品分類
                    $('#select_protype').get(0).selectedIndex = 0;
                     // 商品名称（中国語）
                     $('#td_productname').html('');
                      // 商品名：
                    $('#text_product').val('');
                     // 分類①：
                     $('#text_sub1').val('');
                      // 分類②：
                    $('#text_sub2').val('');
                     // 商品名称（日本語）
                     $('#text_jpproductname').val('');
                      // 数量
                    $('#text_num').val('');
                     // 備考
                     $('#text_remark').val('');
                      // 商品写真
                    $('#img_pic').attr("src","img/uploadpic_Smart-Bear.png");
                    $('#img_pic2').css("display","none");
                    shipactingmaster_inputdialog.dialog('open');
                }
          
                function choice(val){
                    var v = $(val).val();

                    if(v != null && v != ''){
                        // $('#btn_update').attr('disabled', false);
                        // $('#btn_del').attr('disabled', false);
                        
                        Efw('shipactingmaster_choice');

                    }else{
                        $('#btn_update').attr('disabled', true);
                        $('#btn_del').attr('disabled', true);
                    }

                    

                }
          
                function save(){
                   var pic= $('#img_pic2').attr("src");
                    Efw('shipactingmaster_save',{ "pic" : pic});
                }

                function update(){
                    var no = $('input:radio[name="choice"]:checked').val();
                    $('#opt').val('update');
                    Efw('shipactingmaster_update',{ "no": no});
                }
          
                function del(){
                    var no = $('input:radio[name="choice"]:checked').val();

                    Efw('shipactingmaster_delete',{ "no": no});
                } 
          
                function changeColor(){
                 
                    $("#shipactingmastertable").find("tr").each(function () {
                        var tdArr = $(this).children();
                          // 数量
                          var num = tdArr.eq(5).children().html();
                          if(num == 0 || num == ''){
                            $(this).css({ "background": "#e6e6e6" });
                          }

                    })
                }
          </script>
            <style>

            </style>

        </head>

        <body onload="init();">

            <efw:Part path="shipactingmaster_inputdialog.jsp" />

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
                    <p><a href="menu.jsp">メニュー</a> > 代行発送商品管理</p>
                </div>
                <div class="content">
                    <div class="c_btn" style="border-bottom: 1px solid black;">
                        <table class="table_btn" style="margin-bottom: 5px;">
                            <tbody>
                                <tr>
                                    <td> </td>
                                    <td> </td>
                                    <td> </td>
                                    <td style="width: 200px;"><button class="btn-0901_01" onclick="add()" id="btn_new">新規</button></td>
                                    <td style="width: 200px;"><button class="btn-0901_02" onclick="update()" id="btn_update" disabled>更新</button></td>
                                    <td style="width: 200px;"><button class="btn-0901_03" onclick="del()" id="btn_del" disabled>削除</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="c_detail_header" style="overflow: hidden;">
                        <table class="table_detail_header" style="table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 50px;">選択</th>
                                    <th style="width: 120px;">管理番号</th>
                                    <th style="width: 150px">商品分類</th>
                                    <th style="width: 400px;">名称/色/サイズ（中国語）</th>

                                    <th style="width: 200px;">名称（日本語）</th>
                                    <th style="width: 150px;">数量</th>

                                </tr>
                            </thead>
                        </table>
                    </div>

                    <div class="c_detail_content" style="overflow: auto;height: 673px;margin-left:48px;width: 1106px;">
                        <table class="table_detail_content" id="shipactingmastertable" style="table-layout: fixed;" >
                           
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