<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


            <div CLASS="dialog" ID="information_inputdialog" style="display:none;"> 
            <SCRIPT>
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
        
            
        
            </SCRIPT>
            <style>
                :root {
                    --width: 1920px;
                }

                * {
                    margin: 0;
                    letter-spacing: 3px;
                }
/* 
                .head {
                    width: var(--width);
                    height: 60px;
                    background-color: rgb(178, 178, 240);
                    color: aliceblue;
                }

                .hleft {
                    float: left;
                    width: 50%;
                    height: 60px;
                }

                .hright {
                    float: right;
                    width: 30%;
                    height: 60px;
                }

                .hright_r {
                    float: right;
                    margin-right: 57.6px;
                    margin-top: 21px;
                    width: 90px;
                    height: 30px;
                    border: 0;
                    border-radius: 20px;
                }

                .hright_l {
                    float: left;
                    line-height: 30px;
                }

                /* topnav */
                .topnav {
                    width: var(--width);
                    line-height: 43px;
                    height: 43px;
                    background: rgb(233, 229, 173);
                }

                .topnav p {
                    text-indent: 2.5em;

                }



                /* c_query */
                .c_query {
                    width: var(--width);
                    /* height: 216px; */
                }

                .c_q_nav {
                    width: 95%;
                    margin-top: 30px;
                    line-height: 66px;
                    border-collapse: collapse;
                    /* display: inline-block; */
                }

                .one td {
                    width: 13%;
                }

                .two input:not(:first-child) {
                    margin-left: 40px;
                }

                /* info */
                .info {
                    width: 95%;
                    margin: auto;
                    margin-top: 20px;

                }

                .info th {
                    height: 45px;
                    border: 1px solid black;
                    background-color:#f6f6f6;
                }

                .three td {
                    height: 65px;
                }

                .info div {
                    width: 100px;
                    height: 30px;
                    border: 1px solid whitesmoke;
                    border-radius: 20px;
                    box-shadow: 2px 2px 1px #888888;
                }

              */

                /* detail */
                .detail {
                    width: 1000px;
                    /* height: 520px; */
                    position: absolute;
                    left: 40%;
                    top: 50%;
                    margin-top: -200px;
                    /* 高度的一半 */
                    margin-left: -300px;
                    background: #ffffff;
                    border: 1px solid black;

                }

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
                }

                input[type="text"] {
                    border: 1px solid black;
                }
                .btn {
                    width: 160px;
                    height: 50px;
                    background: rgb(253, 253, 253);
                    font-size: 20px;
                    border: 1px solid rgb(206, 205, 205);
                    box-shadow: 5px 5px 2px #888888;
                }

                /* number */
                .number {
                    width:100%;
                    text-align: center;
                    border-collapse: collapse;
                    line-height: 30px;
                }
                .footbtn{
                    width: 100%;
                    height: 80px;
                }
                .footbtn tr{
                    line-height: 60px;
                }
                .footbtn td{
                    width: 25%;
                  
                }
            </style>
 
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


