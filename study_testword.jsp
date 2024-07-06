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

        </style>
        <script>
            $(document).ready(function() {

                // 添加一个option
                // for(var i = 1;i <= 70;i ++){
                //     var key = "Day" + i.toString().padStart(2, '0');
                //     $("#opt_classification").append("<option value='" + i + "'>" + key + "</option>");
                // }

            });


            // 初期化
            function init() {
                Efw('study_testword_init');
            }

            // 初期化
            function beginTest() {

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

                window.open("study_testword_init.jsp", 'fullscreenWindow', windowFeatures);

            }

            function checkTest(obj){

                var n = 0;

                var bookArr = new Array();
                //var testno = "";

                $('#testwordtable input[type="checkbox"]').each(function() {

                    var book = "";
                    if($(this).prop('checked') == true){
                        n = n + 1;
                        book = $(obj).parent().next().children().eq(0).html();

                        if(!bookArr.includes(book)){
                            bookArr.push(book);
                        }
                        //testno = testno + (testno == "" ? "" : ",") + $(this).val();
                    }

                });

                // <td style="width: 120px;"><button id="btn_testwrong" onclick="testWrong()">誤り単語再テスト</button></td>
                // <td style="width: 120px;"><button id="btn_delete" onclick="deleteTest()">単語テスト削除</button></td>
                // <td style="width: 120px;"><button id="btn_continue" onclick="continueTest()">単語テスト継続</button></td>
                // <td style="width: 120px;"><button id="btn_dotest" onclick="beginTest()">単語テスト実施</button></td>

                if(n == 0){
                    $("#btn_testwrong").prop("disabled", true);
                    $("#btn_delete").prop("disabled", true);
                    $("#btn_continue").prop("disabled", true);
                    //$("#btn_dotest").prop("disabled", false);
                }else if(n == 1){
                    if($(obj).parent().next().next().next().children().eq(0).html() == "実施済"){
                        $("#btn_testwrong").prop("disabled", false);
                    }
                    // 実施中のテストのみ継続する可能です。
                    if($(obj).parent().next().next().next().children().eq(0).html() == "実施中"){
                        $("#btn_continue").prop("disabled", false);
                        $("#btn_delete").prop("disabled", false);
                    }else{
                        $("#btn_continue").prop("disabled", true);
                    }
                    
                    //$("#btn_dotest").prop("disabled", false);
                }else if(n >= 2){

                    // 書籍が違うテストは一緒に再テストできない。
                    // 実施済のテストのみ再テストする可能です。
                    if(bookArr.length == 1 && $(obj).parent().next().next().next().children().eq(0).html() == "実施済"){
                        $("#btn_testwrong").prop("disabled", false);
                    }
                    if($(obj).parent().next().next().next().children().eq(0).html() == "実施中"){
                        $("#btn_delete").prop("disabled", false);
                    }
                    $("#btn_continue").prop("disabled", true);
                    //$("#btn_dotest").prop("disabled", false);
                }
                console.log("チェックOK個数:" + n);
                //console.log(testno);
            }

            function getSelectedTest(){

                var testno = "";

                $('#testwordtable input[type="checkbox"]').each(function() {
                    if($(this).prop('checked') == true){
                        testno = testno + (testno == "" ? "" : ",") + $(this).val();
                    }

                });

                return testno;
            }
 
            function testWrong(){

                var testno = getSelectedTest();

                Efw('study_testword_wrong', {testno : testno});

            }

            function deleteTest(){

                var testno = getSelectedTest();

                Efw('study_testword_delete', {testno : testno});

            }

            function continueTest(){
                var testno = getSelectedTest();

                Efw('study_testword_continue', {testno : testno});
            }
            // 初期化
            function continueTestPopup() {

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

                window.open("study_testword_test.jsp", 'fullscreenWindow', windowFeatures);

            }

            function listWord(testno){

                Efw('study_testword_listword', {testno : testno});
            }

            // function showWordInfo(){

            //     $("#testwordtable").parent().prev().hide();
            //     $("#testwordtable").parent().hide();

            //     $("#wordinfotable").parent().prev().show();
            //     $("#wordinfotable").parent().show();

            //     $("#btn_wordlist").hide();
            //     $("#btn_testlist").show();
            // }

            function showTestInfo(){

                // $("#testwordtable").parent().prev().show();
                // $("#testwordtable").parent().show();

                // $("#wordinfotable").parent().prev().hide();
                // $("#wordinfotable").parent().hide();

                // $("#btn_wordlist").show();
                // $("#btn_testlist").hide();

                Efw('study_testword_testinfo');
            }

            function scrollHead(obj) {
                    var p = $(obj).get(0).scrollLeft;
                    $(obj).prev().get(0).scrollLeft = p;
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

            function changeStyleForTestInfo(){
                $("#testwordtable tr").each(function () {

                    var status = $(this).children().eq(3).children().eq(0).html();
                    var per = parseFloat($(this).children().eq(8).children().eq(0).html().replaceAll("%",""));

                    // console.log(status);
                    // console.log(per);

                    if(status == "実施中"){
                        $(this).css("color", "blue");
                        $(this).css("font-weight", "blod");
                    }
                    if(status == "実施済"){
                        if(per >= 90){
                            $(this).css("background-color", "rgb(200,255,200)");
                        }else if(per >= 70){
                            $(this).css("background-color", "rgb(255,255,200)");
                        }else{
                            $(this).css("background-color", "rgb(255,200,200)");
                        }
                    }
                    
                });
            }

            function initclassification(){

                Efw('study_testword_initclassification');
            }

            function selectAll(obj){
                
                var checked = $(obj).prop('checked');

                $("input[name='testitem']").prop("checked", checked);

                var n = 0;
                var bookArr = new Array();
                var statusArr = new Array();

                $('#testwordtable input[type="checkbox"]').each(function() {

                    var book = "";
                    var status = "";
                    if($(this).prop('checked') == true){
                        n = n + 1;
                        book = $(this).parent().next().children().eq(0).html();
                        if(!bookArr.includes(book)){
                            bookArr.push(book);
                        }

                        status = $(this).parent().next().next().next().children().eq(0).html();
                        if(!statusArr.includes(status)){
                            statusArr.push(status);
                        }
                    }

                });


                if(n == 0){

                    $("#btn_testwrong").prop("disabled", true);
                    $("#btn_delete").prop("disabled", true);
                    $("#btn_continue").prop("disabled", true);


                }else if(n == 1){
                    if(statusArr[0] == "実施済"){
                        $("#btn_testwrong").prop("disabled", false);
                        $("#btn_delete").prop("disabled", true);
                        $("#btn_continue").prop("disabled", true);
                    }
                    // 実施中のテストのみ継続する可能です。
                    if(statusArr[0] == "実施中"){
                        $("#btn_testwrong").prop("disabled", true);
                        $("#btn_delete").prop("disabled", false);
                        $("#btn_continue").prop("disabled", false);
                    }

                }else if(n >= 2){

                    $("#btn_continue").prop("disabled", true);

                    // 書籍が違うテストは一緒に再テストできない。
                    // 実施済のテストのみ再テストする可能です。

                    if(statusArr.length == 1 && statusArr[0] == "実施済" && bookArr.length == 1){
                        $("#btn_testwrong").prop("disabled", false);
                    }else{
                        $("#btn_testwrong").prop("disabled", true);
                    }


                    // 実施中のテストのみ継続する可能です。
                    if(statusArr.length == 1 && statusArr[0] == "実施中"){
                        $("#btn_delete").prop("disabled", false);

                    }else{
                        $("#btn_delete").prop("disabled", true);
                    }

                }

            }
        </script>
    </head>

    <body onload="init();">
        <efw:Part path="study_testword_inputdialog.jsp" />
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
                <p><a href="study_menu.jsp">メニュー</a> > 単語テスト</p>
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
                                <td></td>
                                <td style="text-align: right;color: red;font-weight: bold;"><span id="studytime">今日勉強時間　00:00:00</span>&nbsp;&nbsp;</td>
                                <td style="width: 180px;"><button id="btn_dotest" onclick="beginTest()" style="color: blue;font-weight: bold;background-color:aqua;width: 300px;">単語テスト実施</button></td>
                                <td style="width: 180px;"><button id="btn_testlist" onclick="showTestInfo();">検索</button></td>
                                <td style="width: 180px;"><button id="btn_testwrong" onclick="testWrong()" disabled>誤り単語再テスト</button></td>
                                <td style="width: 180px;"><button id="btn_delete" onclick="deleteTest()" disabled>単語テスト削除</button></td>
                                <td style="width: 180px;"><button id="btn_continue" onclick="continueTest()" disabled>単語テスト継続</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="c_detail_header" style="overflow: hidden;" >
                    <table class="table_detail_header" style="table-layout: fixed;">
                        <thead>
                            <tr class="header">
                                <th style="width:  60px;" id="temp">選択<br/><input type="checkbox" onclick="selectAll(this);" /></th>
                                <th style="width: 180px;">書籍</th>
                                <th style="width: 250px;">分類</th>

                                <th style="width: 100px;">ステータス</th>

                                <th style="width: 160px;">範囲</th>
                                <th style="width: 160px;">種類</th>
                                <th style="width: 280px;">テスト期間</th>

                                <th style="width: 320px;">数量</th>

                                <th style="width: 120px;">全部正確率</th>
                                <th style="width: 140px;">勉強時間</th>
                            </tr>
                        </thead>
                    </table>
                </div>

                <div class="c_detail_content" style="overflow: auto;" onscroll="scrollHead(this);">
                    <table class="table_detail_content" id="testwordtable" style="table-layout: fixed;">

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