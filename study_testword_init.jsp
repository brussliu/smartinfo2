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

        </style>
        <script>


            $(document).ready(function() {

                // alert(screen.availWidth);
                // alert(window.innerWidth);

                // window.moveTo(0,0);
                // window.resizeTo(screen.availWidth + 10,1000);

                // alert(window.innerWidth);
                // 添加一个option
                // for(var i = 1;i <= 70;i ++){

                //     var key = "Day" + i.toString().padStart(2, '0');

                //     $("#opt_dayfrom").append("<option class='addcontent' value='" + i + "'>" + key + "</option>");
                //     $("#opt_dayto").append("<option class='addcontent' value='" + i + "'>" + key + "</option>");
                // }
            
                $("#opt_dayfrom").focus();
            });

            function changeDayTo(){

                var from = $("#opt_dayfrom").val();
                var to = $("#opt_dayto").val();

                $('#opt_dayto option').each(function(){
                    var optionValue = $(this).val();
                    var optionText = $(this).text();

                    if(optionValue < from){
                        $(this).hide();
                    }else{
                        $(this).show();
                    }
                    
                });
                if(to == ""){
                    $("#opt_dayto").val(from);
                }

                $("#opt_dayto").focus();
                
            }

            function changeDayFrom(){

                var from = $("#opt_dayfrom").val();
                var to = $("#opt_dayto").val();

                $('#opt_dayfrom option').each(function(){
                    var optionValue = $(this).val();
                    var optionText = $(this).text();

                    if(optionValue > to){
                        $(this).hide();
                    }else{
                        $(this).show();
                    }
                    
                });
                if(from == ""){
                    $("#opt_dayfrom").val(to);
                }

                $("#btnFixRange").focus();

            }

            function focusNext(){
                $("#rdo_all").focus();
            }

            function fixRange() {
                Efw("study_testword_fixrange");
            }

            function showWorldCount(count) {

                $('#worldCounthidden').val(count);

                $('#worldCountDiv1').children().eq(0).html("単語数：" + count + "個");
                $('#worldCountDiv1').show();


                var count2 = $("#opt_testcount").val();

                var way = $("input[name='radioword']:checked").val();

                if(way == "all"){

                    $('#worldCountDiv2').children().eq(0).html("単語数：" + count + "個");
                    
                }else{

                    $('#worldCountDiv2').children().eq(0).html("単語数：" + (count < count2 ? count : count2) + "個");

                }          
                $('#worldCountDiv2').show();


                $('#testway').show();
                $('#testway').next().next().show();

                $('#testway').next().next().next().show();

            }

            function changeTestCount(){

                var count = $("#opt_testcount").val();
                $('#worldCountDiv2').children().eq(0).html("単語数：" + count + "個");

                $('#worldCountDiv2').show();
            }

            function changeTestWay1(){

                var way = $("input[name='radioword']:checked").val();
                if(way == "all"){
                    var count = $("#worldCounthidden").val();
                    $('#worldCountDiv2').children().eq(0).html("単語数：" + count + "個");

                    $('#worldCountDiv2').show();
                    $('#opt_testcount').prop('disabled', true);

                    $('#testway1hidden').val("all");
                    

                }else if(way == "part"){

                    var count1 = $("#worldCounthidden").val();
                    var count2 = $("#opt_testcount").val();

                    $('#worldCountDiv2').children().eq(0).html("単語数：" + (count1 < count2 ? count1 : count2) + "個");
                    $('#worldCountDiv2').show();
                    $('#opt_testcount').prop('disabled', false);

                    $('#testway1hidden').val("part");
                }
            }
            function changeTestDiv(){

                var div = $("input[name='radiodiv']:checked").val();
                if(div == "1"){
                    $('#opt_way2').prop('disabled', false);
                    $('#opt_way3').prop('disabled', false);
                    $("input[type='radio'][name='radioword']").prop("disabled", false);

                    var way = $("input[name='radioword']:checked").val();
                    if(way == "all"){
                        var count = $("#worldCounthidden").val();
                        $('#worldCountDiv2').children().eq(0).html("単語数：" + count + "個");

                        $('#opt_testcount').prop('disabled', true);

                        $('#testway1hidden').val("all");
                    }else{
                        var count1 = $("#worldCounthidden").val();
                        var count2 = $("#opt_testcount").val();

                        $('#worldCountDiv2').children().eq(0).html("単語数：" + (count1 < count2 ? count1 : count2) + "個");

                        $('#opt_testcount').prop('disabled', false);
                        $('#testway1hidden').val("part");
                    }

                }
                if(div == "2"){

                    $('#opt_way3').val("0");
                    $('#opt_way3').prop('disabled', true);

                    $('#opt_way2').prop('disabled', false);

                    $("input[type='radio'][name='radioword']").prop("disabled", false);

                    var way = $("input[name='radioword']:checked").val();
                    if(way == "all"){
                        var count = $("#worldCounthidden").val();
                        $('#worldCountDiv2').children().eq(0).html("単語数：" + count + "個");

                        $('#opt_testcount').prop('disabled', true);

                        $('#testway1hidden').val("all");
                    }else{
                        var count1 = $("#worldCounthidden").val();
                        var count2 = $("#opt_testcount").val();

                        $('#worldCountDiv2').children().eq(0).html("単語数：" + (count1 < count2 ? count1 : count2) + "個");

                        $('#opt_testcount').prop('disabled', false);
                        $('#testway1hidden').val("part");
                    }

                }
                if(div == "3"){
                    $('#opt_way2').val("0");
                    $('#opt_way2').prop('disabled', true);
                    $('#opt_way3').val("0");
                    $('#opt_way3').prop('disabled', true);

                    $("input[type='radio'][name='radioword'][value='all']").prop("checked", true);
                    $("input[type='radio'][name='radioword']").prop("disabled", true);

                    var count = $("#worldCounthidden").val();
                    $('#worldCountDiv2').children().eq(0).html("単語数：" + count + "個");

                    $('#opt_testcount').prop('disabled', true);

                    $('#testway1hidden').val("all");

                    
                    // <input type="radio" tabindex="50" id="rdo_all" style="width: 16px;height: 16px;" name="radioword" onchange="changeTestWay1();" value="all" checked>&nbsp;全部
                    // <input type="radio" tabindex="60" id="rdo_port" style="width: 16px;height: 16px;" name="radioword" onchange="changeTestWay1();" value="part">&nbsp;一部抽選
                    // <input type="hidden" id="testway1hidden" value="all">
                    // <select id="opt_testcount" tabindex="70" style="width: 80px;height:30px;border-style: solid;font-size: 16px;margin-top: 0px;" onchange="changeTestCount();" disabled>
                    //     <option value="10">10語</option>
                    //     <option value="20">20語</option>
                    //     <option value="30">30語</option>
                    //     <option value="50">50語</option>
                    //     <option value="80">80語</option>
                    //     <option value="100">100語</option>
                    // </select>


                }

                $('#testway4hidden').val(div);
                
            }

            function startTest(){
                Efw("study_testword_starttest");
            }

            function init(){
                Efw("study_testword_init_init");
            }

            function initclassification(){

                Efw('study_testword_init_initclassification');
            }

            function fullScreen(obj){

                $(obj).hide();
                $(obj).next().show();

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

            }

            function unfullScreen(obj){

                $(obj).hide();
                $(obj).prev().show();

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
        </script>
    </head>

    <body onload="init()">

        <div class="content" style="width: 100%;">
            <div class="c_detail_header" style="margin-top: 20px;height:205px;">
                <table style="width: 100%;" border="0">
                    <tr style="height: 50px;">
                        <td style="font-weight: bold;font-size: 16px;">
                            <span style="font-weight: bold;font-size: 20px;color:blue;">【テスト範囲】</span>
                        </td>
                        <td rowspan="3" style="vertical-align: text-top;">
                            <img src="img/full.png" onclick="fullScreen(this);" style="cursor: pointer;float: right;" width="50px;" height="50px;"></img>
                            <img src="img/unfull.png" onclick="unfullScreen(this);" style="cursor: pointer;float: right;display: none;" width="22px;" height="22px;"></img>
                        </td>
                    </tr>
                    <tr style="height: 40px;">
                        <td style="font-weight: bold;font-size: 16px;">
                            &nbsp;・書籍
                            <select id="opt_book" style="width: 230px;height:30px;border-style: solid;font-size: 16px;" tabindex="10" onchange="initclassification();">
                            </select>
                        </td>
                    </tr>
                    <tr style="height: 40px;">
                        <td style="font-weight: bold;font-size: 16px;">
                            &nbsp;・条件
                            <select id="opt_dayfrom" style="width: 100px;height:30px;border-style: solid;font-size: 16px;" onchange="changeDayTo();" tabindex="20">
                                <option value=""></option>
                            </select>
                            ～
                            <select id="opt_dayto" style="width: 100px;height:30px;border-style: solid;font-size: 16px;" onchange="changeDayFrom();" tabindex="30">
                                <option value=""></option>
                            </select>
                        </td>
                    </tr>
                    <tr style="height: 60px;">
                        <td style="font-weight: bold;font-size: 16px;text-align: center;" colspan="2">
                            <button onclick="fixRange();" id="btnFixRange" style="width: 70%;height: 40px;font-size: 20px;font-weight: bold;" tabindex="40">範囲確認</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="text-align: center;width: 100%;display: none;" id="worldCountDiv1">
                <span style="font-size: 20px;color: red;font-weight: bold;">
                    <!-- 単語数：9999個 -->
                </span>
                <input type="hidden" id="worldCounthidden">
            </div>
            <div class="c_detail_header" style="margin-top: 0px;height:290px;display: none;" id="testway">
                <table style="width: 100%;" border="0">
                    <tr style="height: 50px;">
                        <td style="font-weight: bold;font-size: 16px;">
                            <span style="font-weight: bold;font-size: 20px;color:blue;">【テスト方式】</span>
                        </td>
                    </tr>
                    <tr style="height: 40px;">
                        <td style="font-weight: bold;font-size: 16px;">
                            &nbsp;・範囲
                            <input type="radio" tabindex="50" id="rdo_all" style="width: 16px;height: 16px;" name="radioword" onchange="changeTestWay1();" value="all" checked>&nbsp;全部
                            <input type="radio" tabindex="60" id="rdo_port" style="width: 16px;height: 16px;" name="radioword" onchange="changeTestWay1();" value="part">&nbsp;一部抽選
                            <input type="hidden" id="testway1hidden" value="all">
                            <select id="opt_testcount" tabindex="70" style="width: 80px;height:30px;border-style: solid;font-size: 16px;margin-top: 0px;" onchange="changeTestCount();" disabled>
                                <option value="10">10語</option>
                                <option value="20">20語</option>
                                <option value="30">30語</option>
                                <option value="50">50語</option>
                                <option value="80">80語</option>
                                <option value="100">100語</option>
                            </select>
                        </td>
                    </tr>
                    <tr style="height: 40px;">
                        <td style="font-weight: bold;font-size: 16px;">
                            &nbsp;・種類
                            <select id="opt_way2" tabindex="71" style="width: 200px;height:30px;border-style: solid;font-size: 16px;margin-top: 0px;" onchange="">
                                <option value="0">&nbsp;0.全訳英</option>
                                <option value="1" selected>&nbsp;1.日訳英(音声付き)</option>
                                <option value="2">&nbsp;2.日訳英(音声無し)</option>
                                <option value="3">&nbsp;3.音声のみ</option>
                                <option value="4">&nbsp;4.漢訳英(音声付き)</option>
                                <option value="5">&nbsp;5.漢訳英(音声無し)</option>
                                <option value="6">&nbsp;6.ランダム</option>
                            </select>
                        </td>
                    </tr>
                    <tr style="height: 40px;">
                        <td style="font-weight: bold;font-size: 16px;">
                            &nbsp;・入力方式
                            <select id="opt_way3" tabindex="71" style="width: 200px;height:30px;border-style: solid;font-size: 16px;margin-top: 0px;" onchange="">
                                <option value="0" selected>&nbsp;0.キーボード入力</option>
                                <option value="1">&nbsp;1.手書き入力</option>
                                <!-- <option value="2">&nbsp;2.手書き入力(一つ端末)</option> -->
                            </select>
                        </td>
                    </tr>
                    <tr style="height: 40px;">
                        <td style="font-weight: bold;font-size: 16px;">
                            &nbsp;・区分
                            <input type="radio" style="width: 16px;height: 16px;" tabindex="80" name="radiodiv" onchange="changeTestDiv()" value="1" checked>&nbsp;テスト
                            <input type="radio" style="width: 16px;height: 16px;" tabindex="90" name="radiodiv" onchange="changeTestDiv()" value="2" >&nbsp;練習
                            <input type="radio" style="width: 16px;height: 16px;" tabindex="90" name="radiodiv" onchange="changeTestDiv()" value="3" >&nbsp;暗记
                            <input type="hidden" id="testway4hidden" value="1">
                        </td>
                    </tr>
                    <tr style="height: 60px;">
                        <td style="font-weight: bold;font-size: 16px;text-align: center;">
                            <button onclick="startTest();" style="width: 70%;height: 40px;font-size: 20px;font-weight: bold;" tabindex="100" >テスト開始</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="margin-top:5px;text-align: center;width: 100%;display: none;" id="worldCountDiv2">
                <span style="font-size: 20px;color: red;font-weight: bold;">
                    <!-- 単語数：10個 -->
                </span>
                <input type="hidden" id="worldCounthidden">
            </div>
        </div>
    </body>
</html>