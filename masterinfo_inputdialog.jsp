<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="masterinfo_inputdialog" style="display:block;background-color: rgb(255, 255, 240);">
        <script>
            var masterinfo_inputdialog = null;
            $(function () {
                masterinfo_inputdialog = $("#masterinfo_inputdialog").dialog({
                    title: "マスタ詳細情報",
                    autoOpen: false,
                    resizable: true,
                    height: 640,
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


            function preproductchange(val) {
                var opt = $("#opt").val();
                if (opt == 'new') {
                    if (val == '親商品') {
                        console.log('new親商品');
                       
                        $("#fba option:first").prop("selected", 'selected');
                        $('#sub1').val("");
                        $('#sub2').val("");
                        $('#price1').val("");
                        $('#price2').val("");
                        $('#price3').val("");
                      
                        $("#preproduct").removeAttr("disabled").css("background", "#e0ffff");
                        $("#fba").attr("disabled", "disabled").css("background", "rgb(194, 189, 189)");
                        $("#sub1").attr("disabled", "disabled").css("background", "rgb(194, 189, 189)");
                        $("#sub2").attr("disabled", "disabled").css("background", "rgb(194, 189, 189)");
                        $("#price1").attr("disabled", "disabled").css("background", "rgb(194, 189, 189)");
                        $("#price2").attr("disabled", "disabled").css("background", "rgb(194, 189, 189)");
                        $("#price3").attr("disabled", "disabled").css("background", "rgb(194, 189, 189)");

                    } else if (val == '子商品') {
                        console.log('new子商品');
                        $("#preproduct").removeAttr("disabled").css("background", "#e0ffff");
                        $("#fba").removeAttr("disabled").css("background", "#e0ffff");
                        $("#sub1").removeAttr("disabled").css("background", "#e0ffff");
                        $("#sub2").removeAttr("disabled").css("background", "#e0ffff");
                        $("#price1").removeAttr("disabled").css("background", "#e0ffff");
                        $("#price2").removeAttr("disabled").css("background", "#e0ffff");
                        $("#price3").removeAttr("disabled").css("background", "#e0ffff");
                        $("#preproduct").removeAttr("disabled").css("background", "#e0ffff");
                    }
                 }
               
            }
        </script>
        <style>
        </style>

        <div style="margin: 10px;">
            <table style="border-bottom: 1px solid black;height: 40px;margin-bottom: 10px;">
                <tbody>
                    <tr>
                        <td style="width: 130px;text-align: left;">【ASIN番号】</input></td>
                        <td style="width: 170px;" id="asin"></td>
                        
                        <td style="width: 120px;text-align: left;">【SKU番号】</input></td>
                        <td style="width: 180px;" id="sku"></td>
                        
                        <td style="width: 150px;text-align: left;">【LABEL番号】</td>
                        <td style="width: 170px;" id="label"></td>
                        
                    </tr>
                </tbody>
            </table>
            <table class="table_inputdialog" border="0">
                <tbody>
                    <tr>
                        <td style="width: 14%;">商品種別：</td>
                        <td style="width: 18%;"><select style="width: 200px;" id="newproducttype">
                                <option value=""></option>
                            </select></td>
                        <td style="width:18%;"><input type="text" style="width: 200px;" id="newproducttype2"></input>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>商品管理番号：</td>
                        <td><select style="width: 200px;" id="newproductno">
                                <option value=""></option>
                            </select></td>
                        <td><input type="text" style="width: 200px;" id="newproductno2"></input></td>
                        <td></input></td>
                    </tr>

                    <tr>
                        <td>
                            親子区分：
                        </td>
                        <td id="pre"><select style="width: 100px;height: 30px;" id="preproduct"
                                onchange="preproductchange(this.value);"><option value="親商品">親商品</option><option value="子商品">子商品</option></select></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            FBA発送方式：
                        </td>
                        <td><select style="width: 200px;background-color:rgb(194, 189, 189) ;" id="fba"
                                disabled="disabled">
                                <option value=""></option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                            </select></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            分類①：
                        </td>
                        <td colspan="2"><input type="text" style="width: 460px;background-color: rgb(194, 189, 189);"
                                id="sub1" disabled="disabled"></input>
                        </td>
                        <td><input type="hidden" id="oldsub1"></input></td>
                    </tr>
                    <tr>
                        <td>
                            分類②：
                        </td>
                        <td colspan="2"><input type="text" style="width: 460px;background-color: rgb(194, 189, 189);"
                                id="sub2" disabled="disabled"></input>
                        </td>
                        <td><input type="hidden" id="oldsub2"></input></td>
                    </tr>

                    <tr>
                        <td>仕入価格：</td>
                        <td> <input type="text"id="price1" style="width: 200px;background-color: rgb(194, 189, 189);" 
                                disabled="disabled"> 円</input></td>
                        <td> </td>
                        <td> </td>
                    </tr>
                    <tr>
                        <td>仕入申報価格：</td>
                        <td> <input type="text" style="width: 200px;background-color: rgb(194, 189, 189);" id="price2"
                                disabled="disabled"> 元</input></td>
                        <td> <input type="text" style="width: 200px;background-color: rgb(194, 189, 189);" id="price3"
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
                        <td></td>
                        <td><input type="hidden" id="opt" value="new"></input></td>
                        <td style="width: 200px;"><button class="btn" onclick="save()">保存</button></td>
                        <td style="width: 200px;"><button class="btn" onclick="cel()">キャンセル</button></td>
                    </tr>
                </tbody>
            </table>

        </div>
    </div>