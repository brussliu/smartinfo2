<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>店舗を選択してください。</title>
            <efw:Client />
            <style>
                  :root {
                    --width: 1920px;
                }
                * {
                    margin: 0;
                    letter-spacing: 3px;
                }

                .head {
                    width: var(--width);
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
                    margin-top: 2vh;
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
                    width: var(--width);
                    line-height: 43px;
                    height: 43px;
                    background: rgb(233, 229, 173);
                }

                .topnav p {
                    text-indent: 2.5em;

                }


                /* content */
                .content {
                    width: var(--width);
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
                    background-color:#f6f6f6;
                }
                a{
                    text-decoration-line: none;
                    color: black;
                }
            </style>
        </head>

        <body>
            <div>
                <div class="head">
                    <div class="hleft">
                        <h1 style="height: 60px;line-height: 60px;margin-left:40px;">SmartInfo 2.0</h1>
                    </div>
                    <div class="hright">
                        <div class="hright_l">
                            <p>店舗ID：<span>未选择</span></p>
                            <p>UserID：<span>XXXX</span></p>
                        </div>
                        <div>


                            <button class="hright_r">ログオフ</button>
                            <button class="hright_r" style="display: none;">切換える</button>

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
                           
                                <td><a onclick="Efw('common_smartChoice',{UserID:this.innerHTML})">Smart-bear</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
 
        </body>

        </html>
