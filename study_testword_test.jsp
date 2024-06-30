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
                width: 94%;
                height: 100%;
            }
            .table_detail_header td{
                border: 1px solid black;
            }
            .table_detail_header th{
                font-size: 30px;
                font-weight: bold;
            }
            .inputword {
                width: 60px;
                height: 100px;
                text-align: center;
                font-size: 50px;
                font-weight: bold;
                color: red;
                background-color: lightyellow;
                border-top-style: none;
                border-left-style: none;
                border-right-style: none;
                border-bottom-style: solid;
                border-bottom-width: 5px;
                ime-mode: disabled;
            }
            .inputsentence {
                width: 800px;
                height: 80px;
                text-align: center;
                font-size: 50px;
                font-weight: bold;
                color: red;
                background-color: lightyellow;
                border-top-style: none;
                border-left-style: none;
                border-right-style: none;
                border-bottom-style: solid;
                border-bottom-width: 5px;
            }
            .wrongworddiv {
                width: 1200px;
                height: 80px;
                text-align: center;
                font-size: 40px;
                font-weight: bold;
                color: red;
                text-decoration: line-through;
                background-color: rgb(180, 255, 255);
                border-top-style: none;
                border-left-style: none;
                border-right-style: none;
                border-bottom-style: none;
                display: flex;
                align-items: center;
                justify-content: center;

            }
            .worddiv {
                width: 1200px;
                height: 80px;
                text-align: center;
                font-size: 40px;
                font-weight: bold;
                color: blue;
                background-color: rgb(180, 255, 255);
                border-top-style: none;
                border-left-style: none;
                border-right-style: none;
                border-bottom-style: none;
                display: flex;
                align-items: center;
                justify-content: center;

            }
            .sen1div {
                width: 1200px;
                height: 80px;
                text-align: center;
                font-size: 40px;
                font-weight: bold;
                color: blue;
                background-color: rgb(180, 255, 255);
                border-top-style: none;
                border-left-style: none;
                border-right-style: none;
                border-bottom-style: none;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .wrongsen1div {
                width: 1200px;
                height: 80px;
                text-align: center;
                font-size: 40px;
                font-weight: bold;
                color: red;
                text-decoration: line-through;
                background-color: rgb(180, 255, 255);
                border-top-style: none;
                border-left-style: none;
                border-right-style: none;
                border-bottom-style: none;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .sen2div {
                width: 1200px;
                height: 80px;
                text-align: center;
                font-size: 40px;
                font-weight: bold;
                color: blue;
                background-color: rgb(180, 255, 255);
                border-top-style: none;
                border-left-style: none;
                border-right-style: none;
                border-bottom-style: none;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .wrongsen2div {
                width: 1200px;
                height: 80px;
                text-align: center;
                font-size: 40px;
                font-weight: bold;
                color: red;
                text-decoration: line-through;
                background-color: rgb(180, 255, 255);
                border-top-style: none;
                border-left-style: none;
                border-right-style: none;
                border-bottom-style: none;
                display: flex;
                align-items: center;
                justify-content: center;
            }
        </style>
        <script>

            // 初期化
            function init() {
                Efw('study_testword_test');
            }

            function overTest(){
                alert("テスト完了しました！");
                window.close();
 
                if (window.opener && !window.opener.closed) {
                    window.opener.location.reload();
                }

            }
            function wrongVoice() {
                var audioElement = document.createElement('audio');
                audioElement.setAttribute('src', './mp3/wrong.mp3');
                audioElement.setAttribute('autoplay', 'autoplay');
            }

            function rightVoice(flg) {
                var audioElement = document.createElement('audio');

                if(flg == "word"){
                    if($('#hiddenSen1J').val() != "" || $('#hiddenSen2J').val() != ""){
                        audioElement.setAttribute('src', './mp3/right1.mp3');
                    }else{
                        audioElement.setAttribute('src', './mp3/right2.mp3');
                    }
                }else if(flg == "sen1"){
                    if($('#hiddenSen2J').val() != ""){
                        audioElement.setAttribute('src', './mp3/right1.mp3');
                    }else{

                        if($('#hiddenWordWrongTime').val() > 0){
                            audioElement.setAttribute('src', './mp3/right1.mp3');
                        }else{
                            audioElement.setAttribute('src', './mp3/right2.mp3');
                        }
                        
                    }
                }else if(flg == "sen2"){
                    if($('#hiddenWordWrongTime').val() > 0 || $('#hiddenSen1WrongTime').val() > 0){
                        audioElement.setAttribute('src', './mp3/right1.mp3');
                    }else{
                        audioElement.setAttribute('src', './mp3/right2.mp3');
                    }
                }
                
                audioElement.setAttribute('autoplay', 'autoplay');
            }


            function showNumber(){

                var no = $('#hiddenWordNo').val();
                var count = $('#hiddenWordCount').val();


                $('#nospan').html(no + "/" + count);

                if(no == 1){

                    $('#btnback').hide();
                }
                if(no == count){

                    $('#btnnext').html("完了");
                }

                
            }

            function showWord() {


                // 日本語表示
                $("#wordJSpan").html($('#hiddenWordJ').val());

                if($("#hiddenWay").val() == "音声"){
                    $("#wordJSpan").hide();
                    $("#wordJSpan").next().show();
                }

                
                // 入力欄表示
                var wordE = $('#hiddenWordE').val();
                var html = "";
                for(var i = 0;i < wordE.length;i ++){
                    html = html + "<input type='text' class='inputword' maxlength='1' oninput='nextLetter(this);'/>&nbsp;&nbsp;";
                }
                

                $("#wordEDiv").html(html);

                $(".inputword").keydown(function(event) {

                    var keycode = (event.keyCode ? event.keyCode : event.which);

                    console.log(keycode);

                    if(keycode === 13) {
                        checkWord();
                    }
                    if(keycode === 16) {
                        playVoice(1,0);
                        
                    }
                    if(keycode === 17) {
                        playVoice(1,1);
                        
                    }
                    if(keycode === 18) {
                        playVoice(1,2);
                            
                    }
                    if(keycode === 8) {

                        if ($(":focus").length > 0) {

                            if($(":focus").val().length > 0){
                                $(":focus").val("");
                            }else{
                                $(":focus").prev().focus();
                            }
                        }
                    }
                });

                $(".inputword").eq(0).focus();
                
                
            }


            function checkWord(){

                var inputword = "";
                $(".inputword").each(function(index, element) {
                    
                    inputword = inputword + $(element).val();
                    
                });

                // OK
                if(inputword.trim() == $('#hiddenWordE').val().trim()){

                    var time = $('#hiddenWordWrongTime').val();
                    if(time == null || time == ""){
                        time = 0;
                    }
                    $('#hiddenWordWrongTime').val(time);

                    rightVoice("word");
                    overWord("OK");
                    showSen1();

                // NG
                }else{

                    wrongVoice();

                    $('#wordWrongTimeDiv').show();
                    
                    var time = $('#hiddenWordWrongTime').val();
                    if(time == null || time == ""){
                        time = 0;
                    }
                    time = parseInt(time) + 1;
                    $('#hiddenWordWrongTime').val(time);
                    $('#wordWrongTimeDiv').children().eq(0).html("誤り回数：" + time + "回");

                    if(parseInt(time) >= 3){

                        // 3回誤りの場合
                        overWord("NG");

                        showSen1();
                    }else{


                        return;
                    }
                
                    
                }
            }

            function nextLetter(obj){

                
                if($(obj).val().length == 1){
                    $(obj).next().focus();
                }
                
            }
            
            function overWord(flg){

                
                // 単語
                $('#wordEDiv').hide();
                $('.worddiv').eq(0).parent().css('display', 'flex');
                $('.worddiv').eq(0).html($('#hiddenWordE').val());
                if(flg == "OK"){
                    $('.worddiv').eq(0).css('color', 'blue');
                }else{
                    $('.worddiv').eq(0).css('color', 'red');

                    var inputword = "";
                    $(".inputword").each(function(index, element) {
                        inputword = inputword + $(element).val();
                    });
                    if(inputword.trim() != ""){
                        $('.wrongworddiv').eq(0).html(inputword.trim());
                        $('.wrongworddiv').eq(0).parent().css('display', 'flex');

                        $('.worddiv').eq(0).css('color', 'blue');
                    }

                    
                }
            }

            function overSen1(flg){

                // 単語
                $('#sen1EDiv').hide();
                $('.sen1div').eq(0).parent().css('display', 'flex');
                $('.sen1div').eq(0).html($('#hiddenSen1E').val());
                if(flg == "OK"){
                    $('.sen1div').eq(0).css('color', 'blue');
                }else{
                    $('.sen1div').eq(0).css('color', 'red');

                    if($('#inputsentence1').val() != ""){
                        $('.wrongsen1div').eq(0).html($('#inputsentence1').val());
                        $('.wrongsen1div').eq(0).parent().css('display', 'flex');

                        $('.sen1div').eq(0).css('color', 'blue');
                    }

                }

            }

            function overSen2(flg){

                // 単語
                $('#sen2EDiv').hide();
                $('.sen2div').eq(0).parent().css('display', 'flex');
                $('.sen2div').eq(0).html($('#hiddenSen2E').val());
                if(flg == "OK"){
                    $('.sen2div').eq(0).css('color', 'blue');
                }else{
                    $('.sen2div').eq(0).css('color', 'red');
                    if($('#inputsentence2').val() != ""){
                        $('.wrongsen2div').eq(0).html($('#inputsentence2').val());
                        $('.wrongsen2div').eq(0).parent().css('display', 'flex');

                        $('.sen2div').eq(0).css('color', 'blue');
                    }
                }

            }

            function showSen1(){



                if($('#hiddenSen1J').val() != ""){

                    // 日本語表示
                    $("#sen1JSpan").html($('#hiddenSen1J').val());

                    if($("#hiddenWay").val() == "音声"){
                        $("#sen1JSpan").hide();
                        $("#sen1JSpan").next().show();
                    }

                    $("#inputsentence1").keydown(function(event) {
                        var keycode = (event.keyCode ? event.keyCode : event.which);
                        console.log(keycode);
                        if(keycode === 13) {
                            checkSen1();
                        }
                        if(keycode === 16) {
                            playVoice(2,0);
                        
                        }
                        if(keycode === 17) {
                            playVoice(2,1);
                            
                        }
                        if(keycode === 18) {
                            playVoice(2,2);
                            
                        }
                    });

                    $('#sen1div').show();
                
                    $("#inputsentence1").focus();
                }else{
                    setTimeout(function(){
                            $("#btnnext").focus();
                        }, 100);

                }

                
            }

            function showSen2(){

                if($('#hiddenSen2J').val() != ""){
                    // 日本語表示
                    $("#sen2JSpan").html($('#hiddenSen2J').val());

                    if($("#hiddenWay").val() == "音声"){
                        $("#sen2JSpan").hide();
                        $("#sen2JSpan").next().show();
                    }

                    $("#inputsentence2").keydown(function(event) {
                        var keycode = (event.keyCode ? event.keyCode : event.which);
                        console.log(keycode);
                        if(keycode === 13) {
                            checkSen2();
                        }
                        if(keycode === 16) {
                            playVoice(3,0);
                            
                        }
                        if(keycode === 17) {
                            playVoice(3,1);
                            
                        }
                        if(keycode === 18) {
                            playVoice(3,2);
                            
                        }

                    });

                    $('#sen2div').show();

                    $("#inputsentence2").focus();
                }else{
                    setTimeout(function(){
                            $("#btnnext").focus();
                        }, 100);

                }
            }

            function checkSen2(){

                console.log("checksen2");

                var inputsent2 = $("#inputsentence2").val();

                // OK
                if(inputsent2.trim() == $('#hiddenSen2E').val().trim()){

                    var time = $('#hiddenSen2WrongTime').val();
                    if(time == null || time == ""){
                        time = 0;
                    }

                    $('#hiddenSen2WrongTime').val(time);

                    rightVoice("sen2");
                    overSen2("OK");

                    setTimeout(function(){
                        $("#btnnext").focus();
                    }, 100);

                // NG
                }else{

                    wrongVoice();

                    $('#sen2WrongTimeDiv').show();
                    
                    var time = $('#hiddenSen2WrongTime').val();
                    if(time == null || time == ""){
                        time = 0;
                    }
                    time = parseInt(time) + 1;

                    $('#hiddenSen2WrongTime').val(time);
                    $('#sen2WrongTimeDiv').children().eq(0).html("誤り回数：" + time + "回");

                    if(parseInt(time) >= 3){

                        // 3回誤りの場合
                        overSen2("NG");

                        setTimeout(function(){
                            $("#btnnext").focus();
                        }, 100);

                        return;
                    }else{


                        return;
                    }

                    
                }
            }

            function checkSen1(){

                console.log("checksen1");

                var inputsent1 = $("#inputsentence1").val();

                // OK
                if(inputsent1.trim() == $('#hiddenSen1E').val().trim()){

                    var time = $('#hiddenSen1WrongTime').val();
                    if(time == null || time == ""){
                        time = 0;
                    }

                    $('#hiddenSen1WrongTime').val(time);

                    rightVoice("sen1");
                    overSen1("OK");
                    showSen2();

                // NG
                }else{

                    wrongVoice();

                    $('#sen1WrongTimeDiv').show();
                    
                    var time = $('#hiddenSen1WrongTime').val();
                    if(time == null || time == ""){
                        time = 0;
                    }

                    time = parseInt(time) + 1;

                    $('#hiddenSen1WrongTime').val(time);
                    $('#sen1WrongTimeDiv').children().eq(0).html("誤り回数：" + time + "回");

                    if(parseInt(time) >= 3){

                        // 3回誤りの場合
                        overSen1("NG");

                        showSen2();

                        return;
                    }else{

                        return;
                    }
                
                    
                }
            }

            function goBack(){
                $('#hiddenOpt').val("back");
                Efw('study_testword_updatedetail');
            }

            function goNext(){

                //return;
                $('#hiddenOpt').val("next");
                Efw('study_testword_updatedetail');
            }

            function playVoice(no,flg){

                if(flg == 0){
                    pronounceA($("#hiddenWordE").val(), no);
                }else if(flg == 1){
                    // アメリカ発音
                    pronounceB($("#hiddenWordE").val(), no, 0);
                }else if(flg == 2){
                    // イギリス発音
                    pronounceB($("#hiddenWordE").val(), no, 1);

                }


            }

            function pronounceB(content , no, type) {

                // 音声ファイルの存在チェック
                var currentURL = window.location.href;

                var currentURL = currentURL.substring(0, currentURL.lastIndexOf("/"));
                console.log(currentURL);

                var pathUrl = "/mp3/" + $("#hiddenBook").val() + "/" + $("#hiddenclassification").val() + "/";

                var fileName = "";
                if(no == 1){
                    fileName = $("#hiddenwordseq").val() + "-word-" + type + ".mp3"; 
                }else if(no == 2){
                    fileName = $("#hiddenwordseq").val() + "-sen1-" + type + ".mp3"; 
                }else if(no == 3){
                    fileName = $("#hiddenwordseq").val() + "-sen2-" + type + ".mp3"; 
                }

                if (checkFileExists(currentURL + pathUrl + fileName)) {

                    console.log('File exists.');
                    var audioElement = document.createElement('audio');
                    audioElement.setAttribute('src', '.' + pathUrl + fileName);
                    audioElement.setAttribute('autoplay', 'autoplay');
                    
                } else {

                    console.log('File does not exist.');
                    Efw('study_testword_downloadvoice',{type : type});
                    setTimeout(function(){
                        pronounceB(content , no, type);
                    }, 6000);

                }




                //Efw('testrestapi');

            }

            function pronounceA(content, no) {

                let word = content;
                let u = new SpeechSynthesisUtterance();
                u.lang = 'en-US';
                u.text = word;
                speechSynthesis.speak(u);

            }

            function checkFileExists(url) {
                var xhr = new XMLHttpRequest();
                xhr.open('HEAD', url, false);
                xhr.send();
                return xhr.status === 200;
            }

        </script>
    </head>

    <body onload="init();">

        <div class="content" style="width: 100%;">
            <!-- <div class="c_detail_header" style="margin-top: 20px;height:40px;text-align: right;">
                <a href="study_testword_init.jsp" style="font-size: 24px;">戻る</a>
            </div> -->
            <div class="c_detail_header" style="margin-top: 0px;height:60px;text-align: center;">
                <span style="font-weight: bold;font-size: 40px;color:maroon;" id="nospan"></span>
            </div>
            <div>
                <div class="c_detail_header" style="margin-top: 0px;height:50px;">
                    <span style="font-weight: bold;font-size: 30px;color:blue;">【単語】</span>
                </div>
                <div class="c_detail_header" style="height:40px;text-align: right;display: none;" id="wordWrongTimeDiv">
                    <span style="font-weight: bold;font-size: 24px;color:red;">誤り回数：1回</span>
                </div>
                <div style="margin-top:10px;text-align: center;width: 100%;">
                    <span style="font-size: 30px;font-weight: bold;" id="wordJSpan"></span>
                    <img style="width: 80px;height: 80px;margin: -2px;display: none;" src="img/speaker.png" id="wordIcon" onclick="playVoice(1,1);" ondblclick="playVoice(1,2);">
                </div>
                <div style="margin-top:20px;text-align: center;width: 100%;" id="wordEDiv">
                </div>
                <div style="margin-top:20px;text-align: center;width: 100%;display: flex;justify-content: center;align-items: center;display: none;">
                    <div class="wrongworddiv">this is a dog</div>
                </div>
                <div style="margin-top:20px;text-align: center;width: 100%;display: flex;justify-content: center;align-items: center;display: none;">
                    <div class="worddiv">this is a dog</div>
                </div>
            </div>
            <div id="sen1div" style="display: none;">
                <div class="c_detail_header" style="margin-top: 20px;height:50px;">
                    <span style="font-weight: bold;font-size: 30px;color:blue;">【例句】</span>
                </div>
                <div class="c_detail_header" style="height:40px;text-align: right;display: none;" id="sen1WrongTimeDiv">
                    <span style="font-weight: bold;font-size: 24px;color:red;">誤り回数：1回</span>
                </div>
                <div style="margin-top:20px;text-align: center;width: 100%;">
                    <span style="font-size: 30px;font-weight: bold;" id="sen1JSpan"></span>
                    <img style="width: 80px;height: 80px;margin: -2px;display: none;" src="img/speaker.png" id="sen1Icon" onclick="playVoice(2,1);" ondblclick="playVoice(2,2);">
                </div>
                <div style="margin-top:20px;text-align: center;width: 100%;" id="sen1EDiv">
                    <input type="text" class="inputsentence" id="inputsentence1" autocomplete="off"/>
                </div>
                <div style="margin-top:20px;text-align: center;width: 100%;display: flex;justify-content: center;align-items: center;display: none;">
                    <div class="wrongsen1div">this is a dog</div>
                </div>
                <div style="margin-top:20px;text-align: center;width: 100%;display: flex;justify-content: center;align-items: center;display: none;">
                    <div class="sen1div">this is a dog</div>
                </div>
                <br/>
            </div>
            <div id="sen2div" style="display: none;">
                <div class="c_detail_header" style="margin-top: 20px;height:60px;">
                    <span style="font-weight: bold;font-size: 30px;color:blue;">【例句】</span>
                </div>
                <div class="c_detail_header" style="height:40px;text-align: right;display: none;" id="sen2WrongTimeDiv">
                    <span style="font-weight: bold;font-size: 24px;color:red;">誤り回数：1回</span>
                </div>
                <br/>
                <div style="margin-top:20px;text-align: center;width: 100%;">
                    <span style="font-size: 30px;font-weight: bold;" id="sen2JSpan"></span>
                    <img style="width: 80px;height: 80px;margin: -2px;display: none;" src="img/speaker.png" id="sen1Icon" onclick="playVoice(3,1);" ondblclick="playVoice(3,2);">
                </div>
                <br/>
                <div style="margin-top:20px;text-align: center;width: 100%;" id="sen2EDiv">
                    <input type="text" class="inputsentence"  id="inputsentence2" autocomplete="off"/>
                </div>
                <div style="margin-top:20px;text-align: center;width: 100%;display: flex;justify-content: center;align-items: center;display: none;">
                    <div class="wrongsen2div">this is a dog</div>
                </div>
                <div style="margin-top:20px;text-align: center;width: 100%;display: flex;justify-content: center;align-items: center;display: none;">
                    <div class="sen2div">this is a dog</div>
                </div>
                <br/>
            </div>
            <div style="margin-top:20px;text-align: center;width: 100%;height: 120px;;">
                <button onclick="goBack()" style="width: 30%;height: 80px;font-size: 30px;font-weight: bold;" id="btnback">前へ</button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button onclick="goNext()" style="width: 30%;height: 80px;font-size: 30px;font-weight: bold;" id="btnnext">次へ</button>
            </div>
        </div>

        <input type="hidden" id="hiddenOpt">

        <input type="hidden" id="hiddenTestNo">
        <input type="hidden" id="hiddenWordNo">
        <input type="hidden" id="hiddenWordCount">

        <input type="hidden" id="hiddenWordWrongTime">
        <input type="hidden" id="hiddenSen1WrongTime">
        <input type="hidden" id="hiddenSen2WrongTime">

        <input type="hidden" id="hiddenWordE">
        <input type="hidden" id="hiddenWordJ">
        <input type="hidden" id="hiddenWordC">
        <input type="hidden" id="hiddenSen1E">
        <input type="hidden" id="hiddenSen1J">
        <input type="hidden" id="hiddenSen1C">
        <input type="hidden" id="hiddenSen2E">
        <input type="hidden" id="hiddenSen2J">
        <input type="hidden" id="hiddenSen2C">

        <input type="hidden" id="hiddenWay">

        <input type="hidden" id="hiddenBook">
        <input type="hidden" id="hiddenclassification">
        <input type="hidden" id="hiddenwordseq">

        <input type="hidden" id="hiddenMp3">
    </body>
</html>