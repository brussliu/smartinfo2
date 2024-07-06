<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>SmartInfo 2.0</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <style>
                /* content */
                .content {
                    width: var(--width);
                    height: 100%;
                    vertical-align: middle;
                }

                .content_l,
                .content_r {
                    display: inline-block;
                }

                .content_l {
                    width: 68%;
                    height: 68vh;
                }

                .content_r {
                    width: 31.5%;
                    height: 68vh;
                    vertical-align: top;
                    overflow-y: auto;
                }

                /* content_l_nav     */
                .content_l_nav {
                    line-height: 35px;
                    height: 35px;
                    background: rgb(255, 255, 100);
                }

                .content_l_nav p {
                    text-indent: 2.5em;
                }

                /* content_l_btn */
                .content_l_btn {
                    width: 90%;
                    height: 68vh;
                    margin: auto;
                }

                .content_l_btn div {
                    width: 100%;
                    height: 14vh;
                    line-height: 14vh;

                    display: flex;
                    justify-content: flex-start;
                    align-items: center;
                    border-bottom: 1px dashed black;

                }

                .content_l_btn td {
                    width: 25%;
                    border-bottom: 1px dashed black;
                }

                .btn {
                    width: 235px;
                    height: 50px;
                    background: rgb(240, 240, 240);
                    font-size: 20px;
                    border: 1px solid rgb(206, 205, 205);
                    box-shadow: 5px 5px 2px #888888;
                    cursor: pointer;
                }

                /* content_l_con */
                .content_l_con p {
                    display: flex;
                    justify-content: flex-start;
                    flex-wrap: wrap;
                    flex-direction: column;
                    word-break: break-all;
                }

                .span_t {
                    border: 1px dashed rgb(145, 139, 139);
                    background-color: #c8ffff;

                }


                /*滚动条样式*/
                .content_r::-webkit-scrollbar {
                    width: 4px;
                    /*height: 4px;*/
                }

                .content_r::-webkit-scrollbar-thumb {
                    border-radius: 10px;
                    -webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
                    background: rgba(0, 0, 0, 0.2);
                }

                .content_r::-webkit-scrollbar-track {
                    -webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
                    border-radius: 0;
                    background: rgba(0, 0, 0, 0.1);

                }

                .content_b {
                    width: 95%;
                    height: 15vh;
                    margin: auto;
                    margin-top: 20px;
                    overflow-x: auto;
                  white-space: nowrap;
                }
                .content_b>div {
                    display: inline-block;

                    min-width: 200px;
                    max-width: 300px;
                    height: 110px;
                    margin: auto;
                    background-color: #ffffff;
                    border: 1px solid rgba(0, 0, 0, 0.2);
                }
                .content_b>div p:first-child {
                    height: 37px;
                    margin-left: 10px;
                    font-size: 20px;
                    line-height: 37px;
                }

                .content_b>div p:last-child {
                    width: 90%;
                    margin: auto;
                    font-size: 3.5em;
                    font-weight: bolder;
                    height: 76px;
                    margin-left: 10px;
                    border: 0;
                    text-align: right;
                }
            </style>
        </head>

        <body onload="Efw('study_menuinit');">
            <div>
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
                                    UserID:<span id="userid" style="font-weight: bold;color: yellow;">XXXX</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="topnav">
                    <p>メニュー</p>
                </div>
                <div class="content">
                    <div class="content_l">
                        <table class="content_l_btn">
                            <tbody>
                                <tr style="height: 80px;">
                                    <td><button class="btn" onclick="Efw('common_menu_goto',{page:'study_testword.jsp'})">単語テスト</button></td>
                                    <td><button class="btn" onclick="Efw('common_menu_goto',{page:'study_word.jsp'})">単語状況確認</button></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr style="height: 80px;">
                                    <td><button class="btn" onclick="Efw('common_menu_goto',{page:'study_test.jsp'})">テスト情報管理</button></td>
                                    <td><button class="btn" onclick="Efw('common_menu_goto',{page:'study_wrongquestion.jsp'})">不正解情報管理</button></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr style="height: 80px;">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr style="height: 80px;">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr style="height: 80px;">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr style="height: 80px;">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

        </body>

        </html>
