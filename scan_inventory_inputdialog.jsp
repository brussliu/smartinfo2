<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="scan_inventory_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var scan_inventory_inputdialog = null;
            $(function () {
                scan_inventory_inputdialog = $("#scan_inventory_inputdialog").dialog({
                    title: "棚卸",
                    autoOpen: false,
                    resizable: true,
                    height: 800,
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

            <table class="table_inputdialog" style="height: 40px; " border="0">
                <tbody>
                    <tr>
                        <td style="width: 140px;">【棚卸対象】</td>
                        <td style="width: 120px;"></td>
                        <td style="width: 80px; "></td>
                        <td style="width: 220px;"></td>
                        <td style="width: 80px; "></td>
                        <td style="width: 220px;"></td>
                        <td ></td>
                    </tr>
                    <tr>
                        <td>商品管理番号：</td>
                        <td>
                            <select style="width: 100px;">
                                <option value=""></option>
                            </select>
                        </td>
                        <td class="c">分類①：</td>
                        <td>
                            <select style="width: 200px;">
                                <option value=""></option>
                            </select>
                        </td>
                        <td class="c">分類②：</td>
                        <td>
                            <select style="width: 200px;">
                                <option value=""></option>
                            </select>
                        </td>
                        <td>
                        </td>
                    </tr>
                </tbody>
            </table>
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
            <div style="overflow-x: hidden;height: 160px; overflow-y: auto; ">
                <table class=" table_detail_content" style="table-layout: fixed;text-align: center;">
                    <tbody>
                        <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>

                        </tr>
                        <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>

                        </tr>
                        <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>

                        </tr>
                        <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>

                        </tr>   <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>

                        </tr>   <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>

                        </tr>
                       
                        
                    </tbody>
                </table>

            </div>
           
            <hr style="border: 1px dashed black;margin-top: 20px;margin-bottom: 10px;"></hr>
            <table class="table_inputdialog" style="height: 40px;" border="0">
                <tbody>
                    <tr>
                        <td style="width: 120px;">【棚卸結果】</td>
                        <td style="width: 220px;"></td>
                        <td style="width: 120px; "></td>
                        <td style="width: 220px;"></td>
                        <td style="width: 120px; "></td>
                        <td style="width: 100px;"></td>
                        <td ></td>
                    </tr>
                    <tr>
                        <td>リストNO：</td>
                        <td>
                            <select style="width:200px;">
                                <option value="">20220101-121212</option>
                            </select>
                        </td>
                        <td>リスト名称：</td>
                        <td>XXXXXXXXXXXXXX</td>
                        <td>合計数量：</td>
                        <td>999999</td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
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
            <div style="overflow-x: hidden;height: 160px; overflow-y: auto; ">
                <table class=" table_detail_content" style="table-layout: fixed;text-align: center;">
                    <tbody>
                        <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>

                        </tr>
                        <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>

                        </tr>
                        <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>

                        </tr>
                        <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>

                        </tr>   <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>

                        </tr>   <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

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
                        <td style="width: 200px;"><button class="btn">在庫更新</button></td>
                        <td style="width: 200px;"><button class="btn" onclick="cel()">キャンセル</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>