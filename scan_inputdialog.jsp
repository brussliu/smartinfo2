<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="scan_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var scan_inputdialog = null;
            $(function () {
                scan_inputdialog = $("#scan_inputdialog").dialog({
                    title: "スキャンリスト詳細情報",
                    autoOpen: false,
                    resizable: true,
                    height: 790,
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
          
            <table class="table_inputdialog" style="height: 40px;" border="0">
                <tbody>
                    <tr>
                        <td style="width: 120px;">リストNO：</td>
                        <td style="width: 240px;">YYYYMMDD-HHMMSS</td>
                        <td style="width: 80px; ">名称：</td>
                        <td style="width: 240px;"><input type="text"></input></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td >スキャン：</td>
                        <td ><input type="text" ></input></td>
                        <td colspan="2">
                            <input type="radio" name="add" style="vertical-align:middle; margin-top:-4px; "> 増加操作（+）</input>
                            <input type="radio" name="add" style="vertical-align:middle; margin-top:-4px; "> 増加操作（-）</input>
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <div style="overflow: hidden;">
                <table class="table_detail_header" style="table-layout: fixed;text-align: center;" border="1">
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
            <div style="overflow-x: hidden;height: 480px; overflow-y: auto;width: 919px;">
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
                         
                        </tr>      <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>
                         
                        </tr>      <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>
                         
                        </tr>      <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>
                         
                        </tr>      <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>
                         
                        </tr>      <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>
                         
                        </tr>      <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>
                         
                        </tr>      <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>
                         
                        </tr>      <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>
                         
                        </tr>      <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>
                         
                        </tr>      <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>
                         
                        </tr>      <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>
                         
                        </tr>      <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>
                         
                        </tr>      <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>
                         
                        </tr>      <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>
                         
                        </tr>      <tr>
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
                        <td style="width: 200px;"><button class="btn">保存</button></td>
                        <td style="width: 200px;"><button class="btn" onclick="cel()">キャンセル</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>