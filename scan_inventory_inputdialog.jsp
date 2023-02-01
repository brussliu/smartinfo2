<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="scan_inventory_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var scan_inventory_inputdialog = null;
            $(function () {
                scan_inventory_inputdialog = $("#scan_inventory_inputdialog").dialog({
                    title: "棚卸",
                    autoOpen: false,
                    resizable: true,
                    height: 790,
                    width: 1154,
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
            select{
                width: 150px;
                height: 30px;
            }
            .c{
                text-align: center;
            }
        </style>

        <div style="margin: 10px;">

            <table class="table_btn" style="height: 40px;width: 1068px; ">
                <tbody>
                    <tr>
                        <td style="width: 130px;">【棚卸対象】</td>
                        <td style="width: 200px;"></td>
                        <td style="width: 80px; "></td>
                        <td style="width: 220px;"></td>
                        <td style="width: 80px; "></td>
                        <td style="width: 100px;"></td>
                        <td ></td>
                    </tr>
                    <tr>
                        <td>商品管理番号：</td>
                        <td>
                            <select>
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
                            <button style="width: 100px;">確定</button>
                        </td>
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

                            <th style="width: 80px;">数量</th>

                        </tr>
                    </thead>
                </table>

            </div>
            <div style="overflow-x: hidden;height: 150px; overflow-y: auto; ">
                <table class=" table_detail_content" style="width: 1068px;table-layout: fixed;text-align: center;">
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
           
            <hr style="border: 1px dashed black;margin-top: 30px;margin-bottom: 30px;"></hr>
            <table class="table_btn" style="height: 40px;width: 1068px; ">
                <tbody>
                    <tr>
                        <td style="width: 130px;">【棚卸結果】</td>
                        <td style="width: 250px;"></td>
                        <td style="width: 110px; "></td>
                        <td style="width: 200px;"></td>
                        <td style="width: 110px; "></td>
                        <td style="width: 100px;"></td>
                        <td ></td>
                    </tr>
                    <tr>
                        <td>リストNO：</td>
                        <td>
                            <select style="width:220px;">
                                <option value="">20221/11/11/11/11/11</option>
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
                <table class="table_detail_header" style="width: 1068px;table-layout: fixed;text-align: center;">
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
            <div style="overflow-x: hidden;height: 150px; overflow-y: auto; ">
                <table class=" table_detail_content" style="width: 1068px;table-layout: fixed;text-align: center;">
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
            <table class="table_inputdialog_btn" border="0" style="width: 1068px;">
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