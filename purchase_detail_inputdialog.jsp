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
                $(".date").datepicker({
                    showOtherMonths: true,
                    selectOtherMonths: true,
                    dateFormat: "yy-mm-dd"
                });

            });
        </script>
        <style>
            .file_table {
                width: 100%;
            }

            .file_table tr td:first-child {
                width: 60px;
                height: 60px;
            }

            .file_table tr td:first-child img {
                width: 40px;
                height: 40px;
            }

            .file_table tr td:last-child {
                width: 60px;
                height: 30px;
            }

            .file_table tr td:last-child img {
                width: 30px;
                height: 30px;
            }
        </style>

        <div style="margin: 10px;">
            <div style=" width: 55%;display: inline-block;">
                <table class="table_inputdialog" border="0">
                    <tbody>
                        <tr>
                            <td style="width: 180px;">仕入NO： </td>
                            <td style="width: 250px;" id="td_no">-</td>
                            <td style="width: 135px;"></td>
                            <td style="width: 150px;"></td>

                        </tr>
                        <tr>
                            <td>仕入名称：</td>
                            <td colspan="2"><input type="text" id="text_purchase" style="width: 400px;"></input></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>発送方式：</td>
                            <td colspan="2">
                                <select id="opt_ship" style="width: 400px;">
                                    <option value=""></option>
                                    <option value="1:空運（EMS）">1:空運（EMS）</option>
                                    <option value="2:海運（呉）">2:海運（呉）</option>
                                    <option value="9:その他">9:その他</option>
                                </select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>登録日： </td>
                            <td  id="date_entrydate"></td>
                            <td></td>
                            <td></td>

                        </tr>
                        <tr>
                            <td>発送日①： </td>
                            <td><input type="text" id="date_forwarddate1" class="date" style="width: 200px;"></input>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>発送日②： </td>
                            <td><input type="text" id="date_forwarddate2" class="date" style="width: 200px;"></input>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>完了日： </td>
                            <td><input type="text" id="date_completiondate" class="date" style="width: 200px;"></input>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr>
                            <td>商品費用： </td>
                            <td><input type="number" id="number_productamountRMB" onchange="Xchanger();" style="width: 200px;"></input></td>
                            <td>
                                <select id="opt_monetaryunit1" onchange="Xchanger();" style="width: 100px;">
                                    <option value="CNY"  selected="selected">元</option>
                                    <option value="JPY" >円</option>
                                
                                </select>
                            </td>
                            <td id="number_productamountRY">999999円</td>
                        </tr>
                        <tr>
                            <td>物流費用： </td>
                            <td><input type="number" id="number_shipamountRMB" onchange="Xchanger();" style="width: 200px;"></input></td>
                            <td>
                                <select id="opt_monetaryunit2" onchange="Xchanger();" style="width: 100px;">
                                    <option value="CNY" selected="selected">元</option>
                                    <option value="JPY" >円</option>
                            
                                </select>
                            </td>
                            <td id="number_shipamountRY"></td>
                        </tr>
                        <tr>
                            <td>税金： </td>
                            <td><input type="number" id="number_faxamountRMB" onchange="Xchanger();" style="width: 200px;"></input></td>
                            <td>
                                <select id="opt_monetaryunit3" onchange="Xchanger();" style="width: 100px;">
                                    <option value="JPY" selected="selected">円</option>
                                    <option value="CNY"  >元</option>
                                </select>
                            </td>
                            <td id="number_faxamountRY"></td>
                        </tr>
                        <tr>
                            <td>為替レート： </td>
                            <td><input type="number" id="number_rate"  onchange="Xchanger();" style="width: 200px;"></input></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>合計： </td>
                            <!--  元 -->
                            <td  id="text_totalRMB"></td>

                            <td colspan="2" id="text_totalRY"></td>

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
                            <td style="width: 150px;">添付ファイル：<input type="hidden" id="purchaseno"></input></td>
                            <td style="width: 400px;"><input type="file" id="file_acces" style="width: 400px;"></input>
                            </td>
                            <td style="width:10px"></td>
                        </tr>
                        <tr>
                            <td>ファイル名：</td>
                            <td><input type="text" id="text_filename" style="width: 400px;"></input></td>
                            <td><button style="height: 30px;" id="btn_up" onclick="upload()">⬆UP</button></td>
                        </tr>

                    </tbody>
                </table>
                <div style="width: 99%;height: 512px;overflow-y: auto;border: 1px solid black;margin-top: 10px;">
                    <table class="file_table" border="0" id="filetable">
                   
                            <!-- <tr>
                                <td>
                                    <img src="img/word.png"></img>
                                </td>
                                <td style="width: 400px;" class="a">XXXXXXXXXXXXXXXXXXXXXXXXXX.word</td>
                                <td> <img src="img/delete.png" onclick="delfile(this)"></img></td>
                            </tr> -->
                          
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
                        <td style="width: 200px;"><button onclick="save()" class="btn">保存</button></td>
                        <td style="width: 200px;"><button class="btn" onclick="cel()">キャンセル</button></td>

                    </tr>
                </tbody>
            </table>

        </div>
    </div>