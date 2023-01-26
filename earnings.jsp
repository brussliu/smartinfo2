<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>壳上情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            
            <style>
                /* c_query */
                .c_query {
                    width: var(--width);
                    /* height: 216px; */
                }

                .c_q_nav {
                    width: 100%;
                    line-height: 55px;
                    border-collapse: collapse;
                }

                .one {
                    margin-top: 10px;
                }

                .one td {
                    width: 13%;
                }

                .one td button {
                    float: right;
                }


                .three table {
                    border-collapse: collapse;
                    text-align: center;
                    width: 1824px;
                    word-break: break-all;
                }

                .three td {
                    height: 65px;
                }

                /* info */
                .info {
                    width: 95%;
                    margin: auto;
                    height: 750px;
                    overflow: auto;
                }

                .table_btn td {
                    width: 6%;
                }

                .info th {
                    height: 45px;
                    border: 1px solid black;
                    background-color: #f6f6f6;
                }



                .info div {
                    width: 100px;
                    height: 30px;
                    border: 1px solid whitesmoke;
                    border-radius: 20px;
                    box-shadow: 2px 2px 1px #888888;
                }

                .send input:not(:first-child) {
                    margin-left: 20px;
                }

                .table_btn td button{
                    width: 100px;
                }  
                
            </style>
     
        </head>

        <body>

            <efw:Part path="earnings_detail_inputdialog.jsp" />
            <efw:Part path="earnings_stock_inputdialog.jsp" />
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
                    <p><a href="menu.jsp">メニュー</a> > 壳上情報管理</p>
                </div>
                <div class="c_query">
                    <div style="width: 95%;margin: auto; ">
                        <table class="table_btn">
                            <tbody>
                                <tr>
                                    <td style="font-weight: bold;color: maroon">【検索条件】</td>
                                 
                                    <td></td>
                                    <td></td>
                                    <td></td>

                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    
                                    <td> </td>
                                    <td> </td>
                                    <td> </td>

                                    <td> </td>
                                    <td> </td>
                                    <td> </td>

                                    <td> </td>
                                    <td> </td>
                                    <td><button  onclick="earnings_stock_inputdialog.dialog('open');">在庫計算</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                 
                 

 
                    <div class="c_detail_header" style="overflow: hidden;">
                        <table class="table_detail_header" style="width: 1824px;table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 150px;">年月</th>
                                    <th style="width: 122px">注文数量</th>
                                    <th style="width: 150px;">注文粗利益</th>

                                    <th style="width: 150px;">月額登録料</th>
                                    <th style="width: 150px;">広告費用</th>
                                    <th style="width: 150px;">返品損失金額</th>

                                    <th style="width: 150px;">FBA入庫料金</th>
                                    <th style="width: 150px;">FBA保管料金</th>
                                    <th style="width: 150px">振込金額</th>

                                    <th style="width: 150px;">仕入金額</th>
                                    <th style="width: 140px;">その他コスト</th>
                                    <th style="width: 170px">純利益</th>

                                    
                      
                                </tr>
                            </thead>
                        </table>
                    </div>
 
                    <div class="c_detail_content" style="overflow: auto;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" style="width: 1789px;table-layout: fixed;">
                            <tbody>
                                <tr>
                                    <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                    <td style="width: 121px" class="r">748個</td>
                                    <td style="width: 149px;" class="r">614531.99円</td>
                                   
                                    <td style="width: 149px;" class="r">614531.99円</td>
                                    <td style="width: 149px;" class="r">614531.99円</td>
                                    <td style="width: 149px;" class="r">614531.99円</td>

                                    <td style="width: 149px;" class="r">614531.99円</td>
                                    <td style="width: 149px;" class="r">614531.99円</td>
                                    <td style="width: 149px;" class="r">614531.99円</td>
                                    
                                    <td style="width: 149px;" class="r">614531.99円</td>
                                    <td style="width: 138px;" class="r">614531.99円</td>
                                    <td style="width: 135px;" class="r">614531.99円</td>
                                 
                              
                                 <!-- 最后一个如果没对齐，将138改139,135改134 -->
                                    </tr>
                                    <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>
                                        <tr>
                                            <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                            <td style="width: 121px" class="r">748個</td>
                                            <td style="width: 149px;" class="r">614531.99円</td>
                                           
                                            <td style="width: 149px;" class="r">614531.99円</td>
                                            <td style="width: 149px;" class="r">614531.99円</td>
                                            <td style="width: 149px;" class="r">614531.99円</td>
        
                                            <td style="width: 149px;" class="r">614531.99円</td>
                                            <td style="width: 149px;" class="r">614531.99円</td>
                                            <td style="width: 149px;" class="r">614531.99円</td>
                                            
                                            <td style="width: 149px;" class="r">614531.99円</td>
                                            <td style="width: 138px;" class="r">614531.99円</td>
                                            <td style="width: 135px;" class="r">614531.99円</td>
                                         
                                            </tr>     <tr>
                                                <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                                <td style="width: 121px" class="r">748個</td>
                                                <td style="width: 149px;" class="r">614531.99円</td>
                                               
                                                <td style="width: 149px;" class="r">614531.99円</td>
                                                <td style="width: 149px;" class="r">614531.99円</td>
                                                <td style="width: 149px;" class="r">614531.99円</td>
            
                                                <td style="width: 149px;" class="r">614531.99円</td>
                                                <td style="width: 149px;" class="r">614531.99円</td>
                                                <td style="width: 149px;" class="r">614531.99円</td>
                                                
                                                <td style="width: 149px;" class="r">614531.99円</td>
                                                <td style="width: 138px;" class="r">614531.99円</td>
                                                <td style="width: 135px;" class="r">614531.99円</td>
                                             
                                                </tr>     <tr>
                                                    <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                                    <td style="width: 121px" class="r">748個</td>
                                                    <td style="width: 149px;" class="r">614531.99円</td>
                                                   
                                                    <td style="width: 149px;" class="r">614531.99円</td>
                                                    <td style="width: 149px;" class="r">614531.99円</td>
                                                    <td style="width: 149px;" class="r">614531.99円</td>
                
                                                    <td style="width: 149px;" class="r">614531.99円</td>
                                                    <td style="width: 149px;" class="r">614531.99円</td>
                                                    <td style="width: 149px;" class="r">614531.99円</td>
                                                    
                                                    <td style="width: 149px;" class="r">614531.99円</td>
                                                    <td style="width: 138px;" class="r">614531.99円</td>
                                                    <td style="width: 135px;" class="r">614531.99円</td>
                                                 
                                                    </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>     <tr>
                                        <td style="width: 149px;"  class="c a"  onclick="earnings_detail_inputdialog.dialog('open');">2023年01月</td>
                                        <td style="width: 121px" class="r">748個</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                       
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
    
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        
                                        <td style="width: 149px;" class="r">614531.99円</td>
                                        <td style="width: 138px;" class="r">614531.99円</td>
                                        <td style="width: 135px;" class="r">614531.99円</td>
                                     
                                        </tr>
                                    
                                        
                                                                            
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </body>

        </html>
