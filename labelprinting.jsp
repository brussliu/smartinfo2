<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>SmartInfo 2.0</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <script>

                function scrollHead(obj) {
                    var p = $(obj).get(0).scrollLeft;
                    $(".c_detail_header").get(0).scrollLeft = p;
                }

                function init() {
                    Efw('labelprinting_init');
                }

                function cancel(){
                    labelprinting_inputdialog.dialog('close');
                }

                // 新規
                function add(){
                    $("input[name=product]").removeProp("checked"); 
                    $("input:radio[value='自納商品']").prop( "checked" ,true);
                  
                    $('#select_productno').get(0).selectedIndex = 0;
                    $('#select_productno').attr('disabled', false);
                    $('#select_sub1').get(0).selectedIndex = 0;
                    $('#select_sub1').attr('disabled', false);
                    $('#select_sub2').get(0).selectedIndex = 0;
                    $('#select_sub2').attr('disabled', false);

                    $('#text_productno').val('');
                    $('#text_productno').attr('disabled', true);
                    $('#text_sub1').val('');
                    $('#text_sub1').attr('disabled', true);
                    $('#text_sub2').val('');
                    $('#text_sub2').attr('disabled', true);
                    $('#text_label').val('');
                    $('#text_label').attr('disabled', true);
                    $('#text_remark').val('');
                    $('#text_remark').attr('disabled', true);

                    labelprinting_inputdialog.dialog('open');
                }
                
                // 商品选择
                function changeProduct(val){
                
                    if($(val).val() == '自納商品'){     
                        $('#select_productno').get(0).selectedIndex = 0;
                        $('#select_productno').attr('disabled', false);
                        $('#select_sub1').get(0).selectedIndex = 0;
                        $('#select_sub1').attr('disabled', false);
                        $('#select_sub2').get(0).selectedIndex = 0;
                        $('#select_sub2').attr('disabled', false);

                        $('#text_productno').val('');
                        $('#text_productno').attr('disabled', true);
                        $('#text_sub1').val('');
                        $('#text_sub1').attr('disabled', true);
                        $('#text_sub2').val('');
                        $('#text_sub2').attr('disabled', true);
                        $('#text_label').val('');
                        $('#text_label').attr('disabled', true);
                        $('#text_remark').val('');
                        $('#text_remark').attr('disabled', true);
                    }
                    if($(val).val() == '代納商品'){ 
                        $('#select_productno').get(0).selectedIndex = 0;
                        $('#select_productno').attr('disabled', true);
                        $('#select_sub1').get(0).selectedIndex = 0;
                        $('#select_sub1').attr('disabled', true);
                        $('#select_sub2').get(0).selectedIndex = 0;
                        $('#select_sub2').attr('disabled', true);

                        $('#text_productno').val('');
                        $('#text_productno').attr('disabled', false);
                        $('#text_sub1').val('');
                        $('#text_sub1').attr('disabled', false);
                        $('#text_sub2').val('');
                        $('#text_sub2').attr('disabled', false);
                        $('#text_label').val('');
                        $('#text_label').attr('disabled', false);
                        $('#text_remark').val('');
                        $('#text_remark').attr('disabled', false);
                    }
                }
                // 保存   
                function save() {

                    var choice = $('input[name="product"]:checked').val()
                    
                    Efw('labelprinting_save',{'choice':choice} );
                }

                // 全选
                function alllabel(val){ 
                    if (val.checked){  
                        $("input[name='label']:checkbox").each(function(){ 
                            $(this).prop("checked", true);  
                        });

                        // 所有数量改变
                        $("#labeltable").find("tr").each(function () {

                            var tdArr = $(this).children();
                            var count = tdArr.eq(7);
                            var span_count = tdArr.eq(7).children();
                            var span_count_val = span_count.html() == ''? 0 : span_count.html();
                            span_count.css("display", "none");
                            count.append("<input type='text' class='text_count' value='" + span_count_val + "' style='width:60px;height: 30px;'></input>")
                   
                        })

                        $('#btn_del').attr('disabled',true);
                        $('#btn_reserve').attr('disabled',false);

                    } else {   

                        $("input[name='label']:checkbox").each(function() {   
                            $(this).prop("checked", false);  
                        });

                        // 所有数量改变
                        $("#labeltable").find("tr").each(function () {

                            var tdArr = $(this).children();
                            var count = tdArr.eq(7);
                            var span_count = tdArr.eq(7).children();
                            var span_count_val = span_count.html() == ''? 0 : span_count.html();
                            span_count.css("display", "block"); 
                            count.children().next().remove();
                            })
                            
                        $('#btn_del').attr('disabled',true);
                        $('#btn_reserve').attr('disabled',true);
                    }
 
                }

                // 商品管理番号、分類１、分類２変更
                function changeProductSub(val) {
                    Efw('labelprinting_queryproductsub',{'opt':val} );
                }
           
                // 选择
                function check(val){
                    var span_count = $(val).parent().next().next().next().next().next().next().next().children();
                    var count =  $(val).parent().next().next().next().next().next().next().next();
                    var span_count_val = span_count.html() == ''? 0 : span_count.html();
                    
                    if ($(val).is(':checked')) {
                        span_count.css("display", "none");
                        count.append("<input type='text' class='text_count' value='" + span_count_val + "' style='width:60px;height: 30px;'></input>")
                    }else {
                        span_count.css("display", "block"); 
                        count.children().next().remove();
                    }
                   
                   var s= $("input:checkbox:checked");
                   
                   if(s.length <= 0){
                    $('#btn_del').attr('disabled',true);
                    $('#btn_reserve').attr('disabled',true);
                   }else if(s.length == 1){
                    $('#btn_del').attr('disabled',false);
                    $('#btn_reserve').attr('disabled',false);
                   }else{
                    $('#btn_del').attr('disabled',true);
                    $('#btn_reserve').attr('disabled',false);
                   }
                   

                }

                // 削除
                function del(){
                    // 多个删除
                    // var allArr = new Array();
                    // $("#labeltable").find("tr").each(function () {
                    //     var tdArr = $(this).children();
                    //     var checkbox = tdArr.eq(0).children().val();
                    //     if (checkbox != '' && checkbox.checked) {

                    //     }
                    // })

                    // 单个删除
                    
                    var s= $("input:checkbox:checked");
                   
                   if(s.length == 1){
                 
                        var type = s.parent().next().children().html();
                        if(type == '代納商品'){
                            var productno = s.parent().next().next().html();
                            var sub1 = s.parent().next().next().next().children().html();
                            var sub2 = s.parent().next().next().next().next().children().html();
                            var label = s.parent().next().next().next().next().next().children().html();
                       
                            s.parent().parent().remove();
                            Efw('labelprinting_del',
                            {'productno':productno ,'sub1':sub1,'sub2':sub2,'label':label} );
                             
                        }
                        if(type == '自納商品'){
                          
                            s.parent().parent().remove();
                            // 按钮更新
                            $('#btn_del').attr('disabled',true);
                            $('#btn_reserve').attr('disabled',true);
                        }
                        
                       }
                }
          
                // 印刷
                function reserve(){
                    var tableArr = new Array();
                    $("input[name='label']:checkbox:checked").each(function(){ 
                          
                            
                            var type = $(this).parent().next().children().html();
                            var productno = $(this).parent().next().next().html();
                            var sub1 = $(this).parent().next().next().next().children().html();
                            var sub2 = $(this).parent().next().next().next().next().children().html();
                            var label = $(this).parent().next().next().next().next().next().children().html();
                            var count =parseInt( $(this).parent().next().next().next().next().next().next().next().children().next().val());
                            if(count > 0){
                            var jsons = JSON.stringify( { "type": type, "productno": productno , "sub1": sub1 , "sub2": sub2 ,  "label": label , "count": count });
                             tableArr.push(jsons);
                            }
                        });
                        console.log(tableArr)
                        if(tableArr.length > 0)
                        Efw('labelprinting_reserve',{'tableArr':tableArr} );
                        else
                        alter('印刷 IS NULL')
                }
          </script>

            <style>

            </style>
        </head>
 
        <body onload="init();">
            <efw:Part path="labelprinting_inputdialog.jsp" />
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
                                    <button class="hright_r"
                                        onclick="Efw('common_menu_goto',{page:'shoplist.jsp'})">切替</button>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;padding-right: 20px;" id="sessioninfo">
                                    店舗ID：<span id="shopid" style="font-weight: bold;color: yellow;">未选择</span>
                                    &nbsp;&nbsp;&nbsp;
                                    UserID：<span id="userid" style="font-weight: bold;color: yellow;">XXXX</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="topnav">
                    <p><a href="menu.jsp">メニュー</a> > LABEL印刷</p>
                </div>
                <div class="content">
                    <div class="c_btn"  style="border-bottom: 1px solid black;">
                        <table class="table_btn"  style="margin-bottom: 5px;"   >
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td style="width: 200px;"><button id="btn_new" onclick="add()" >新規</button>  </td>
                                    <td style="width: 200px;"><button id="btn_del" onclick="del()" disabled>削除</button></td>
                                    <td style="width: 200px;"><button id="btn_reserve" onclick="reserve()" disabled>印刷</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
               
                    <div class="c_detail_header" style="overflow: hidden;">
                        <table class="table_detail_header" id="stocktablehead"
                            style="width: 1253px;table-layout: fixed;"> 
                            <thead>
                                <tr class="header">
                                    <th style="width: 70px;"><input type="checkbox"name="alllabel" onclick="alllabel(this)"></input> 選択</th>
                                    <th style="width: 140px;">商品区分</th>
                                    <th style="width: 100px;">商品管理番号</th> 
                                    <th style="width: 160px;">分類①</th>
                                    <th style="width: 160px;">分類②</th> 
                                    <th style="width: 150px;">LABEL番号</th>
                                    <th style="width: 300px;" >備考</th> 
                                    <th style="width: 127px;">数量</th> 
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="c_detail_content" style="overflow: auto;" onscroll="scrollHead(this);">
                        <table id="labeltable" class="table_detail_content" style="width: 1253px;table-layout: fixed;" id="stocktable">

                            <!-- <tr>
                                <td style="width: 70px;" class="c"><input type="checkbox" name="label"></input></td>
                                <td style="width: 140px;" class="l"><span class="l5">01:レインコート</span></td>
                                <td style="width: 80px;" class="c">W001</td>                
                                <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>                              
                                <td style="width: 200px;" class="c">X000UXRHRV</td>
                                <td style="width: 100px;" class="r"><span class="r5">999.00</span></td>
                                <td style="width: 177px;" class="l"><span class="l5">A:クリックポスト</span></td>                   
                            </tr>
                            <tr>
                                <td style="width: 70px;" class="c"><input type="checkbox" name="label"></input></td>
                                <td style="width: 140px;" class="l"><span class="l5">01:レインコート</span></td>
                                <td style="width: 80px;" class="c">W001</td>                
                                <td style="width: 160px;" class="l"><span class="l5">イエローライオン</span></td>
                                <td style="width: 160px;" class="l"><span class="l5">28 内寸18.5cm</span></td>                              
                                <td style="width: 200px;" class="c">X000UXRHRV</td>
                                <td style="width: 100px;" class="r"><span class="r5">999.00</span></td>
                                <td style="width: 177px;" class="l"><span class="l5">A:クリックポスト</span></td>                   
                            </tr>     -->


                        </table>
                    </div>

                </div>
            </div>
        </body>

        </html>