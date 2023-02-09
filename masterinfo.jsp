<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>SmartInfo 2.0</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <script>
                function scrollHead(obj) {
                    var p = $(obj).get(0).scrollLeft;
                    $(".c_detail_header").get(0).scrollLeft = p;
                }
                function init() {
                    Efw('masterinfo_init');
                }

                // 颜色
                // function changeColor() {

                //     var oyflg = false;
                //     var oldproductno = "";

                //     $("#stocktable").find("tr").each(function () {

                //         var tdArr = $(this).children();

                //         // 商品管理番号
                //         var newproductno = tdArr.eq(2).html();
                //         // 商品種別
                //         var productkinds = tdArr.eq(3).html();

                //         var flg = false;
                //         if (newproductno != oldproductno) {
                //             flg = true;
                //         }
                //         // 商品管理番号変わる
                //         if (flg) {
                //             oyflg = false;
                //         }

                //         if (productkinds == "親商品") {
                //             // 行の色を変更
                //             $(this).css({ "background": "rgb(153,217,234)" });
                //             oyflg = true;
                //         }

                //         if (productkinds == "子商品") {
                //             // チェックボックス列の色を変更
                //             if (oyflg) {
                //                 tdArr.eq(0).css({ "background": "rgb(153,217,234)" });
                //             } else {
                //                 // 行の色を変更
                //                 $(this).css({ "background": "rgb(159,252,253)" });
                //             }
                //         }
                //         oldproductno = newproductno;
                //     });
                // }


                // 检索
                function searchmasterinfo() {
                    var productdivArr = new Array();
                    $('#producttype input:checkbox:checked').each(function (index, item) {
                        productdivArr.push($(this).val());
                    });

                    var displayflg2 = "0";
                    $('#displayitem input:checkbox:checked').each(function (index, item) {

                        if ($(this).val() == 'ASIN、SKU、LABEL') {
                            displayflg2 = "1";
                        }
                    });
                    Efw('masterinfo_search', { 'producttype': productdivArr, 'displayflg2': displayflg2 });
                }


                function showitem(obj) {
                    var flg2 = false;
                    $('#displayitem input:checkbox:checked').each(function (index, item) {

                        if ($(this).val() == 'ASIN、SKU、LABEL') {
                            $(".display2").show();
                            flg2 = true;
                            $("#stocktablehead").width($("#stocktablehead").width());
                            $("#stocktable").width($("#stocktable").width());
                        }
                    });
                    if (flg2 == false) {
                        $(".display2").hide();
                    }

                }
                // 新规
                function newdialog() {
                    $("#opt").val("new");
                    var opt = $("#opt").val();
                    $('#asin').html("-");
                    $('#sku').html("-");
                    $('#label').html("-");

                    // $('#newproducttype2').attr("data-name","nicai");
                    // console.log($('#newproducttype2').attr("data-name"));
                    $('#newproducttype2').data('aaa','111');
                    console.log($('#newproducttype2').data('aaa'));

                    $("#newproducttype option:first").prop("selected", 'selected');
                    $('#newproducttype2').val("");

                    $("#newproductno option:first").prop("selected", 'selected');
                    $('#newproductno2').val("");

                    $("#pre option:first").prop("selected", 'selected');
                    $("#fba option:first").prop("selected", 'selected');
                    $('#sub1').val("");
                    $('#sub2').val("");
                    $('#price1').val("");
                    $('#price2').val("");
                    $('#price3').val("");
                    $('#productname').val("");
                


                    masterinfo_inputdialog.dialog('open');
                }
                // 更新
                function updatedialog(btn) {
                    var flg=$(btn).next().val();
                    console.log(flg);
                    $("#opt").val("update");
                    if (flg == '1') {//更新时，当暂定为1时
                        console.log(1);
                      
                        
                       var type= $(btn).parent().next().children().html();
                        console.log(type);
                        var no=$(btn).parent().next().next().html();
                        console.log(no);
                        var preproduct=$(btn).parent().next().next().next().html();
                        console.log(preproduct);
                        var sub1=$(btn).parent().next().next().next().next().children().html();
                        console.log(sub1);
                        var sub2=$(btn).parent().next().next().next().next().next().children().html();
                        console.log(sub2);
                        
                        Efw('masterinfo_update', {'flg':'1', 'oldasin':"",'oldsku': "",'type': type,'no': no,'preproduct': preproduct,'sub1': sub1,'sub2': sub2});
                    }else if (flg == '0') {//更新时，当暂定为0时
                        console.log(0)
                       

                        // $('#label span:last-child').html(label);
                        var oldasin=$(btn).parent().next().next().next().next().next().next().html().toString();
                        console.log(oldasin);
                        var oldsku=$(btn).parent().next().next().next().next().next().next().next().html().toString();
                        console.log(oldsku);
                        Efw('masterinfo_update', {'flg':'0', 'oldasin': oldasin,'oldsku': oldsku,'type': "",'no':"",'preproduct': "",'sub1': "",'sub2': ""});

                    }
      

                    masterinfo_inputdialog.dialog('open');
                }


                function save() {
                    var oldasins=('#asin').data('oldadins');
                    var oldskus=('#sku').data('oldskus');
                    var oldtype=('#newproducttype2').data('oldtype');
                    var oldno=('#newproductno2').data('oldno');
                    var oldpreproduct=('#preproduct').data('oldpreproduct');
                    var oldsub1=('#sub1').data('oldsub1');
                    var oldsub2=('#sub2').data('oldsub2');
                  
                        Efw('masterinfo_save',{'oldasins':oldasins, 'oldskus': oldskus,'oldtype': oldtype,'oldno':oldno,'oldpreproduct': oldpreproduct,'oldsub1': oldsub1,'oldsub2': oldsub2});
               


                }

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
                                    <td style="width: 200px;"><button id="insert" onclick="newdialog()">新规</button>
                                    </td>
                                    <td style="width: 200px;"><button id="searchbtn"
                                            onclick="searchmasterinfo()">検索</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_condition" style="height: 70px;">
                        <table>
                            <tbody>
                                <tr>
                                    <td style="width: 120px;font-weight: bold;">&nbsp;&nbsp;商品分類：</td>
                                    <td id="producttype">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <table>
                            <tbody>
                                <tr>
                                    <td style="width: 120px;font-weight: bold;">&nbsp;&nbsp;商品番号：</td>
                                    <td style="width: 140px;">
                                        <select style="width: 100px;height:30px;border-style: solid;" id="productno">
                                            <option value=""></option>
                                            <option value="マスタ未登録">マスタ未登録</option>
                                        </select>
                                    </td>
                                    <td style="width: 120px;font-weight: bold;">キーワード：</td>
                                    <td style="width: 190px;">
                                        <input type="text" style="width: 150px;height: 30px;" id="keyword"></input>
                                    </td>
                                    <td style="width: 120px;font-weight: bold;">表示項目：</td>
                                    <td style="width: 250px;" id="displayitem">
                                        <input type="checkbox" onclick="showitem(this);" value="ASIN、SKU、LABEL" checked>
                                        ASIN、SKU、LABEL
                                    </td>

                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="c_detail_header" style="overflow: hidden;display: none;">
                        <table class="table_detail_header" id="stocktablehead"
                            style="width: 2164px;table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 70px;">操作</th>
                                    <th style="width: 140px;">商品種別</th>
                                    <th style="width: 80px;">商品<br>管理番号</th>
                                    <th style="width: 70px;">親子区分</th>
                                    <th style="width: 160px;">分類①</th>
                                    <th style="width: 160px;">分類②</th>
                                    <th style="width: 150px;" class="display2">ASIN番号</th>
                                    <th style="width: 150px;" class="display2">SKU番号</th>
                                    <th style="width: 150px;" class="display2">LABEL番号</th>
                                    <th style="width: 80px;">仕入価格</th>
                                    <th style="width: 160px;">FBA発送方式</th>
                                    <th style="width: 817px;">商品名称</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="c_detail_content" style="overflow: auto;display: none;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" style="width: 2147px;table-layout: fixed;" id="stocktable">

                            <tr>
                                <td style="width: 70px;" class="c"><button class="btn" id="update"
                                        onclick="masterinfo_inputdialog.dialog('open');" value="">更新</button><input type="hidden" id="flg" value=""></input></td>
                                <td style="width: 140px;" class="l"><span class="l5">01:レインコート</span></td>
                                <td style="width: 80px;" class="c">W001</td>
                                <td style="width: 70px;" class="c">親商品</td>
                                <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>
                                <td style="width: 150px;" class="c">B089WGVH9V</td>
                                <td style="width: 150px;" class="c">H2-E3RM-NID1</td>
                                <td style="width: 150px;" class="c">X000UXRHRV</td>
                                <td style="width: 80px;" class="r"><span class="r5">999.00</span></td>
                                <td style="width: 160px;" class="l"><span class="l5">A:クリックポスト</span></td>
                                <td style="width: 800px;" class="l"><span>【Smart-Bear】P002 キッズ服 Tシ </span></td>
                            </tr>


                        </table>
                    </div>

                </div>
            </div>
        </body>

        </html>