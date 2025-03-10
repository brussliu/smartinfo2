<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="efw" uri="efw" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>単語ノート</title>
    <efw:Client />
    <link rel="stylesheet" href="css/common.css" type="text/css" />
    <link href="favicon.ico" rel="icon" type="image/x-icon" />
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="js/jSignature.min.js"></script>
    <script type="text/javascript" src="js/flashcanvas.js"></script>
    <style>

        .sign_box {
            padding: 0px 5px 5px 5px;
            height: 98.5%;
        }

        .B {
            border: 2px solid gray;
            background: rgb(255,255,240);
            width: 1267px;
            height: 620px;
            cursor: url("img/pen.png"),auto;
            position: relative;
        }

        .D {
            border: 2px solid red;
            background: rgb(255,255,240);
            width: 5106px;
            height: 1360px;
            cursor: url("img/pen.png"),auto;
            position: relative;
        }

        .E {
            border: 2px solid red;
            background: rgb(255,255,240);
            width: 696px;
            height: 296px;
            cursor: url("img/pen.png"),auto;
            position: relative;
        }

        .F {
            border: 2px solid red;
            background: rgb(255,255,240);
            width: 716px;
            height: 296px;
            cursor: url("img/pen.png"),auto;
            position: relative;
        }
        .G {
            border: 2px solid red;
            background: rgb(255,255,240);
            width: 1907px;
            height: 1170px;
            cursor: url("img/pen.png"),auto;
            position: relative;
        }
        /* .E_T,.E_F {
            height: 30px;
        } */

        .B::after,.B::before,.D::after,.D::before,.E::after,.E::before,.F::after,.F::before,.G::after,.G::before {
            content: ' ';
            position: absolute;
            left: 5%;
            width: 90%;
            height: 4px;
            background: lightgrey;
        }

        .B::before,.D::before,.E::before,.F::before,.G::before {
            bottom: 30%;
        }
        
        .B::after,.D::after,.E::after,.F::after,.G::after {
            bottom: 65%;
        }

        canvas {
            width: 100% !important;
            height: 100% !important;
        }

        #submit_btn:hover {
            background-color: lightgreen;
        }

    </style>
    <script>

        var urlParams = new URLSearchParams(window.location.search);
        var flg = urlParams.get('flg');
        var div = urlParams.get('div');
        var pc = urlParams.get('pc');

        if(flg == null || flg == ""){
            alert("アクセスは不正ですので、この画面が利用できません。");
        }

        $(document).ready(function() {

            // if (window.opener && !window.opener.closed) {

            //     $("body").keydown(function(event) {
            //         var keycode = (event.keyCode ? event.keyCode : event.which);
            //         window.opener.keydown(keycode);
            //     });
            // }


            // $("body").keydown(function(event) {

            //     var keycode = (event.keyCode ? event.keyCode : event.which);

            //     if(keycode === 13) {
                    
            //         $("#submit_btn").click();
            //     }

            // });

        });

        function overSave(){

            $("#reset_btn").click();

            if (div == 1) {

                window.opener.doKeydown(999);

            }

        }

        function keydown(keycode){
            if (div == 1) {
                window.opener.doKeydown(keycode);
            }else{
                Efw("study_testword_keydown",{keycode : keycode});
            }
            
        }

    </script>
</head>

<body>
    <div class="sign_box">
        <div id="canvas_title" style="text-align: right;height: 45px;width: 100%;background-color: lightyellow;">
            <input type="radio" name="pen" value=" 1" onchange="changePen();">&nbsp;極細</input>
            <input type="radio" name="pen" value=" 2" onchange="changePen();">&nbsp;細</input>
            <input type="radio" name="pen" value=" 5" onchange="changePen();" checked>&nbsp;中</input>
            <input type="radio" name="pen" value="10" onchange="changePen();">&nbsp;粗</input>
            <input type="radio" name="pen" value="15" onchange="changePen();">&nbsp;極粗</input>
            &nbsp;&nbsp;
            <input type="radio" name="pen" value=" 0" onchange="changePen();">&nbsp;消しゴム</input>
            &nbsp;&nbsp;
            <button type="button" id="reset_btn"  style="height: 40px; width: 100px;margin-top: 2px;">クリア</button>
            
            <button type="button" id="full_btn"   style="height: 40px; width: 100px;margin-top: 2px;margin-right: 2px;" onclick="full();">全画面</button>
            <button type="button" id="unfull_btn" style="height: 40px; width: 100px;margin-top: 2px;margin-right: 2px;display: none;" onclick="unfull();">全画面解除</button>
        </div>
        <div id="canvas_box" style="text-align: center;">
            <span id="message" style="font-size: 100px;">全画面ボタンを押下してください。</span>
        </div>
        <div id="canvas_foot" style="text-align: right;height: 45px;width: 100%;background-color: lightgreen;display: none;">
            <button type="button" id="key17" onclick="keydown(17);" style="height: 40px; width: 100px;margin-top: 2px;margin-right: 2px;">A発音</button>
            <button type="button" id="key18" onclick="keydown(18);" style="height: 40px; width: 100px;margin-top: 2px;margin-right: 2px;">B発音</button>
            <button type="button" id="key16" onclick="keydown(16);" style="height: 40px; width: 100px;margin-top: 2px;margin-right: 2px;">AI発音</button>
            <button type="button" id="submit_btn" style="height: 40px; width: 100px;margin-top: 2px;margin-right: 2px;">OK</button>
            <button type="button" id="key16" onclick="keydown(997);" style="height: 40px; width: 100px;margin-top: 2px;margin-right: 2px;">前へ</button>
            <button type="button" id="key16" onclick="keydown(998);" style="height: 40px; width: 100px;margin-top: 2px;margin-right: 2px;">次へ</button>
        </div>

    </div>
    <input type="hidden" id="signContent">
    <input type="hidden" id="signContent_tb">
