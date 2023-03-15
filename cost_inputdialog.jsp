<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="cost_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var cost_inputdialog = null;
            $(function () {
                cost_inputdialog = $("#cost_inputdialog").dialog({
                    title: "コスト詳細情報",
                    autoOpen: false,
                    resizable: true,
                    height: 440,
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

            //保存押下
            function save() {

                var updateKey = $('input:radio[name="choice"]:checked').val();
                    
                
                Efw('cost_save',{"updateKey":updateKey});
            }
        </script>
        <style>

        </style>

        <div style="margin: 10px;">

            <table class="table_inputdialog" border="0">
                <tbody>
               
                    <tr>
                        <td style="width: 120px;">登録日時：</td>
                        <td style="width: 220px;" id="td_registrationdate">2022/12/12 12:12:12</td>
                        <td style="width: 120px;">ステータス：</td>
                        <td style="width: 220px;">
                            <select style="width:200px;" id="opt_status">
                                <option value="未支払" selected>未支払</option>
                                <option value="支払済">支払済</option>
                            </select>
                        </td>
                    </tr> 
                    <tr>
                        <td>発生日：</td>
                        <td><input type="text" class="date" id="txt_accrualdate"></input></td>
                        <td>分類：</td>
                        <td>
                            <select style="width:200px;" id="txt_classification">
                                <option value="" selected></option>
                                <option value="操作">操作</option>
                                <option value="資材">資材</option>
                                <option value="美工">美工</option>美工
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>タイトル：</td>
                        <td colspan="3">    
                             <input type="text" style="width: 680px;" id="txt_title"></input>
                        </td>                 
                    </tr>
                    <tr>
                        <td>金額：</td>
                        <td>    
                            <input type="text" id="txt_account" onchange="cal();"></input>
                            <select style="width: 50px;" id="opt_currency" onchange="cal();">
                                <option value="JPY" >円</option>
                                <option value="CNY" selected>元</option>
                            </select>
                        </td>
                        <td id="td_num">999999 円</td>
                        <td align="left"></td>
                    </tr>
                    <tr>
                        <td>為替レート：</td>
                        <td>    
                            <input type="text" id="txt_exchangerate" onchange="cal();"></input>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>備考：</td>
                        <td colspan="3">    
                            <input type="text" style="width: 680px;" id="txt_remarks"></input>
                    </td>
                     
                    </tr>
                </tbody>
            </table>
         
           
 
           
         
            <table class="table_inputdialog_btn" b
            
            order="0">
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td style="width: 200px;"><button class="btn" onclick="save()">保存</button><input type="hidden" id="opt"/></td>
                        <td style="width: 200px;"><button class="btn" onclick="cel()">キャンセル</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>