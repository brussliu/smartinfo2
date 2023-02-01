<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="shipactingmaster_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var shipactingmaster_inputdialog = null;
            $(function () {
                shipactingmaster_inputdialog = $("#shipactingmaster_inputdialog").dialog({
                    title: "代行発送商品詳細情報",
                    autoOpen: false,
                    resizable: true,
                    height: 680,
                    width: 1250,
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

            <table class="table_inputdialog" border="0">
                <tbody>
                    <tr>
                        <td style="width: 180px;">管理番号： </td>
                        <td style="width: 293px;"> </td>
                        <td style="width: 100px;"></td>
                        <td style="width: 250px;"></td>
                        <td></td> <td></td>
                    </tr>
                    <tr>
                        <td>商品分類：</td>
                        <td >
                            <select style="width: 200px;">
                                <option value="">A：販売商品</option>
                            </select>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td >商品名称（中国語）： </td>
                        <td colspan="3"></td>
                        <td></td>
                        <td></td>
                        
                    </tr>
                    <tr>
                        <td style="text-align: right">商品名： </td>
                        <td><input type="text" style="width: 280px;"></input></td>
                        <td style="text-align: right">分類①：</td>
                        <td><input type="text" style="width: 200px;"></input></td>
                        <td style="text-align: right">分類②：</td>
                        <td><input type="text" style="width: 200px;"></input></td>
                    </tr>
                    <tr>
                        <td >商品名称（日本語）： </td>
                        <td colspan="3"><input type="text" style="width: 600px;"></input></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td >数量： </td>
                        <td><input type="text" style="width: 200px;"></input></td>
                        <td></td>
                        <td></td>
                        <td></td><td></td>
                    </tr>
                    <tr>
                        <td >備考： </td>
                        <td colspan="3"><input type="text" style="width: 600px;"></input></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top;">商品写真： </td>
                        <td><img style="width: 200px;height: 200px;" src="img/uploadpic.png" ></td>
                        <td><button class="btn">表示</button> </td>
                        <td></td>
                        <td></td><td></td>
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