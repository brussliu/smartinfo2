<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="earnings_stock_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var earnings_stock_inputdialog = null;
            $(function () {
                earnings_stock_inputdialog = $("#earnings_stock_inputdialog").dialog({
                    title: "在庫計算",
                    autoOpen: false,
                    resizable: true,
                    height: 480,
                    width: 860,
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
            <p style="text-align: left;color:red;"><span>合計金額：</span><span>99999999円</span></p>
            <div style="overflow: hidden;">
                <table class="table_detail_header " style=" width: 783px; table-layout: fixed;text-align: center;">
                    <thead>
                        <tr class="header">
                            <th style="width: 250px;">商品種別</th>
                            <th style="width: 120px;">数量</th>
                            <th style="width: 200px;">純利益</th>
                            <th style="width: 200px;">合計</th>

                        </tr>
                    </thead>
                </table>

            </div>
            <div style="overflow-x: hidden;height: 300px; overflow-y: auto;">
                <table class=" table_detail_content" style="width: 783px; table-layout: fixed;text-align: center;">
                    <tbody>
                        <tr>
                            <td style="width: 250px;">01:レインコート</td>
                            <td style="width: 120px;">99999999</td>
                            <td style="width: 200px;">999999.99</td>
                            <td style="width: 200px;">999999.99</td>
                        </tr>
                        <tr>
                            <td style="width: 250px;">01:レインコート</td>
                            <td style="width: 120px;">99999999</td>
                            <td style="width: 200px;">999999.99</td>
                            <td style="width: 200px;">999999.99</td>
                        </tr>
                        <tr>
                            <td style="width: 250px;">01:レインコート</td>
                            <td style="width: 120px;">99999999</td>
                            <td style="width: 200px;">999999.99</td>
                            <td style="width: 200px;">999999.99</td>
                        </tr>
                        <tr>
                            <td style="width: 250px;">01:レインコート</td>
                            <td style="width: 120px;">99999999</td>
                            <td style="width: 200px;">999999.99</td>
                            <td style="width: 200px;">999999.99</td>
                        </tr>
                        <tr>
                            <td style="width: 250px;">01:レインコート</td>
                            <td style="width: 120px;">99999999</td>
                            <td style="width: 200px;">999999.99</td>
                            <td style="width: 200px;">999999.99</td>
                        </tr>
                        <tr>
                            <td style="width: 250px;">01:レインコート</td>
                            <td style="width: 120px;">99999999</td>
                            <td style="width: 200px;">999999.99</td>
                            <td style="width: 200px;">999999.99</td>
                        </tr>
                        <tr>
                            <td style="width: 250px;">01:レインコート</td>
                            <td style="width: 120px;">99999999</td>
                            <td style="width: 200px;">999999.99</td>
                            <td style="width: 200px;">999999.99</td>
                        </tr>
                        <tr>
                            <td style="width: 250px;">01:レインコート</td>
                            <td style="width: 120px;">99999999</td>
                            <td style="width: 200px;">999999.99</td>
                            <td style="width: 200px;">999999.99</td>
                        </tr>
                        <tr>
                            <td style="width: 250px;">01:レインコート</td>
                            <td style="width: 120px;">99999999</td>
                            <td style="width: 200px;">999999.99</td>
                            <td style="width: 200px;">999999.99</td>
                        </tr>
                        <tr>
                            <td style="width: 250px;">01:レインコート</td>
                            <td style="width: 120px;">99999999</td>
                            <td style="width: 200px;">999999.99</td>
                            <td style="width: 200px;">999999.99</td>
                        </tr>
                        <tr>
                            <td style="width: 250px;">01:レインコート</td>
                            <td style="width: 120px;">99999999</td>
                            <td style="width: 200px;">999999.99</td>
                            <td style="width: 200px;">999999.99</td>
                        </tr>
                        <tr>
                            <td style="width: 250px;">01:レインコート</td>
                            <td style="width: 120px;">99999999</td>
                            <td style="width: 200px;">999999.99</td>
                            <td style="width: 200px;">999999.99</td>
                        </tr>
                        <tr>
                            <td style="width: 250px;">01:レインコート</td>
                            <td style="width: 120px;">99999999</td>
                            <td style="width: 200px;">999999.99</td>
                            <td style="width: 200px;">999999.99</td>
                        </tr>
                        <tr>
                            <td style="width: 250px;">01:レインコート</td>
                            <td style="width: 120px;">99999999</td>
                            <td style="width: 200px;">999999.99</td>
                            <td style="width: 200px;">999999.99</td>
                        </tr>
                        <tr>
                            <td style="width: 250px;">01:レインコート</td>
                            <td style="width: 120px;">99999999</td>
                            <td style="width: 200px;">999999.99</td>
                            <td style="width: 200px;">999999.99</td>
                        </tr>
                        <tr>
                            <td style="width: 250px;">01:レインコート</td>
                            <td style="width: 120px;">99999999</td>
                            <td style="width: 200px;">999999.99</td>
                            <td style="width: 200px;">999999.99</td>
                        </tr>                                                                        
                    </tbody>    
                </table>
            </div>
        </div>
    </div>