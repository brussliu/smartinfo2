<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="delivery_box_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var delivery_box_inputdialog = null;
            $(function () {
                delivery_box_inputdialog = $("#delivery_box_inputdialog").dialog({
                    title: "箱詰め",
                    autoOpen: false,
                    resizable: true,
                    height: 560,
                    width: 1400,
                    modal: true,
                    open: function () {
                        setTimeout(function () { });
                    },
                    close: function () {
                        setTimeout(function () { });
                    },
                });
            });
        </script>
        <style>

        </style>

        <div style="margin: 10px;">
            <table class="table_btn" style="height: 40px; ">
                <tbody>
                    <tr>
                        <td style="width: 100px;text-align: left;">スキャン欄</td>
                        <td style="width: 200px;"><input type="text" style="width: 160px;height: 30px;"></input></td>
                        <td style="width: 150px; "><input type="radio"> 増加操作（+）</input></td>
                        <td style="width: 150px;"><input type="radio"> 増加操作（-）</input></td>
                        <td></td>
                        <td></td>
                        <td><button>箱增加</button></td>
                    
                    </tr>
                </tbody>
            </table>
            <div class=" " style="overflow: hidden;">
                <table class="table_detail_header " style=" width: 1313px;table-layout: fixed;text-align: center;">
                    <thead>
                        <tr class="header">
                            <th style="width: 140px;">商品管理番号</th>
                            <th style="width: 140px;">分類①</th>
                            <th style="width: 140px;">分類②</th>

                            <th style="width: 140px;">ASIN番号</th>
                            <th style="width: 140px;">SKU番号</th>
                            <th style="width: 140px;">LABEL番号</th>

                            <th style="width: 140px;">予定数量</th>
                            <th style="width: 140px;">実際数量</th>
                            <th style="width: 150px;">◎箱（No.1）</th>
                        </tr>
                    </thead>
                </table>

            </div>
            <div   style="overflow: auto;width: 1313px;height: 300px; " onscroll="scrollHead(this);">
                <table class=" table_detail_content" style="width: 1313px;table-layout: fixed;text-align: center;">
                    <tbody>
                        <tr>

                            <td style="width: 140px;">P002</td>
                            <td style="width: 140px;">XXXXXXX</td>
                            <td style="width: 140px;">XXXXXXX</td>
                            <td style="width: 140px;">XXXXXXX</td>
                            <td style="width: 140px;">XXXXXXX</td>
                            <td style="width: 140px;">XXXXXXX</td>
                            <td style="width: 140px;">XXXXXXX</td>
                            <td style="width: 140px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                        <tr>
                            <td>P002</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                            <td>XXXXXXX</td>
                        </tr>
                    </tbody>
                </table>
         
            </div>
            <table class="table_inputdialog_btn" border="0">
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td style="width: 200px;"><button class="btn">確定</button></td>
                        <td style="width: 200px;"><button class="btn" onclick="cel()">キャンセル</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>