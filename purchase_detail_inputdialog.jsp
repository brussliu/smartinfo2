<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="purchase_detail_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var purchase_detail_inputdialog = null;
            $(function () {
                purchase_detail_inputdialog = $("#purchase_detail_inputdialog").dialog({
                    title: "仕入詳細",
                    autoOpen: false,
                    resizable: true,
                    height: 700,
                    width: 1100,
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

            <table class="table_inputdialog" width="100%">
                <tbody>
                    <tr>
                        <td style="width: 150px;">仕入NO： </td>
                        <td style="width: 250px;">YYYYMMDD-HHMMSS </td>
                        <td style="width: 180px;"></td>
                        <td style="width: 220px;"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>仕入名称：</td>
                        <td style="width: 250px;"><input type="text" style="width: 200px;"></input></td>
                        <td style="width: 150px;">サプライヤー：</td>
                        <td>
                            <select style="width: 200px;">
                                <option value="">W001</option>
                            </select>
                        </td>
                        <td style="width: 200px;"><input type="text" style="width: 200px;"></input></td>

                    </tr>
                    <tr>
                        <td style="width: 100px;">登録日： </td>
                        <td><input type="text" style="width: 200px;"></input></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="width: 100px;">登録日： </td>
                        <td><input type="text" style="width: 200px;"></input></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="width: 100px;">発送日： </td>
                        <td><input type="text" style="width: 200px;"></input></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="width: 100px;">受取日： </td>
                        <td><input type="text" style="width: 200px;"></input></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="width: 100px;">完了日： </td>
                        <td><input type="text" style="width: 200px;"></input></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="width: 100px;">商品費用： </td>
                        <td><input type="text" style="width: 200px;"></input></td>
                        <td>商品費用（円）： </td>
                        <td><input type="text" style="width: 200px;"></input></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="width: 100px;">物流費用： </td>
                        <td><input type="text" style="width: 200px;"></input></td>
                        <td>物流費用（円）： </td>
                        <td><input type="text" style="width: 200px;"></input></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="width: 100px;">税金： </td>
                        <td><input type="text" style="width: 200px;"></input></td>
                        <td>税金（円）： </td>
                        <td><input type="text" style="width: 200px;"></input></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="width: 100px;">合計： </td>
                        <td><input type="text" style="width: 200px;"></input></td>
                        <td style="width: 100px;">合計（円）： </td>
                        <td><input type="text" style="width: 200px;"></input></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="width: 100px;">仕入内容： </td>
                        <td colspan="4"><input type="file" style="width: 500px;"></input></td>
                    </tr>
                </tbody>
            </table>

            <table class="table_inputdialog_btn" border="0">
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td style="width: 200px;"><button class="btn">保存</button></td>
                        <td style="width: 200px;"><button class="btn" onclick="cel()">キャンセル</button></td>

                    </tr>
                </tbody>
            </table>

        </div>
    </div>