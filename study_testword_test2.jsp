<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="efw" uri="efw" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>単語テスト</title>
        <efw:Client />
        <link rel="stylesheet" href="css/common.css" type="text/css" />
        <script type="text/javascript" src="js/common.js"></script>
        <script type="text/javascript" src="js/study2.js"></script>
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
            #worddiv_right,#sen1div_right,#sen2div_right {
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

                //return;
                $('#hiddenOpt').val("next");
                Efw('study_testword_updatedetail');
            }
            // function displayNote(){

                
            //     $('#wordinput').arc
            //     console.log("SSSSSSSSSSSSSSSSSSS");
            // }

            var status = null;

            $(document).ready(function() {


                setInterval(function() {

                    Efw('study_testword_getwordnote');
                    console.log('interval');

                }, 2000);

                // window.addEventListener('message', function(event) {

                //     if(event.data != null && event.data != ""){

                //         $('#wordinput').attr('src', event.data);
                //         $('#wordinput').show();
                //         $('#wordinput').parent().css('display', 'flex');

                //         $('#wordinput').parent().prev().css('display', 'flex');

                //     }

                // });

                $("body").keydown(function(event) {

                    var keycode = (event.keyCode ? event.keyCode : event.which);
                    keydown(keycode);

                });


            });

            function keydown(keycode){

                var status = getStatus();

                if(status == "1" || status == "2" || status == "3"){
                    if(keycode === 16) {
                        playVoice(parseInt(status),0);
                    }
                    if(keycode === 17) {
                        playVoice(parseInt(status),1);
                    }
                    if(keycode === 18) {
                        playVoice(parseInt(status),2);
                    }
                }
            }

            function getStatus(){


                if($('#wordinput').attr('src') == null || $('#wordinput').attr('src') == ""){

                    status = "1";

                }else if($('#sen1input').attr('src') == null || $('#sen1input').attr('src') == ""){

                    if($("#sen1div").css("display") == "none"){
                        status = "1E";
                    }else{
                        status = "2";
                    }

                }else{

                    if($("#sen2div").css("display") == "none"){
                        status = "2E";
                    }else{
                        status = "3";
                    }

                }

                // if($("#sen1div").css("display") == "none"){

                //     status = "1";

                // }else{

                //     if($("#sen2div").css("display") == "none"){
                //         status = "2";
                //     }else{
                //         status = "3";
                //     }

                // }

                return status;
            }

            // function setNoteSeq(seq){

            //     var status = getStatus();

            //     // <input type="hidden" id="hiddenWordNoteSeq">
            //     // <input type="hidden" id="hiddenSen1NoteSeq">
            //     // <input type="hidden" id="hiddenSen2NoteSeq">

            //     // 単語
            //     if(status == "1"){

            //         console.log("11111111111111111111111111111111");
            //         console.log(seq);
            //         console.log("11111111111111111111111111111111");

            //         alert("OOOOOOO");

            //         $("#hiddenWordNoteSeq").val(seq);
            //     }
            //     if(status == "2"){

            //         console.log("22222222222222222222222222222222");
            //         console.log(seq);
            //         console.log("22222222222222222222222222222222");

            //         $("#hiddenSen1NoteSeq").val(seq);
            //     }
            //     if(status == "3"){

            //         console.log("33333333333333333333333333333333");
            //         console.log(seq);
            //         console.log("33333333333333333333333333333333");
            //         $("#hiddenSen2NoteSeq").val(seq);
            //     }
            // }

            function displayNote(seq,notecontent){

                var status = getStatus();

                // <input type="hidden" id="hiddenWordNoteSeq">
                // <input type="hidden" id="hiddenSen1NoteSeq">
                // <input type="hidden" id="hiddenSen2NoteSeq">

                // 単語
                if(status == "1"){

                    $("#hiddenWordNoteSeq").val(seq);
                    $('#wordinput').prop('src', notecontent);
                    $('#wordinput').parent().css('display','flex');
                    $('#wordinput').parent().prev().css('display','flex');

                    overWord();
                    showSen1();

                    $("#alldiv").scrollTop($("#alldiv").prop("scrollHeight"));
                    //return;
                }
                if(status == "2"){


                    $("#hiddenSen1NoteSeq").val(seq);
                    $('#sen1input').prop('src', notecontent);
                    $('#sen1input').parent().css('display','flex');
                    $('#sen1input').parent().prev().css('display','flex');

                    overSen1();
                    showSen2();
                   
                    $("#alldiv").scrollTop($("#alldiv").prop("scrollHeight"));
                    //return;
                }
                if(status == "3"){

                    $("#hiddenSen2NoteSeq").val(seq);
                    $('#sen2input').prop('src', notecontent);
                    $('#sen2input').parent().css('display','flex');
                    $('#sen2input').parent().prev().css('display','flex');

                    overSen2();

                    $("#alldiv").scrollTop($("#alldiv").prop("scrollHeight"));
                    //return;
                }
            }

            function sc(){

                //alert($("#alldiv").prop("scrollHeight"));
                
            }
        </script>
    </head>

    <body onload="init();">

        <div class="content" style="width: 100%;overflow: auto;" id="alldiv">
            <div class="c_detail_header" style="margin-top: 0px;height:60px;text-align: center;">
                <span style="font-weight: bold;font-size: 40px;color:maroon;" id="nospan"></span>
            </div>
            <div>
                <div class="c_detail_header" style="margin-top: 0px;height:50px;">
                    <span style="font-weight: bold;font-size: 30px;color:brown">【単語】</span>
                </div>
                <!-- <div class="c_detail_header" style="height:40px;text-align: right;display: none;" id="wordWrongTimeDiv">
                    <span style="font-weight: bold;font-size: 24px;color:red;">誤り回数：1回</span>
                </div> -->
                <div style="margin-top:10px;text-align: center;width: 100%;">
                    <span style="font-size: 24px;font-weight: bold;display: none;color:blue;" id="wordCSpan"></span><br/>
                    <span style="font-size: 30px;font-weight: bold;display: none;" id="wordJSpan"></span><br/>
                    <img style="width: 80px;height: 80px;margin: -2px;display: none;" src="img/speaker.png" id="wordIcon" onclick="playVoice(1,1);" ondblclick="playVoice(1,2);">
                </div>
                <!-- <div style="margin-top:20px;text-align: center;width: 100%;" id="wordEDiv">
                </div>
                <div style="margin-top:20px;text-align: center;width: 100%;display: flex;justify-content: center;align-items: center;display: none;">
                    <div class="wrongworddiv">this is a dog</div>
                </div> -->
                <div style="margin-top:20px;text-align: center;width: 100%;display: flex;justify-content: center;align-items: center;display: none;">
                    <div id="worddiv_right">this is a dog</div>
                </div>
                <div style="margin-top:20px;text-align: center;width: 100%;display: flex;justify-content: center;align-items: center;display: none;">
                    <img src="" id="wordinput" width="800px" height="450px" style="border: 1px solid gray;">
                </div>
            </div>
            <div id="sen1div" style="display: none;">
                <div class="c_detail_header" style="margin-top: 20px;height:50px;">
                    <span style="font-weight: bold;font-size: 30px;color:brown;">【例句】</span>
                </div>
                <!-- <div class="c_detail_header" style="height:40px;text-align: right;display: none;" id="sen1WrongTimeDiv">
                    <span style="font-weight: bold;font-size: 24px;color:red;">誤り回数：1回</span>
                </div> -->
                <div style="margin-top:20px;text-align: center;width: 100%;">
                    <span style="font-size: 24px;font-weight: bold;display: none;color:blue;" id="sen1CSpan"></span><br/>
                    <span style="font-size: 30px;font-weight: bold;display: none;" id="sen1JSpan"></span><br/>
                    <img style="width: 80px;height: 80px;margin: -2px;display: none;" src="img/speaker.png" id="sen1Icon" onclick="playVoice(2,1);" ondblclick="playVoice(2,2);">
                </div>
                <!-- <div style="margin-top:20px;text-align: center;width: 100%;" id="sen1EDiv">
                    <input type="text" class="inputsentence" id="inputsentence1" autocomplete="off"/>
                </div>
                <div style="margin-top:20px;text-align: center;width: 100%;display: flex;justify-content: center;align-items: center;display: none;">
                    <div class="wrongsen1div">this is a dog</div>
                </div> -->
                <div style="margin-top:20px;text-align: center;width: 100%;display: flex;justify-content: center;align-items: center;display: none;">
                    <div id="sen1div_right">this is a dog</div>
                </div>
                <div style="margin-top:20px;text-align: center;width: 100%;display: flex;justify-content: center;align-items: center;display: none;">
                    <img src="" id="sen1input" width="800px" height="450px" style="border: 1px solid gray;">
                </div>
                <br/>
            </div>
            <div id="sen2div" style="display: none;">
                <div class="c_detail_header" style="margin-top: 20px;height:60px;">
                    <span style="font-weight: bold;font-size: 30px;color:brown;">【例句】</span>
                </div>
                <!-- <div class="c_detail_header" style="height:40px;text-align: right;display: none;" id="sen2WrongTimeDiv">
                    <span style="font-weight: bold;font-size: 24px;color:red;">誤り回数：1回</span>
                </div> -->
                <br/>
                <div style="margin-top:20px;text-align: center;width: 100%;">
                    <span style="font-size: 24px;font-weight: bold;display: none;color:blue;" id="sen2CSpan"></span><br/>
                    <span style="font-size: 30px;font-weight: bold;display: none;" id="sen2JSpan"></span><br/>
                    <img style="width: 80px;height: 80px;margin: -2px;display: none;" src="img/speaker.png" id="sen1Icon" onclick="playVoice(3,1);" ondblclick="playVoice(3,2);">
                </div>
                <br/>
                <!-- <div style="margin-top:20px;text-align: center;width: 100%;" id="sen2EDiv">
                    <input type="text" class="inputsentence"  id="inputsentence2" autocomplete="off"/>
                </div>
                <div style="margin-top:20px;text-align: center;width: 100%;display: flex;justify-content: center;align-items: center;display: none;">
                    <div class="wrongsen2div">this is a dog</div>
                </div> -->
                <div style="margin-top:20px;text-align: center;width: 100%;display: flex;justify-content: center;align-items: center;display: none;">
                    <div id="sen2div_right">this is a dog</div>
                </div>
                <div style="margin-top:20px;text-align: center;width: 100%;display: flex;justify-content: center;align-items: center;display: none;">
                    <img src="" id="sen2input" width="800px" height="450px" style="border: 1px solid gray;">
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

        <input type="hidden" id="hiddenBook">
        <input type="hidden" id="hiddenclassification">
        <input type="hidden" id="hiddenwordseq">

        <input type="hidden" id="hiddenMp3">

        <input type="hidden" id="hiddenWordNoteSeq">
        <input type="hidden" id="hiddenSen1NoteSeq">
        <input type="hidden" id="hiddenSen2NoteSeq">

    </body>
</html>