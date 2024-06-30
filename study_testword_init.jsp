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
                


                $('#testway').show();
                $('#testway').next().next().show();

                $('#testway').next().next().next().show();

            }

            function changeTestCount(){

                var count = $("#opt_testcount").val();
                $('#worldCountDiv2').children().eq(0).html("単語数：" + count + "個");

                
            }

            function changeTestWay1(){

                var way = $("input[name='radioword']:checked").val();
                if(way == "all"){
                    var count = $("#worldCounthidden").val();
                    $('#worldCountDiv2').children().eq(0).html("単語数：" + count + "個");


                    $('#opt_testcount').prop('disabled', true);

                    $('#testwayhidden1').val("all");
                    

                }else if(way == "part"){

                    var count1 = $("#worldCounthidden").val();
                    var count2 = $("#opt_testcount").val();

                    $('#worldCountDiv2').children().eq(0).html("単語数：" + (count1 < count2 ? count1 : count2) + "個");

                    $('#opt_testcount').prop('disabled', false);

                    $('#testwayhidden1').val("part");
                }
            }
            function changeTestWay2(){

                var way = $("input[name='testway']:checked").val();

                $('#testwayhidden2').val(way);

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

        </script>
    </head>

    <body onload="init()">

        <div class="content" style="width: 100%;">
            <div class="c_detail_header" style="margin-top: 20px;height:200px;">
                <span style="font-weight: bold;font-size: 30px;color:blue;">【テスト範囲】</span>
                <br/><br/>
                <table style="width: 100%;">
                    <tr style="height: 60px;">
                        <td style="font-weight: bold;font-size: 30px;">
                            &nbsp;・書籍
                            <select id="opt_book" style="width: 417px;height:60px;border-style: solid;font-size: 24px;" tabindex="10" onchange="initclassification();">
                            </select>
                        </td>
                    </tr>
                    <tr style="height: 60px;">
                        <td style="font-weight: bold;font-size: 30px;">
                            &nbsp;・条件
                            <select id="opt_dayfrom" style="width: 180px;height:60px;border-style: solid;font-size: 24px;" onchange="changeDayTo();" tabindex="20">
                                <option value=""></option>
                            </select>
                            ～
                            <select id="opt_dayto" style="width: 180px;height:60px;border-style: solid;font-size: 24px;" onchange="changeDayFrom();" tabindex="30">
                                <option value=""></option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
            <br/>
            <div style="margin-top:20px;text-align: center;width: 100%;">
                <button onclick="fixRange();" id="btnFixRange" style="width: 70%;height: 80px;font-size: 30px;font-weight: bold;" tabindex="40">範囲確認</button>
            </div>
            <br/>
            <div style="margin-top:20px;text-align: center;width: 100%;display: none;" id="worldCountDiv1">
                <span style="font-size: 30px;color: red;font-weight: bold;">
                    <!-- 単語数：9999個 -->
                </span>
                <input type="hidden" id="worldCounthidden">
            </div>
            <br/>
            <div class="c_detail_header" style="margin-top: 0px;height:200px;display: none;" id="testway">
                <span style="font-weight: bold;font-size: 30px;color:blue;">【テスト方式】</span>
                <br/><br/>
                <table style="width: 100%;">
                    <tr style="height: 60px;">
                        <td style="font-weight: bold;font-size: 30px;">
                            &nbsp;
                            <input type="radio" tabindex="50" id="rdo_all" style="width: 30px;height: 30px;" name="radioword" onchange="changeTestWay1();" value="all" checked>&nbsp;全部　&nbsp;&nbsp;
                            <input type="radio" tabindex="60" id="rdo_port" style="width: 30px;height: 30px;" name="radioword" onchange="changeTestWay1();" value="part">&nbsp;一部抽選
                            <input type="hidden" id="testwayhidden1" value="all">
                            <select id="opt_testcount" tabindex="70" style="width: 180px;height:60px;border-style: solid;font-size: 24px;margin-top: 0px;" onchange="changeTestCount();" disabled>
                                <option value="10">10語</option>
                                <option value="20">20語</option>
                                <option value="30">30語</option>
                                <option value="50">50語</option>
                                <option value="80">80語</option>
                                <option value="100">100語</option>
                            </select>
                        </td>
                    </tr>
                    <tr style="height: 60px;">
                        <td style="font-weight: bold;font-size: 30px;">
                            &nbsp;
                            <input type="radio" style="width: 30px;height: 30px;" tabindex="80" name="testway" onchange="changeTestWay2();" value="translate" checked>&nbsp;日訳英&nbsp;&nbsp;
                            <input type="radio" style="width: 30px;height: 30px;" tabindex="90" name="testway" onchange="changeTestWay2();" value="voice" >&nbsp;音声
                            <input type="hidden" id="testwayhidden2" value="translate">
                        </td>
                    </tr>
                </table>
            </div>
            <br/>
            <div style="margin-top:20px;text-align: center;width: 100%;display: none;" id="worldCountDiv2">
                <span style="font-size: 30px;color: red;font-weight: bold;">
                    <!-- 単語数：10個 -->
                </span>
                <input type="hidden" id="worldCounthidden">
            </div>
            <div style="margin-top:20px;text-align: center;width: 100%;display: none;">
                <button onclick="startTest();" style="width: 70%;height: 80px;font-size: 30px;font-weight: bold;" tabindex="100" >テスト開始</button>
            </div>
        </div>
    </body>
</html>