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
                    width: 1380,
                    modal: true,
                    open: function () {
                        setTimeout(function () { });
                    },
                    close: function () {
                        setTimeout(function () { });
                    },
                });
            });

        function showaddmonthlyfee(txt1,txt2){
            $("#span_advertising").html(txt1);
            $("#span_allAdvertising").html(txt1);
            $("#span_monthlyfee").html(txt2);
            $("#span_allMonthlyfee").html(txt2);
            
        }

        function showyearmonth(txt){
             $("#span_no").html(txt);
        }

        function showearnings(txt1,txt2,txt3,txt4,txt5,txt6,txt7,txt8,txt9,txt10){
			$("#span_orderCount").html(txt1);
			$("#span_orderEarnings").html(txt2);
			$("#span_shipFee").html(txt3);
			$("#span_packFee").html(txt4);
			$("#span_saleFee").html(txt5);
			$("#span_fbaFee").html(txt6);
			$("#span_pointFee").html(txt7);
            $("#span_discountFee").html(txt8);
			$("#span_otherFee").html(txt9);
			$("#span_allOrder").html(txt10);
		}

        function showreturninfo(txt1,txt2,txt3,txt4,txt5){
			$("#span_ruturnNum").html(txt1);
			$("#span_returnAmount").html(txt2);
			$("#span_ruturnFee").html(txt3);
			$("#span_returnadJust").html(txt4);
            $("#span_allReturn").html(txt5);
		}

        function showfbainfo(txt1,txt2,txt22,txt3,txt4,txt44){
			$("#span_fbaStockFee").html(txt1);
			$("#span_fbaLongtermStockFee").html(txt2);
            $("#span_allCustody").html(txt22);
			$("#span_refund1").html(txt3);
			$("#span_refund2").html(txt4);
            $("#span_allRefund").html(txt44);
		}

        
		function showpurchaseinfo(txt1){
			$("#span_allRemittance").html(txt1);
		}

        function showpurchase(txt1){
			$("#span_purchase").html(txt1);
		}

        function showothers(txt1){
			$("#span_allOthers").html(txt1);
		}

        function showdelivery(txt){
             $("#span_allfbaDel").html(txt);
        }

        
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
            <p style="line-height: 40px;font-weight: bold;"><span id="span_no">YYYY年MM月</span></p>
            <!-- 上部 -->
            <div class="div_tab" style="border-left: 1px solid black;">
                <div>
                    <p  style="background-color: #fabf8f;"><span>登録料</span></p>
                    <div style="height:78px;overflow-y: hidden;">
                        <table  >
                            <tbody>
                            <tr>
                                <td><span>月額登録料：</span></td>
                                <td><span id="span_monthlyfee">-99999円</span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <p ><span >月額登録料：</span><span id="span_allMonthlyfee">-99999円</span></p>
                </div>
               <div>
                    <p  style="background-color:#c4e759;"><span>FBA納品</span></p>
                    <div style="height: 192px;overflow-y: auto;">
                        <table id="tab_fbaDelTable">
                            <tbody>
                                <tr>
                                    <td><span >2023/1/23</span></td>
                                    <td ><span>-99999999円</span></td>
                                </tr>
                               
                            </tbody>
                        </table>
                    </div>
                    <p ><span >納品物流費用：</span><span  id="span_allfbaDel">-99999円</span></p>
                </div>
            </div><div class="div_tab"><!-- 2 -->
                <div>
                    <p  style="background-color: #00b0f0;"><span >FBA保管</span></p>
                    <div style="height:78px;overflow-y: hidden;">
                        <table>
                            <tbody>
                                <tr>
                                    <td><span>保管手数料：</span></td>
                                    <td><span id="span_fbaStockFee">-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span>長期保管手数料：</span></td>
                                    <td><span  id="span_fbaLongtermStockFee">-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td> </td>
                                    <td> </td>
                                </tr>  
                            </tbody>
                        </table>
                    </div>
                    <p ><span >保管費用：</span><span  id="span_allCustody" >-99999円</span></p>
                </div>
                <div>
                    <p  style="background-color: #8db4e2;"><span>FBA作業</span></p>
                    <div style="height:78px;overflow-y: hidden;">
                        <table  >
                            <tbody>
                            <tr>
                                <td><span>返送手数料：</span></td>
                                <td><span id="span_refund1">-99999999円</span></td>
                            </tr>
                            <tr>
                                <td><span>廃棄手数料：</span></td>
                                <td><span  id="span_refund2">-99999999円</span></td>
                            </tr>
                            
                            </tbody>
                        </table>
                    </div>
                    <p ><span >作業費用：</span><span  id="span_allRefund">-99999円</span></p>
                </div>
                <div>
                    <p  style="background-color: #b1a0c7;"><span>広告費用：</span></p>
                    <div style="height:40px;overflow-y: hidden;">
                        <table  >
                            <tbody>
                            <tr>
                                <td><span>広告費用：</span></td>
                                <td><span id="span_advertising">-99999999円</span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <p ><span >広告費用：</span><span   id="span_allAdvertising">-99999円</span></p>
                </div>
            </div><div class="div_tab"> <!-- 3 -->
                <div>
                    <p  style="background-color:#c8ffff;"><span >注文</span></p>
                    <div style="height: 344px;overflow-y: hidden;">
                        <table >
                            <tbody>
                                <tr>
                                    <td><span >注文数量：</span></td>
                                    <td ><span  id="span_orderCount">-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span>注文売上：</span></td>
                                    <td><span  id="span_orderEarnings">-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span>配送料：</span></td>
                                    <td><span  id="span_shipFee">-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span>包装料：</span></td>
                                    <td><span  id="span_packFee">-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span>販売手数料：</span></td>
                                    <td><span  id="span_saleFee">-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span>FBA手数料：</span></td>
                                    <td><span  id="span_fbaFee">-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span>ポイント費用：</span></td>
                                    <td><span  id="span_pointFee">-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span>プロモーション割引：</span></td>
                                    <td><span  id="span_discountFee">-99999999円</span></td>
                                </tr>
                                <tr>
                                    <td><span>その他料金：</span></td>
                                    <td><span  id="span_otherFee">-99999999円</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <p ><span >注文粗利益：</span><span id="span_allOrder">-99999円</span></p>
                </div>

            </div><div class="div_tab"><!-- 4 -->
                <div>
                    <p  style="background-color:#00b050;"><span>振込</span></p>
                    <div style="height: 116px;overflow-y: auto;">
                        <table id="tab_remittance">
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
                    <p ><span >振込金額：</span><span  id="span_allRemittance">-99999円</span></p>
                </div>
                <div>
                    <p  style="background-color:#ffff64;"><span>返品</span></p>
                    <div style="height: 154px;overflow-y: auto;">
                        <table >
                            <tbody>
                                <tr>
                                    <td><span >返品数量：</span></td>
                                    <td ><span id="span_ruturnNum">-99999999円</span></td>
                                </tr>
                                <tr>
                                <td><span >返品金額：</span></td>
                                <td ><span id="span_returnAmount">-99999999円</span></td>
                            </tr>
                            <tr>
                                <td><span >返品作業手数料：</span></td>
                                <td ><span id="span_ruturnFee">-99999999円</span></td>
                            </tr>
                            <tr>
                                <td><span >返金調整額：</span></td>
                                <td ><span id="span_returnadJust">-99999999円</span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <p ><span >返品損失：</span><span  id="span_allReturn">-99999円</span></p>
                </div>
            </div>


            <!-- 下部 -->
            <div class="div_tab" style="border-left: 1px solid black;width: 641px;height: 245px;margin-top: 5px;"> 
                <div>
                    <p  style="background-color:#ff6464;"><span>仕入NO</span></p>
                    <div style="height: 160px;overflow-y: auto;">
                        <table id="tab_purchase" style="font-size:12px">
                            <tbody>
                                <tr>
                                    <td ><span>2023/1/23</span></td>
                                    <td ><span>XXXXXXXXXXXXXX</span></td>
                                    <td ><span>-99999円/-9999円/-9999円</span></td>
                                </tr>
                               
                            </tbody>
                        </table>
                    </div>
                    <p ><span >仕入費用：</span><span  id="span_purchase">-99999円/-9999円/-9999円</span></p>
                </div>
            </div><div class="div_tab" style="width: 641px;height: 245px;margin-top: 5px;"> 
                <div>
                    <p  style="background-color:#ffc000;"><span>その他収入/支出</span></p>
                    <div style="height: 160px;overflow-y: auto;">
                        <table id="tab_others">
                            <tbody>
                                <tr>
                                    <td ><span >2023/1/23</span></td>
                                    <td ><span>XXXXXXXXXXXXXX</span></td>
                                    <td ><span>-99999円/-9999円/-9999円</span></td>
                                </tr>
                               
                            </tbody>
                        </table>
                    </div>
                    <p ><span >その他収入/支出：</span><span  id="span_allOthers">-99999円/-9999円/-9999円</span></p>
                </div>
            </div>
         </div>
         
    </div>
