<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="dialog" id="masterinfo_inputdialog" style="display:block;background-color: rgb(255,255,240);"> 
    <script>
        var masterinfo_inputdialog = null;
        $(function() {
            masterinfo_inputdialog = $("#masterinfo_inputdialog").dialog({
                title : "マスタ詳細情報",
                autoOpen : false,
                resizable : true,
                height : 560,
                width : 1000,
                modal : true,
                open : function(){
                    setTimeout(function(){});
                },
                close : function(){
                    setTimeout(function(){});
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
                    <td style="width: 120px;text-align: left;">【ASIN番号】</td>
                    <td style="width: 170px;">B089WGVH9V</td>
                    <td style="width: 120px;text-align: left;">【SKU番号】</td>
                    <td style="width: 180px;">H2-E3RM-NID1</td>
                    <td style="width: 140px;text-align: left;">【LABEL番号】</td>
                    <td style="width: 170px;">X000UXRHRV</td>
                </tr>
            </tbody>
        </table>
        <table class="table_inputdialog" width="100%" border="0">
            <tbody>
                <tr>
                    <td style="width: 14%;">商品種別 </td>
                    <td style="width: 18%;">
                        <select style="width: 200px;">
                            <option value="">01:レインコート</option>
                        </select>
                    </td>
                    <td style="width:18%;"><input type="text" style="width: 200px;"></input></td>
                    <td></td>
                </tr>
                <tr>
                    <td>商品管理番号</td>
                    <td>
                        <select style="width: 200px;">
                            <option value="">W001</option>
                        </select>
                    </td>
                    <td><input type="text" style="width: 200px;"></input></td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        親子区分
                    </td>
                    <td>子商品</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        分類①
                    </td>
                    <td colspan="2"><input type="text" style="width: 460px;"></input></td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        分類②
                    </td>
                    <td colspan="2"><input type="text" style="width: 460px;"></input></td>
                    <td></td>
                </tr>
                <tr>
                    <td>仕入価格</td>
                    <td> <input type="text" style="width: 200px;"></input></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr style="height: 70px;">
                    <td>
                        商品名称
                    </td>
                    <td colspan="3"> <textarea style="width: 800px;height: 65px;"></textarea></td>
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


