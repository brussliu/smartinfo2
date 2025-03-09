<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="efw" uri="efw" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>単語テスト</title>
        <efw:Client />
        <link rel="stylesheet" href="css/common.css" type="text/css" />
        <link href="favicon.ico" rel="icon" type="image/x-icon" />
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

            #btn_testlist {
                background-image: url('img/search.png');
                background-size: 38px 38px;
                background-repeat: no-repeat;
                background-position: center;
            }

            #btn_testlist[disabled] {
                background-image: url('img/search_disabled.png');
                background-size: 38px 38px;
                background-repeat: no-repeat;
                background-position: center;
            }
            #btn_delete {
                background-image: url('img/delete.png');
                background-size: 38px 38px;
                background-repeat: no-repeat;
                background-position: center;
            }
            #btn_delete[disabled] {
                background-image: url('img/delete_disabled.png');
                background-size: 38px 38px;
                background-repeat: no-repeat;
                background-position: center;
            }
            #btn_continue {
                background-image: url('img/continue.png');
                background-size: 38px 38px;
                background-repeat: no-repeat;
                background-position: center;
            }
            #btn_continue[disabled] {
                background-image: url('img/continue_disabled.png');
                background-size: 38px 38px;
                background-repeat: no-repeat;
                background-position: center;
            }
            #btn_allwrong {
                background-image: url('img/allwrong.png');
                background-size: 38px 38px;
                background-repeat: no-repeat;
                background-position: center;
            }
            #btn_allwrong[disabled] {
                background-image: url('img/allwrong_disabled.png');
                background-size: 38px 38px;
                background-repeat: no-repeat;
                background-position: center;
            }
            #btn_testwrong {
                background-image: url('img/wrong.png');
                background-size: 38px 38px;
                background-repeat: no-repeat;
                background-position: center;
            }
            #btn_testwrong[disabled] {
                background-image: url('img/wrong_disabled.png');
                background-size: 38px 38px;
                background-repeat: no-repeat;
                background-position: center;
            }
            #btn_dotest {
                background-image: url('img/test.png');
                background-size: 38px 38px;
                background-repeat: no-repeat;
                background-position: center;
            }
            #btn_check {
                background-image: url('img/checksheet.png');
                background-size: 38px 38px;
                background-repeat: no-repeat;
                background-position: center;
            }
            #btn_check[disabled] {
                background-image: url('img/checksheet_disabled.png');
                background-size: 38px 38px;
                background-repeat: no-repeat;
                background-position: center;
            }
        </style>
        <script>

            $(document).ready(function() {

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

                        status = $(this).parent().next().next().next().next().children().eq(0).html();
                        if(!statusArr.includes(status)){
                            statusArr.push(status);
                        }
                    }

                });

                if(n == 0){

                    $("#btn_testwrong").prop("disabled", true);
                    $("#btn_delete").prop("disabled", true);
                    $("#btn_continue").prop("disabled", true);
                    $("#btn_check").prop("disabled", true);


                }else if(n == 1){
                    if(statusArr[0] == "実施済" || statusArr[0] == "採点中" || statusArr[0] == "採点済"){
                        $("#btn_testwrong").prop("disabled", false);
                        $("#btn_delete").prop("disabled", true);
                        $("#btn_continue").prop("disabled", true);
                        $("#btn_check").prop("disabled", false);
                    }
                    // 実施中のテストのみ継続する可能です。
                    if(statusArr[0] == "実施中"){
                        $("#btn_testwrong").prop("disabled", true);
                        $("#btn_delete").prop("disabled", false);
                        $("#btn_continue").prop("disabled", false);
                        $("#btn_check").prop("disabled", true);
                    }

                }else if(n >= 2){

                    $("#btn_continue").prop("disabled", true);
                    $("#btn_check").prop("disabled", true);
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

            function allWrong(){
                Efw('study_testword_allwrong');
            }

            function deleteTest(){

                var testno = getSelectedTest();
                Efw('study_testword_delete', {testno : testno});
            }

            function checkTestResult(){

                var testno = getSelectedTest();

                checkResultPop(testno);
                //Efw('study_testword_check', {testno : testno});
            }

            function continueTest(){

                var testno = getSelectedTest();
                Efw('study_testword_continue', {testno : testno});
            }
            // 初期化
            function continueTestPopup(no) {

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

                if(parseInt(no) == 1){
                    window.open("study_testword_test2.jsp", 'fullscreenWindow', windowFeatures);
                }else if(parseInt(no) == 2){
                    window.open("study_testword_test3.jsp", 'fullscreenWindow', windowFeatures);
                }else{
                    window.open("study_testword_test.jsp", 'fullscreenWindow', windowFeatures);
                }
                

            }

            // 初期化
            function checkResultPop(testno) {

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

                window.open("study_testword_check.jsp?testno=" + testno, 'checkResult', windowFeatures);

            }

            function listWord(obj,testno){

                var status = $(obj).parent().parent().parent().parent().parent().prev().prev().prev().prev().prev().children().eq(0).html();

                if(status == "実施中"){
                    alert("実施中のテストは単語リストを参照できません！");
                    return;
                }

                Efw('study_testword_listword', {testno : testno});
            }

            function showTestInfo(){

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

                $("#testwordtable .tr1").each(function () {

                    var status = $(this).children().eq(4).children().eq(0).html();
                    var per = parseFloat($(this).children().eq(10).children().eq(0).html().replaceAll("%",""));
                    
                    var type = $(this).children().eq(6).children().eq(0).html();

                    // console.log(status);
                    // console.log(per);

                    // if(status == "実施中"){

                    // }
                    if(status == "実施済" || status == "採点済"){

                        var kikan = $(this).children().eq(8).children().eq(0).html().substring(0, 10);
                        var today = (new Date()).format("yyyy/MM/dd");

                        if(kikan == today){
                            $(this).css("color", "blue");
                            $(this).css("font-weight", "bold");
                        }

                        if(per >= 90){
                            $(this).css("background-color", "rgb(200,255,200)");
                        }else if(per >= 70){
                            $(this).css("background-color", "rgb(255,255,200)");
                        }else{
                            $(this).css("background-color", "rgb(255,200,200)");
                        }
                    }

                    if(status == "採点中"){
                        $(this).css("background-color", "rgb( 155,255,255)");
                    }

                    // 全訳英
                    if(type == "0"){
                        $(this).children().eq(6).html(
                            "<div style='display: flex;align-items: center;margin-left: 5px;'>" +
                            "<img src='img/un.png' width='30px;' height='30px;'>" + "&nbsp;" + 
                            "<img src='img/yjls.png' width='20px;' height='20px;'>" + "&nbsp;" + 
                            "<img src='img/english.png' width='30px;' height='30px;'>" + 
                            "<div style='width:60px;'><img src='img/audio.png' width='20px;' height='20px;' style='float: right;'></div>" +
                            "</div>"
                        );
                    // 日訳英（音声付き）
                    }else if(type == "1"){
                        $(this).children().eq(6).html(
                            "<div style='display: flex;align-items: center;margin-left: 5px;'>" +
                            "<img src='img/japanese.png' width='30px;' height='30px;'>" + "&nbsp;" + 
                            "<img src='img/yjls.png' width='20px;' height='20px;'>" + "&nbsp;" + 
                            "<img src='img/english.png' width='30px;' height='30px;'>" + 
                            "<div style='width:60px;'><img src='img/audio.png' width='20px;' height='20px;' style='float: right;'></div>" +
                            "</div>"
                        );
                    // 日訳英（音声無し）
                    }else if(type == "2"){
                        $(this).children().eq(6).html(
                            "<div style='display: flex;align-items: center;margin-left: 5px;'>" +
                            "<img src='img/japanese.png' width='30px;' height='30px;'>" + "&nbsp;" + 
                            "<img src='img/yjls.png' width='20px;' height='20px;'>" + "&nbsp;" + 
                            "<img src='img/english.png' width='30px;' height='30px;'>" + 
                            "<div style='width:60px;'><img src='img/audio.png' width='20px;' height='20px;' style='float: right;'></div>" +
                            "</div>"
                        );
                        
                    // 音声のみ
                    }else if(type == "3"){
                        $(this).children().eq(6).html(
                            "<div style='display: flex;align-items: center;margin-left: 5px;'>" +
                            "------" +
                            "<div style='width:108px;'><img src='img/audio.png' width='20px;' height='20px;' style='float: right;'></div>" +
                            "</div>"
                        );
                        
                    // 漢訳英(音声付き)
                    }else if(type == "4"){
                        $(this).children().eq(6).html(
                            "<div style='display: flex;align-items: center;margin-left: 5px;'>" +
                            "<img src='img/chinese.png' width='30px;' height='30px;'>" + "&nbsp;" + 
                            "<img src='img/yjls.png' width='20px;' height='20px;'>" + "&nbsp;" + 
                            "<img src='img/english.png' width='30px;' height='30px;'>" + 
                            "<div style='width:60px;'><img src='img/audio.png' width='20px;' height='20px;' style='float: right;'></div>" +
                            "</div>"
                        );
                        
                    // 漢訳英(音声無し)
                    }else if(type == "5"){
                        $(this).children().eq(6).html(
                            "<div style='display: flex;align-items: center;margin-left: 5px;'>" +
                            "<img src='img/chinese.png' width='30px;' height='30px;'>" + "&nbsp;" + 
                            "<img src='img/yjls.png' width='20px;' height='20px;'>" + "&nbsp;" + 
                            "<img src='img/english.png' width='30px;' height='30px;'>" + 
                            "<div style='width:60px;'><img src='img/audio.png' width='20px;' height='20px;' style='float: right;'></div>" +
                            "</div>"
                        );
                    
                    // ランダム
                    }else if(type == "6"){
                        $(this).children().eq(6).html(
                            "<div style='display: flex;align-items: center;margin-left: 5px;'>" +
                            "<img src='img/dice.png' width='30px;' height='30px;'>" +
                            // "<div style='width:122px;'><img src='img/audio.png' width='20px;' height='20px;' style='float: right;'></div>" +
                            "</div>"
                        );
                        
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

                        status = $(this).parent().next().next().next().next().children().eq(0).html();
                        if(!statusArr.includes(status)){
                            statusArr.push(status);
                        }
                    }

                });


                if(n == 0){

                    $("#btn_testwrong").prop("disabled", true);
                    $("#btn_delete").prop("disabled", true);
                    $("#btn_continue").prop("disabled", true);
                    $("#btn_check").prop("disabled", true);

                }else if(n == 1){
                    if(statusArr[0] == "実施済" || statusArr[0] == "採点中"){
                        $("#btn_testwrong").prop("disabled", false);
                        $("#btn_delete").prop("disabled", true);
                        $("#btn_continue").prop("disabled", true);
                        $("#btn_check").prop("disabled", false);
                    }
                    // 実施中のテストのみ継続する可能です。
                    if(statusArr[0] == "実施中"){
                        $("#btn_testwrong").prop("disabled", true);
                        $("#btn_delete").prop("disabled", false);
                        $("#btn_continue").prop("disabled", false);
                        $("#btn_check").prop("disabled", true);
                    }

                }else if(n >= 2){

                    $("#btn_continue").prop("disabled", true);
                    $("#btn_check").prop("disabled", true);

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
                                <td style="width: 240px;">
                                    書籍:
                                    <select id="opt_book" style="width: 160px;" onchange="initclassification();">
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
                                <td style="text-align: right;color: red;font-weight: bold;vertical-align:middle;display: table-cell;">
                                    <img src="img/time2.png" width="25px;" height="25px;">
                                    <span id="studytime" style="font-size: 30px;">00:00:00</span>&nbsp;&nbsp;
                                </td>
                                <td style="width: 80px;">
                                    <button id="btn_dotest" onclick="beginTest()" style="color: blue;font-weight: bold;background-color:aqua;width: 80px;height: 50px;">
                                        <!-- <img src="img/test.png" width="38px;" height="38px;"> -->
                                    </button>
                                </td>
                                <td style="width: 80px;">
                                    <button id="btn_testlist" onclick="showTestInfo();" style="width: 50px;height: 50px;">
                                        <!-- <img src="img/search.png" width="38px;" height="38px;"> -->
                                    </button>
                                </td>
                                <td style="width: 80px;">
                                    <button id="btn_testwrong" onclick="testWrong()" style="width: 50px;height: 50px;" disabled>
                                        <!-- <img src="img/wrong.png" width="38px;" height="38px;"> -->
                                    </button>
                                </td>
                                <td style="width: 80px;">
                                    <button id="btn_allwrong" onclick="allWrong()" style="width: 50px;height: 50px;">
                                        <!-- <img src="img/allwrong.png" width="38px;" height="38px;"> -->
                                    </button>
                                </td>
                                <td style="width: 80px;">
                                    <button id="btn_delete" onclick="deleteTest()" style="width: 50px;height: 50px;" disabled>
                                        <!-- <img src="img/delete.png" width="38px;" height="38px;"> -->
                                    </button>
                                </td>
                                <td style="width: 80px;">
                                    <button id="btn_continue" onclick="continueTest()" style="width: 50px;height: 50px;" disabled>
                                        <!-- <img src="img/continue.png" width="38px;" height="38px;"> -->
                                    </button>
                                </td>
                                <td style="width: 80px;">
                                    <button id="btn_check" onclick="checkTestResult()" style="width: 50px;height: 50px;" disabled>
                                        <!-- <img src="img/checksheet.png" width="38px;" height="38px;"> -->
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="c_detail_header" style="overflow: hidden;" >
                    <table class="table_detail_header" style="table-layout: fixed;">
                        <thead>
                            <tr class="header">
                                <th style="width:  60px;" id="temp">選択<br/><input type="checkbox" onclick="selectAll(this);" /></th>
                                <th style="width: 160px;">書籍</th>
                                <th style="width: 390px;">分類</th>

                                <th style="width: 60px;">区分</th>

                                <th style="width: 100px;">ステータス</th>

                                <th style="width: 100px;">範囲</th>
                                <th style="width: 160px;">種類</th>
                                <th style="width:  60px;">方式</th>

                                <th style="width: 220px;">テスト期間</th>

                                <th style="width: 260px;">数量</th>

                                <th style="width: 100px;">全部正確率</th>
                                <th style="width: 100px;">勉強時間</th>
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