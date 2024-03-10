<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="scan_instorage_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var scan_instorage_inputdialog = null;
            $(function () {
                scan_instorage_inputdialog = $("#scan_instorage_inputdialog").dialog({
                    title: "在庫変更",
                    autoOpen: false,
                    resizable: true,
                    height: 850,
                    width: 972,
                    modal: true,
                    open: function () {
                        setTimeout(function () { });
                    },
                    close: function () {
                        setTimeout(function () { });
                    },
                });

                $("input:radio[name='type']" ).change(function(){
                    if ($('input[name="type"]:checked').val() != null ) { 
                        $('#btn_implement').attr('disabled', false); // 设置按钮可用
                    } else { 
                        $('#btn_implement').attr('disabled', true);
                    }
                    })
                    
                
            });
          
        </script>
        <style>
            li{
                margin-top: 5px;
            }
        </style>

        <div style="margin: 10px;">
          
            <table class="table_inputdialog" style="height: 40px;" border="0">
                <tbody>
                    <tr>
                        <td style="width: 80px;">リストNO：</td>
                        <td style="width: 200px;" id="td_instorageno"></td>
                        <td style="width: 80px; ">名称：</td>
                        <td style="width: 200px;" id="td_instoragename"></td>
                        <td style="width: 80px; ">合計数量：</td>
                        <td style="width: 120;" id="td_instoragenum"></td>
                    </tr>
                    
                </tbody>
            </table>
            <div style="overflow: hidden;">
                <table class="table_detail_header" style="table-layout: fixed;text-align: center;" border="1">
                    <thead>
                        <tr class="header2">
                            <th style="width: 90px;">商品管理番号</th>
                            <th style="width: 160px;">分類①</th>
                            <th style="width: 160px;">分類②</th>

                            <th style="width: 120px;">ASIN番号</th>
                            <th style="width: 150px;">SKU番号</th>
                            <th style="width: 120px;">LABEL番号</th>
                            <th style="width: 80px;">数量</th>
                           
                        </tr>
                    </thead>
                </table>

            </div>
            <div style="overflow-x: hidden;height: 480px; overflow-y: auto;width: 919px;">
                <table id="instoragetable" class=" table_detail_content2" style="table-layout: fixed;text-align: center;">
                    <tbody> 
                    </tbody>
                </table>

            </div>
            <table class="table_inputdialog_btn" border="0">
                <tbody>
                    <tr>
                        <td>変更種類</td>
                        <td><ul>
                            <li> <input type="radio" id="radio_in" name="type" value="1"  /> LOCAL1-入庫</li>
                            <li> <input type="radio" id="radio_out" name="type" value="2"  /> LOCAL1-出庫</li>
                            <li> <input type="radio" id="radio_1to2" name="type" value="3"  /> LOCAL1⇒LOCAL2-移動</li>
                            <li> <input type="radio" id="radio_2to1" name="type" value="4"  /> LOCAL2⇒LOCAL1-移動</li>
                        </ul></td>
                        <td><input type="hidden" id="opt"></input></td>
                        <td style="width: 200px;"><button class="btn" id="btn_implement" onclick="implement()" disabled>実　　行</button></td>
                        <td style="width: 200px;"><button class="btn" onclick="cancel3()">キャンセル</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>