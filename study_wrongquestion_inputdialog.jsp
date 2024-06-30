<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="study_wrongquestion_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var study_wrongquestion_inputdialog = null;
            $(function () {
                study_wrongquestion_inputdialog = $("#study_wrongquestion_inputdialog").dialog({
                    title: "間違った問題新規",
                    autoOpen: false,
                    resizable: true,
                    height: 700,
                    width: 1350,
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
           table {  
                border-spacing: 0 0px;  
                border-collapse: separate; /* 与border-spacing一起使用时需明确指定 */  
            } 
            .rad{
                /* margin-top: 5px; */
                display: table-cell;
                vertical-align: middle;
            }
            .rspan{
                float: right;
            }
            .lspan{
                margin-left: 100px;
            }
            .title{
                width: 120px;
                color: 6670CB;
            }
        </style>

    <div style="margin: 10px;">
        
        <table class="table_inputdialog" border="0" padding="0">
            <tbody> 
                <tr>
                    <td class="title"><input type="radio" name="question" class="rad"> テスト問題</input></td>
                      <td colspan="5"></td>
                </tr>
                <tr>
                    <td>テスト名称：</td>
                    <td colspan="5"> <input type="text" style="width: 650px;" id="text_name"></input>
                    </td>
                    
                </tr>

                <tr>
                    <td> 科目：</td> 
                    <td style="width: 220px;" colspan="2">
                            <select style="width: 200px;height:30px;border-style: solid;" id="subject"> 
                                    <option value=""></option>
                                    <option value="0.総合">0.総合</option>
                                    <option value="1.国語">1.国語</option>
                                    <option value="2.数学">2.数学</option>
                                    <option value="3.英語">3.英語</option>
                                    <option value="4.理科">4.理科</option>
                                    <option value="5.社会">5.社会</option>
                                    <option value="6.地理">6.地理</option>
                                    <option value="7.歴史">7.歴史</option> 
                            </select>
                    </td> 
                    <td ></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td> 期間：</td>
                    <td>
                        <input type="text" style="width: 100px;" id="text_to"></input>
                    <span style="margin-left: 45px;"> ～ </span>
                    </td>
                    <td><input type="text" style="width: 100px;" id="text_from"></input></td>
                    <td> </td>
                    <td ></td>  <td ></td>  
                </tr>

                <tr>
                    <td>得点：</td>
                    <td colspan="5">
                        <span >88/100</span>
                        <span class="lspan">学級順位:</span><span class="lspan">88/100</span>
                        <span class="lspan">学年順位:</span><span class="lspan">88/100</span>
                    </td>
                   
                </tr>
                <tr>
                    <td>番号：</td>
                    <td><input type="text" id="text_number1" width="100px"></input><span> - </span></td>
                    
                    <td style="width: 220px;"><input type="text" id="text_number2" width="100px"></input><span> - </span></td>
                    
                    <td><input type="text" id="text_number3" width="100px"></input></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td  class="title"><input type="radio" name="question" class="rad"  ><label> その他問題</label></input></td>
                    <td colspan="5"></td>
                </tr>
                <tr>
                    <td>問題出所：</td>
                    <td style="width: 700px;" colspan="5"> <input type="text" style="width: 650px;" id="text_sourceproblem"></input>
                    </td> 
                </tr>
                <tr>
                    <td>科目：</td>
                    <td style="width: 220px;">
                        <select style="width: 200px;height:30px;border-style: solid;" id="subject"> 
                                <option value=""></option>
                                <option value="0.総合">0.総合</option>
                                <option value="1.国語">1.国語</option>
                                <option value="2.数学">2.数学</option>
                                <option value="3.英語">3.英語</option>
                                <option value="4.理科">4.理科</option>
                                <option value="5.社会">5.社会</option>
                                <option value="6.地理">6.地理</option>
                                <option value="7.歴史">7.歴史</option> 
                        </select>
                    </td> 
                    <td colspan="4"></td> 
                </tr>
            </tbody>
        </table>

        <table class="table_inputdialog" border="0"  padding="0" style="border-top: 1px dashed black;">
            <tbody> 
                <tr >
                    <td   class="title"> 【問題情報】</td>
                    <td></td>  <td></td>  
                </tr>
                <tr>
                    <td>内容：</td>
                    <td style="width: 220px;"  id="td_content2"> <img src="img\zhaoxiang.png"   width="100" height="100"> 
                    </td> <td></td>  
                </tr>

                <tr>
                    <td>誤った答え：</td>
                    <td >
                       <input type="text" style="width:200px"></input>
                    </td> <td></td>  
                </tr>
                <tr>
                    <td></td>
                    <td  id="td_content3">
                        <img src="img\zhaoxiang.png"   width="100" height="100"> 
                    </td> <td></td>  
                </tr>
                <tr>
                    <td>誤った原因：</td>
                    <td>
                        <textarea style="width: 400px;height: 100px;" id="text_score1"></textarea>
                    </td> <td></td>  
                </tr> 
                <tr>
                    <td>深い原因：</td>
                    <td>
                        <textarea style="width: 400px;height: 100px;" id="text_score1"></textarea>
                    </td> <td></td>  
                </tr> 
                <tr>
                    <td>正しい答え：</td>
                    <td  id="td_content3">
                       <input type="text" style="width:200px"></input>
                    </td> <td></td>  
                </tr>
                <tr>
                    <td></td>
                    <td  id="td_content3">
                        <img src="img\zhaoxiang.png"   width="100" height="100"> 
                    </td> <td></td>  
                </tr>
                <tr>
                    <td>再計算内容：</td>
                    <td  id="td_content3">
                        <img src="img\zhaoxiang.png"   width="100" height="100"> 
                    </td> <td></td>  
                </tr>
            </tbody>
        </table>
    
        <table class="table_inputdialog_btn" border="0">
            <tbody>
                <tr>
                    <td style="width:400px;"> </td>
                    <td style="width: 200px;" id="btn_login">
                        <button class="btn" id="login" onclick="login()">登　録</button></td>
                     
                    <td style="width: 200px;"><button class="btn" onclick="cel()">キャンセル</button></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>

    </div>
    </div>