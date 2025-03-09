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
        <script type="text/javascript" src="js/study.js"></script>
        <script type="text/javascript" src="js/jSignature.min.js"></script>
        <script type="text/javascript" src="js/flashcanvas.js"></script>
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

            function goBack(){
                $('#hiddenOpt').val("back");
                Efw('study_testword_updatedetail');
            }

            function goNext(){

                if($('#hiddenWordCheckResult').val() != "OK"){
                    $('#hiddenWordWrongTime').val(null);
                }
                if($('#hiddenSen1CheckResult').val() != "OK"){
                    $('#hiddenSen1WrongTime').val(null);
                }
                if($('#hiddenSen2CheckResult').val() != "OK"){
                    $('#hiddenSen2WrongTime').val(null);
                }
                
                $('#hiddenOpt').val("next");
                Efw('study_testword_updatedetail');
            }

        </script>
    </head>

    <body onload="init();">
        <!-- <efw:Part path="study_testword_handwriting_inputdialog.jsp" /> -->
        <div class="content" style="width: 100%;">
            <div class="c_detail_header" style="margin-top: 0px;height:60px;text-align: center;">
                <span style="font-weight: bold;font-size: 40px;color:maroon;" id="nospan"></span>
            </div>
            <div>
                <div class="c_detail_header" style="margin-top: 0px;height:50px;">
                    <span style="font-weight: bold;font-size: 30px;color:brown">【単語】</span>
                </div>
                <div class="c_detail_header" style="height:40px;text-align: right;display: none;" id="wordWrongTimeDiv">
                    <span style="font-weight: bold;font-size: 24px;color:red;">誤り回数：1回</span>
                </div>
                <div style="margin-top:10px;text-align: center;width: 100%;">
                    <span style="font-size: 24px;font-weight: bold;display: none;color:blue;" id="wordCSpan"></span><br/>
                    <span style="font-size: 30px;font-weight: bold;display: none;" id="wordJSpan"></span><br/>
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
                    <span style="font-weight: bold;font-size: 30px;color:brown;">【例句】</span>
                </div>
                <div class="c_detail_header" style="height:40px;text-align: right;display: none;" id="sen1WrongTimeDiv">
                    <span style="font-weight: bold;font-size: 24px;color:red;">誤り回数：1回</span>
                </div>
                <div style="margin-top:20px;text-align: center;width: 100%;">
                    <span style="font-size: 24px;font-weight: bold;display: none;color:blue;" id="sen1CSpan"></span><br/>
                    <span style="font-size: 30px;font-weight: bold;display: none;" id="sen1JSpan"></span><br/>
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
                    <span style="font-weight: bold;font-size: 30px;color:brown;">【例句】</span>
                </div>
                <div class="c_detail_header" style="height:40px;text-align: right;display: none;" id="sen2WrongTimeDiv">
                    <span style="font-weight: bold;font-size: 24px;color:red;">誤り回数：1回</span>
                </div>
                <br/>
                <div style="margin-top:20px;text-align: center;width: 100%;">
                    <span style="font-size: 24px;font-weight: bold;display: none;color:blue;" id="sen2CSpan"></span><br/>
                    <span style="font-size: 30px;font-weight: bold;display: none;" id="sen2JSpan"></span><br/>
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

        <input type="hidden" id="hiddenWay2">
        <input type="hidden" id="hiddenWay3">
        <input type="hidden" id="hiddenWay4">

        <input type="hidden" id="hiddenBook">
        <input type="hidden" id="hiddenclassification">
        <input type="hidden" id="hiddenwordseq">

        <input type="hidden" id="hiddenMp3">

        <input type="hidden" id="hiddenWordNoteSeq">
        <input type="hidden" id="hiddenSen1NoteSeq">
        <input type="hidden" id="hiddenSen2NoteSeq">

        <input type="hidden" id="hiddenWordCheckResult">
        <input type="hidden" id="hiddenSen1CheckResult">
        <input type="hidden" id="hiddenSen2CheckResult">
    </body>
</html>