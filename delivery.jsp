<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>納品情報管理</title>
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

                .table_btn tr td {
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
            <efw:Part path="delivery_content_inputdialog.jsp" />
            <efw:Part path="delivery_box_inputdialog.jsp" />
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
                    <p><a href="menu.jsp">メニュー</a> > 納品情報管理</p>
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
                                    
                                    <td><button>新規</button></td>
                                    <td><button  onclick="delivery_content_inputdialog.dialog('open');">納品内容</button></td>
                                    <td><button>納品更新</button></td>

                                    <td><button onclick="delivery_box_inputdialog.dialog('open');">箱詰め</button></td>
                                    <td><button>納品出力</button></td>
                                    <td><button>納品削除</button></td>

                                    <td><button>納品発送</button></td>
                                    <td><button>納品受領</button></td>
                                    <td><button>納品完了</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                 
                    <div class="c_condition"style="height: 45px;">

           

                        <table border="0" >
                            <tbody>
                                <tr>
                                    <td style="width: 120px;font-weight: bold;">&nbsp;&nbsp;納品名称：</td>
                                    <td style="width: 200px;">
                                        <input type="text" style="width: 160px;height:30px;border-style: solid;">   
                                    </td>
                                    <td style="width: 142px;font-weight: bold;">納品ファイル：</td>
                                    <td style="width: 260px;">
                                        <input type="file" style="width: 220px; "  ></input>

                                    </td>
                                    <td style="width: 142px;font-weight: bold;">受領ファイル：</td>
                                    <td style="width: 260px;">
                                        <input type="file" style="width: 220px; "  ></input>

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>


 
                    <div class="c_detail_header" style="overflow: hidden;">
                        <table class="table_detail_header" style="width: 1824px;table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 55px;">選択</th>
                                    <th style="width: 165px">納品NO</th>
                                    <th style="width: 139px;">納品名称</th>

                                    <th style="width: 199px;">納品内容</th>
                                    <th style="width: 66px;">数量</th>
                                    <th style="width: 99px;">ステータス</th>

                                    <th style="width: 125px;">登録日</th>
                                    <th style="width: 125px;">確定日</th>
                                    <th style="width: 124px">発送日</th>

                                    <th style="width: 125px;">受領日</th>
                                    <th style="width: 125px;">完了日</th>
                                    <th style="width: 150px">AMZ納品番号</th>

                                    <th style="width: 273px;">AMZ納品名</th>
                      
                                </tr>
                            </thead>
                        </table>
                    </div>

                    <div class="c_detail_content" style="overflow: auto;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" style="width: 1790px;table-layout: fixed;">
                            <tbody>
                                <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 65px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 125px;" class="c">2023/01/18</td>
                                    <td style="width: 125px;" class="c">2023/01/18</td>
                                    <td style="width: 125px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 125px;" class="c">2023/01/18</td>
                                    <td style="width: 125px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 240px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                                    <tr>
                                        <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                        <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                        <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                        
                                        <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                        <td style="width: 70px;" class="r">70</td>
                                        <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                       
                                        <td style="width: 130px;" class="c">2023/01/18</td>
                                        <td style="width: 130px;" class="c">2023/01/18</td>
                                        <td style="width: 130px;" class="c">2023/01/18</td>
                                        
                                        <td style="width: 130px;" class="c">2023/01/18</td>
                                        <td style="width: 130px;" class="c">2023/01/18</td>
                                        <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                                  
                                        <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                    
                                        </tr>
                                        <tr>
                                            <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                            <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                            <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                            
                                            <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                            <td style="width: 70px;" class="r">70</td>
                                            <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                           
                                            <td style="width: 130px;" class="c">2023/01/18</td>
                                            <td style="width: 130px;" class="c">2023/01/18</td>
                                            <td style="width: 130px;" class="c">2023/01/18</td>
                                            
                                            <td style="width: 130px;" class="c">2023/01/18</td>
                                            <td style="width: 130px;" class="c">2023/01/18</td>
                                            <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                                      
                                            <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                        
                                            </tr>
                                            <tr>
                                                <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                                <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                                <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                                
                                                <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                                <td style="width: 70px;" class="r">70</td>
                                                <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                               
                                                <td style="width: 130px;" class="c">2023/01/18</td>
                                                <td style="width: 130px;" class="c">2023/01/18</td>
                                                <td style="width: 130px;" class="c">2023/01/18</td>
                                                
                                                <td style="width: 130px;" class="c">2023/01/18</td>
                                                <td style="width: 130px;" class="c">2023/01/18</td>
                                                <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                                          
                                                <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                            
                                                </tr>
                                                <tr>
                                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                                    
                                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                                    <td style="width: 70px;" class="r">70</td>
                                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                                   
                                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                                    
                                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                                              
                                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                                
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                                        <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                                        <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                                        
                                                        <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                                        <td style="width: 70px;" class="r">70</td>
                                                        <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                                       
                                                        <td style="width: 130px;" class="c">2023/01/18</td>
                                                        <td style="width: 130px;" class="c">2023/01/18</td>
                                                        <td style="width: 130px;" class="c">2023/01/18</td>
                                                        
                                                        <td style="width: 130px;" class="c">2023/01/18</td>
                                                        <td style="width: 130px;" class="c">2023/01/18</td>
                                                        <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                                                  
                                                        <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                                    
                                                        </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                              <tr>
                                    <td style="width: 55px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 165px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 140px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 200px;" class="c"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 70px;" class="r">70</td>
                                    <td style="width: 100px;" class="c"><span class="l5">2:钠品凳送</span></td>
                                   
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 130px;" class="c">2023/01/18</td>
                                    <td style="width: 150px;" class="l"><span class="l5">FBA15D9WH51X</span></td>
                              
                                    <td style="width: 250px;" class="c"><span class="l5">FBA STA(2023/01/14<br> 06:45)-NRT5</td>
                                
                                    </tr>
                                                                            
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </body>

        </html>
