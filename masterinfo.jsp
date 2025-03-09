<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>SmartInfo 2.0</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <link href="favicon.ico" rel="icon" type="image/x-icon" />
            <script type="text/javascript" src="js/common.js"></script>
            <script>

                function scrollHead(obj) {
                    var p = $(obj).get(0).scrollLeft;
                    $(".c_detail_header").get(0).scrollLeft = p;
                }

                function init() {
                    Efw('masterinfo_init');
                }

                function cel(){
                    masterinfo_inputdialog.dialog('close');
                }

                // 検索
                function searchmasterinfo() {

                    var productdivArr = new Array();
                    $('#producttype input:checkbox:checked').each(function (index, item) {
                        productdivArr.push($(this).val());
                    });
 
                    Efw('masterinfo_search', { 'producttype': productdivArr});
                    
                }

                // 新規
                function newdialog() {

                    // 操作区分
                    $("#opt").val("new");

                    $('#asinselect').val("-");
                    $("#asinselect").attr("disabled", "disabled").css("background", "lightgray");

                    $('#skuselect').val("-");
                    $("#skuselect").attr("disabled", "disabled").css("background", "lightgray");

                    $('#label').html("-");

                    $('#preproduct').val("親商品");
                    $("#preproduct").removeAttr("disabled").css("background", "lightcyan");
                    $("#purchase").val('');
                    $("#productname").val('');
                    $("#cbox_suspend").prop('checked',false); 
                    $("#td_suspend").attr("disabled", false); 
                    $("#del").css("display","none");
                    Efw('masterinfo_new');

                }

                // 更新
                function updatedialog(btn) {

                    var flg = $(btn).next().val();
                    
                    $("#opt").val("update");
                    $("#del").val(flg);
                    $("#td_suspend").attr("disabled", false);  
                    $("#del").attr("disabled", false); 

                    var type = $(btn).parent().next().next().children().html();
                    var no = $(btn).parent().next().next().next().html();
                    var preproduct = $(btn).parent().next().next().next().next().html();
                    var sub1 = $(btn).parent().next().next().next().next().next().children().html();
                    var sub2 = $(btn).parent().next().next().next().next().next().next().children().html();
                
                    $("#newproducttype2").data("oldvalue", type);
                    $("#newproductno2").data("oldvalue", no);
                    $("#preproduct").data("oldvalue", preproduct);
                    $("#sub1").data("oldvalue", sub1);
                    $("#sub2").data("oldvalue", sub2); 
                    
                    var preproduct = $(btn).parent().next().next().next().next().html();
                    var asin = $(btn).parent().next().next().next().next().next().next().next().html().toString();
                    var sku = $(btn).parent().next().next().next().next().next().next().next().next().html().toString();
                     
                    if (flg == '0') {//更新时，当暂定为0时
                        $("#del").css("display","none");
 
                        $("#asinselect").attr("disabled", "disabled").css("background", "lightgray");
                        $("#skuselect").attr("disabled", "disabled").css("background", "lightgray");
                        $("#preproduct").attr("disabled", "disabled").css("background", "lightgray");
                        
                        Efw('masterinfo_update0', {'asin': asin, 'sku': sku });

                    } else{//更新时，非暂定时
                        $("#del").css("display","block");
                        $("#preproduct").attr("disabled", "disabled").css("background", "lightgray");
                         
                        Efw('masterinfo_update1', { "flg" : flg});

                    }

                }

                function preproductchange() {

                    var opt = $("#opt").val();

                    var val = $("#preproduct").val();

                    if (opt == 'new') {

                        if (val == '親商品') {
                            $('#fba').val("");
                            $('#sub1').val("");
                            $('#sub2').val("");
                            $('#price1').val("");
                            $('#price2').val("");
                            $('#price3').val("");

                            $("#fba").attr("disabled", "disabled").css("background", "lightgray");
                            $("#sub1").attr("disabled", "disabled").css("background", "lightgray");
                            $("#sub2").attr("disabled", "disabled").css("background", "lightgray");
                            $("#price1").attr("disabled", "disabled").css("background", "lightgray");
                            $("#price2").attr("disabled", "disabled").css("background", "lightgray");
                            $("#price3").attr("disabled", "disabled").css("background", "lightgray");

                        } else if (val == '子商品') {

                            $("#fba").removeAttr("disabled").css("background", "lightcyan");
                            $("#sub1").removeAttr("disabled").css("background", "lightcyan");
                            $("#sub2").removeAttr("disabled").css("background", "lightcyan");
                            $("#price1").removeAttr("disabled").css("background", "lightcyan");
                            $("#price2").removeAttr("disabled").css("background", "lightcyan");
                            $("#price3").removeAttr("disabled").css("background", "lightcyan");
                        }
                    }else if(opt == 'update') {

                        if (val == '親商品') {
                           
                            $('#sub1').val("");
                            $('#sub2').val("");

                            $("#sub1").attr("disabled", "disabled").css("background", "lightgray");
                            $("#sub2").attr("disabled", "disabled").css("background", "lightgray");

                        } else if (val == '子商品') {

                            $("#sub1").removeAttr("disabled").css("background", "lightcyan");
                            $("#sub2").removeAttr("disabled").css("background", "lightcyan");

                        }

                        $("#fba").removeAttr("disabled").css("background", "lightcyan");
                        $("#price1").removeAttr("disabled").css("background", "lightcyan");
                        $("#price2").removeAttr("disabled").css("background", "lightcyan");
                        $("#price3").removeAttr("disabled").css("background", "lightcyan");

                    }
               
                }

                function save() {   
                    var opt = $("#opt").val();
                    if(opt == 'new'){

                        Efw('masterinfo_save', {
                        'oldtype': '', 
                        'oldno': '', 
                        'oldpreproduct': '',
                        'oldsub1': '',
                        'oldsub2': '',
                    });
                    }
                    if(opt == 'update'){
                        var oldtype = $('#newproducttype2').data('oldvalue');
                        var oldno = $('#newproductno2').data('oldvalue');
                        var oldpreproduct = $('#preproduct').data('oldvalue');
                        var oldsub1 = $('#sub1').data('oldvalue');
                        var oldsub2 = $('#sub2').data('oldvalue');
                        Efw('masterinfo_save', {
                        'oldtype': oldtype, 
                        'oldno': oldno, 
                        'oldpreproduct': oldpreproduct,
                        'oldsub1': oldsub1==undefined?'':oldsub1,
                        'oldsub2': oldsub2==undefined?'':oldsub2,
                    });
                    }
                     
                }

                function changeColor(hideflg) {

                    var oyflg = false;
                    var oldproductno = "";

                    $("#stocktable").find("tr").each(function () {

                        var tdArr = $(this).children();

                        // 商品管理番号
                        var newproductno = tdArr.eq(3).html();
                        // 親子区分
                        var productkinds = tdArr.eq(4).html(); 
                       
                        var flg = false;
                        if (newproductno != oldproductno) {
                            flg = true;
                        }
                        // 商品管理番号変わる
                        if (flg) {
                            oyflg = false;
                        }

                        if (productkinds == "親商品") {
                            // 行の色を変更
                            $(this).css({ "background": "rgb(153,217,234)" });
                            oyflg = true;
                        }

                        if (productkinds == "子商品") {

                            // チェックボックス列の色を変更
                            if (oyflg) {
                                $(this).css({ "background": "rgb(210,255,255)" });
                                tdArr.eq(0).css({ "background": "rgb(153,217,234)" });
                            }else{
                                $(this).css({ "background": "rgb(255,255,240)" });
                            }
                        }
                        oldproductno = newproductno;

                        // 入力足りない
                        var displayflg = false;
                        // １，商品種別が未入力
                        var inputValue = tdArr.eq(2).children(0).html();
                        if(inputValue == null || inputValue == ""){
                            tdArr.eq(2).css({ "background": "rgb(255,150,150)" });
                            displayflg = true;
                        }
                        // ２，商品管理番号が未入力
                        var inputValue = tdArr.eq(3).html();
                        if(inputValue == null || inputValue == ""){
                            tdArr.eq(3).css({ "background": "rgb(255,150,150)" });
                            displayflg = true;
                        }
                        // ３，商品分類が未入力
                        var inputValue1 = tdArr.eq(5).children(0).html();
                        var inputValue2 = tdArr.eq(6).children(0).html();
                        if (productkinds == "親商品") {
                            if(inputValue1 != null && inputValue1 != ""){
                                tdArr.eq(5).css({ "background": "rgb(255,150,150)" });
                                displayflg = true;
                            }
                            if(inputValue2 != null && inputValue2 != ""){
                                tdArr.eq(6).css({ "background": "rgb(255,150,150)" });
                                displayflg = true;
                            }
                        }else{
                            if(
                                (inputValue1 == null || inputValue1 == "") && 
                                (inputValue2 == null || inputValue2 == "")
                            ){
                                tdArr.eq(5).css({ "background": "rgb(255,150,150)" });
                                tdArr.eq(6).css({ "background": "rgb(255,150,150)" });
                                displayflg = true;
                            }
                        }
                        // ４，暫定商品
                        var inputValue1 = tdArr.eq(7).html();
                        var inputValue2 = tdArr.eq(8).html();
                        if(inputValue1 == null || inputValue1 == ""){
                            $(this).css({ "background": "rgb(255, 210, 255)" });
                            tdArr.eq(0).css({ "background": "rgb(255, 210, 255)" });
                            displayflg = true;
                        } 
                        if(inputValue2 == null || inputValue2 == ""){
                            $(this).css({ "background": "rgb(255, 210, 255)" });
                            tdArr.eq(0).css({ "background": "rgb(255, 210, 255)" });
                            displayflg = true;
                        }
                        // ５，LABEL番号
                        var inputValue = tdArr.eq(9).html();
                        if (productkinds == "親商品") {
                            if(inputValue != null && inputValue != ""){
                                tdArr.eq(9).css({ "background": "rgb(255,150,150)" });
                                displayflg = true;
                            }
                        }
                        // ６，仕入価格
                        var inputValue = tdArr.eq(10).children(0).html();
                        if (productkinds == "親商品") {
                            if(inputValue != null && inputValue != ""){
                                tdArr.eq(10).css({ "background": "rgb(255,150,150)" });
                                displayflg = true;
                            }
                        }
                        if (productkinds == "子商品") {
                            if(inputValue == null || inputValue == "" || inputValue == 0){
                                tdArr.eq(10).css({ "background": "rgb(255,150,150)" });
                                displayflg = true;
                            }
                        }
                        // ７，FBA発送方式
                        var inputValue = tdArr.eq(12).children(0).html();
                        if (productkinds == "親商品") {
                            if(inputValue != null && inputValue != ""){
                                tdArr.eq(12).css({ "background": "rgb(255,150,150)" });
                                displayflg = true;
                            }
                        }
                        if (productkinds == "子商品") {
                            if(inputValue == null || inputValue == ""){
                                tdArr.eq(12).css({ "background": "rgb(255,150,150)" });
                                displayflg = true;
                            }
                        }

                        if(hideflg == 1){
                            if(displayflg == false){
                                $(this).hide();
                            }
                        }
                      
                         // 仕入中止
                         if($(this).children().eq(1).children().html() == '止' || $(this).children().eq(1).children().html() == '削除済'){ 
                            $(this).css({ "background": "rgb(200,200,200)" })
                            $(this).children().eq(0).css({ "background": "rgb(200,200,200)" })
                            $(this).children().eq(1).css({"color" : "red"})
                        }
                    });
                }

                function del(){

                    var flg =  $("#del").val();  
                    Efw('masterinfo_delete', {  "flg" : flg }); 
                }
                 // CTRL+O
                $(window).keydown(function(e) {
	   
                    if (e.keyCode == 79 && e.ctrlKey) {

                        outputToExcelFile(); 
                    } 
                });


            </script>

    <style>

    </style>
        </head>

        <body onload="init();">
            <efw:Part path="masterinfo_inputdialog.jsp" />
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
                    <p><a href="menu.jsp">メニュー</a> >マスタ情報管理</p>
                </div>
                <div class="content">
                    <div class="c_btn">
                        <table class="table_btn">
                            <tbody>
                                <tr>
                                    <td style="font-weight: bold;color: maroon">【検索条件】</td>
                                    <td></td>
                                    <td></td>
                                    <td></td> 
                                    <td></td> 
                                    <td style="width: 200px;"><button id="insert" onclick="newdialog()" >新規</button>
                                    </td> 
                                    <td style="width: 200px;"><button id="searchbtn" onclick="searchmasterinfo()">検索</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_condition" style="height: 78px;">
                        <table>
                            <tbody>
                                <tr>
                                    <td style="width: 120px;font-weight: bold;">&nbsp;&nbsp;商品分類：</td>
                                    <td id="producttype">  </td>
                                    <td  style="width: 100px;font-weight: bold;">&nbsp;&nbsp;仕入先：</td>
                                    <td >
                                        <select style="width: 130px;height:30px;border-style: solid;" id="opt_purchase">
                                            <option value=""></option> 
                                            <option value="01">01.恩氏製衣</option>
                                            <option value="02">02.両匹狼</option>
                                            <option value="03">03.星峰製衣</option>
                                            <option value="99">99.その他</option>
                                            
                                        </select>
                                    </td>
                                </tr> 
                            </tbody>
                        </table>
                        <table>
                            <tbody>
                                <tr>
                                    <td style="width: 120px;font-weight: bold;">&nbsp;&nbsp;商品番号：</td>
                                    <td style="width: 150px;">
                                        <select style="width: 130px;height:30px;border-style: solid;" id="productno">
                                            <option value=""></option>
                                            <option value="マスタ未登録">マスタ未登録</option>
                                        </select>
                                    </td>
                                    <td style="width: 120px;font-weight: bold;">キーワード：</td>
                                    <td style="width: 220px;">
                                        <input type="text" style="width: 200px;height: 30px;" id="keyword"></input>
                                    </td>
                                    <td style="width: 120px;font-weight: bold;">表示条件：</td>
                                    <td style="width: 250px;">
                                        <input type="checkbox" id="notenough" value="1">
                                        入力不足項目のみ
                                    </td>
                                    <td style="width: 250px;">
                                        <input type="checkbox" id="conceal" value="1">
                                        削除データも表示
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_detail_header" style="overflow: hidden;display: none;">
                        <table class="table_detail_header" id="stocktablehead"
                            style="width: 2324px;table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 70px;">操作</th>
                                    <th style="width: 70px;">STR</th>
                                    <th style="width: 140px;">商品種別</th>
                                    <th style="width: 80px;">商品<br>管理番号</th>
                                    <th style="width: 70px;">親子区分</th>
                                    <th style="width: 160px;">分類①</th>
                                    <th style="width: 160px;">分類②</th>
                                    <th style="width: 140px;" class="display2">ASIN番号</th>
                                    <th style="width: 140px;" class="display2">SKU番号</th>
                                    <th style="width: 140px;" class="display2">LABEL番号</th>
                                    <th style="width: 80px;">仕入価格</th>
                                    <th style="width: 120px;">仕入先</th>
                                    <th style="width: 160px;">FBM発送方式</th>
                                    <th style="width: 817px;">商品名称</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="c_detail_content" style="overflow: auto;display: none;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" style="width: 2307px;table-layout: fixed;" id="stocktable">
                          
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