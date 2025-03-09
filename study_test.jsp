<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="efw" uri="efw" %>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>テスト情報管理</title>
            <efw:Client />
            <link rel="stylesheet" href="css/common.css" type="text/css" />
            <link href="favicon.ico" rel="icon" type="image/x-icon" />
            <script type="text/javascript" src="js/common.js"></script>
            <style>
                .table_btn td button {
                    width: 100px;
                }
                .hide{
                    display: none;  
                }
          
                .aimg{
                    width: 50px;
                    height: 50px;
                }
                
            </style>
            <script>
                    // 单科数量
                  var tablenum = 3;
                function scrollHead(obj) {
                    var p = $(obj).get(0).scrollLeft;
                    $(".c_detail_header").get(0).scrollLeft = p;
                }

                // 初期化
                function init() {
                    Efw('study_test_init');
                }
                 // CTRL+O
                 $(window).keydown(function(e) {
                    
                    if (e.keyCode == 79 && e.ctrlKey) {

                        outputToExcelFile(); 
                    } 
                });

                // 初始化
                function add() {
                    $("#opt_academicyear").prop('selectedIndex', 0);
                    $('#text_name').val('');
                    $('#text_to').val('');
                    $('#text_from').val(''); 
                    $('#text_score1').val('');
                    $('#text_score2').val('');
                    $('#text_classaverage').val('');
                    $('#text_yearaverage').val('');
                    $('#text_classranking1').val('');
                    $('#text_classranking2').val('');
                    $('#text_yearranking1').val('');
                    $('#text_yearranking2').val('');

                    // 科目 单科
                    $("#opt_subject").prop('selectedIndex', 0); 
                    $('#text_score3').val('');
                    $('#text_score4').val('');
                    $('#text_classaverage2').val('');
                    $('#text_yearaverage2').val('');
                    $('#text_classranking3').val('');
                    $('#text_classranking4').val('');
                    $('#text_yearranking3').val('');
                    $('#text_yearranking4').val('');                  

                    tablenum=3;
                    $('.newtable').remove();
                    $('#btn_login').attr('data-tags', 'table_inputdialog3');
                    $('#opt').val('new');
                    $("#study_test_inputdialog").dialog({title:"テスト新規"})
                     $('#btn_login').html('登　録');
                    
                    // img清除
                    $('.table_inputdialog1 .contentimg,.table_inputdialog3 .contentimg,.table_inputdialog3 .contentimg2').each(function() {
                        var $img = $(this);
                        var $td = $img.closest('td'); // 获取 img 元素所在的 td
                        $td.empty(); // 清空 td 中的所有内容
                        $td.append($img); // 重新添加 class="contentimg" 的 img 元素
                     });
                    study_test_inputdialog.dialog('open');
                }

              // 子画面が閉じる
              function cel() {
                add(); 
                study_test_inputdialog.dialog('close');
                }

                // table缩小
                function lessen(t){ 
                        $(t).closest("table").find("tr:gt(0)").toggle(); 
                }
                    
              
                // 添加/删除新table
                function toggleTable(imgElement) {
                
                    var currentTable = $(imgElement).closest('.table_inputdialog3');
                    var isAddIcon = $(imgElement).hasClass('addicon');
                    // 登录按钮
                    var buttonElement = $('#btn_login');

                    if (isAddIcon) {//增加
                        var newTable = currentTable.clone(true, true);
                        newTable.insertAfter(currentTable);
                    
                    
                        // 更新当前图标和事件处理
                        $(imgElement).attr('src', 'img/minus.png')
                            .removeClass('addicon').addClass('removeicon')
                            .off('click').on('click', function() { toggleTable(this); });

                        currentTable.removeClass('table_inputdialog3')
                            tablenum++;
                            var tables = 'table_inputdialog'+tablenum
                            
                            currentTable.addClass('newtable');
                            currentTable.addClass(tables);
                        
                        // 记录类名
                            // 获取当前的tags值并将其分割成数组
                            var tags = buttonElement.attr('data-tags').split(', ');
                    
                            // 检查新值是否已存在以避免重复添加
                            if (!tags.includes(tables)) {
                                tags.push(tables); // 添加新的值到数组中
                            }
                            tags = tags.filter(tag => tag.trim() !== ''); 

                    // 将数组重新合并成字符串，并更新button的data-tags属性
                    buttonElement.attr('data-tags', tags.join(', ')) ;
                    } else {//减
                        var tableToRemove = $(imgElement).closest('.table_inputdialog3');
                        var classNames = tableToRemove[0].className.split(' ');
                        var lastClassName = classNames[classNames.length - 1]; 

                        tableToRemove.remove();

                        // 获取当前的tags值并将其分割成数组
                        var tags =  buttonElement.attr('data-tags').split(', ');
                        // 使用filter方法从数组中移除指定的值
                        tags = tags.filter(tag => tag.trim() !== '');
                        tags = tags.filter(tag => tag !== lastClassName);  
                        
                        // 将过滤后的数组重新合并成字符串，并更新button的data-tags属性
                        buttonElement.attr('data-tags', tags.join(', ')) ;
                        tablenum--;
                        // 还原图标和事件处理
                        // $(imgElement).attr('src', 'img/jia.png').removeClass('removeicon').addClass('addicon').off('click').on('click', function() { toggleTable(this); });
                    }
                }
                
                // 登　録
                function tablelist(){
                    var buttonElement = $('#btn_login');
                    var tags = buttonElement.attr('data-tags').split(', ');
                    
                    // 获取table每个类名的数据
                        // 综合成绩
                        var comprehensive = {};
                        comprehensive['table_inputdialog2'] = $('.table_inputdialog2 input').map(function() {
                            return $(this).val();
                        }).get();

                        // console.log(comprehensive);  

                        // 单科成绩map
                        var monotechnical = {};
                        // 单科成绩目录
                        var monotechnicallist = new Array();
                        tags.forEach(function(tagClass) {

                                // 获取opt_subject的当前选中值
                                //  var subjectKey = $('.'+tagClass+' option:selected').val();
                                var tableElement = $('table.' + tagClass);
                                var subjectKey = tableElement.find('select').val(); 
                                monotechnicallist.push(subjectKey) 
                                
                                // 初始化一个空数组，用于收集图片和input的值
                                var valuesArray = [];

                                // 遍历除了第一行之外的所有tr
                                $('table.' + tagClass + ' tbody tr:gt(0)').each(function() {
                                    // 对于每一行，初始化一个临时数组用于收集该行中所有imgsign的src值
                                    var imgSrcsForRow = [];
                                    // 标志是否遇到过非imgsign的img
                                    var imgflg = true;

                                    // 遍历当前行中的所有td
                                    $('td', this).each(function() {
                                        // 用于收集当前td下的imgsign的src值
                                        var imgSrcsForTd = [];
                                        // 遍历当前td中的img和input
                                        $(this).find('.imgsign, input').each(function() {
                                            if ($(this).is('.imgsign')) {
                                                var src = $(this).attr('src');
                                                if (src !== 'img\\jian.png') {
                                                    imgSrcsForTd.push(src);
                                                } else {
                                                    imgflg = false;
                                                }
                                            } else if ($(this).is('input')) {
                                                // 直接将input的值添加到行级别的数组中
                                                imgSrcsForRow.push($(this).val());
                                            }
                                        });

                                        if (imgSrcsForTd.length > 0 && imgflg) {
                                            imgSrcsForRow.push(imgSrcsForTd.join(','));
                                        }
                                    });

                                    // 将这一行收集到的所有值添加到主数组中
                                    valuesArray.push(imgSrcsForRow);
                                });

                                // 将收集到的值数组与opt_subject的值关联起来
                                monotechnical[subjectKey] = valuesArray.flat();
                        });
                        // for (var key in monotechnical) {
                        //     if (monotechnical.hasOwnProperty(key)) {
                        //         console.log('Key:', key, ', Values:', monotechnical[key]);
                        //     }
                        // }
                        var opt = $('#opt').val()
                        // console.log(opt);
                        var seq = ''
                        if(opt == 'update'){
                             seq = $('input:radio[name="seq"]:checked').val();
                        }
                        // console.log(seq);
                        Efw('study_test_add_save',{"seq":seq,"comprehensive": comprehensive ,"monotechnical": monotechnical,"tags":monotechnicallist });
                }
            
                // 更新
                function update(){
                    var seqs = $('input:radio[name="seq"]:checked');
                    
                    var seq = seqs.val();
                    var $row = seqs.closest('tr');
                    var project = $row.find('td:eq(5)').text();
                    // console.log(seq);
                    Efw('study_test_update',{"seq":seq,"project":project});
                }
            
                // 更新赋值
                function assignment(col0,col1,col2,col3,col4,col5,col6,col7,col8,col9,col10,col11 ){
                   var col = [col1,col2,col3,col4,col5,col6,col7,col8,col9,col10,col11 ]
                   console.log(col);
                    // 图片路径
                    var imgpath = 'img\\';
                    if(col1 == '総合成績'){
                        var inputs = document.querySelectorAll('.table_inputdialog2 input');
                       
                        for (var i = 0; i < inputs.length; i++) {
                            var input = inputs[i]; 
                            if (input) {  
                                input.value =  col[i+3] 
                            }
                        }

                    }else{
                        // 内容
                        var img = $('#td_content1')
                        // console.log(imgpath+ col0);
                        var $newDiv = $('<div class="imgcss">');
                            $newDiv.html(
                                    '<img src="' +imgpath+ col0 + '" class="imgsign">' +
                                    '<img src="img/jian.png" onclick="deleteimg(this)">'
                                );

                                // 在 img 元素前面插入新的 div
                        img.before($newDiv);
                        // 科目
                        var selects =$('.table_inputdialog3 select');
                        selects[0].value = col1;
                        console.log(selects[0]);
                        selects[0].disabled = true;
                        // 内容
                        var firstimg1 = col2.split(',');
                        // 找到具有 class="contentimg" 的第一个 img 元素
                        var $firstImg = $('.table_inputdialog3 .contentimg:first');
 
                        if ($firstImg.length > 0) { 
                            $.each(firstimg1, function(index, value) { 
                                var $newDiv = $('<div class="imgcss">');
                                $newDiv.html(
                                    '<img src="' + imgpath + value + '" class="imgsign">' +
                                    '<img src="img/jian.png" onclick="deleteimg(this)">'
                                );

                                // 在 img 元素前面插入新的 div
                                $firstImg.before($newDiv);
                            });
                        }
                        //内容(クリア)
                        var firstimg2 = col3.split(','); console.log(firstimg2);
                        var $secondImg = $('.table_inputdialog3 .contentimg2:first');
                        // console.log($secondImg);
                        if ($secondImg.length > 0) { 
                          $.each(firstimg2, function(index, value) {
                            // 创建一个新的 div 元素
                                var $newDiv = $('<div class="imgcss">');
                                $newDiv.html(
                                    '<img src="' + imgpath + value + '" class="imgsign">' +
                                    '<img src="img/jian.png" onclick="deleteimg(this)">'
                                ); 
                                $secondImg.before($newDiv);
                            });
                        }
                   
                        var inputs = document.querySelectorAll('.table_inputdialog3 input');
                        // console.log(inputs);
                      
                       for (var i = 0; i < inputs.length; i++) {
                            var input = inputs[i]; 
                            if (input) {  
                                input.value =  col[i+3] 
                            }
                        }
                    }

                    $('#opt').val('update');

                    study_test_inputdialog.dialog('open');
                }
                // 删除img
                function deleteimg(img) {
                    $(img).parent().remove();
                }
                // 移动
                function move(index){
                    // Efw('studytest_move',{"seq": index });
                }
            </script>
        </head>
        <body onload="init();">
            <efw:Part path="study_test_inputdialog.jsp" /> 
         
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
                    <p><a href="study_menu.jsp">メニュー</a> > テスト情報管理</p>
                </div>
                <div class="content">
                    <div class="c_btn">
                        <table class="table_btn">
                            <tbody>
                                <tr>
                                    <td style="font-weight: bold;color: maroon">【検索条件】</td>

                                    <td></td>
                                    <td style="width: 120px;"><button id="btn_update" onclick="update()">更新</button></td>
                                    <td style="width: 120px;"><button id="btn_new" onclick="add()">新規</button></td>
                                    <td style="width: 120px;"><button   onclick="init()">検　索</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="c_condition" style="height: 55px;">
                        <table border="0" style="margin-top: 10px;">
                            <tbody>
                                <tr>
                                    <td style="width: 150px;font-weight: bold;">&nbsp;&nbsp;テスト名称：</td>
                                    <td style="width: 600px;">
                                        <select style="width: 560px;height:30px;border-style: solid;" id="testname">
                                            <option value=""></option> 
                                            <option value="01">01.恩氏製衣</option> 
                                        </select>
                                    </td>
                                    <td style="width: 60px;font-weight: bold;">科目：</td>
                                    <td style="width: 320px;">
                                        <select style="width: 130px;height:30px;border-style: solid;" id="subject"> 
                                                <option value=""></option>
                                                <option value="0.総合">0.総合</option>
                                                <option value="1.国語">1.国語</option>
                                                <option value="2.数学">2.数学</option>
                                                <option value="3.英語">3.英語</option>
                                                <option value="4.理科">4.理科</option>
                                                <option value="5.社会">5.社会</option>
                                                <option value="6.地理">6.地理</option>
                                                <option value="7.歴史">7.歴史</option> 
                                        </select>
                                    </td>
                                     
                                </tr>
                            </tbody>
                        </table>
                    </div>


                    <div class="c_detail_header" style="overflow: hidden;" onscroll="scrollHead(this);">
                        <table class="table_detail_header" style="table-layout: fixed;">
                            <thead>
                                <tr class="header">
                                    <th style="width: 50px;" id="temp">選択</th>
                                    <th style="width: 150px">テスト番号</th>
                                    <th style="width: 100px;">学年</th>

                                    <th style="width: 220px;">名称</th>
                                    <th style="width: 220px;">期間</th>

                                    <th style="width: 100px;">科目</th>
                                    <th style="width: 200px;">内容</th>
                                    <th style="width: 200px;">クリア内容</th>

                                    <th style="width: 80px;">得点</th>
                                    <th style="width: 80px;">満点</th>  
                                    <th style="width: 80px;">学級平均点</th>
                                    <th style="width: 80px">学年平均点</th>
                                    <th style="width: 100px;">学級順位</th>
                                    <th style="width: 100px;">学年順位</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <!-- display: none; -->
                    <div class="c_detail_content" style="overflow: auto;" onscroll="scrollHead(this);">
                        <table class="table_detail_content" id="studytesttable" style="table-layout: fixed;">
                            <tr class="header">
                                <td style="width: 50px;text-align: center;" ><input type="checkbox"   value=""  onchange="check(this)"/></td>
                                <td style="width: 150px" class="c">20241212-123456</td>
                                <td style="width: 100px;" class="l">01.中1-上期</td>

                                <td style="width: 220px;" class="l"><a href="#">期中テスト</a></td>
                                <td style="width: 220px;text-align: center;" class="">2024/01/01～2024/12/31</td>

                                <td style="width: 100px;" class="c">0.総合</td>
                                <td style="width: 200px;text-align: center;"> 
                                    <a href="#">1</a>&nbsp;
                                    <a href="#">2</a>&nbsp;
                                    <a href="#">3</a>&nbsp;
                                </td>
                                <td style="width: 200px;text-align: center;"> 
                                    <a href="null" target="_blank"><img src="null" class="aimg" ></a>&nbsp;
                                    <a href="img\loginBG.jpg" target="_blank"><img src="img\loginBG.jpg" class="aimg" ></a>&nbsp;
                                    <a href="img\loginBG.jpg" target="_blank"><img src="img\loginBG.jpg" class="aimg" ></a>
                                </td>
                                <td style="width: 80px;" class="r">88.50</td>
                                <td style="width: 80px;" class="r">100</td>
                                <td style="width: 80px;" class="r">82.00</td>
                                <td style="width: 80px;" class="r">83.00</td>
                                <td style="width: 100px;" class="r">50/999</td>
                                <td style="width: 100px;" class="r">23/999</td> 
                            </tr>
                            
                        </table>
                    </div>
                </div>
            </div>

        </body>
        <script>
            $(document).ready(function() {

                // 获取屏幕宽度
                var screenWidth = window.screen.width;

                // 获取屏幕高度
                var screenHeight = window.screen.height;

                // 获取屏幕可用工作区宽度（不包括任务栏等）
                var screenAvailableWidth = window.screen.availWidth;

                // 获取屏幕可用工作区高度（不包括任务栏等）
                var screenAvailableHeight = window.screen.availHeight;

                var h0 = $(document).height();
                

                var h1 = $(".head").height();
                var h2 = $(".topnav").height();
                var h3 = $(".c_btn").height();
                var h4 = $(".c_condition").height();
                var h5 = $(".c_detail_header").height();

                var h6 = h0 - h1 - h2 - h3 - h4 - h5 - 30 -120;

                $(".c_detail_content").height(h6);
         

            });
        </script>
        </html>