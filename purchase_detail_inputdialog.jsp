<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="purchase_detail_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var purchase_detail_inputdialog = null;
            $(function () {
                purchase_detail_inputdialog = $("#purchase_detail_inputdialog").dialog({
                    title: "仕入詳細",
                    autoOpen: false,
                    resizable: true,
                    height: 800,
                    width: 1600,
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
            <div style=" width: 55%;display: inline-block;">
                <table class="table_inputdialog" border="0">
                    <tbody>
                        <tr>
                            <td style="width: 180px;">仕入NO： </td>
                            <td style="width: 250px;" id="no">YYYYMMDD-HHMMSS </td>
                            <td style="width: 135px;"></td>
                            <td style="width: 150px;"></td>

                        </tr>
                        <tr>
                            <td>仕入名称：</td>
                            <td colspan="2"><input type="text" id="text_purchase" style="width: 400px;"></input></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>サプライヤー：</td>
                            <td colspan="2">
                                <select id="select_ship" style="width: 400px;">
                                    <option value="1:空運（EMS）">1:空運（EMS）</option>
                                    <option value="2:海運（呉）">2:海運（呉）</option>
                                    <option value="9:その他">9:その他</option>
                                </select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>登録日： </td>
                            <td><input type="date" id="date_entrydate" style="width: 200px;"></input></td>
                            <td></td>
                            <td></td>

                        </tr>
                        <tr>
                            <td>発送日①： </td>
                            <td><input type="date" id="date_forwarddate1" style="width: 200px;"></input></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>発送日②： </td>
                            <td><input type="date" id="date_forwarddate2"  style="width: 200px;"></input></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>完了日： </td>
                            <td><input type="date" id="finishdate" style="width: 200px;"></input></td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr>
                            <td>商品費用： </td>
                            <td><input type="number" id="number_productamount"  style="width: 200px;"></input></td>
                            <td>
                                <select id="select_monetaryunit1"  style="width: 100px;">
                                    <option value="元">元</option>
                                    <option value="円">円</option>
                                </select>
                            </td>
                            <td>999999円</td>
                        </tr>
                        <tr>
                            <td>物流費用： </td>
                            <td><input type="number" id="number_shipamount" style="width: 200px;"></input></td>
                            <td>
                                <select id="select_monetaryunit2"  style="width: 100px;">
                                    <option value="元">元</option>
                                    <option value="円">円</option>
                                </select>
                            </td>
                            <td>999999円</td>
                        </tr>
                        <tr>
                            <td>税金： </td>
                            <td><input type="number" id="number_faxamount" style="width: 200px;"></input></td>
                            <td>
                                <select id="select_monetaryunit3" style="width: 100px;">
                                    <option value="元">元</option>
                                    <option value="円">円</option>
                                </select>
                            </td>
                            <td>999999円</td>
                        </tr>
                        <tr>
                            <td>為替レート： </td>
                            <td><input type="number" id="number_rate" style="width: 200px;"></input></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>合計： </td>
                            <td><input type="number" id="text_rmbtotal" style="width: 200px;"></input> 元</td>

                            <td colspan="2"><input type="text" id="text_rytotal" style="width: 200px;"></input> 円</td>

                        </tr>
                        <tr>
                            <td>仕入内容： </td>
                            <td colspan="3"><input id="file_ProContent" type="file" style="width: 400px;"></input></td>
                        </tr>
                        <tr>
                            <td>追跡番号： </td>
                            <td><input type="text" id="text_track" style="width: 200px;"></input></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div style="width: 42%;display: inline-block;vertical-align: top;">
                <table class="table_inputdialog" border="0">
                    <tbody>
                        <tr>
                            <td style="width: 150px;">添付ファイル：</td>
                            <td style="width: 400px;"><input type="file" id="file_acces" style="width: 400px;"></input></td>
                            <td style="width:10px"></td>
                        </tr>
                        <tr>
                            <td>ファイル名：</td>
                            <td><input type="text" id="text_filename" style="width: 400px;"></input></td>
                            <td><button style="height: 30px;" id="btn_up">⬆UP</button></td>
                        </tr>

                    </tbody>
                </table>
                <div style="width: 100%;height: 512px;overflow-y: auto;border: 1px solid black;margin-top: 10px;">
                    <table class="table_inputdialog" border="0">
                        <tbody>
                            <tr>
                                <td style="width: 60px;height: 60px;">
                                <img src="img/word.png" style="width:40px;height: 40px;"></img></td>
                                <td style="width: 400px;">XXXXXXXXXXXXXXXXXXXXXXXXXX.word</td>
                                <td style="width: 60px;height: 30px;">
                                <img src="img/delete.png" style="width:30px;height: 30px;"></img></td>
                            </tr>
                            <tr>
                                <td style="width: 60px;height: 60px;">
                                <img src="img/word.png" style="width:40px;height: 40px;"></img></td>
                                <td style="width: 400px;">XXXXXXXXXXXXXXXXXXXXXXXXXX.word</td>
                                <td style="width: 60px;height: 30px;">
                                <img src="img/delete.png" style="width:30px;height: 30px;"></img></td>
                            </tr>
                            <tr>
                                <td style="width: 60px;height: 60px;">
                                <img src="img/word.png" style="width:40px;height: 40px;"></img></td>
                                <td style="width: 400px;">XXXXXXXXXXXXXXXXXXXXXXXXXX.word</td>
                                <td style="width: 60px;height: 30px;">
                                <img src="img/delete.png" style="width:30px;height: 30px;"></img></td>
                            </tr>
                            <tr>
                                <td style="width: 60px;height: 60px;">
                                <img src="img/word.png" style="width:40px;height: 40px;"></img></td>
                                <td style="width: 400px;">XXXXXXXXXXXXXXXXXXXXXXXXXX.word</td>
                                <td style="width: 60px;height: 30px;">
                                <img src="img/delete.png" style="width:30px;height: 30px;"></img></td>
                            </tr>
                            <tr>
                                <td style="width: 60px;height: 60px;">
                                <img src="img/word.png" style="width:40px;height: 40px;"></img></td>
                                <td style="width: 400px;">XXXXXXXXXXXXXXXXXXXXXXXXXX.word</td>
                                <td style="width: 60px;height: 30px;">
                                <img src="img/delete.png" style="width:30px;height: 30px;"></img></td>
                            </tr>
                            <tr>
                                <td style="width: 60px;height: 60px;">
                                <img src="img/word.png" style="width:40px;height: 40px;"></img></td>
                                <td style="width: 400px;">XXXXXXXXXXXXXXXXXXXXXXXXXX.word</td>
                                <td style="width: 60px;height: 30px;">
                                <img src="img/delete.png" style="width:30px;height: 30px;"></img></td>
                            </tr>
                            <tr>
                                <td style="width: 60px;height: 60px;">
                                <img src="img/word.png" style="width:40px;height: 40px;"></img></td>
                                <td style="width: 400px;">XXXXXXXXXXXXXXXXXXXXXXXXXX.word</td>
                                <td style="width: 60px;height: 30px;">
                                <img src="img/delete.png" style="width:30px;height: 30px;"></img></td>
                            </tr>
                            <tr>
                                <td style="width: 60px;height: 60px;">
                                <img src="img/word.png" style="width:40px;height: 40px;"></img></td>
                                <td style="width: 400px;">XXXXXXXXXXXXXXXXXXXXXXXXXX.word</td>
                                <td style="width: 60px;height: 30px;">
                                <img src="img/delete.png" style="width:30px;height: 30px;"></img></td>
                            </tr>
                            <tr>
                                <td style="width: 60px;height: 60px;">
                                <img src="img/word.png" style="width:40px;height: 40px;"></img></td>
                                <td style="width: 400px;">XXXXXXXXXXXXXXXXXXXXXXXXXX.word</td>
                                <td style="width: 60px;height: 30px;">
                                <img src="img/delete.png" style="width:30px;height: 30px;"></img></td>
                            </tr>
                            <tr>
                                <td style="width: 60px;height: 60px;">
                                <img src="img/word.png" style="width:40px;height: 40px;"></img></td>
                                <td style="width: 400px;">XXXXXXXXXXXXXXXXXXXXXXXXXX.word</td>
                                <td style="width: 60px;height: 30px;">
                                <img src="img/delete.png" style="width:30px;height: 30px;"></img></td>
                            </tr>
                            <tr>
                                <td style="width: 60px;height: 60px;">
                                <img src="img/word.png" style="width:40px;height: 40px;"></img></td>
                                <td style="width: 400px;">XXXXXXXXXXXXXXXXXXXXXXXXXX.word</td>
                                <td style="width: 60px;height: 30px;">
                                <img src="img/delete.png" style="width:30px;height: 30px;"></img></td>
                            </tr>
                            <tr>
                                <td style="width: 60px;height: 60px;">
                                <img src="img/word.png" style="width:40px;height: 40px;"></img></td>
                                <td style="width: 400px;">XXXXXXXXXXXXXXXXXXXXXXXXXX.word</td>
                                <td style="width: 60px;height: 30px;">
                                <img src="img/delete.png" style="width:30px;height: 30px;"></img></td>
                            </tr>
                            <tr>
                                <td style="width: 60px;height: 60px;">
                                <img src="img/word.png" style="width:40px;height: 40px;"></img></td>
                                <td style="width: 400px;">XXXXXXXXXXXXXXXXXXXXXXXXXX.word</td>
                                <td style="width: 60px;height: 30px;">
                                <img src="img/delete.png" style="width:30px;height: 30px;"></img></td>
                            </tr>
                            <tr>
                                <td style="width: 60px;height: 60px;">
                                <img src="img/word.png" style="width:40px;height: 40px;"></img></td>
                                <td style="width: 400px;">XXXXXXXXXXXXXXXXXXXXXXXXXX.word</td>
                                <td style="width: 60px;height: 30px;">
                                <img src="img/delete.png" style="width:30px;height: 30px;"></img></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
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