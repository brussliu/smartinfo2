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
                        <td style="width: 293px;" id="td_no"> </td>
                        <td style="width: 100px;"></td>
                        <td style="width: 250px;"></td>
                        <td></td> <td></td>
                    </tr>
                    <tr>
                        <td>商品分類：</td>
                        <td > 
                            <select style="width: 200px;" id="select_protype">
                                <option id="" class=""></option>	
                                <option id="A" class="newshop">A:販売商品</option>	
                                <option id="B" class="newshop">B:返送商品</option>
                                <option id="C" class="newshop">C:FBA転送商品</option>
                                <option id="D" class="newshop">D:その他</option>
                            </select>
                        </td>
                        <td>所有者：</td>
                        <td>                           
                            <select style="width: 200px;" id="select_possessor">
                                <option value=""></option>	
                                <option value="zhixun" class="newshop">zhixun</option>	
                                <option value="Smart-Bear" class="newshop">Smart-Bear</option>

                            </select>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td >商品名称（中国語）： </td>
                        <td colspan="3" id="td_productname"></td>
                        <td></td>
                        <td></td>
                        
                    </tr>
                    <tr>
                        <td style="text-align: right;padding-right: 27px;">商品名： </td>
                        <td><input type="text" style="width: 280px;"oninput="display();" id="text_product"></input></td>
                        <td style="text-align: right">分類①：</td>
                        <td><input type="text" style="width: 200px;"oninput="display();" id="text_sub1"></input></td>
                        <td style="text-align: right">分類②：</td>
                        <td><input type="text" style="width: 200px;"oninput="display();" id="text_sub2"></input></td>
                    </tr>
                    <tr>
                        <td >商品名称（日本語）： </td>
                        <td colspan="3"><input type="text" style="width: 600px;" id="text_jpproductname"></input></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td >数量： </td>
                        <td><input type="number" style="width: 200px;"id="text_num"></input></td>
                        <td></td>
                        <td></td>
                        <td></td><td></td>
                    </tr>
                    <tr>
                        <td >備考： </td>
                        <td colspan="3"><input type="text" style="width: 600px;" id="text_remark"></input></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top;">商品写真： </td>
                        <td>
                            <!-- <img style="width: 200px;height: 200px;" src="img/uploadpic.png" > -->
                            <img src="img/uploadpic_Smart-Bear.png" id="img_pic"  style="height:200px" > 
                        </td>
                        <td><button class="btn btn-0902_01" onclick="showpic()">表示</button> </td>
                        <td><img src="#"  id="img_pic2" style="width: 200px;height:200px;float: right;display: none;"></td>
                        <td></td><td></td>
                    </tr>
                
                </tbody>
            </table>

            <table class="table_inputdialog_btn" border="0">
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td><input type="hidden" id="opt"></input></td>
                        <td style="width: 200px;"><button class="btn btn-0902_02" onclick="save()">保存</button></td>
                        <td style="width: 200px;"><button class="btn btn-0902_03" onclick="cancel()">キャンセル</button></td>

                    </tr>
                </tbody>
            </table>

        </div>
    </div>