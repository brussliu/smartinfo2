<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="sending_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var sending_inputdialog = null;
            $(function () {
                sending_inputdialog = $("#sending_inputdialog").dialog({
                    title: "発送詳細情報",
                    autoOpen: false,
                    resizable: true,
                    height: 660,
                    width: 1170,
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
            .l {
                text-align: left;

            }

            .r {
                text-align: right;
            }

            .c {
                text-align: center;
            }

            .t {
                vertical-align: top;
            }

            input[tyle="text"] {
                width: 200px;
            }

            .borbom {
                border-bottom: 1px dashed black;
            }
        </style>

        <div style="margin: 10px;">

            <table class="table_inputdialog" width="100%">
                <tbody>
                    <tr>
                        <td style="width: 150px;">区分： </td>
                        <td style="width: 250px;"> 
                            <select style="width: 205px;">
                                <option value=""></option>
                            </select> 
                        </td>
                        <td style="width: 100px;">発送方法：</td>
                        <td style="width: 250px;" class="c"> 
                            <select style="width: 205px;">
                                <option value=""></option>
                            </select> 
                        </td>
                        <td style="width: 100px;"></td>
                        <td style="width: 220px;"></td>
                    </tr>
                    <tr>
                        <td>注文番号：</td>
                        <td colspan="2">
                            <input type="text" style="width: 350px;"></input>
                        </td>

                        <td></td>
                        <td></td>
                        <td></td>

                    </tr>
                    <tr>
                        <td >発送商品： </td>
                        <td> 
                            <select style="width: 205px;">
                                <option value=""></option>
                            </select> 
                        </td>
                        <td >分類①</td>
                        <td class="c"> 
                            <select style="width: 205px;">
                                <option value=""></option>
                            </select> 
                        </td>
                        <td >分類②</td>
                        <td> 
                            <select style="width: 205px;">
                                <option value=""></option>
                            </select> 
                        </td>
                    </tr>
                    <tr>
                        <td> </td>
                        <td colspan="5"><input type="text" style="width: 937px;"></input></td>
                    </tr>
                    <tr>
                        <td>数量： </td>
                        <td><input type="text"></input></td>
                        <td  >金額：</td>
                        <td class="c"><input type="text"></input></td>
                        <td></td><td></td>
                    </tr>

                    <tr>
                        <td >郵便番号： </td>
                        <td colspan="3"><input type="text" style="width: 595px;"></input></td>
                        <td></td><td></td>
                    </tr>

                    <tr>
                        <td>届け先住所①： </td>
                        <td colspan="3"><input type="text" style="width: 595px;"></input></td>
                        <td></td><td></td>
                    </tr>
                    <tr>
                        <td>届け先住所②： </td>
                        <td colspan="3"><input type="text" style="width: 595px;"></input></td>
                        <td></td><td></td>
                    </tr>
                    <tr>
                        <td>届け先住所③： </td>
                        <td colspan="3"><input type="text" style="width: 595px;"></input></td>
                        <td></td><td></td>
                    </tr>
                    <tr>
                        <td>宛先： </td>
                        <td><input type="text"></input></td>
                        <td >電話番号：</td>
                        <td class="c"><input type="text"></input></td>
                        <td></td><td></td>
                    </tr>
                    <tr>
                        <td>備考： </td>
                        <td colspan="3"><input type="text" style="width: 595px;"></input></td>
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