<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="study_wrongquestion_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var study_wrongquestion_inputdialog = null;
            $(function () {
                study_wrongquestion_inputdialog = $("#study_wrongquestion_inputdialog").dialog({
                    title: "不正解詳細",
                    autoOpen: false,
                    resizable: true,
                    height: 980,
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
                width: 150px;
                color: 6670CB;
            }
        </style>

    <div style="margin: 10px;">
        
        <table class="table_inputdialog" border="0" padding="0">
            <tbody> 
                <tr style="background-color: E3F2D9;">
                    <td style="width: 150px;">
                        &nbsp;<input type="radio" name="questionType" class="rad" onchange="changeQuersionType();" value="way1"> テスト問題</input>
                    </td>
                    <td></td>
                </tr>
                <tr class="way1" style="display: none;">
                    <td>テスト名称：</td>
                    <td>
                        <select style="width: 560px;height:30px;border-style: solid;" id="testname">
                            <option value=""></option> 
                            <option value="01">01.恩氏製衣</option> 
                        </select>
                    </td>
                </tr>

                <tr class="way1" style="display: none;">
                    <td> 科目：</td> 
                    <td>
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
                </tr>

                <tr class="way1" style="display: none;">
                    <td colspan="2">
                        期間：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>2024/01/01～2024/12/31</span>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        得点：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>888/999</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        学級順位：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>888/999</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        学年順位：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>888/999</span>
                    </td>
                </tr>

                <tr class="way1" style="display: none;">
                    <td>番号：</td>
                    <td>
                        <input type="text" id="text_number1" style="width: 60px;"></input>-
                        <input type="text" id="text_number1" style="width: 60px;"></input>-
                        <input type="text" id="text_number1" style="width: 60px;"></input>
                    </td>
                </tr>
                <tr style="background-color: E3F2D9;">
                    <td style="border-top: 1px solid rgb(255, 255, 240);">
                        &nbsp;<input type="radio" name="questionType" class="rad" onchange="changeQuersionType();" value="way2" checked>その他問題</input>
                    </td>
                    <td style="border-top: 1px solid rgb(255, 255, 240);"></td>
                </tr>
                <tr class="way2">
                    <td>問題出所：</td>
                    <td> <input type="text" style="width: 560px;" id="text_sourceproblem"></input></td> 
                </tr>
                <tr class="way2">
                    <td>科目：</td>
                    <td>
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
                </tr>
                <tr style="height: 10px;">
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>

        <table class="table_inputdialog" border="0"  padding="0" style="border-top: 2px dashed black;">
            <tbody> 
                <tr style="height: 10px;">
                    <td></td>
                    <td colspan="3"></td>
                </tr>
                <tr style="background-color: D9E1F4;">
                    <td class="title"> 【問題情報】</td>
                    <td colspan="3"></td>
                </tr>
                <tr style="height: 120px;">
                    <td>内容：</td>
                    <td id="td_content2" colspan="3"><img src="img\zhaoxiang.png" width="50" height="50"></td>
                </tr>

                <tr>
                    <td style="border-top: 1px dashed gray;">誤った答え：</td>
                    <td style="border-top: 1px dashed gray;"><input type="text" style="width:500px"></input></td>
                    <td style="border-top: 1px dashed gray;">正しい答え：</td>
                    <td style="border-top: 1px dashed gray;"><input type="text" style="width:500px"></input></td>
                </tr>
                <tr style="height: 120px;">
                    <td style="text-align: right;">
                        <img src="img\zhaoxiang.png" width="50" height="50">
                        <br>
                        <img src="img\memo.png" style="margin-top: 5px;" width="50" height="50" onclick="openNote(1);">
                    </td>
                    <td>
                        <div style="overflow: auto;height: 130px;" id="note_area_1">
                            <!-- <img src="img\zhaoxiang.png" width="100" height="100" style="border: 1px solid gray;">
                            <img src="img\zhaoxiang.png" width="100" height="100" style="border: 1px solid gray;">
                            <img src="img\zhaoxiang.png" width="100" height="100" style="border: 1px solid gray;">
                            <img src="img\zhaoxiang.png" width="100" height="100" style="border: 1px solid gray;">
                            <img src="img\zhaoxiang.png" width="100" height="100" style="border: 1px solid gray;"> -->
                        </div>
                    </td>
                    <td style="text-align: right;">
                        <img src="img\zhaoxiang.png" width="50" height="50">
                        <br>
                        <img src="img\memo.png" style="margin-top: 5px;" width="50" height="50" id="memo1" onclick="openNote(2);">
                    </td>
                    <td>
                        <div style="overflow: auto;height: 130px;" id="note_area_2">
                            <!-- <img src="img\zhaoxiang.png" width="100" height="100" style="border: 1px solid gray;">
                            <img src="img\zhaoxiang.png" width="100" height="100" style="border: 1px solid gray;">
                            <img src="img\zhaoxiang.png" width="100" height="100" style="border: 1px solid gray;">
                            <img src="img\zhaoxiang.png" width="100" height="100" style="border: 1px solid gray;">
                            <img src="img\zhaoxiang.png" width="100" height="100" style="border: 1px solid gray;"> -->
                        </div>
                    </td>
                </tr>
                <tr style="height: 120px;">
                    <td style="border-top: 1px dashed gray;width: 150px;">誤った原因：</td>
                    <td style="border-top: 1px dashed gray;width: 560px;"><textarea style="width: 500px;height: 100px;" id="text_score1"></textarea></td>
                    <td style="border-top: 1px dashed gray;width: 150px;">深い原因：</td>
                    <td style="border-top: 1px dashed gray;"><textarea style="width: 500px;height: 100px;" id="text_score1"></textarea></td>
                </tr> 
                <tr>
                    <td style="border-top: 1px dashed gray;">
                        再計算内容：
                    </td>
                    <td style="border-top: 1px dashed gray;" colspan="3" rowspan="2">
                        <div style="overflow: auto;height: 140px;" id="note_area_3">
                            <!-- <img src="img\zhaoxiang.png" width="120" height="120" style="border: 1px solid gray;">
                            <img src="img\zhaoxiang.png" width="120" height="120" style="border: 1px solid gray;">
                            <img src="img\zhaoxiang.png" width="120" height="120" style="border: 1px solid gray;">
                            <img src="img\zhaoxiang.png" width="120" height="120" style="border: 1px solid gray;">
                            <img src="img\zhaoxiang.png" width="120" height="120" style="border: 1px solid gray;"> -->
                            <!-- <img src="img\zhaoxiang.png" width="120" height="120" style="border: 1px solid gray;">
                            <img src="img\zhaoxiang.png" width="120" height="120" style="border: 1px solid gray;">
                            <img src="img\zhaoxiang.png" width="120" height="120" style="border: 1px solid gray;">
                            <img src="img\zhaoxiang.png" width="120" height="120" style="border: 1px solid gray;">
                            <img src="img\zhaoxiang.png" width="120" height="120" style="border: 1px solid gray;">
                            <img src="img\zhaoxiang.png" width="120" height="120" style="border: 1px solid gray;"> -->
                        </div>

                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">
                        <img src="img\zhaoxiang.png" width="50" height="50">
                        <br>
                        <img src="img\memo.png" style="margin-top: 5px;" width="50" height="50" onclick="openNote(3);">
                    </td>
                </tr>
            </tbody>
        </table>
    
        <table class="table_inputdialog_btn" border="0" style="border-top: 1px dashed black;">
            <tbody>
                <tr>
                    <td style="width: 650px;"></td>
                    <td style="width: 200px;"><button class="btn"  onclick="tablelist()">保存</button></td>
                    <td style="width: 200px;"><button class="btn" onclick="cel()">キャンセル</button></td>
                    <td style="width: 650px;"></td>
                </tr>
            </tbody>
        </table>

    </div>
    </div>