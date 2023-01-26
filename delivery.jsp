<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>納品情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <style>
                .table_btn td button{
                    float: right;
                    width: 100px;
                    height: 40px;
                    background: rgb(240, 240, 240);
                    font-size: 16px;
                    border: 1px solid rgb(206, 205, 205);
                    box-shadow: 2px 2px 2px #888888;
                    cursor:pointer;
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
                <div class="content">
                    <div style="width: 95%;margin: auto; ">
                        <table class="table_btn">
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    
                                    <td style="width: 120px;"><button>新規</button></td>
                                    <td style="width: 120px;"><button  onclick="delivery_content_inputdialog.dialog('open');">納品内容</button></td>
                                    <td style="width: 120px;"><button>納品更新</button></td>

                                    <td style="width: 120px;"><button onclick="delivery_box_inputdialog.dialog('open');">箱詰め</button></td>
                                    <td style="width: 120px;"><button>納品出力</button></td>
                                    <td style="width: 120px;"><button>納品削除</button></td>

                                    <td style="width: 120px;"><button>納品発送</button></td>
                                    <td style="width: 120px;"><button>納品受領</button></td>
                                    <td style="width: 120px;"><button>納品完了</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                 
                    <div class="c_condition"style="height: 45px;">
                        <table >
                            <tbody>
                                <tr>
                                    <td style="width: 120px;font-weight: bold;">&nbsp;&nbsp;納品名称：</td>
                                    <td style="width: 240px;">
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
                        <table class="table_detail_header" style="width: 1828px;table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 50px;">選択</th>
                                    <th style="width: 155px">納品NO</th>
                                    <th style="width: 200px;">納品名称</th>

                                    <th style="width: 370px;">納品内容</th>
                                    <th style="width: 50px;">数量</th>
                                    <th style="width: 120px;">ステータス</th>

                                    <th style="width: 100px;">登録日</th>
                                    <th style="width: 100px;">確定日</th>
                                    <th style="width: 100px">発送日</th>
                                    <th style="width: 100px;">受領日</th>
                                    <th style="width: 100px;">完了日</th>

                                    <th style="width: 140px">AMZ納品番号</th>

                                    <th style="width: 217px;">AMZ納品名</th>
                                </tr>
                            </thead>
                        </table>
                    </div>

                    <div class="c_detail_content" style="overflow-y: auto;overflow-x: hidden;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" style="width: 1811px;table-layout: fixed;">
                            <tbody>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>                                
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>                                
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>                                
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>                                
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>                                                                
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>                                
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>                                
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>
                                <tr>
                                    <td style="width: 50px;" class="c"><input type="radio" name="choice"></input></td>
                                    <td style="width: 155px" class="l"><span class="l5">20230118-151418</span></td>
                                    <td style="width: 200px;" class="l"><span class="l5">20230118-納品</span></td>
                                    
                                    <td style="width: 370px;" class="l"><span class="l5">XXXXXXXXX</span></td>
                                    <td style="width: 50px;" class="r"><span class="r5">70</span></td>
                                    <td style="width: 120px;" class="c">2:钠品凳送</td>
                                   
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>
                                    <td style="width: 100px;" class="c">2023/01/18</td>

                                    <td style="width: 140px;" class="c">FBA15D9WH51X</td>
                              
                                    <td style="width: 200px;" class="l"><span class="l5">FBA STA(2023/01/14 06:45)-NRT5</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </body>

        </html>
