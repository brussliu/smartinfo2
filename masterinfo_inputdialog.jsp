<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="masterinfo_inputdialog" style="display:block;background-color: rgb(255, 255, 240);">
        <script>
            var masterinfo_inputdialog = null;
            $(function () {
                masterinfo_inputdialog = $("#masterinfo_inputdialog").dialog({
                    title: "マスタ詳細情報",
                    autoOpen: false,
                    resizable: true,
                    height: 660,
                    width: 1040,
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
            <table style="border-bottom: 1px solid black;height: 40px;margin-bottom: 10px;">
                <tbody>
                    <tr>
                        <input type="hidden" id="zt_flg" value=""></input>
                        <td style="width: 157px;text-align: left;">【ASIN番号】</td>
                        <td style="width: 200px;">
                            <select style='width: 180px;height: 30px;' id='asinselect'>
                                <option value='-'>-</option>
                            </select>
                        </td>
                        
                        <td style="width: 130px;text-align: left;">【SKU番号】</input></td>
                        <td style="width: 200px;">
                            <select style="width: 180px;height: 30px;" id="skuselect">
                                <option value="-">-</option>
                            </select>
                        </td>
                        
                        <td style="width: 150px;text-align: left;">【LABEL番号】</td>
                        <td style="width: 170px;" id="label"></td>
                        
                    </tr>
                </tbody>
            </table>
            <table class="table_inputdialog" border="0">
                <tbody>
                    <tr>
                        <td style="width: 150px;">商品種別：</td>
                        <td style="width: 220px;">
                            <select style="width: 200px;" id="newproducttype">
                                <option value=""></option>
                            </select></td>
                        <td style="width:220px;"><input type="text" style="width: 200px;" id="newproducttype2"></input>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>商品管理番号：</td>
                        <td>
                            <select style="width: 200px;" id="newproductno">
                                <option value=""></option>
                            </select>
                        </td>
                        <td><input type="text" style="width: 200px;" id="newproductno2"></input></td>
                        <td></input></td>
                    </tr>

                    <tr>
                        <td>
                            親子区分：
                        </td>
                        <td id="pre">
                            <select style="width: 100px;height: 30px;" id="preproduct" onchange="preproductchange();">
                                <option value="親商品" selected>親商品</option>
                                <option value="子商品">子商品</option>
                            </select>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>
                            分類①：
                        </td>
                        <td colspan="2">
                            <input type="text" style="width: 460px;" id="sub1" disabled="disabled"></input>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            分類②：
                        </td>
                        <td colspan="2">
                            <input type="text" style="width: 460px;" id="sub2" disabled="disabled"></input>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            FBM発送方式：
                        </td>
                        <td><select style="width: 200px;" id="fba" disabled="disabled">
                                <option value="" selected></option>
                                <option value="01.クリックポスト">01.クリックポスト</option>
                                <option value="02.普通便">02.普通便</option>
                                <option value="03.ゆうパケット">03.ゆうパケット</option>
                            </select></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>仕入価格：</td>
                        <td> <input type="text"id="price1" style="width: 200px;" 
                                disabled="disabled"> 元</input></td>
                        <td> </td>
                        <td> </td>
                    </tr>
                    <tr>
                        <td>仕入申報価格：</td>
                        <td> <input type="text" style="width: 200px;" id="price2"
                                disabled="disabled"> 元</input></td>
                        <td> <input type="text" style="width: 200px;" id="price3"
                                disabled="disabled"> $</input></td>
                        <td> </td>
                    </tr>
                    <tr style="height: 70px;">
                        <td>
                            商品名称：
                        </td>
                        <td colspan="3"> <textarea style="width: 800px;height: 65px;" id="productname"></textarea></td>
                    </tr>

                </tbody>
            </table>

            <table class="table_inputdialog_btn" border="0">
                <tbody>
                    <tr>
                        <td><input type="hidden" id="opt" value="new"></input></td>
                        <td><button class="btn" id="del" onclick="del()">削除</button></td>
                        <td style="width: 200px;"><button class="btn" onclick="save()">保存</button></td>
                        <td style="width: 200px;"><button class="btn" onclick="cel()">キャンセル</button></td>
                    </tr>
                </tbody>
            </table>

        </div>
    </div>