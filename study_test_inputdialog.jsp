<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="study_test_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var study_test_inputdialog = null;
            $(function () {
                study_test_inputdialog = $("#study_test_inputdialog").dialog({
                    title: "テスト新規",
                    autoOpen: false,
                    resizable: true,
                    height: 1070,
                    width: 1600,
                    modal: true,
                    open: function () {
                        setTimeout(function () { });
                    },
                    close: function () {
                        setTimeout(function () { });
                    },
                });
                   // 初始化所有加号图标
                $('.addicon').on('click', function() {
                    toggleTable(this);
                }); 
                $('.contentimg').on('click', function() {
                    move('1');
                });
                $('.contentimg2').on('click', function() {
                    move('2');
                });
            });

          
        </script>
        <style>
           table {  
                border-spacing: 0 0px;  
                border-collapse: separate; /* 与border-spacing一起使用时需明确指定 */  
            } 
            .contentimg{
                width: 100px;
                height: 100px;
            }
            .contentimg2{
                width: 100px;
                height: 100px;
            }
            .stacked-img {
                display: block;
                
             }
            
             .imgcss {
                display:inline-block;
                text-align: center; /* 使内部的块级元素水平居中 */
            }

            .imgcss img:first-child {
                width: 80px;
                height: 80px;
            }

            .imgcss img:last-child {
                width: 20px;
                height: 20px;
                display: block;
                margin: 0 auto; /* 使此图片水平居中 */
            }
        </style>

    <div style="margin: 10px;">
        <table class="table_inputdialog table_inputdialog1" border="0" padding="0">
            <tbody> 
                <tr>
                    <td style="width: 150px;">学年：</td>
                    <td style="width: 205px;">
                        <select style="width: 200px;" id="opt_academicyear">
                            <option value=""></option>
                            <option value="01.中1-上期">01.中1-上期</option>
                            <option value="02.中1-下期">02.中1-下期</option>
                            <option value="03.中2-上期">03.中2-上期</option>
                            <option value="04.中2-下期">04.中2-下期</option>
                            <option value="05.中3-上期">05.中3-上期</option>
                            <option value="06.中3-下期">06.中3-下期</option>
                            <option value="07.中1-上期">07.中1-上期</option>
                            <option value="08.中1-下期">08.中1-下期</option>
                            <option value="09.中2-上期">09.中2-上期</option>
                            <option value="10.中2-下期">10.中2-下期</option>
                            <option value="11.中3-上期">11.中3-上期</option>
                            <option value="12.中3-下期">12.中3-下期</option>
                        </select></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>名称：</td>
                    <td colspan="3"><input type="text" style="width: 460px;" id="text_name"></input></td>
                </tr>

                <tr>
                    <td>期間：</td>
                    <td><input type="date" style="width: 200px;" id="text_from"></input></td>
                    <td style="width: 50px;text-align: center;">～</td>
                    <td><input type="date" style="width: 200px;" id="text_to"></input></td>
                </tr>

                <tr style="height: 120px;">
                    <td>内容：</td>
                    <td colspan="3"  >
                        <div class="imgcss">
                            <img src="img\delete.png" ></img>
                           <img src="img\jian.png" onclick="deleteimg(this)"></img>
                        </div>
                        <img src="img\zhaoxiang.png" class="contentimg" id="td_content1"></td> 
                </tr> 
            </tbody>
        </table>
        <!--総合成績  -->
        <table class="table_inputdialog table_inputdialog2" border="0"  padding="0" style="border-top: 1px dashed black;">
            <tbody> 
                <tr style="background-color: D9E1F4;">
                    <td style="width: 150px;" > <img src="img\right.png"  onclick="lessen(this)" width="20" height="20" style="vertical-align: middle;" > 科目：</td>
                    <td style="width: 220px;">総合成績</td>
                    <td style="width:  30px;"></td>
                    <td style="width: 300px;"></td>
                    <td style="width: 180px;"></td>
                    <td style="width: 220px;"></td>
                    <td style="width:  30px;"></td>
                    <td></td>
                </tr>
                <tr style="height: 20px;">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr> 
                <tr>
                    <td>得点：</td>
                    <td>
                        <input type="text" style="width: 200px;" id="text_score1"></input>
                    </td>
                    <td> / </td>
                    <td> <input type="text" style="width: 200px;" id="text_score2"></input></td> 
                    <td></td>  
                    <td></td>
                    <td></td>
                    <td></td>
                </tr> 
                <tr>
                    <td>学級平均点：</td>
                    <td>
                        <input type="text" style="width: 200px;" id="text_classaverage"></input>
                    </td>
                    <td></td>
                    <td></td>
                    <td>学年平均点：</td>
                    <td>
                        <input type="text" style="width: 200px;" id="text_yearaverage"></input>
                    </td>
                    <td></td>
                    <td></td>
                </tr> 
                <tr>
                    <td>学級順位：</td>
                    <td>
                        <input type="text" style="width: 200px;" id="text_classranking1"></input>
                    </td>
                    <td> / </td>
                    <td > <input type="text" style="width: 200px;" id="text_classranking2"></input></td>  
                    <td >学年順位：</td>
                    <td>
                         <input type="text" style="width: 200px;" id="text_yearranking1"></input>
                    </td>
                    <td> /&nbsp;&nbsp;</td>
                    <td> <input type="text" style="width: 200px;" id="text_yearranking2"></input></td> 
                </tr>
                <tr style="height: 20px;">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr> 
            </tbody>
        </table>
        <!-- 单科 -->
        <table class="table_inputdialog table_inputdialog3" border="0"  padding="0" style="border-top: 1px dashed black;">
            <tbody> 
                <tr style="background-color: E3F2D9;">
                    <td style="width: 150px;" > <img src="img\right.png"  onclick="lessen(this)"   width="20" height="20" style="vertical-align: middle;"> 科目：</td>
                    <td style="width: 220px;">
                        <select style="width: 200px;" id="opt_subject">
                             <option value=""></option>
                             <option value="0.総合">0.総合</option>
                             <option value="1.国語">1.国語</option>
                             <option value="2.数学">2.数学</option>
                             <option value="3.英語">3.英語</option>
                             <option value="4.理科">4.理科</option>
                             <option value="5.社会">5.社会</option>
                             <option value="6.地理">6.地理</option>
                             <option value="7.歴史">7.歴史</option>
                        </select></td>
                    <td style="width: 30px;"><img src="img\jia.png"  class="addicon" width="30" height="30"></td>
                    <td style="width: 300px;"></td>
                    <td style="width: 180px;"></td>
                    <td style="width: 220px;"></td>
                    <td style="width: 30px;"></td>
                    <td></td>
                </tr>
                <tr style="height: 20px;">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr> 
                <tr style="height: 120px;">
                    <td>内容：</td>
                    <td id="td_content4" colspan="7">
                        <div class="imgcss">
                             <img src="img\delete.png" class="imgsign"></img>
                            <img src="img\jian.png" onclick="deleteimg(this)"></img>
                        </div>
                        <div class="imgcss">
                            <img src="img\delete.png" class="imgsign"></img>
                           <img src="img\jian.png" onclick="deleteimg(this)"></img>
                       </div>
                        <img src="img\zhaoxiang.png" class="contentimg"></img>
                    </td>
                
                </tr>

                <tr style="height: 120px;">
                    <td> 内容(クリア)：</td>
                    <td id="td_content5"  colspan="7">
                        <div class="imgcss">
                            <img src="img\delete.png" class="imgsign"></img>
                           <img src="img\jian.png" onclick="deleteimg(this)"></img>
                       </div>
                       <div class="imgcss">
                           <img src="img\delete.png" class="imgsign"></img>
                          <img src="img\jian.png" onclick="deleteimg(this)"></img>
                      </div>
                      <img src="img\zhaoxiang.png" class="contentimg2"></td>
                   
                </tr>

                <tr>
                    <td>得点：</td>
                    <td><input type="text" style="width: 200px;" id="text_score3"></input></td>
                    <td>/</td>
                    <td><input type="text" style="width: 200px;" id="text_score4"></input></td> 
                    <td></td>  
                    <td></td>
                    <td></td>
                    <td></td>
                </tr> 
                <tr>
                    <td>学級平均点：</td>
                    <td><input type="text" style="width: 200px;" id="text_classaverage2"></input></td>
                    <td></td>
                    <td></td>
                    <td>学年平均点：</td>
                    <td><input type="text" style="width: 200px;" id="text_yearaverage2"></input></td>
                    <td></td>
                    <td></td>
                </tr> 
                <tr>
                    <td>学級順位：</td>
                    <td><input type="text" style="width: 200px;" id="text_classranking3"></input></td>
                    <td>/</td>
                    <td> <input type="text" style="width: 200px;" id="text_classranking4"></input></td>  
                    <td>学年順位：</td>
                    <td><input type="text" style="width: 200px;" id="text_yearranking3"></input></td>
                    <td>/&nbsp;&nbsp;</td>
                    <td><input type="text" style="width: 200px;" id="text_yearranking4"></input></td> 
                </tr> 
                <tr style="height: 20px;">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr> 
            </tbody>
        </table>

        <table class="table_inputdialog_btn" border="0" style="border-top: 1px dashed black;">
            <tbody>
                <tr>
                    <td style="width: 650px;"><input type="hidden" id="opt"></input></td>
                    <td style="width: 200px;"><button class="btn" id="btn_login" data-tags="table_inputdialog3" onclick="tablelist()">登　録</button></td>
                    <td style="width: 200px;"><button class="btn" onclick="cel()">キャンセル</button></td>
                    <td style="width: 650px;"></td>
                </tr>
            </tbody>
        </table>

    </div>
    </div>