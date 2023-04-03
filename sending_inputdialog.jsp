<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="sending_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var sending_inputdialog = null;
            $(function () {
                sending_inputdialog = $("#sending_inputdialog").dialog({
                    title: "発送詳細情報",
                    autoOpen: false,
                    resizable: true,
                    height: 730,
                    width: 1170,
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
                        <td style="width: 150px;">区分： </td>
                        <td style="width: 250px;"> 
                            <select style="width: 205px;" id="select_type">
                                <option value=""></option>
                                <option value="A.AmazonFBM">A.AmazonFBM</option>
                                <option value="B.Qoo10発送">B.Qoo10発送</option>
                                <option value="C.代行発送">C.代行発送</option>
                                <option value="D.自行発送">D.自行発送</option>
                            </select> 
                        </td>
                        <td style="width: 100px;">発送方法：</td>
                        <td style="width: 250px;"> 
                            <select style="width: 205px;"  id="select_send">
                                <option value=""></option>
                                <option value="01.クリックポスト">01.クリックポスト</option>
                                <option value="02.普通便">02.普通便</option>
                                <option value="03.ゆうパケット">03.ゆうパケット</option>
                           
                            </select> 
                        </td>
                        <td style="width: 100px;"></td>
                        <td style="width: 220px;"></td>
                    </tr>
                    <tr>
                        <td>注文番号：</td>
                        <td colspan="2">
                            <input type="text" style="width: 350px;" id="text_no"></input>
                        </td>

                        <td></td>
                        <td></td>
                        <td></td>

                    </tr>
                    <tr>
                        <td >発送商品： </td>
                        <td> 
                            <select style="width: 205px;" id="select_product" onchange="changeProduct('0')">
                                <option value=""></option>
                            </select> 
                        </td>
                        <td >分類①：</td>
                        <td> 
                            <select style="width: 205px;" id="select_sub1" onchange="changeProduct('1')">
                                <option value=""></option>
                            </select> 
                        </td>
                        <td >分類②：</td>
                        <td> 
                            <select style="width: 205px;" id="select_sub2"  onchange="changeProduct('2')">
                                <option value=""></option>
                            </select> 
                        </td>
                    </tr>
                    <tr>
                        <td> </td>
                        <td colspan="5"><input type="text" style="width: 937px;" id="text_productname" ></input></td>
                    </tr>
                    <tr>
                        <td>数量： </td>
                        <td><input type="text" id="text_num"></input></td>
                        <td style="display: none;">金額：</td>
                        <td style="display: none;"><input type="text" id="text_money"></input></td>
                        <td></td><td></td>
                    </tr>

                    <tr>
                        <td >郵便番号： </td>
                        <td colspan="3"><input type="text" style="width: 568px;" id="text_mail"></input></td>
                        <td colspan="2" rowspan="5" id="td_addressall" style="vertical-align: top;border:1px solid black;" >
                            </td> 
                    </tr>

                    <tr>
                        <td>都道府県： </td>
                        <td><input type="text" id="text_prefecture"></input></td>
                        <td>市区町村： </td>
                        <td><input type="text" id="text_city"></input></td>
                     
                    </tr>
                    <tr>
                        <td>届け先住所①： </td>
                        <td colspan="3"><input type="text" style="width: 568px;" id="text_address1"></input></td>
                   
                    </tr>
                    <tr>
                        <td>届け先住所②： </td>
                        <td colspan="3"><input type="text" style="width: 568px;" id="text_address2"></input></td>
                     
                    </tr>
                    <tr>
                        <td>届け先住所③： </td>
                        <td colspan="3"><input type="text" style="width: 568px;" id="text_address3"></input></td>
                      
                    </tr>
                    <tr>
                        <td>宛先： </td>
                        <td><input type="text" id="text_name"></input></td>
                        <td>電話番号：</td>
                        <td><input type="text" id="text_phone"></input></td>
                        <td></td><td></td>
                    </tr>
                    <tr>
                        <td>備考： </td>
                        <td colspan="3"><input type="text" style="width: 568px;" id="text_remark"></input></td>
                        <td></td><td></td>
                    </tr>
                    <tr>
                        <td>発送内容： </td>
                        <td colspan="3"><input type="text" style="width: 568px;" id="text_sendcontent"></input></td>
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
                        <td style="width: 200px;"><button class="btn"  onclick="save()">保存</button></td>
                        <td style="width: 200px;"><button class="btn" onclick="cancel()">キャンセル</button></td>

                    </tr>
                </tbody>
            </table>

        </div>
    </div>