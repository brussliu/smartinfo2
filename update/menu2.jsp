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
                    border: 0;
                    overflow: hidden;
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
                    margin-top: 2vh;
                    width: 90px;
                    height: 30px;
                    border: 0;
                    border-radius: 20px;

                }

                .hright_l {
                    float: left;
                    line-height: 30px;
                    height: 60px;
                }



                /* content */
                .content {
                    width: 100vw;
                    height: 86vh;
                    vertical-align: middle;
                }

                .content_l,
                .content_r {
                    display: inline-block;
                }

                .content_l {
                    width: 73%;
                    height: 86vh;
                }

                .content_r {
                    width: 26.5%;
                    height: 86vh;
                    vertical-align: top;
                    overflow-y: auto;
                }

                /* content_l_nav     */
                .content_l_nav {
                    line-height: 4vh;
                    height: 4vh;
                    background: rgb(233, 229, 173);
                }

                .content_l_nav p {
                    text-indent: 2.5em;
                }

                /* content_l_btn */
                .content_l_btn {
                    width: 90%;
                    height: 82vh;
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

            td{
                border-bottom :1px dashed black ;
            }




                .btn {
                    width: 140px;
                    height: 40px;
                    margin: 0 3vw;
                    box-shadow: 2px 2px 5px rgb(145, 139, 139);
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
            </style>
        </head>

        <body>
            <div>
                <div class="head">
                    <div class="hleft">
                        <h1 style="height: 60px;line-height: 60px;margin-left:3vw;">SmartInfo 2.0</h1>
                    </div>
                    <div class="hright">
                        <div class="hright_l">
                            <p>店舗ID：<span>未选择</span></p>
                            <p>UserID：<span>XXXX</span></p>
                        </div>
                        <div>

                            <button class="hright_r">ログオフ</button>
                            <button class="hright_r">切換える</button>

                        </div>
                    </div>
                </div>

                <div class="content">
                    <div class="content_l">
                        <div class="content_l_nav">
                            <p>メニュー </p>
                        </div>
                        <table class="content_l_btn">
                            <tbody>
                                <tr>
                                    <td><button class="btn">データ導入</button></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><button class="btn">マスタ情報管理</button>
                                    </td>
                                    <td> <button class="btn">在庫情報管理</button>
                                    </td>
                                    <td> <button class="btn">販売情報管理</button></td>
                                </tr>
                                <tr>
                                    <td> <button class="btn">納品管理</button>
                                    </td>
                                    <td> <button class="btn">仕入管理</button></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td> <button class="btn">代行発送商品管理</button></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><button class="btn">発送情報管理</button>
                                    </td>
                                    <td></td>
                                    <td> <button class="btn">売上管理</button></td>
                                </tr>
                                <tr>
                                    <td> <button class="btn">商品スキャン</button>
                                    </td>
                                    <td></td>
                                    <td> <button class="btn">TODO管理</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- <div class="content_l">
                        <div class="content_l_nav">
                            <p>メニュー </p>
                        </div>
                        <div class="content_l_btn">
                            <div>
                                <button class="btn">データ導入</button>


                            </div>
                            <div class="content_l_btn_r">
                                <button class="btn">マスタ情報管理</button>
                                <button class="btn">在庫情報管理</button>
                                <button class="btn">販売情報管理</button>
                            </div>
                            <div>
                                <button class="btn">納品管理</button>
                                <button class="btn" style="margin-left:9vw;">仕入管理</button>
                            </div>
                            <div>
                                <button class="btn">代行発送商品管理</button>
                            </div>
                            <div class="content_l_btn_r">
                                <button class="btn">発送情報管理</button>
                                <button class="btn_r">売上管理</button>
                            </div>
                            <div class="content_l_btn_r">
                                <button class="btn">商品スキャン</button>
                                <button class="btn_r">TODO管理</button>
                            </div>

                        </div>
                    </div> -->
                    <div class="content_r">
                        <div class="content_l_nav">
                            <p>TODO</p>
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
                </div>
            </div>

        </body>

        </html>
