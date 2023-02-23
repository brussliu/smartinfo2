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
                // sl:时间格式化
                Date.prototype.Format = function (fmt) {
                    var o = {
                        "M+": this.getMonth() + 1, //月份   
                        "d+": this.getDate(), //日   
                        "H+": this.getHours(), //小时   
                        "m+": this.getMinutes(), //分   
                        "s+": this.getSeconds(), //秒   
                        "q+": Math.floor((this.getMonth() + 3) / 3), //季度   
                        "S": this.getMilliseconds() //毫秒   
                    };
                    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
                    for (var k in o)
                        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
                    return fmt;
                }
                // new初始化
                function newdialog() {
                    $('#td_no').html("-");
                    $('#text_purchase').val("");
                    $('#opt_ship').get(0).selectedIndex = 0;
                    $('#date_entrydate').val("");
                    $('#date_forwarddate1').val("");
                    $('#date_forwarddate2').val("");
                    $('#date_completiondate').val("");
                    $('#number_productamountRMB').val("");
                    $('#opt_monetaryunit1').get(0).selectedIndex = 0;
                    $('#number_productamountRY').html("");
                    $('#number_shipamountRMB').val("");
                    $('#opt_monetaryunit2').get(0).selectedIndex = 0;
                    $('#number_shipamountRY').html("");
                    $('#number_faxamountRMB').val("");
                    $('#opt_monetaryunit3').get(0).selectedIndex = 0;
                    $('#number_faxamountRY').html("");
                    $('#number_rate').val("");
                    $('#text_totalRMB').val("");
                    $('#text_totalRY').val("");
                    $('#file_ProContent').val("");
                    $('#text_track').val("");
                    $('#file_acces').val("");
                    $('#text_filename').val("");
                }
                // 打开dialog
                function opendialog(val) {
                    if (val == 'new') {
                        newdialog();

                    }
                    else {

                    }
                    purchase_detail_inputdialog.dialog('open');
                }
                // button初始化
                function choice(val) {
                    // ステータス
                    var v = $(val).parent().next().next().next().next().next().next().next().html();
                    // 仕入NO
                    var tempno = $(val).parent().next().children().html();

                    $('#temp').data("temp", tempno);
                    // console.log(tempno);
                    // console.log($('#temp').data("temp"));
                    if (v == '0:新規登録') {
                        $('#btn_delete').attr('disabled', false);
                        $('#btn_send').attr('disabled', false);
                        $('#btn_collection').attr('disabled', false);
                    } else if (v == '2:钠品凳送') {
                        $('#btn_delete').attr('disabled', true);
                        $('#btn_send').attr('disabled', true);
                        $('#btn_collection').attr('disabled', false);
                    } else if (v == '4:受取済み') {
                        $('#btn_delete').attr('disabled', true);
                        $('#btn_send').attr('disabled', true);
                        $('#btn_collection').attr('disabled', true);
                    }
                }
                //关闭dialog
                function cel() {
                    purchase_detail_inputdialog.dialog('close');
                }

                // 汇率转换
                function cal() {
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
                        $("#number_productamountRY").html((productamountRMB / exchange).toFixed(2) + " 円");
                    }
                    // 货币单位为JPY时
                    if (monetaryunit1 == "JPY" && exchange != null && exchange != "" && productamountRMB != null && productamountRMB != "") {
                        $("#number_productamountRY").html((productamountRMB * exchange).toFixed(2) + " 元");
                    }

                    //物流費用
                    var shipamountRMB = $("#number_shipamountRMB").val();
                    if (shipamountRMB == null || shipamountRMB == "") {
                        $("#number_shipamountRY").html("");
                    }
                    //物流費用货币单位
                    var monetaryunit2 = $("#opt_monetaryunit2").val();
                    if (monetaryunit2 == "CNY" && exchange != null && exchange != "" && shipamountRMB != null && shipamountRMB != "") {

                        $("#number_shipamountRY").html((shipamountRMB / exchange).toFixed(2) + " 円");
                    }
                    if (monetaryunit2 == "JPY" && exchange != null && exchange != "" && shipamountRMB != null && shipamountRMB != "") {

                        $("#number_shipamountRY").html((shipamountRMB * exchange).toFixed(2) + " 元");
                    }

                    //税金
                    var faxamountRMB = $("#number_faxamountRMB").val();
                    if (faxamountRMB == null || faxamountRMB == "") {
                        $("#number_faxamountRY").html("");
                    }
                    //税金货币单位
                    var monetaryunit3 = $("#opt_monetaryunit3").val();
                    if (monetaryunit3 == "CNY" && exchange != null && exchange != "" && faxamountRMB != null && faxamountRMB != "") {

                        $("#number_faxamountRY").html((faxamountRMB / exchange).toFixed(2) + " 円");
                    }
                    if (monetaryunit3 == "JPY" && exchange != null && exchange != "" && faxamountRMB != null && faxamountRMB != "") {

                        $("#number_faxamountRY").html((faxamountRMB * exchange).toFixed(2) + " 元");
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
                    $("#text_totalRMB").val(rmbmoney);
                    $("#text_totalRY").val(jpymoney.toFixed(3));
                }
                // 判断转换的值是否为空
                function isNULL(val) {
                    if (val == null || val == '') {
                        return 0;
                    } else {

                        return Number(val.slice(0, -1));
                    }

                }

                // 削除
                function deletepurchase() {
                    var no = $('#temp').data("temp");
                    Efw('purchase_delete', { 'no': no });
                }

                // sl:保存
                function save() {
                    // 仕入NO
                    var no = new Date().Format("yyyyMMdd-HHmmss"); 
                    console.log(no);
                    Efw('purchase_save');
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
                                <td style="text-align: right;padding-right: 20px;">
                                    店舗ID：<span id="shopid">未选择</span>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    UserID：<span id="userid">XXXX</span>
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

                                    <td style="width: 120px;"><button id="btn_new"
                                            onclick="opendialog('new')">新規</button></td>
                                    <td style="width: 120px;"><button id="btn_content"
                                            onclick="purchase_content_inputdialog.dialog('open');">仕入内容</button></td>
                                    <td style="width: 120px;"><button id="btn_update"
                                            onclick="opendialog('update')">仕入更新</button></td>

                                    <td style="width: 120px;"><button id="btn_delete" onclick="deletepurchase()"
                                            disabled="disabled">仕入削除</button>
                                    </td>

                                    <td style="width: 120px;"><button id="btn_send" disabled="disabled">仕入発送</button>
                                    </td>
                                    <td style="width: 120px;"><button id="btn_collection"
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
                            <tbody>
                                <tr>
                                    <td style="width: 50px;" rowspan="2" class="c"><input type="radio"
                                            name="choice"></input></td>
                                    <td style="width: 155px" rowspan="2" class="l"><span class="l5 a"
                                            onclick="purchase_detail_inputdialog.dialog('open')">20230118-151418</span>
                                    </td>
                                    <td style="width: 200px;" rowspan="2" class="l"><span
                                            class="l5">20230112-レインコート</span></td>

                                    <td style="width: 200px;" rowspan="2" class="l"><span
                                            class="l5">XXXXXXXXXXXXXX</span></td>
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

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </body>

        </html>