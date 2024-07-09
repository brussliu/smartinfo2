<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="efw" uri="efw" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>単語テスト</title>
        <efw:Client />
        <link rel="stylesheet" href="css/common.css" type="text/css" />
        <script type="text/javascript" src="js/common.js"></script>
        <style>
            .c_detail_header {
                width: 95%;
                height: 51px;
            }
            .table_detail_header td{
                border: 1px solid black;
            }
            .table_detail_header th{
                font-size: 12px;
                font-weight: bold;
            }
            .word {
                color: red;
                font-weight: bold;
            }

        </style>
        <script>
            $(document).ready(function() {


            });

            function scrollHead(obj) {
                    var p = $(obj).get(0).scrollLeft;
                    $(obj).prev().get(0).scrollLeft = p;
            }
            
            // 初期化
            function init() {

                Efw('study_word_init');

            }

            function initclassification(){

                Efw('study_testword_initclassification');
            }

            function searchWord(){
                Efw('study_word_search');
            }

            function changeStyleForWordInfo(){

                
                $("#wordinfotable tr").each(function () {

                    var ct = $(this).children().eq(4).children().eq(0).html();
                    var per = parseFloat($(this).children().eq(6).children().eq(0).html().replaceAll("%",""));

                    if(ct != "" && per >= 90){
                        $(this).css("background-color", "rgb(200,255,200)");
                    }else if(ct != "" &&per >= 70){
                        $(this).css("background-color", "rgb(255,255,200)");
                    }else if(ct != ""){
                        $(this).css("background-color", "rgb(255,200,200)");
                    }
                    
                });

            }

            function downloadVoice(){

                Efw('study_word_downloadvoice');
            }

            function getChineseExplain(){

                Efw('study_word_getchinese');

                setTimeout(function(){
                    searchWord();
                    }, 1000);
                ;
            }

            function updateItem(no,obj){
                
                var book =              $(obj).parent().children().eq(0).children().eq(0).html();
                var classification =    $(obj).parent().children().eq(1).children().eq(0).html();
                var wordseq =           $(obj).parent().children().eq(2).children().eq(0).html();

                var itemvalue = $(obj).children().eq(0).html();
                if(no == 1){
                    itemvalue = $(obj).children().eq(0).children().eq(0).html();
                }
                var input = prompt("内容を修正してください：", itemvalue);

                var flg = null;

                if(no == 1){
                    flg = "wordE";
                }else if(no == 2){
                    flg = "wordJ";
                }else if(no == 3){
                    flg = "wordC";
                }else if(no == 4){
                    flg = "sen1E";
                }else if(no == 5){
                    flg = "sen1J";
                }else if(no == 6){
                    flg = "sen1C";
                }else if(no == 7){
                    flg = "sen2E";
                }else if(no == 8){
                    flg = "sen2J";
                }else if(no == 9){
                    flg = "sen2C";
                }

                if(input != null){
                    Efw('study_word_updateitem',{book : book, classification : classification, wordseq : wordseq, flg : flg, content : input});
                }
            }

            function openWord(obj){

                var word = $(obj).children().eq(0).html();

                const windowFeatures =
                "toolbar=no," + 
                "location=no," + 
                "directories=no," + 
                "status=no," + 
                "menubar=no," + 
                "scrollbars=yes," + 
                "resizable=yes," + 
                "width=1920," + 
                "height=1080";

                window.open("https://ejje.weblio.jp/content/" + word, 'fullscreenWindow', windowFeatures);
            }
        </script>
    </head>

    <body onload="init();">
        <div style="overflow: auto;">
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
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;padding-right: 20px;" id="sessioninfo" >
                                店舗ID：<span id="shopid" style="font-weight: bold;color: yellow;">未选择</span>
                                &nbsp;&nbsp;&nbsp;
                                UserID：<span id="userid" style="font-weight: bold;color: yellow;">XXXX</span>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="topnav">
                <p><a href="study_menu.jsp">メニュー</a> > 単語状況確認</p>
            </div>
            <div class="content">
                <div class="c_btn">
                    <table class="table_btn">
                        <tbody>
                            <tr>
                                <td style="width: 200px;">
                                    書籍:
                                    <select id="opt_book" style="width: 120px;" onchange="initclassification();">
                                        <option value=""></option>
                                    </select>
                                </td>
                                <td style="width: 180px;">
                                    分類:
                                    <select id="opt_classification" style="width: 100px;" >
                                        <option value=""></option>
                                    </select>
                                </td>
                                <td style="width: 250px;">
                                    正確率:
                                    <select id="opt_accuracy" style="width: 140px;" >
                                        <option value=""></option>
                                        <option value="1">100%</option>
                                        <option value="2">100%未満</option>
                                        <option value="3">80%～100%</option>
                                        <option value="4">50%～80%</option>
                                        <option value="5">50%未満</option>
                                    </select>
                                </td>
                                <td>
                                    キーワード:
                                    <input type="text" style="width: 150px;height: 25px;" id="keyword">
                                </td>
                                <td></td>
                                <td></td>
                                <td style="width: 180px;"><button onclick="getChineseExplain();">中日翻訳取得</button></td>
                                <td style="width: 180px;"><button onclick="downloadVoice();">音声ダウンロード</button></td>
                                <td style="width: 180px;"><button onclick="searchWord();">単語検索</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="c_detail_header" style="overflow: hidden;" id="wordinfoheaddiv">
                    <table class="table_detail_header" style="width: 2535px;table-layout: fixed;" >
                        <thead>
                            <tr class="header">
                                <th style="width: 120px;">書籍</th>
                                <th style="width: 120px;">分類</th>
                                <th style="width: 120px;">単語SEQ</th>

                                <th style="width: 100px;color: red;background-color: aqua;">時間</th>
                                <th style="width: 100px;color: red;background-color: aqua;">テスト回数</th>
                                <th style="width: 100px;color: red;background-color: aqua;">全部正確回数</th>
                                <th style="width: 100px;color: red;background-color: aqua;">全部正確率</th>

                                <th style="width: 200px;background-color: yellow;">単語</th>
                                <th style="width: 200px;background-color: yellow;">日本語</th>
                                <th style="width: 500px;background-color: yellow;">中国語</th>
                                <th style="width: 100px;background-color: yellow;">正解回数</th>
                                <th style="width: 100px;background-color: yellow;">誤り回数</th>

                                <th style="width: 250px;background-color: greenyellow;">例句1</th>
                                <th style="width: 250px;background-color: greenyellow;">日本語</th>
                                <th style="width: 250px;background-color: greenyellow;">中国語</th>
                                <th style="width: 100px;background-color: greenyellow;">正解回数</th>
                                <th style="width: 100px;background-color: greenyellow;">誤り回数</th>

                                <th style="width: 250px;background-color: skyblue;">例句2</th>
                                <th style="width: 250px;background-color: skyblue;">日本語</th>
                                <th style="width: 250px;background-color: skyblue;">中国語</th>
                                <th style="width: 100px;background-color: skyblue;">正解回数</th>
                                <th style="width: 117px;background-color: skyblue;">誤り回数</th>

                            </tr>
                        </thead>
                    </table>
                </div>

                <div class="c_detail_content" style="overflow: auto;" onscroll="scrollHead(this);">
                    <table class="table_detail_content" id="wordinfotable" style="width: 2518px;table-layout: fixed;">

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
            if(h4 == undefined){
                h4 = 0;
            }
            var h5 = $(".c_detail_header").height();

            var h6 = h0 - h1 - h2 - h3 - h4 - h5 - 30 -120;

            $(".c_detail_content").height(h6);

        });
    </script>
</html>