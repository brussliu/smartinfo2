<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>収入支出情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <link href="favicon.ico" rel="icon" type="image/x-icon" />
            <script type="text/javascript" src="js/common.js"></script>
            <style>
           

            </style>
            <script>
                function chooseItem(){
                  
                    $("#btn_update").removeAttr('disabled');
                    $("#btn_delete").removeAttr('disabled');
                }
                function init(){
        	        Efw('cost_init');
                }
                // CTRL+O
                $(window).keydown(function(e) {
                    
                    if (e.keyCode == 79 && e.ctrlKey) {

                        outputToExcelFile(); 
                    } 
                });  
                function del() {
                    //
                    var delKey = $('input:radio[name="choice"]:checked').val();
                    Efw('cost_delete',{"delKey":delKey});
                }
                function update(){
                    
                     // 1.取数据 
                    var updateKey = $('input:radio[name="choice"]:checked').val();
                    Efw('cost_update',{"updateKey":updateKey});
                     //操作フラグ
                     $("#opt").val("UPDATE");
                    // //登録日時
                    // $("#td_registrationdate").html("");
                    // //ステータス
                    // $("#opt_status").val("未支払");
                    // //発生日
                    // $("#txt_accrualdate").val("");
                    // //分類
                    //  $("#txt_classification").val("");
                    // //タイトル
                    // $("#txt_title").val("");
                    // //金額
                    // $("#txt_account").val("");
                    // //為替レート
                    // $("#txt_exchangerate").val("");
                    // //備考
                    //  $("#txt_remarks").val("");
                    $("#opt_currency").val("CNY");
                    // //金額(変換後)
                    //  $("#td_num").html("");
                    
                    // //操作フラグ
                    // $("#opt").val("NEW");
                    //2.画面開く
                    // cost_inputdialog.dialog('open');
                    // Efw('cost_renew');
                }
                
                function add(){
                    // 1.画面初期化　
                    //登録日時
                    $("#td_registrationdate").html("");
                    //ステータス
                    $("#opt_status").val("未支払");
                    //発生日
                    $("#txt_accrualdate").val("");
                    //分類
                    $("#txt_classification").val("");
                    //タイトル
                    $("#txt_title").val("");
                    //金額
                    $("#txt_account").val("");
                    //通貨
                    $("#opt_currency").val("CNY");
                    //為替レート
                    $("#txt_exchangerate").val("");
                    //備考
                    $("#txt_remarks").val("");
                    //金額(変換後)
                    $("#td_num").html("");
                    //操作フラグ
                    $("#opt").val("NEW");

                    //2.画面開く
                    cost_inputdialog.dialog('open');
                    
                }
                
                function cancel(){
                    cost_inputdialog.dialog('close');
                }

                function cal(){
                    //金額の取得
                    var account = $("#txt_account").val();
                    
                    //為替レート取得
                    var exchange = $("#txt_exchangerate").val();

                    //通貨の取得
                    var currency = $("#opt_currency").val();

                    if(currency == "CNY" && exchange != null && exchange != ""){
                        
                        $("#td_num").html(parseInt( account/exchange*100) + " 円");
                        
                    }
                    if(currency == "JPY" && exchange != null && exchange != ""){
                       
                        $("#td_num").html( Math.floor((account*exchange/100) * 100) / 100  + " 元");
                    }

                }
          
                function changetype(type){
             
                    if(type == '支出'){
                        $('#opt_status option').remove();
                        $('#opt_status').append('<option value="未支払" >未支払</option> <option value="支払済">支払済</option>')
                       
                        $('#txt_classification option').remove();
                        $('#txt_classification').append('<option value="" ></option> <option value="操作">操作</option>'+
                                                          ' <option value="資材">資材</option> <option value="美工">美工</option>' +
                                                          '<option value="現状">現状</option> <option value="その他">その他</option>');
                    }

                    if(type == '収入'){
                        $('#opt_status option').remove();
                        $('#opt_status').append('<option value="未受領" >未受領</option> <option value="受領済">受領済</option>')
                    
                        $('#txt_classification option').remove();
                        $('#txt_classification').append('<option value="" ></option> <option value="代行納品">代行納品</option><option value="その他">その他</option>');
                                     
                    }
                }
 
          </script>
            
        </head>

        <body onload="init();">
            <efw:Part path="cost_inputdialog.jsp" />
            
            <div>
                <div class="head">
                    <div class="hleft">
                        <h1 style="height: 80px;line-height: 80px;margin-left:40px;">SmartInfo 2.0</h1>
                    </div>
                    <div class="hright">
                        <table style="float: right;width: 100%;color: aliceblue;">
                            <tr>
                                <td>
                                    <button class="hright_r" onclick="Efw('common_menu_goto',{page:'login.jsp'})">ログオフ</button>
                                    <button class="hright_r" onclick="Efw('common_menu_goto',{page:'shoplist.jsp'})">切替</button>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;padding-right: 20px;" id="sessioninfo">
                                    店舗ID:<span id="shopid" style="font-weight: bold;color: yellow;">未选择</span>
                                    &nbsp;&nbsp;&nbsp;
                                    UserID:<span id="userid" style="font-weight: bold;color: yellow;">XXXX</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="topnav">
                    <p><a href="menu.jsp">メニュー</a> > 収入支出情報管理</p>
                </div>
                <div class="content"  >
                    <div class="c_btn" style="border-bottom: 1px solid black;">
                        <table class="table_btn" style="margin-bottom: 5px;">
                            <tbody>
                                <tr>
                                    <td> </td>
                                    <td> </td> 
                                    <td> </td>         
                                    <td style="width: 200px;"><button onclick="add();">新規</button></td>
                                    <td style="width: 200px;"><button disabled id="btn_update" onclick="update();">更新</button></td>
                                    <td style="width: 200px;"><button disabled id="btn_delete" onclick="del();">削除</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
 
                    <div class="c_detail_header" style="overflow: hidden;">
                        <table class="table_detail_header" style="table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 50px;">選択</th>
                                    <th style="width: 200px">登録日時</th>
                                    <th style="width: 150px">区分</th>
                                    <th style="width: 150px;">発生日</th>

                                    <th style="width: 120px;">ステータス</th>
                                    <th style="width: 200px;">分類</th>
                                    <th style="width: 250px;">タイトル</th>

                                    <th style="width: 120px;">金額（元）</th>
                                    <th style="width: 120px;">金額（円）</th>
                                    <th style="width: 100px;">為替レート</th>

                                    <th style="width: 316px;">備考</th>
                                 
                                </tr>
                            </thead>
                        </table>
                    </div>

                    <div class="c_detail_content" style="overflow-y: auto;overflow-x: hidden;height: 777px;margin-left:48px;">
                        <table class="table_detail_content" style="table-layout: fixed;">
                           
                        </table>
                    </div>
                </div>
            </div>

        </body>
        

        </html>
