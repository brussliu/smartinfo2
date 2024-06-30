<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="study_testword_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var study_testword_inputdialog = null;
            $(function () {
                study_testword_inputdialog = $("#study_testword_inputdialog").dialog({
                    title: "単語リスト",
                    autoOpen: false,
                    resizable: true,
                    height: 800,
                    width: 1500,
                    modal: true,
                    open: function () {
                        setTimeout(function () { });
                    },
                    close: function () {
                        setTimeout(function () { });
                    },
                });

            });
        </script>
        <style>
        </style>

        <div style="margin: 10px;">
          
            <table class="table_detail_header" id="wordlisttable" style="table-layout: fixed;text-align: center;" border="1">
                <thead>
                    <tr class="header2">
                        <th style="width: 60px;">枝番号</th>
                        <th style="width: 100px;">書籍</th>
                        <th style="width: 100px;">分類</th>

                        <th style="width: 80px;">単語SEQ</th>
                        <th style="width: 120px;">単語</th>
                        <th style="width: 180px;">日本語</th>
                        <th style="width: 250px;">例句-1</th>
                        <th style="width: 250px;">日本語</th>
                        <th style="width: 250px;">例句-2</th>
                        <th style="width: 250px;">日本語</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>

            </table>

        </div>
    </div>