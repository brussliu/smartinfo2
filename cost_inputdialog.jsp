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
            .table_btn td{
                height: 40px;
            }
            input[type="text"]{
                height: 30px;
            }
            .r{
                text-align: right;
            }
        </style>

        <div style="margin: 10px;">

            <table class="table_btn" style=" width: 1068px; ">
                <tbody>
               
                    <tr>
                        <td style="width: 140px;">登録日：</td>
                        <td style="width: 150px;">YYYY/MM/DD</td>
                        <td style="width: 100px;">発生日：</td>
                        <td style="width: 250px;"><input type="text"></input></td>
                        <td style="width: 120px;">ステータス：</td>
                        <td style="width: 180px;" class="r">
                            <select>
                                <option value=""></option>
                            </select>
                        </td>
                    </tr> 
                    <tr>
                        <td>分類：</td>
                        <td>    
                            <select>
                            <option value=""></option>
                        </select>
                    </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>タイトル：</td>
                        <td colspan="3">    
                             <input type="text" style="width: 600px;"></input>
                    </td>
                        <td></td>
                        <td></td>
                       
                    </tr>
                    <tr>
                        <td>金額：</td>
                        <td>    
                            <input type="text"></input>
                    </td>
                        <td> 
                             <select style="width: 70px;">
                            <option value=""></option>
                        </select></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>為替レート：</td>
                        <td>    
                            <input type="text"></input>
                    </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>備考：</td>
                        <td colspan="5">    
                            <input type="text" style="width: 920px;"></input>
                    </td>
                     
                    </tr>
                </tbody>
            </table>
         
           
 
           
         
            <table class="table_inputdialog_btn" border="0" style="width: 1068px;">
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