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
            var urlParams = new URLSearchParams(window.location.search);
            var testno = urlParams.get('testno');

            $(document).ready(function() {


            });


            // 初期化
            function init() {
                Efw('study_testword_listcheck',{testno : testno});
            }

            function checkWord(obj){

                var name = $(obj).prop("name");

                var nameArr = name.split("_");
                // cr_{testno}_{subno}_{kbn}_{book}_{classification}_{wordseq}
                var testno = nameArr[1];
                var subno = nameArr[2];
                var kbn = nameArr[3];
                var book = nameArr[4];
                var classification = nameArr[5];
                var wordseq = nameArr[6];

                var checkresult = $(obj).val();

                Efw('study_testword_checkword',{testno:testno, subno:subno, kbn:kbn, book:book, classification:classification, wordseq:wordseq, checkresult:checkresult});

            }

            function changeColor(testno,subno){

                $("#testwordchecktable tr").each(function () {

                    var t1 = $(this).children().eq(0).children().eq(0).html();
                    var t2 = $(this).children().eq(1).children().eq(0).html();

                    if(t1 == testno && t2 == subno){

                        var kikan = $(this).children().eq(7).children().eq(0).html().substring(0, 10);
                        var today = (new Date()).format("yyyy/MM/dd");

                        $(this).css("background-color", "gray");

                    }

                });
            }

        </script>
    </head>

    <body onload="init();">
        <div style="overflow: auto;">
            <div class="content">
                <div class="c_detail_header" style="overflow: hidden;" >
                    <table class="table_detail_header" style="table-layout: fixed;">
                        <thead>
                            <tr class="header">
                                <th style="width: 160px;">テスト番号</th>
                                <th style="width:  60px;">枝番号</th>
                                <th style="width: 160px;">書籍</th>
                                <th style="width: 100px;">分類</th>
                                <th style="width: 100px;">SEQ</th>
                                <th style="width: 100px;">区分</th>

                                <th style="width: 200px;">正解</th>
                                <th style="width: 410px;">答え</th>

                                <th style="width: 100px;">○</th>
                                <th style="width: 100px;">×</th>
                            </tr>
                        </thead>
                    </table>
                </div>

                <div class="c_detail_content" style="overflow: auto;height: 1000px;" onscroll="scrollHead(this);">
                    <table class="table_detail_content" id="testwordchecktable" style="table-layout: fixed;">

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