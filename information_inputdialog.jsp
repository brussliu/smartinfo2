<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


            <div class="dialog" id="information_inputdialog" style="display:block;"> 
            <script>
                var information_inputdialog = null;
                $(function() {
                    information_inputdialog = $("#information_inputdialog").dialog({
                        title : "マスタ情報管理",
                        autoOpen : false,
                        resizable : false,
                        // height : 600,
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
            
            <div class="detail" id="detail">
                <div>

                    <h2 style="background-color: #b2b2f0;color: aliceblue;">マスタ詳細情報</h2>

                </div>
                <div style="width: 95%;height: 85%;margin: 20px;">

                    <table class="number">
                        <thead>
                            <tr>
                                <th>ASIN番号</th>
                                <th>SKU番号</th>
                                <th>LABEL番号</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>XXX</td>
                                <td>XXX</td>
                                <td>XXX</td>
                            </tr>
                        </tbody>
                    </table>

                    <table class="d2" width="100%" id="d2">
                        <tbody>
                            <tr>
                                <td style="width: 14%;">商品種別 </td>
                                <td style="width: 18%;">
                                    <select>
                                        <option value=""></option>
                                    </select>
                                </td>
                                <td style="width:18%;"><input type="text"></input></td>
                                <td style="width:12%;"></td>
                                <td style="width:12%;"></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td style="width: 12%;">商品管理番号</td>
                                <td>
                                    <select>

                                    </select>
                                </td>
                                <td><input type="text"></input></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    親子区分
                                </td>
                                <td>子商品</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    分類①
                                </td>
                                <td> <input type="text"></input></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    分類②
                                </td>
                                <td> <input type="text"></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>仕入価格</td>
                                <td> <input type="text"> </input></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    商品名称
                                </td>
                                <td colspan="4"> <input type="text" style="width: 740px;"></input></td>
                            </tr>

                        </tbody>
                    </table>

                            <table class="footbtn">
                                <tbody>
                               <tr>
                                <td></td>
                                <td></td>
                                <td><button class="btn">保存</button></td>
                                <td><button class="btn" onclick="cel()">キャンセル</button></td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>


        </div>


