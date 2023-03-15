<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="delivery_box_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var delivery_box_inputdialog = null;
            $(function () {
                delivery_box_inputdialog = $("#delivery_box_inputdialog").dialog({
                    title: "箱詰め",
                    autoOpen: false,
                    resizable: true,
                    height: 730,
                    width: 1137,
                    modal: true,
                    open: function () {
                        setTimeout(function () { });
                    },
                    close: function () {
                        setTimeout(function () { });
                    },
                });
             


            });
            function scrollHead2(obj) {
                var p = $(obj).get(0).scrollLeft;
                $("#boxheaddiv").get(0).scrollLeft = p;
            }
            // 增加列
            function addbox() {

                var addboxcount = parseInt($("#maxboxcount").val()) + 1;
                var title_td = $("<TH><input type='radio' name='boxno' value='" + addboxcount + "' onclick='' checked><br>箱（No." + addboxcount + "）</TH>");
                var data_td = $("<td></td>");
                var headwidth = $("#boxinfohead").width();
                $("#boxinfohead").width(headwidth + 82);
                var bodywidth = $("#boxinfobody").width();
                $("#boxinfobody").width(bodywidth + 82);
                $("#boxinfohead tr").append(title_td);
                $("#boxinfobody tr").append(data_td);
                $("#maxboxcount").val(addboxcount);
            }

            // エラー時の声
            function errorMsg() {
                $("#scanInput").val("");
                // ダメの音声
                var audioElement = document.createElement('audio');
                audioElement.setAttribute('src', 'damei.mp3');
                audioElement.setAttribute('autoplay', 'autoplay');

            }

            // ラベル欄入力
            function inputLabel(obj) {

                if ($(obj).val().length == 10 && $(obj).val().startsWith("X00")) {

                    // 商品情報取得
                    Efw('delivery_searchProductInfoByLabel', { "labelno": $(obj).val() });

                } else {

                    return;
                }

            }

            // 更新数量
            function displayToTable(pno, sub1, sub2,  asin ,sku,label) {

                var colq = 0;

                var overflg = false;

                // 増加：1、削減：-1
                var opttype = parseInt($("input[name='opttype']:checked").val());

                // 全部行をループする
                $("#boxinfobody").find("tr").each(function () {

                    var tdArr = $(this).children();
                    // 列の数
                    colq = tdArr.length;

                    var td_asin = tdArr.eq(3).html();
                    var td_sku = tdArr.eq(4).html();

                    // 対象商品の行
                    if (sku == td_sku || asin == td_asin) {

                        // 操作対象列（箱No）
                        var boxCol = 7 + parseInt($("input[name='boxno']:checked").val());

                        // 対象箱の数量（操作前）
                        var td_q = tdArr.eq(boxCol).html().length <= 0 ? 0 : parseInt(tdArr.eq(boxCol).html());

                        // 操作成功フラグ
                        var successflg = true;

                        // 操作後の数<0の場合
                        if (td_q + opttype < 0) {

                            // 箱の数量を0に設定
                            tdArr.eq(boxCol).html(0);
                            // 操作失敗
                            successflg = false;

                        // 操作後の数>=0の場合
                        } else {
                            
                            // 操作する（操作後の数量を箱列に反映）
                            tdArr.eq(boxCol).html(td_q + opttype);
                        }

                        // 操作成功の場合、実際数量を設定する
                        // 変更後>=0の場合、変更後の値で設定
                        // 変更後<0の場合、0で設定
                        if (successflg == true) {
                            tdArr.eq(7).html((parseInt(tdArr.eq(7).html()) + opttype) > 0 ? (parseInt(tdArr.eq(7).html()) + opttype) : 0);
                        }


                        // 予定数量 < 実際数量
                        if (parseInt(tdArr.eq(6).html()) < parseInt(tdArr.eq(7).html())) {

                            // 予定数量 = 0の場合、超出種類とする
                            if (parseInt(tdArr.eq(6).html()) == 0) {

                                // 予定種類に超出する場合
                                // 増加操作の場合のみ、声が出る
                                if (opttype > 0) {
                                    var audioElement = document.createElement('audio');
                                    audioElement.setAttribute('src', 'chaochuzhonglei.mp3');
                                    audioElement.setAttribute('autoplay', 'autoplay');
                                }else{
                                    // 正常操作の場合、
                                    var audioElement = document.createElement('audio');
                                    audioElement.setAttribute('src', 'facai.mp3');
                                    audioElement.setAttribute('autoplay', 'autoplay');
                                }

                            // 予定数量 != 0の場合、数量超過とする
                            } else {

                                // 予定数量に超過する場合
                                // 増加操作の場合のみ、声が出る
                                if (opttype > 0) {
                                    var audioElement = document.createElement('audio');
                                    audioElement.setAttribute('src', 'shuliangchaoguo.mp3');
                                    audioElement.setAttribute('autoplay', 'autoplay');
                                }else{
                                    // 正常操作の場合、
                                    var audioElement = document.createElement('audio');
                                    audioElement.setAttribute('src', 'facai.mp3');
                                    audioElement.setAttribute('autoplay', 'autoplay');
                                }

                            }

                            // 行の色をピンク変更
                            $(this).css("background-color", "pink");

                            // 処理終了フラグ
                            overflg = true;

                            return;
                            
                        }else{

                            // 正常操作の場合、
                            var audioElement = document.createElement('audio');
                            audioElement.setAttribute('src', 'facai.mp3');
                            audioElement.setAttribute('autoplay', 'autoplay');

                            // 行の色を少し深くに変更
                            $(this).css("background-color", "cornsilk");

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

                // 未表示の商品を新規する
                // 箱数
                var boxq = colq - 8;
                // 操作対象箱
                var boxno = parseInt($("input[name='boxno']:checked").val());

                // 箱部分のHTML
                var boxhtml = "";
                for (var i = 1; i <= boxq; i++) {
                    if (i == boxno) {
                        boxhtml = boxhtml + "<TD>1</TD>";
                    } else {
                        boxhtml = boxhtml + "<TD></TD>";
                    }

                }

                var resultHTML =
                "<tr style='background-color:pink;'>" +
                    "<td style='width: 90px;'>" + pno + "</td>" +    // 商品管理番号
                    "<td style='width: 160px;'>" + sub1 + "</td>" +  // 分類①
                    "<td style='width: 160px;'>" + sub2 + "</td>" +  // 分類②
                    "<td style='width: 120px;'>" + asin + "</td>" +  // ASIN
                    "<td style='width: 150px;'>" + sku + "</td>" +   // SKU
                    "<td style='width: 120px;'>" + label + "</td>" + // LABEL
                    "<td style='width: 80px;'>0</td>" +              // 予定数量
                    "<td style='width: 80px;'>1</td>" +              // 実際数量
                    boxhtml +	                                     // 箱No.1
                "</tr>";
         

                $("#boxinfobody").append(resultHTML);

                var audioElement = document.createElement('audio');
                audioElement.setAttribute('src', 'chaochuzhonglei.mp3');
                audioElement.setAttribute('autoplay', 'autoplay');

                $("#scanInput").val("");

            }

            // 保存
            function savebox() {
                var no = $('#temp').data("temp");

                var skuArr = new Array();
                var asinArr = new Array();
                var qArr = new Array();

                $("#boxinfobody").find("tr").each(function () {

                    var tdArr = $(this).children();

                    var td_asin = tdArr.eq(3).html();
                    var td_sku = tdArr.eq(4).html();
                    var td_q = tdArr.eq(7).html();

                    if (parseInt(td_q) > 0) {
                        skuArr[skuArr.length] = td_sku;
                        asinArr[asinArr.length] = td_asin;
                        qArr[qArr.length] = td_q;
                    }

                });

                //alert(skuArr);alert(asinArr);alert(qArr);

                Efw('delivery_saveBox', { "skuArr": skuArr, "asinArr": asinArr, "qArr": qArr, "deliveryno": no });
            }

        </script>
        <style>
        </style>

        <div style="margin: 10px;">

            <table class="table_inputdialog" style="height: 40px;">
                <tbody>
                    <tr>
                        <td style="width: 100px;text-align: left;">スキャン欄</td>
                        <td style="width: 200px;">
                            <input type="text" autocomplete="off" id="scanInput" oninput="inputLabel(this);"
                                maxlength="10" onblur="this.focus();" style="width: 160px;ime-mode:disabled;"></input>
                        </td>
                        <td style="width: 150px;"><input type="radio" checked name="opttype" value="1"
                                style="vertical-align:middle; margin-top:-4px; "> 増加操作（+）</input></td>
                        <td style="width: 150px;"><input type="radio" name="opttype" value="-1" style="vertical-align:middle; margin-top:-4px; ">
                            削減操作（-）</input></td>
                        <td></td>
                        <td><input type="hidden" id="maxboxcount" value="1"> </input></td>
                        <td><button onclick="addbox()">箱增加</button></td>

                    </tr>
                </tbody>
            </table>
            <div style="overflow: hidden;" id="boxheaddiv">
                <table id="boxinfohead" class="table_detail_header"
                    style="width: 1068px;table-layout: fixed;text-align: center;">
                    <thead>
                        <tr class="header">
                            <th style="width: 90px;">商品管理番号</th>
                            <th style="width: 160px;">分類①</th>
                            <th style="width: 160px;">分類②</th>

                            <th style="width: 120px;">ASIN番号</th>
                            <th style="width: 150px;">SKU番号</th>
                            <th style="width: 120px;">LABEL番号</th>

                            <th style="width: 80px;">予定数量</th>
                            <th style="width: 80px;">実際数量</th>
                            <th style="width: 80px;"><input type="radio" name='boxno'value="1" checked></input><br>箱（No.1）</th>
                        </tr>
                    </thead>
                </table>

            </div>
            <div style=" height: 450px; overflow: auto;" onscroll="scrollHead2(this);">
                <table id="boxinfobody" class="table_detail_content"
                    style="width: 1068px;table-layout: fixed;text-align: center;">
                    <tbody>
                        <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 80px;">XXXXXXX</td>
                            <td style="width: 80px;">XXXXXXX</td>
                            <td style="width: 80px;">XXXXXXX</td>
                        </tr>

                    </tbody>
                </table>

            </div>
            <table class="table_inputdialog_btn" border="0">
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td style="width: 200px;"><button class="btn"onclick="savebox()" >確定</button></td>
                        <td style="width: 200px;"><button class="btn" onclick="cel()">キャンセル</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>