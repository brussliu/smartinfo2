<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="earnings_purchase_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var earnings_purchase_inputdialog = null;
            $(function () {
                earnings_purchase_inputdialog = $("#earnings_purchase_inputdialog").dialog({
                    title: "仕入内容",
                    autoOpen: false,
                    resizable: true,
                    height: 700,
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
        </script>
        <style>
        </style>

        <div style="margin: 10px;">
            <table style="height: 40px; ">
                <tbody>
                    <tr>
                        <td style="width: 85px;text-align: left;">仕入NO：</td>
                        <td id="td_contno" style="width: 260px;" ></td>
                        <td style="width: 90px;text-align: left;">仕入名称：</td>
                        <td id="td_conname" style="width: 380px;"></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    
                    </tr>
                </tbody>
            </table>
            <div style="overflow: hidden;">
                <table class="table_detail_header" style="width: 1068px;table-layout: fixed;text-align: center;">
                    <thead>
                        <tr class="header">
                            <th style="width: 90px;">商品管理番号</th>
                            <th style="width: 160px;">分類①</th>
                            <th style="width: 160px;">分類②</th>

                            <th style="width: 120px;">ASIN番号</th>
                            <th style="width: 150px;">SKU番号</th>
                            <th style="width: 120px;">LABEL番号</th>

                            <th style="width: 80px;">FBA数量</th>
                            <th style="width: 80px;">LOCAL数量</th>
                            <th style="width: 80px;">仕入数量</th>
                        </tr>
                    </thead>
                </table>

            </div>
            <div style="overflow-x: hidden;height: 500px; overflow-y: auto;">
                <table id="table_cot" class=" table_detail_content" style="width: 1068px;table-layout: fixed;text-align: center;">
                   
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
                
                </table>

            </div>

        </div>
    </div>