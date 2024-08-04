<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>不正解情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <script type="text/javascript" src="js/common.js"></script>
            <style>
                .table_btn td button {
                    width: 100px;
                }
                .hide{
                    display: none;  
                }
               

            </style>
            <script>

                function scrollHead(obj) {
                    var p = $(obj).get(0).scrollLeft;
                    $(".c_detail_header").get(0).scrollLeft = p;
                }

                // 初期化
                // function init() {
                //     Efw('delivery_init');
                // }
                 // CTRL+O
                 $(window).keydown(function(e) {
                    
                    if (e.keyCode == 79 && e.ctrlKey) {

                        outputToExcelFile(); 
                    } 
                });

                // 新規
                function add() {
                    // $("#opt_academicyear").prop('selectedIndex', 0);
                    // $('#text_name').val('');
                    // $('#text_to').val('');
                    // $('#text_from').val('');
                    // $('#td_content1').html(' <img src="img\\zhaoxiang.png"   width="100" height="100"> ');
                   
                    // //    科目 综合成绩
                    // $('#td_content2').html(' <img src="img\\zhaoxiang.png"   width="50" height="50"> ');
                    // $('#td_content3').html(' <img src="img\\zhaoxiang.png"   width="50" height="50"> ');
                    // $('#text_score1').val('');
                    // $('#text_score2').val('');
                    // $('#text_classaverage').val('');
                    // $('#text_yearaverage').val('');
                    // $('#text_classranking1').val('');
                    // $('#text_classranking2').val('');
                    // $('#text_yearranking1').val('');
                    // $('#text_yearranking2').val('');

                    // // 科目 单科
                    // $("#opt_subject").prop('selectedIndex', 0);
                    // $('#td_content4').html(' <img src="img\\zhaoxiang.png"   width="50" height="50"> ');
                    // $('#td_content5').html(' <img src="img\\zhaoxiang.png"   width="50" height="50"> ');
                    // $('#text_score3').val('');
                    // $('#text_score4').val('');
                    // $('#text_classaverage2').val('');
                    // $('#text_yearaverage2').val('');
                    // $('#text_classranking3').val('');
                    // $('#text_classranking4').val('');
                    // $('#text_yearranking3').val('');
                    // $('#text_yearranking4').val('');                  


                    study_wrongquestion_inputdialog.dialog('open');
                }

                // 子画面が閉じる
                function cel() {
                    study_wrongquestion_inputdialog.dialog('close');
                }

                function changeQuersionType(){

                    var way = $("input[name='questionType']:checked").val();

                    if(way == "way1"){
                        $(".way1").show();
                        $(".way2").hide();
                    }
                    if(way == "way2"){
                        $(".way1").hide();
                        $(".way2").show();
                    }

                }
 
                function openNote(flg){

                    const windowFeatures =
                    "toolbar=no," + 
                    "location=no," + 
                    "directories=no," + 
                    "status=no," + 
                    "menubar=no," + 
                    "scrollbars=yes," + 
                    "resizable=yes," + 
                    "width=" + screen.availWidth + "," + 
                    "height=" + screen.availHeight;

                    window.open("study_note.jsp?flg=" + flg, 'fullscreenWindow', windowFeatures);
                }

                function displayNote(flg, closeflg){

                    if(closeflg == true){
                        Efw('study_displaynote',{flg : flg});
                    }

                }

                function deleteNote(obj){

                    var msg1 = "このメモを削除します、宜しいでしょうか？";
                    var msg2 = "このメモを削除したら、回復できません。本当に削除しますか？";

                    if(confirm(msg1) == true){
                        if(confirm(msg2) == true){
                            $(obj).remove();
                        }
                    }
                    
                }
                
                function adddisplaynote(flg, v){
                    if(flg == 3){
                        var pichtml = "<img src='" + v + "' height='135' style='border: 1px solid gray;' onclick='deleteNote(this)' ondblclick='openNote(this)'/>";
                        $("#note_area_" + flg).append(pichtml);

                    }else{
                        var pichtml = "<img src='" + v + "' height='120' style='border: 1px solid gray;' onclick='deleteNote(this)' ondblclick='openNote(this)'/>";
                        $("#note_area_" + flg).append(pichtml);

                    }

                }
            </script>
        </head>
        <!-- onload="init();" -->
        <body>
            <efw:Part path="study_wrongquestion_inputdialog.jsp" />
            <div>
                <div class="head">
                    <div class="hleft">
                        <h1 style="height: 80px;line-height: 80px;margin-left:40px;">SmartInfo 2.0</h1>
                    </div>
                    <div class="hright">
                        <table style="float: right;width: 100%;color: aliceblue;">
                            <tr>
                                <td>
                                    <button class="hright_r"
                                        onclick="Efw('common_menu_goto',{page:'login.jsp'})">ログオフ</button>
                                    <button class="hright_r"
                                        onclick="Efw('common_menu_goto',{page:'shoplist.jsp'})">切替</button>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;padding-right: 20px;" id="sessioninfo">
                                    店舗ID：<span id="shopid" style="font-weight: bold;color: yellow;">未选择</span>
                                    &nbsp;&nbsp;&nbsp;
                                    UserID：<span id="userid" style="font-weight: bold;color: yellow;">XXXX</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="topnav">
                    <p><a href="study_menu.jsp">メニュー</a> > 不正解情報管理</p>
                </div>
                <div class="content">
                    <div class="c_btn">
                        <table class="table_btn">
                            <tbody>
                                <tr>
                                    <td style="font-weight: bold;color: maroon">【検索条件】</td>

                                    <td></td>
                                    <td style="width: 120px;"><button id="btn_new" onclick="add()">更新</button></td>
                                    <td style="width: 120px;"><button id="btn_new" onclick="add()">新規</button></td>
                                    <td style="width: 120px;"><button >検　索</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="c_condition" style="height: 55px;">
                        <table border="0" style="margin-top: 10px;">
                            <tbody>
                                <tr>
                                    <td style="width: 150px;font-weight: bold;">&nbsp;&nbsp;テスト名称：</td>
                                    <td style="width: 600px;">
                                        <select style="width: 560px;height:30px;border-style: solid;" id="testname">
                                            <option value=""></option> 
                                            <option value="01">01.恩氏製衣</option> 
                                        </select>
                                    </td>
                                    <td style="width: 60px;font-weight: bold;">科目：</td>
                                    <td style="width: 320px;">
                                        <select style="width: 130px;height:30px;border-style: solid;" id="subject"> 
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
                            </tbody>
                        </table>
                    </div>


                    <div class="c_detail_header" style="overflow: hidden;" onscroll="scrollHead(this);">
                        <table class="table_detail_header" style="table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 50px;" id="temp">選択</th>
                                    <th style="width: 150px">問題番号</th>
                                    <th style="width: 220px;">テスト名称</th>

                                    <th style="width: 100px;">科目</th>
                                    <th style="width: 100px;">番号</th>
                                    <th style="width: 250px;">内容</th>

                                    <th style="width: 400px;">誤った原因</th>
                                    <th style="width: 400px;">深い原因</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="c_detail_content" style="overflow: auto;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" id="deliverytable"
                            style="table-layout: fixed;">
                            <tr class="header">
                                <td style="width: 50px;text-align: center;" ><input type="checkbox" /></td>
                                <td style="width: 150px" class="c">20241212-123456</td>
                                <td style="width: 220px;" class="c">期中テスト</td>

                                <td style="width: 100px;" class="c">1.国語</td>
                                <td style="width: 100px;" class="r">99-99-99</td>
                                <td style="width: 250px;" class="c">
                                    <a href="#">1</a>&nbsp;
                                    <a href="#">2</a>&nbsp;
                                    <a href="#">3</a>&nbsp;
                                </td>

                                <td style="width: 400px;" class="l">ミス</td>
                                <td style="width: 400px"  class="l">理解不足</td>
                            </tr>
                         
                        </table>
                    </div>
                </div>
            </div>

        </body>
        <script>
            $(document).ready(function() {

                // 获取屏幕宽度
                var screenWidth = window.screen.width;

                // 获取屏幕高度
                var screenHeight = window.screen.height;

                // 获取屏幕可用工作区宽度（不包括任务栏等）
                var screenAvailableWidth = window.screen.availWidth;

                // 获取屏幕可用工作区高度（不包括任务栏等）
                var screenAvailableHeight = window.screen.availHeight;

                var h0 = $(document).height();
                

                var h1 = $(".head").height();
                var h2 = $(".topnav").height();
                var h3 = $(".c_btn").height();
                var h4 = $(".c_condition").height();
                var h5 = $(".c_detail_header").height();

                var h6 = h0 - h1 - h2 - h3 - h4 - h5 - 30 -120;

                $(".c_detail_content").height(h6);
         

            });
        </script>
        </html>