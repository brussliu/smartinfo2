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
        </script>
        <style>

        </style>

        <div style="margin: 10px;">

            <table class="table_inputdialog" border="0">
                <tbody>
               
                    <tr>
                        <td style="width: 120px;">登録日時：</td>
                        <td style="width: 220px;">2022/12/12 12:12:12</td>
                        <td style="width: 120px;">ステータス：</td>
                        <td style="width: 220px;">
                            <select style="width:200px;">
                                <option value=""></option>
                            </select>
                        </td>
                    </tr> 
                    <tr>
                        <td>発生日：</td>
                        <td><input type="text"></input></td>
                        <td>分類：</td>
                        <td>
                            <select style="width:200px;">
                                <option value=""></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>タイトル：</td>
                        <td colspan="3">    
                             <input type="text" style="width: 680px;"></input>
                        </td>                 
                    </tr>
                    <tr>
                        <td>金額：</td>
                        <td>    
                            <input type="text"></input>
                            <select style="width: 50px;">
                                <option value=""></option>
                            </select>
                        </td>
                        <td>999999 円</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>為替レート：</td>
                        <td>    
                            <input type="text"></input>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>備考：</td>
                        <td colspan="3">    
                            <input type="text" style="width: 680px;"></input>
                    </td>
                     
                    </tr>
                </tbody>
            </table>
         
           
 
           
         
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