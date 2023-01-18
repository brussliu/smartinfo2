<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <div class="dialog" id="masterinfo_inputdialog" style="display:block;"> 
            <script>
                var masterinfo_inputdialog = null;
                $(function() {
                    masterinfo_inputdialog = $("#masterinfo_inputdialog").dialog({
                        title : "マスタ詳細情報",
                        autoOpen : false,
                        resizable : false,
                        height : 600,
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

                /* detail */
                /* .detail {
                    width: 1000px;
                    position: absolute;
                    left: 40%;
                    top: 50%;
                    margin-top: -200px;
                    margin-left: -300px;
                    background: #ffffff;
                    border: 1px solid black;

                } */

                .d2 {
                    margin-top: 20px;
                    border-top: 1px solid black;
                    padding-top: 20px;
                }

                .d2 tr {
                    line-height: 40px;
                }

                .d2 select {
                    width: 140px;
                    height: 30px;
                }

                .d2 input {
                    width: 140px;
                    height: 30px;
                } */

                /* input[type="text"] {
                    border: 1px solid black;
                } */


                /* number */
                .nb {
                    
                    text-align: center;
                    border-collapse: collapse;
                    line-height: 30px;
                    border: 1px;
                }

                .footbtn {
                    width: 100%;
                    height: 80px;
                }

                .footbtn tr {
                    line-height: 60px;
                }

                .footbtn td {
                    width: 25%;

                }
            </style>
            <div id="detailinfo">
                <div style="width: 95%;height: 95%;margin: 10px;">
                    <table >
                        <tbody>
                            <tr>
                                <th style="width: 120px;text-align: left;background-color: #888888">ASIN番号</th>
                                <td style="width: 160px;">B089WGVH9V</td>
                                <th style="width: 120px;text-align: left;background-color: #888888">SKU番号</th>
                                <td style="width: 160px;">H2-E3RM-NID1</td>
                                <th style="width: 120px;text-align: left;background-color: #888888">LABEL番号</th>
                                <td style="width: 160px;">X000UXRHRV</td>
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


