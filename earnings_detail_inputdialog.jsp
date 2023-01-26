<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="earnings_detail_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var earnings_detail_inputdialog = null;
            $(function () {
                earnings_detail_inputdialog = $("#earnings_detail_inputdialog").dialog({
                    title: "売上詳細情報",
                    autoOpen: false,
                    resizable: true,
                    height: 900,
                    width: 1500,
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
                .red{
                    color: red;
                }
                .table_inputdialog{
                    border-collapse: collapse;
                }
                .table_inputdialog td{
                    width: 175px;
                    height: 25px;
                    padding: 0;
                }
                .table_inputdialog .th{
                    height: 20px;
                    font-weight: bolder;
                    border-top: 1px solid black;
                }
                .r{
                    text-align: right;
                }
                .border-r{
                    border-right: 1px solid black;
                }
                .l5{
                    margin-left: 10px;
                }
                .r5{
                    margin-right: 10px;
                }
             
        </style>

        <div style="width: 96%;height: 96%;margin: 10px;">
            <p style="line-height: 35px;"><span>YYYY年MM月</span></p>
            <div style="border-bottom: 1px solid black;border-right: 1px solid black;border-left: 1px solid black;">

         
            <table class="table_inputdialog" width="100%" border="0"  >
                <tbody>
                    <tr>
                        <td colspan="2" class="th border-r" style="background-color: #fabf8f;"><span class="l5">登録料</span></td>
                        <td colspan="2" class="th border-r" style="background-color: #00b0f0;"><span class="l5">FBA保管</span></td>
                        <td colspan="2" class="th border-r" style="background-color: #c4e759;"><span class="l5">FBA納品</span></td>
                        <td colspan="2" class="th " style="background-color: #00b050;"><span class="l5">振込</span></td>
                    </tr>
                    <tr>
                        <td class="red"><span class="l5">月額登録料：</span></td>
                        <td class="red r border-r"><span class="r5">-99999円</span></td>
                        <td><span class="l5">保管手数料：</span></td>
                        <td class="r border-r"><span class="r5">-999999円</span></td>
                        <td><span class="l5">2023/1/23</span></td>
                        <td class="r border-r"><span class="r5">-9999円</span></td>
                        <td><span class="l5">2023/1/23</span></td>
                        <td class="r "><span class="r5">-9999円</span></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="th border-r" style="background-color: #c8ffff;"><span class="l5">注文</span></td>
                    
                        <td><span class="l5">長期保管手数料：</span></td>
                        <td class="r border-r"><span class="r5">-999999円</span></td>
                        <td><span class="l5">2023/1/23</span></td>
                        <td class="r border-r"><span class="r5">-9999円</span></td>
                        <td><span class="l5">2023/1/2</span></td>
                        <td class="r "><span class="r5">-9999円</span></td>
                    </tr>
                    <tr>
                        <td><span class="l5">注文数量：</span></td>
                        <td class="r border-r"><span class="r5">99999個</span></td>
                        <td></td>
                        <td class="border-r"></td>
                        <td><span class="l5">2023/1/23</span></td>
                        <td class="r border-r"><span class="r5">-9999円</span></td>
                      
                        <td><span class="l5">2023/1/23</span></td>
                        <td class="r"><span class="r5">-9999円</span></td>
                    </tr>
                    <tr>
                        <td><span class="l5">注文売上：</span></td>
                        <td class="r border-r"><span class="r5">99999個</span></td>
                        <td class="red"><span class="l5">保管費用：</span></td>
                        <td class="red r border-r" ><span class="r5">-999999円</span></td>
                        <td><span class="l5">2023/1/23</span></td>
                        <td class="r border-r"><span class="r5">-9999円</span></td>
                        <td class="red"><span class="l5">振込金額：</span></td>
                        <td class="red r "><span class="r5">-9999円</span></td>
                    </tr>
              
                    <tr>
                        <td><span class="l5">配送料：</span></td>
                        <td  class="r border-r"><span class="r5">99999999円</span></td>
                        <td colspan="2" class="th border-r" style="background-color: #8db4e2;"><span class="l5">FBA作業</span></td>
                      
                        <td><span class="l5">2023/1/23</span></td>
                        <td  class="r border-r"><span class="r5">99999999円</span></td>
                        <td colspan="2" class="th " style="background-color: #ffff64;"><span class="l5">返品</span></td>
                       
                    </tr>
                    <tr>
                        <td><span class="l5">包装料：</span></td>
                        <td  class="r border-r"><span class="r5">99999999円</span></td>
                        <td><span class="l5">返送手数料：</span></td>
                        <td class="r border-r"><span class="r5">99999999円</span></td>
                        <td><span class="l5">2023/1/23</span></td>
                        <td class="r border-r"><span class="r5">99999999円</span></td>
                        <td><span class="l5">返品数量：</span></td>
                        <td class="r"><span class="r5">99999999円</span></td>
                    </tr>
                    <tr>
                        <td><span class="l5">販売手数料：</span></td>
                        <td class="r border-r"><span class="r5">-99999999円</span></td>
                        <td><span class="l5">廃棄手数料：</span></td>
                        <td class="r border-r"><span class="r5">-99999999円</span></td>
                        <td><span class="l5">2023/1/23</span></td>
                        <td class="r border-r"><span class="r5">-99999999円</span></td>
                        <td><span class="l5">返品金額：</span></td>
                        <td class="r "><span class="r5">-99999999円</span></td>
                    </tr>
                    <tr>
                        <td><span class="l5">FBA手数料：</span></td>
                        <td class="r border-r"><span class="r5">-99999999円</span></td>
                        <td class="red"><span class="l5">保管費用：</span></td>
                        <td class="red r border-r"><span class="r5">-99999999円</span></td>
                        <td></td>
                        <td class="border-r"></td>
                        <td><span class="l5">返品作業手数料：</span></td>
                        <td class="r "><span class="r5">-99999999円</span></td>
                    </tr>
                    <tr>
                        <td><span class="l5">ポイント費用：</span></td>
                        <td class="r border-r"><span class="r5">-99999999円</span></td>
                        <td colspan="2" class="th border-r" style="background-color: #b1a0c7;"><span class="l5">広告費用</span></td>
                       
                        <td></td>
                        <td class="border-r"></td>
                        <td><span class="l5">返金調整額：</span></td>
                        <td class="r "><span class="r5">-99999999円</span></td>
                    </tr>
                    <tr>
                        <td><span class="l5">その他料金：</span></td>
                        <td class="r border-r"><span class="r5">-99999999円</span></td>
                        <td><span class="l5">広告費用：</span></td>
                        <td class="r border-r"><span class="r5">-99999999円</span></td>
                        <td></td>
                        <td class="border-r"></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="red"><span class="l5">注文粗利益：</span></td>
                        <td class="red r border-r"><span class="r5">-99999999円</span></td>
                        <td class="red"><span class="l5">広告費用：</span></td>
                        <td class="red r border-r"><span class="r5">-99999999円</span></td>
                        <td class="red"><span class="l5">納品物流費用：</span></td>
                        <td class="red r border-r"><span class="r5">-99999999円</span></td>
                        <td class="red"><span class="l5">返品損失</span></td>
                        <td class="red r"><span class="r5">-99999999円</span></td>
                    </tr>
                </tbody>
            </table>
        </div>

        
        <!--  -->
        <div style="border-bottom: 1px solid black;border-right: 1px solid black;border-left: 1px solid black; margin-top: 10px;">

         
            <table class="table_inputdialog" width="100%" border="0"  >
                <tbody>
                    <tr>
                        <td colspan="3" class="th border-r" style="background-color: #ff6464;"><span class="l5">仕入</span></td>
                        <td colspan="3" class="th  " style="background-color: #ffc000;"><span class="l5">その他支出</span></td>
      
                    </tr>
                    <tr>
                        <td style="width:170px;" ><span class="l5">2023/1/23</span></td>
                        <td style="width:230px;"  ><span >XXXXXXXXXXXXXX</span></td>
                        <td class="border-r r" style="width:300px;"><span class="r5">-99999円/-9999円/-9999円</span></td>
                        <td  style="width:170px;"><span class="l5">2023/1/23</span></td>
                        <td  style="width:230px;" ><span >XXXXXXXXXXXXXX</span></td>
                        <td  style="width:300px;"class="  r"><span class="r5">-99999円/-9999円/-9999円</span></td>
                    </tr>  
                     <tr>
                        <td ><span class="l5">2023/1/23</span></td>
                        <td  ><span >XXXXXXXXXXXXXX</span></td>
                        <td class="border-r r"><span class="r5">-99999円/-9999円/-9999円</span></td>
                        <td ><span class="l5">2023/1/23</span></td>
                        <td  ><span >XXXXXXXXXXXXXX</span></td>
                        <td class=" r"><span class="r5">-99999円/-9999円/-9999円</span></td>
                    </tr>
                    <tr>
                        <td ><span class="l5">2023/1/23</span></td>
                        <td  ><span >XXXXXXXXXXXXXX</span></td>
                        <td class="border-r r"><span class="r5">-99999円/-9999円/-9999円</span></td>
                        <td ><span class="l5">2023/1/23</span></td>
                        <td  ><span >XXXXXXXXXXXXXX</span></td>
                        <td class="  r"><span class="r5">-99999円/-9999円/-9999円</span></td>
                    </tr>
                    <tr>
                        <td ><span class="l5">2023/1/23</span></td>
                        <td  ><span >XXXXXXXXXXXXXX</span></td>
                        <td class="border-r r"><span class="r5">-99999円/-9999円/-9999円</span></td>
                        <td ><span class="l5">2023/1/23</span></td>
                        <td  ><span >XXXXXXXXXXXXXX</span></td>
                        <td class="  r"><span class="r5">-99999円/-9999円/-9999円</span></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td class="border-r r"></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="red"><span class="l5">仕入費用：</span></td>
                        <td  ></td>
                        <td class="r border-r"><span class="r5">-99999円/-9999円/-9999円</span></td>
                        <td class="red"><span class="l5">その他支出：</span></td>
                        <td ></td>
                        <td class=" r"><span class="r5">-99999円/-9999円/-9999円</span></td>
                    </tr>
                </tbody>
            </table>
        </div>
        </div>
    </div>