</body>
<script>

    function changePen() {
        var pen = $("input[name='pen']:checked").val();
        let canvas_box = $("#canvas_box");
        if(parseInt(pen) == 0){
            canvas_box.jSignature("updateSetting","lineWidth",20, true);
            canvas_box.jSignature("updateSetting", "color" , "rgb(255,255,240)", true);
            $("#canvas_box").css("cursor", "url('img/rubber.png'),auto");
        }else{
            canvas_box.jSignature("updateSetting","lineWidth",pen, true);
            canvas_box.jSignature("updateSetting", "color" , "rgb(0,0,0)", true);
            $("#canvas_box").css("cursor", "url('img/pen.png'),auto");
        }
    };

    function full() {

        $("#full_btn").hide();
        $("#unfull_btn").show();

        // Chrome & Firefox v64以降
        if( document.body.requestFullscreen ) {
            document.body.requestFullscreen();
        // Firefox v63以前
        } else if( document.body.mozRequestFullScreen ) {
            document.body.mozRequestFullScreen();
        // Safari & Edge & Chrome v68以前
        } else if( document.body.webkitRequestFullscreen ) {
            document.body.webkitRequestFullscreen();
        // IE11
        } else if( document.body.msRequestFullscreen ) {
            document.body.msRequestFullscreen();
        }

        $("#message").hide();
        initCanvas();

        $("#canvas_foot").show();
        
    }
    function unfull() {

        $("#unfull_btn").hide();
        $("#full_btn").show();

        // Chrome & Firefox v64以降
        if( document.exitFullscreen ) {
            document.exitFullscreen();
        // Firefox v63以前
        } else if( document.mozCancelFullScreen ) {
            document.mozCancelFullScreen();
        // Safari & Edge & Chrome v44以前
        } else if( document.webkitCancelFullScreen ) {
            document.webkitCancelFullScreen();
        // IE11
        } else if( document.msExitFullscreen ) {
            document.msExitFullscreen();
        }

    }

    function initCanvas(){
        
        // 学校PC
        if(pc == "A"){
            $("#canvas_box").addClass("A");
        // Z会PC
        }else if(pc == "B"){
            $("#canvas_box").addClass("B");
        // 49インチモニター
        }else if(pc == "D"){
            $("#canvas_box").addClass("D");
        // Mate20X
        }else if(pc == "E"){
            $("#canvas_box").addClass("E");
            $("button").css("height","26px");
            $("button").css("width","70px");
            $("#unfull_btn").css("width","100px");
            $("button").css("margin-right","12px");
            $("#canvas_title").css("height","30px");
            $("#canvas_title").css("font-size","12px");
            $("#canvas_foot").css("height","30px");
            $("#canvas_title").css("width","700px");
            $("#canvas_foot").css("width","700px");
        // P40 pro
        }else if(pc == "F"){
            $("#canvas_box").addClass("F");
            $("button").css("height","26px");
            $("button").css("width","70px");
            $("#unfull_btn").css("width","100px");
            $("button").css("margin-right","12px");
            $("#canvas_title").css("height","30px");
            $("#canvas_title").css("font-size","12px");
            $("#canvas_title").css("width","720px");
            $("#canvas_foot").css("height","30px");
            $("#canvas_foot").css("width","720px");
        // CF-QV8
        }else if(pc == "G"){
            $("#canvas_box").addClass("G");
        }
        let canvas_box = $("#canvas_box");
        canvas_box.jSignature({lineWidth:'5'});
        let signImgSrc = "";


        $("#canvas_box").on("touchstart mousemove touchend",function () {
        });

        $("#reset_btn").on("click",function (e) {
            canvas_box.jSignature("reset");
            signImgSrc = "";
            e.preventDefault();
        });


        $("#submit_btn").on("click",function (e) {

            let signLen = canvas_box.jSignature("getData","native").length; 
            if(signLen==0){	
                alert("メモしていません！");
            }else{
                let datapair = canvas_box.jSignature("getData","image");
                signImgSrc = 'data:' + datapair[0] + "," + datapair[1];
                $("#signContent").val(signImgSrc);
                $("#signContent_tb").val(signImgSrc);
                if(flg == null || flg == ""){
                    alert("アクセスは不正ですので、この画面が利用できません。");
                }else{
                    Efw("study_testword_savenote",{flg : flg,keycode : 999});
                    
                }
                
            }
        });
    }
    </script>
</html>