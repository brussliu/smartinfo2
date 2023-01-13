<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>店舗を選択してください。</title>
            <efw:Client />
            <style>
                * {
                    margin: 0;
                }

                .head {
                    width: 100vw;
                    height: 60px;
                    background-color: rgb(178, 178, 240);
                    color: aliceblue;
                }

                .hleft {
                    float: left;
                    width: 50%;
                    height: 60px;
                }

                .hright {
                    float: right;
                    width: 30%;
                    height: 60px;
                }

                .hright_r {
                    float: right;
                    margin-right: 3vw;
                    margin-top: 2.5vh;
                    width: 90px;
                    height: 30px;
                    border: 0;
                    border-radius: 20px;
                }

                .hright_l {
                    float: left;
                    line-height: 30px;
                }

                /* topnav */
                .topnav {
                    width: 100vw;
                    line-height: 4vh;
                    height: 4vh;
                    background: rgb(233, 229, 173);
                }

                .topnav p {
                    text-indent: 2.5em;

                }

                /* content */
                .content {
                    width: 100vw;
                    height: 86vh;
                    display: flex;
                    justify-content: center;
                    align-items: center;

                }

                th,
                td {
                    width: 150px;
                    max-width: 200px;
                    height: 45px;
                    max-height: 70px;
                    text-align: center;
                }
                th{
                    background-color: rgb(167, 214, 241);
                }
            </style>
        </head>

        <body>
            <div>
                <div class="head">
                    <div class="hleft">
                        <h1 style="margin-top:2.5vh ;margin-left:3vw;">SmartInfo 2.0</h1>
                    </div>
                    <div class="hright">
                        <div class="hright_l">
                            <p>店舗ID：<span>未选择</span></p>
                            <p>UserID：<span>XXXX</span></p>
                        </div>
                        <div>
                            <button class="hright_r">ログオフ</button>
                        </div>
                    </div>
                </div>
                <div class="topnav">
                    <p>店舗を選択してください。</p>
                </div>
                <div class="content">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>店舗名称</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Smart-bear</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </body>

        </html>