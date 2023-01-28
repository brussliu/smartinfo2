<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="earnings_detail_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var earnings_detail_inputdialog = null;
            $(function () {
                earnings_detail_inputdialog = $("#earnings_detail_inputdialog").dialog({
                    title: "売上詳細情報",
                    autoOpen: false,
                    resizable: true,
                    height: 830,
                    width: 1340,
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
             .div_tab{
                 display: inline-block;
                 width: 320px;
                 height: 430px;
                 
                 border-right: 1px solid black;
                 border-bottom: 1px solid black;
             }
             .div_tab div{
                border-top: 1px solid black;
             }
             .div_tab p{
                 line-height: 36px;
             }
             .div_tab p:first-child span{
                margin-left: 14px;
                line-height: 36px;
                font-weight: bolder;
             }
             .div_tab p:last-child span:first-child{
                margin-left: 14px;
                float: left;
                color: red;
             }
             .div_tab p:last-child span:last-child{
                margin-right: 14px;
                float: right;
                color: red;
             }

             .div_tab table{
                 width: 100%;
                 overflow-y: auto;
             }
             .div_tab table tr td{
                line-height: 36px;
                height: 36px;
                padding: 0;
             }
             .div_tab table tr td:first-child{
                text-align: left;
                 
             }
             .div_tab table tr td:first-child span{
                margin-left: 10px;
                 
             }
             .div_tab table tr td:last-child{
                text-align: right;
               
             }
             .div_tab table tr td:last-child span{
                margin-right: 10px;
                 
             }

             .div_tab ::-webkit-scrollbar {
                width: 4px;
             }
             .div_tab ::-webkit-scrollbar-thumb {
                border-radius: 10px;
                -webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
                background: rgba(0, 0, 0, 0.2);
             }

             .div_tab ::-webkit-scrollbar-track {
                -webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
                border-radius: 0;
                background: rgba(0, 0, 0, 0.1);
             } */

        </style>

        <div style="margin: 10px;">
            <p style="line-height: 40px;font-weight: bold;"><span>YYYY年MM月</span></p>
            <!-- 上部 -->
            <div class="div_tab" style="border-left: 1px solid black;">
                <div>
                    <p  style="background-color: #fabf8f;"><span>登録料</span></p>
                    <div style="height:78px;overflow-y: hidden;">
                        <table  >
                            <tbody>
                            <tr>
                                <td><span>月額登録料：</span></td>
                                <td><span>-99999円</span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <p ><span >月額登録料：</span><span  >-99999円</span></p>
                </div>
               <div>
                    <p  style="background-color:#c4e759;"><span>FBA納品</span></p>
                    <div style="height: 192px;overflow-y: auto;">
                        <table >
                            <tbody>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>-99999999円</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <p ><span >納品物流費用：</span><span  >-99999円</span></p>
                </div>
            </div><div class="div_tab"><!-- 2 -->
                <div>
                    <p  style="background-color: #00b0f0;"><span >FBA保管</span></p>
                    <div style="height:78px;overflow-y: hidden;">
                        <table>
                            <tbody>
                                <tr>
                                    <td><span>保管手数料：</span></td>
                                    <td><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span>長期保管手数料：</span></td>
                                    <td><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td> </td>
                                    <td> </td>
                                </tr>  
                            </tbody>
                        </table>
                    </div>
                    <p ><span >保管費用：</span><span  >-99999円</span></p>
                </div>
                <div>
                    <p  style="background-color: #8db4e2;"><span>FBA作業</span></p>
                    <div style="height:78px;overflow-y: hidden;">
                        <table  >
                            <tbody>
                            <tr>
                                <td><span>返送手数料：</span></td>
                                <td><span>-99999999円</span></td>
                            </tr>
                            <tr>
                                <td><span>廃棄手数料：</span></td>
                                <td><span>-99999999円</span></td>
                            </tr>
                            
                            </tbody>
                        </table>
                    </div>
                    <p ><span >保管費用：</span><span  >-99999円</span></p>
                </div>
                <div>
                    <p  style="background-color: #b1a0c7;"><span>広告費用：</span></p>
                    <div style="height:40px;overflow-y: hidden;">
                        <table  >
                            <tbody>
                            <tr>
                                <td><span>広告費用：</span></td>
                                <td><span>-99999999円</span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <p ><span >広告費用：</span><span  >-99999円</span></p>
                </div>
            </div><div class="div_tab"> <!-- 3 -->
                <div>
                    <p  style="background-color:#c8ffff;"><span >注文</span></p>
                    <div style="height: 344px;overflow-y: hidden;">
                        <table >
                            <tbody>
                                <tr>
                                    <td><span >注文数量：</span></td>
                                    <td ><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span>注文売上：</span></td>
                                    <td><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span>配送料：</span></td>
                                    <td><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span>包装料：</span></td>
                                    <td><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span>販売手数料：</span></td>
                                    <td><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span>FBA手数料：</span></td>
                                    <td><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span>ポイント費用：</span></td>
                                    <td><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span>その他料金：</span></td>
                                    <td><span>-99999999円</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <p ><span >注文粗利益：</span><span  >-99999円</span></p>
                </div>

                <!-- <div>
                    <p  style="background-color:#c4e759;"><span>FBA納品</span></p>
                    <div style="height: 420px;overflow-y: auto;">
                        <table >
                            <tbody>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>-99999999円</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <p ><span >納品物流費用：</span><span  >-99999円</span></p>
                </div> -->
            </div><div class="div_tab"><!-- 4 -->
                <div>
                    <p  style="background-color:#00b050;"><span>振込</span></p>
                    <div style="height: 116px;overflow-y: auto;">
                        <table >
                            <tbody>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>-99999999円</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <p ><span >振込金額：</span><span  >-99999円</span></p>
                </div>
                <div>
                    <p  style="background-color:#ffff64;"><span>返品</span></p>
                    <div style="height: 154px;overflow-y: auto;">
                        <table >
                            <tbody>
                                <tr>
                                    <td><span >返品数量：</span></td>
                                    <td ><span>-99999999円</span></td>
                                </tr>
                                <tr>
                                <td><span >返品金額：</span></td>
                                <td ><span>-99999999円</span></td>
                            </tr>
                            <tr>
                                <td><span >返品作業手数料：</span></td>
                                <td ><span>-99999999円</span></td>
                            </tr>
                            <tr>
                                <td><span >返金調整額：</span></td>
                                <td ><span>-99999999円</span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <p ><span >返品損失：</span><span  >-99999円</span></p>
                </div>
            </div>


            <!-- 下部 -->
            <div class="div_tab" style="border-left: 1px solid black;width: 641px;height: 245px;margin-top: 5px;"> 
                <div>
                    <p  style="background-color:#ff6464;"><span>仕入</span></p>
                    <div style="height: 160px;overflow-y: auto;">
                        <table >
                            <tbody>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>XXXXXXXXXXXXXX</span></td>
                                    <td ><span>-99999円/-9999円/-9999円</span></td>
                                </tr>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>XXXXXXXXXXXXXX</span></td>
                                    <td ><span>-99999円/-9999円/-9999円</span></td>
                                </tr>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>XXXXXXXXXXXXXX</span></td>
                                    <td ><span>-99999円/-9999円/-9999円</span></td>
                                </tr>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>XXXXXXXXXXXXXX</span></td>
                                    <td ><span>-99999円/-9999円/-9999円</span></td>
                                </tr>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>XXXXXXXXXXXXXX</span></td>
                                    <td ><span>-99999円/-9999円/-9999円</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <p ><span >仕入費用：</span><span  >-99999円/-9999円/-9999円</span></p>
                </div>
            </div><div class="div_tab" style="width: 641px;height: 245px;margin-top: 5px;"> 
                <div>
                    <p  style="background-color:#ffc000;"><span>その他支出</span></p>
                    <div style="height: 160px;overflow-y: auto;">
                        <table >
                            <tbody>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>XXXXXXXXXXXXXX</span></td>
                                    <td ><span>-99999円/-9999円/-9999円</span></td>
                                </tr>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>XXXXXXXXXXXXXX</span></td>
                                    <td ><span>-99999円/-9999円/-9999円</span></td>
                                </tr>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>XXXXXXXXXXXXXX</span></td>
                                    <td ><span>-99999円/-9999円/-9999円</span></td>
                                </tr>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>XXXXXXXXXXXXXX</span></td>
                                    <td ><span>-99999円/-9999円/-9999円</span></td>
                                </tr>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>XXXXXXXXXXXXXX</span></td>
                                    <td ><span>-99999円/-9999円/-9999円</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <p ><span >その他支出：</span><span  >-99999円/-9999円/-9999円</span></p>
                </div>
            </div>
         </div>
         
    </div>
