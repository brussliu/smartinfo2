<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="labelprinting_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var labelprinting_inputdialog = null;
            $(function () {
                labelprinting_inputdialog = $("#labelprinting_inputdialog").dialog({
                    title: "LABEL詳細情報",
                    autoOpen: false,
                    resizable: true,
                    height: 500,
                    width: 1200,
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

            <table class="table_inputdialog" border="0">
                <tbody>
                    <tr>
                   
                        <td style="width: 40px;"><input type="radio" value="自納商品" name="product" onchange="changeProduct(this)"  checked="checked"></input></td>
                        <td style="width: 120px;">自納商品：</td>
                        
                        <td style="width: 220px;"></td>
                        <td style="width: 100px;"></td>
                        <td style="width: 200px;"></td>
                        <td style="width: 100px;"></td>
                        <td style="width: 200px;"></td>
                        <td  style="width: 50px;"></td>
                        
                    </tr>
                    <tr>
                        <td></td>
                        <td>商品管理番号：</td>
                        <td >
                            <select id="select_productno" onchange="changeProductSub('0')" style="width: 200px">
                                <option value=""></option>
                            </select>
                        </td>
                        <td>分類①：</td>
                        <td >
                            <select id="select_sub1"  onchange="changeProductSub('1')" style="width: 150px">
                                <option value=""></option>
                            </select>
                        </td>
                        <td>分類②：</td>
                        <td >
                            <select id="select_sub2"  onchange="changeProductSub('2')" style="width: 150px">
                                <option value=""></option>
                            </select>
                        </td>
                        <td></td>
                        
                    </tr>
                    <tr>
                        <td><input type="radio" value="代納商品" name="product" onchange="changeProduct(this)" ></input></td>
                        <td>代納商品：</td>
                        <td ></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        
                    </tr>
                    <tr>
                        <td></td>
                        <td>店舗名：</td>
                        <td><input type="text" style="width: 200px;" id="text_shopid" disabled></input></td>
                        <td colspan="2" style="text-align: right;">LABEL番号： </td> 
                        <td colspan="2" style="text-align: center;"><input type="text"  disabled style="width: 200px;" id="text_label"></input></td>
                         
                        <td></td>
                        
                    </tr>
                    <tr>
                        <td></td>
                        <td>商品管理番号：</td>
                        <td><input type="text" style="width: 200px;" id="text_productno" disabled></input></td>
                        <td></td> 
                        <td></td>
                         
                        <td></td>
                        
                    </tr>
                    <tr>
                        <td></td>
                        <td>分類①：</td>
                        <td><input type="text" style="width: 200px;"  id="text_sub1" disabled></input></td>
                        <td colspan="2" style="text-align: right;">分類②： </td> 
                        <td colspan="2" style="text-align: center;"><input type="text"  id="text_sub2" disabled style="width: 200px;"></input></td>
                         
                        <td></td>
                        
                    </tr>
                    <tr>
                        <td></td>
                        <td>備考：</td>
                        <td colspan="5"><input type="text" id="text_remark" disabled style="width: 840px;"></input></td>
                       
                        <td></td>
                        
                    </tr>
                </tbody>
  
            </table>

            <table class="table_inputdialog_btn" border="0">
                <tbody>
                    <tr>
                        <td></td>
                        <td style="width: 200px;"><button class="btn"  onclick="save()">保存</button></td>
                        <td style="width: 200px;"><button class="btn" onclick="cancel()">キャンセル</button></td>
                        <td style="width: 50px;"></td>
                    </tr>
                </tbody>
            </table>

        </div>
    </div>