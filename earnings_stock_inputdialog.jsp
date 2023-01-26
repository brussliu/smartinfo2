<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="earnings_stock_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var earnings_stock_inputdialog = null;
            $(function () {
                earnings_stock_inputdialog = $("#earnings_stock_inputdialog").dialog({
                    title: "在庫計算",
                    autoOpen: false,
                    resizable: true,
                    height: 560,
                    width: 1000,
                    modal: true,
                    open: function () {
                        setTimeout(function () { });
                    },
                    close: function () {
                        setTimeout(function () { });
                    },
                });
            });

            function scrollHead(obj) {

                var p = $(obj).get(0).scrollLeft;
                $(".c_detail_header").get(0).scrollLeft = p;

            }
        </script>

        <style>

        </style>

        <div style="width: 96%;height: 96%;margin: 10px;">

            <div class=" " style="overflow-x: hidden; width: 929px;">
                <table class="table_detail_header " style=" width: 929px; table-layout: fixed;text-align: center;">
                    <thead>
                        <tr class="header">
                            <th style="width: 230px;">商品種別</th>
                            <th style="width: 230px;">数量</th>
                            <th style="width: 230px;">純利益</th>
                            <th style="width: 228px;">合計</th>

                        </tr>
                    </thead>
                </table>

            </div>
            <div style="overflow-y: auto;width: 912px;height: 380px; " onscroll="scrollHead(this);">
                <table class=" table_detail_content" style="width: 912px; table-layout: fixed;text-align: center;">
                    <tbody>
                        <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr> <tr>
                            <td style="width: 230px;">P002</td>
                            <td style="width: 230px;">99999999</td>
                            <td style="width: 230px;">999999.99</td>
                            <td style="width: 211px;">999999.99</td>
                        </tr>
                        
                    </tbody>    
                </table>
            </div>
            <p style="text-align: right;margin-top: 10px;"><span>合計金額：</span><span>XXXXXX円</span></p>
        </div>
    </div>