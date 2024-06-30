<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="delivery_content_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var delivery_content_inputdialog = null;
            $(function () {
                delivery_content_inputdialog = $("#delivery_content_inputdialog").dialog({
                    title: "納品内容",
                    autoOpen: false,
                    resizable: true,
                    height: 700,
                    width: 1350,
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
            <table style="height: 40px; ">
                <tbody>
                    <tr>
                        <td style="width: 85px;text-align: left;">納品NO：</td>
                        <td id="td_contno" style="width: 260px;"></td>
                        <td style="width: 90px;text-align: left;">納品名称：</td>
                        <td id="td_conname" style="width: 180px;"></td>
                        <td style="width: 185px;text-align: left;"></td>
                        <td style="width: 185px;text-align: left;"></td>
                        <td style="text-align: right;"><input type="checkbox" id="box_move" onchange="move()">&nbsp;&nbsp;移動必要な項目のみ</input></td>
                    
                    </tr>
                </tbody>
            </table>
            <div style="overflow: hidden;">
                <table class="table_detail_header" style="width: 1180px;table-layout: fixed;text-align: center;">
                    <thead>
                        <tr class="header2">
                            <th style="width: 90px;">商品管理<br>番号</th>
                            <th style="width: 160px;">分類①</th>
                            <th style="width: 160px;">分類②</th>

                            <th style="width: 120px;">ASIN番号</th>
                            <th style="width: 150px;">SKU番号</th>
                            <th style="width: 120px;">LABEL番号</th>

                            <th style="width: 80px;">FBA数量</th>
                            <th style="width: 80px;">LOCAL1<br>数量</th>
                            <th style="width: 80px;">LOCAL2<br>数量</th>
                            <th style="width: 80px;">納品数量</th>
                            <th style="width: 110px;">移動必要な数量<br>（2⇒1）</th>
                        </tr>
                    </thead>
                </table>

            </div>
            <div style="overflow-x: hidden;height: 500px; overflow-y: auto;">
                <table  id="table_cot" class="table_detail_content2" style="width: 1180px;table-layout: fixed;text-align: center;">
                    
                     
                </table>

            </div>

        </div>
    </div>