<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>SmartInfo 2.0</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css"/>
            <style>
                /* content */
                .content {
                    width: var(--width);
                    height: 86vh;
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
                    cursor:pointer;
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
                .content_b{
                    width: 100%;
                    height: 22vh;
                     
                }
                .content_b>table td p:first-child{
                    margin-bottom: 50px;
                }
                .content_b>table div{
                   width: 400px;
                   height: 250px;
                }
                .c{
                    text-align: center;
                }
                .c span:first-child{
                    font-size: 2em;
                    font-weight: bolder;
                }
            </style>
        </head>

        <body>
            <div>
                <div class="head">
                    <div class="hleft">
                        <h1 style="height: 80px;line-height: 80px;margin-left:40px;">SmartInfo 2.0</h1>
                    </div>
                    <div class="hright">
                        <table style="float: right;width: 100%;color: aliceblue;">
                            <tr>
                                <td>
                                    <button class="hright_r" onclick="Efw('common_menu_goto',{page:'login.jsp'})">ログオフ</button>
                                    <button class="hright_r" onclick="Efw('common_menu_goto',{page:'shoplist.jsp'})">切替</button>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;padding-right: 20px;">
                                    店舗ID：<span id="shopid">未选择</span>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    UserID：<span id="userid">XXXX</span>
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
                                <tr>
                                    <td><button class="btn" onclick="Efw('common_menu_goto',{page:'import.jsp'})">データ導入</button></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><button class="btn" onclick="Efw('common_menu_goto',{page:'masterinfo.jsp'})">マスタ情報管理</button>
                                    </td>
                                    <td><button class="btn" onclick="Efw('common_menu_goto',{page:'stockinfo.jsp'})">在庫情報管理</button>
                                    </td>
                                    <td> <button class="btn" disabled>販売情報管理</button></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td> <button class="btn" onclick="Efw('common_menu_goto',{page:'delivery.jsp'})">納品情報管理</button>
                                    </td>
                                    <td> <button class="btn" onclick="Efw('common_menu_goto',{page:'purchase.jsp'})">仕入情報管理</button></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td> <button class="btn" onclick="Efw('common_menu_goto',{page:'shipactingmaster.jsp'})">代行発送商品管理</button></td>
                                    <td> <button class="btn" onclick="Efw('common_menu_goto',{page:'shipacting.jsp'})">代行発送情報管理</button></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><button class="btn" onclick="Efw('common_menu_goto',{page:'sending.jsp'})">発送情報管理</button>
                                    </td>
                                    <td></td>
                                    <td> <button class="btn" onclick="Efw('common_menu_goto',{page:'earnings.jsp'})">売上管理</button></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td> <button class="btn" onclick="Efw('common_menu_goto',{page:'scan.jsp'})">商品スキャン</button>
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td><button class="btn">TODO管理</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                 
                    <div class="content_r">
                        <div class="content_l_con">
                            <p>
                                <span class="span_t">
                                    20230101
                                </span>
                                <span class="span_t">
                                    優先度：高
                                </span>
                                <span class="span_t">
                                    期限：2023/02/10
                                </span>
                                <span class="span_t">
                                    進捗率：40%
                                </span>
                            </p>
                            <p>
                                XXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXX
                            </p>
                        </div>
                        <div class="content_l_con">
                            <p>
                                <span class="span_t">
                                    20230101
                                </span>
                                <span class="span_t">
                                    優先度：高
                                </span>
                                <span class="span_t">
                                    期限：2023/02/10
                                </span>
                                <span class="span_t">
                                    進捗率：40%
                                </span>
                            </p>
                            <p>
                                XXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXX
                            </p>
                        </div>
                        <div class="content_l_con">
                            <p>
                                <span class="span_t">
                                    20230101
                                </span>
                                <span class="span_t">
                                    優先度：高
                                </span>
                                <span class="span_t">
                                    期限：2023/02/10
                                </span>
                                <span class="span_t">
                                    進捗率：40%
                                </span>
                            </p>
                            <p>
                                XXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXX
                            </p>
                        </div>
                        <div class="content_l_con">
                            <p>
                                <span class="span_t">
                                    20230101
                                </span>
                                <span class="span_t">
                                    優先度：高
                                </span>
                                <span class="span_t">
                                    期限：2023/02/10
                                </span>
                                <span class="span_t">
                                    進捗率：40%
                                </span>
                            </p>
                            <p>
                                XXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXX
                            </p>
                        </div>
                        <div class="content_l_con">
                            <p>
                                <span class="span_t">
                                    20230101
                                </span>
                                <span class="span_t">
                                    優先度：高
                                </span>
                                <span class="span_t">
                                    期限：2023/02/10
                                </span>
                                <span class="span_t">
                                    進捗率：40%
                                </span>
                            </p>
                            <p>
                                XXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXX
                            </p>
                        </div>
                        <div class="content_l_con">
                            <p>
                                <span class="span_t">
                                    20230101
                                </span>
                                <span class="span_t">
                                    優先度：高
                                </span>
                                <span class="span_t">
                                    期限：2023/02/10
                                </span>
                                <span class="span_t">
                                    進捗率：40%
                                </span>
                            </p>
                            <p>
                                XXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXX
                            </p>
                        </div>
                        <div class="content_l_con">
                            <p>
                                <span class="span_t">
                                    20230101
                                </span>
                                <span class="span_t">
                                    優先度：高
                                </span>
                                <span class="span_t">
                                    期限：2023/02/10
                                </span>
                                <span class="span_t">
                                    進捗率：40%
                                </span>
                            </p>
                            <p>
                                XXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXX
                            </p>
                        </div>
                        <div class="content_l_con">
                            <p>
                                <span class="span_t">
                                    20230101
                                </span>
                                <span class="span_t">
                                    優先度：高
                                </span>
                                <span class="span_t">
                                    期限：2023/02/10
                                </span>
                                <span class="span_t">
                                    進捗率：40%
                                </span>
                            </p>
                            <p>
                                XXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXX
                            </p>
                        </div>
                        <div class="content_l_con">
                            <p>
                                <span class="span_t">
                                    20230101
                                </span>
                                <span class="span_t">
                                    優先度：高
                                </span>
                                <span class="span_t">
                                    期限：2023/02/10
                                </span>
                                <span class="span_t">
                                    進捗率：40%
                                </span>
                            </p>
                            <p>
                                XXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXX
                            </p>
                        </div>
                        <div class="content_l_con">
                            <p>
                                <span class="span_t">
                                    20230101
                                </span>
                                <span class="span_t">
                                    優先度：高
                                </span>
                                <span class="span_t">
                                    期限：2023/02/10
                                </span>
                                <span class="span_t">
                                    進捗率：40%
                                </span>
                            </p>
                            <p>
                                XXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXX
                            </p>
                        </div>
                        <div class="content_l_con">
                            <p>
                                <span class="span_t">
                                    20230101
                                </span>
                                <span class="span_t">
                                    優先度：高
                                </span>
                                <span class="span_t">
                                    期限：2023/02/10
                                </span>
                                <span class="span_t">
                                    進捗率：40%
                                </span>
                            </p>
                            <p>
                                XXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXX
                            </p>
                        </div>
                        <div class="content_l_con">
                            <p>
                                <span class="span_t">
                                    20230101
                                </span>
                                <span class="span_t">
                                    優先度：高
                                </span>
                                <span class="span_t">
                                    期限：2023/02/10
                                </span>
                                <span class="span_t">
                                    進捗率：40%
                                </span>
                            </p>
                            <p>
                                XXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                                XXXXXXXXXXXXXXXXXXXXXXXXXXXX
                            </p>
                        </div>
                    </div>

                    <div class="content_b">
                        <table width="100%">
                            <tbody>
                                <tr>
                                    <td><div><p>XXXXXXXXXXXXXXXX</p><p class="c"><span>999</span><span>個</span></p></div></td>
                                    <td><div><p>XXXXXXXXXXXXXXXX</p><p class="c"><span>999</span><span>個</span></p></div></td>
                                    <td><div><p>XXXXXXXXXXXXXXXX</p><p class="c"><span>999</span><span>個</span></p></div></td>
                                    <td><div><p>XXXXXXXXXXXXXXXX</p><p class="c"><span>999</span><span>個</span></p></div></td>
                                    <td><div><p>XXXXXXXXXXXXXXXX</p><p class="c"><span>999</span><span>個</span></p></div></td>
                                    <td><div><p>XXXXXXXXXXXXXXXX</p><p class="c"><span>999</span><span>個</span></p></div></td>

                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </body>

        </html>
