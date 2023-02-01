<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="shipacting_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var shipacting_inputdialog = null;
            $(function () {
                shipacting_inputdialog = $("#shipacting_inputdialog").dialog({
                    title: "代行発送詳細情報",
                    autoOpen: false,
                    resizable: true,
                    height: 640,
                    width: 1050,
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

            .borbom{
                border-bottom: 1px dashed black;
                height: 55px;
            }
        </style>

        <div style="margin: 10px;">

            <table class="table_inputdialog" border="0">
                <tbody>
                    <tr>
                        <td style="width: 100px;">管理番号： </td>
                        <td style="width: 220px;">YYYYMMDD-HHMMSS</td>
                        <td style="width: 100px;"></td>
                        <td style="width: 200px;"></td>
                        <td rowspan="8" class="borbom" style="text-align: center;line-height:10px;">
                            <img src="#" style="width:280px;height: 280px;"></img>
                            <br><br>
                            <button style="width: 100px;float: none;">詳細情報</button>
                        </td>  
                    </tr>
                    <tr>
                        <td>発送商品：</td>
                        <td colspan="2">
                            <select style="width: 350px;">
                                <option value="">鹰标（一对）银</option>
                            </select>
                        </td>
                 
                        <td style="text-align: right;">数量：<input type="text" style="width: 120px;"></input></td>
                     
                       
                    </tr>
                    <tr>
                        <td >郵便番号： </td>
                        <td ><input type="text"></input></td>
                        <td></td>
                        <td></td>
                     
                   
                    </tr>
                    <tr>
                        <td>住所①： </td>
                        <td colspan="3"><input type="text" style="width: 550px;"></input></td>
                    
                     
                         
                    </tr>
                    <tr>
                        <td >住所②： </td>
                        <td colspan="3"><input type="text" style="width: 550px;"></input></td>
                        
                       
                    </tr>
                    <tr>
                        <td >住所③： </td>
                        <td colspan="3"><input type="text" style="width: 550px;"></input></td>
                        
                       
                    </tr>
                    <tr>
                        <td >名前： </td>
                        <td><input type="text"></input></td>
                        <td >電話番号：</td>
                        <td style="text-align: right;"><input type="text" style="width:160px;"></input></td>

                    </tr>
            
                    <tr >
                        <td  class="borbom">備考： </td>
                        <td colspan="3" class="borbom"><input type="text" style="width: 550px;"></input></td>
                    
                    </tr>
                
                    <tr>
                        <td >発送方法： </td>
                        <td >  <select style="width: 205px;">
                            <option value=""></option>
                        </select> </td>
                        <td >発送費用：</td>
                        <td style="text-align: right;"><input type="text" style="width:160px;"></input> </td> 
                        <td>円&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:160px;"></input> 元</td>
                    </tr>
                    <tr >
                        <td class="borbom">追跡番号： </td>
                        <td class="borbom"><input type="text"></input></td>
                        <td class="borbom"></td>
                        <td class="borbom"></td> 
                        <td class="borbom"></td>
                    </tr>
                </tbody>
            </table>

            <table class="table_inputdialog_btn" border="0">
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td style="width: 200px;"><button class="btn">受入</button></td>
                        <td style="width: 200px;"><button class="btn">保存</button></td>
                        <td style="width: 200px;"><button class="btn" onclick="cel()">キャンセル</button></td>

                    </tr>
                </tbody>
            </table>

        </div>
    </div>