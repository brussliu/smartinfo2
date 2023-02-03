<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="sending_list_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var sending_list_inputdialog = null;
            $(function () {
                sending_list_inputdialog = $("#sending_list_inputdialog").dialog({
                    title: "発送商品集計",
                    autoOpen: false,
                    resizable: true,
                    height: 660,
                    width: 972,
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
         
            <div style="overflow: hidden;">
                <table class="table_detail_header" style="table-layout: fixed;text-align: center;">
                    <thead>
                        <tr class="header">
                            <th style="width: 90px;">商品管理番号</th>
                            <th style="width: 160px;">分類①</th>
                            <th style="width: 160px;">分類②</th>

                            <th style="width: 120px;">ASIN番号</th>
                            <th style="width: 150px;">SKU番号</th>
                            <th style="width: 120px;">LABEL番号</th>

                            <th style="width: 80px;">数量</th>
                           
                        </tr>
                    </thead>
                </table>

            </div>
            <div style="overflow-x: hidden;height: 512px; overflow-y: auto;">
                <table class=" table_detail_content" style="table-layout: fixed;text-align: center;">
                    <tbody>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td style="width: 90px;" class="c">P002</td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>
                            <td style="width: 160px;" class="l"><span class="l5">XXXXXXX</span></td>

                            <td style="width: 120px;" class="c">XXXXXXX</td>
                            <td style="width: 150px;" class="c">XXXXXXX</td>
                            <td style="width: 120px;" class="c">XXXXXXX</td>

                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                            <td colspan="6" style="width: 815px;" class="l"><span class="l5">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</span></td>
                            <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                        </tr>
                        <tr>
                           <td colspan="6" style="width: 815px;" class="l"><span class="l5">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</span></td>
                           <td style="width: 80px;" class="r"><span class="r5">9999</span></td>
                       </tr>
                    </tbody>
                </table>

            </div>

        </div>
    </div>