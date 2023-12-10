function outputToExcelFile(){

    var form = $('.topnav p').text().substring(7);
     
    var span = new RegExp("span");
    var choice = new RegExp("選択");
    //  获取行名 
    var colName = new Array();
    // 第一行是否需要
    var temp = false;
    // 仕入情报管理-資料
    var informationFlg = -1;
    $('.header').children().each(function(index , data){
        if($(this).html() == '選択'||$(this).html() == '序号'||
        $(this).html() == 'NO'||$(this).html() == '操作' || choice.test($(this).html()) == true){
            temp = true ; 
        }else{
            if($(this).html() == '資料'){
                informationFlg = index; 
            }else{
                if(span.test($(this).html())){ 
                    if(form == '手数料見積情報管理' && index == 4){
                        colName.push($(this).children().html().replaceAll("<br>", "/"))
                    }else{
                        colName.push($(this).children().html().replaceAll("<br>", ""))
                    }
                    
                }else{
                    if(form == '手数料見積情報管理' && index == 4){
                        colName.push($(this).html().replaceAll("<br>", "/"))
                    }else{
                        colName.push($(this).html().replaceAll("<br>", ""))
                    }
                    
                } 
               
            }
           
        } 
    })
    
    // 获取数据
    var colData = new Array();
    if(form == '仕入情報管理'){
        var colMaxNum = 0;
        var datas = new Array(); 
        $('.table_detail_content').children().each(function(index , data){
            
            if(index % 2 == 0){
                 datas = new Array(); 
                $(this).children().each(function(i , d){
                    
                        if (i == 0){
                            if(temp){  
                            }else{ 
                                // 包含<span></span>
                                if(span.test($(this).html())){
                                    datas.push($(this).children().html().replaceAll("<br>", ""));
                                }else{
                                    datas.push($(this).html().replaceAll("<br>", "")); 
                                    
                                } 
                            } 
                        }else{ 
                            // 存在资料字段
                            if(informationFlg > 0){ 
                            
                                if(informationFlg != i){ 
                            
                                    if(span.test($(this).html())){ 
                                            datas.push($(this).children().html().replaceAll("<br>", ""));  
                                    }else{ 
                                            datas.push($(this).html().replaceAll("<br>", ""));   
                                    }
                                } 
                            }else{ 
        
                                if(span.test($(this).html())){
                                    
                                        datas.push($(this).children().html().replaceAll("<br>", ""));   
                                    
                                }else{ 
                                        datas.push($(this).html().replaceAll("<br>", ""));  
                                    
                                }
                            }
                        }   
                }) 

            }else{
                $(this).children().each(function(i , d){
                  
                        // 存在资料字段
                        if(informationFlg > 0){ 
                        
                            if(informationFlg != i){ 
                        
                                if(span.test($(this).html())){ 
                                        datas.push($(this).children().html().replaceAll("<br>", ""));  
                                }else{ 
                                        datas.push($(this).html().replaceAll("<br>", ""));   
                                }
                            } 
                        }else{ 
    
                            if(span.test($(this).html())){
                                
                                    datas.push($(this).children().html().replaceAll("<br>", ""));   
                                
                            }else{ 
                                    datas.push($(this).html().replaceAll("<br>", ""));  
                                
                            }
                        }
                     
            }) 
                colData.push(datas);    
            }
                
        })
    }else{
        $('.table_detail_content').children().each(function(index , data){
            var datas = new Array(); 
            $(this).children().each(function(i , d){
              
                    if (i == 0){
                        if(temp){  
                        }else{ 
                            // 包含<span></span>
                            if(span.test($(this).html())){
                                datas.push($(this).children().html().replaceAll("<br>", ""));
                            }else{
                                datas.push($(this).html().replaceAll("<br>", "")); 
                                 
                            } 
                        } 
                    }else{ 
                        // 存在资料字段
                        if(informationFlg > 0){ 
                           
                            if(informationFlg != i){ 
                           
                                if(span.test($(this).html())){
                                    if(form == '手数料見積情報管理' && i == 4){
                                        datas.push($(this).children().html().replaceAll("<br>", "/"));   
                                    }else{
                                        datas.push($(this).children().html().replaceAll("<br>", ""));  
                                    }
                                       
                                }else{
                                    if(form == '手数料見積情報管理' && i == 4){
                                        datas.push($(this).html().replaceAll("<br>", "/"));  
                                    }else{
                                        datas.push($(this).html().replaceAll("<br>", ""));  
                                    }
                                      
                                }
                            } 
                        }else{ 
    
                            if(span.test($(this).html())){
                                if(form == '手数料見積情報管理' && i == 4){
                                    datas.push($(this).children().html().replaceAll("<br>", "/"));   
                                }else{
                                    datas.push($(this).children().html().replaceAll("<br>", ""));   
                                }
                                  
                            }else{
                                if(form == '手数料見積情報管理' && i == 4){
                                    datas.push($(this).html().replaceAll("<br>", "/"));   
                                }else{
                                    datas.push($(this).html().replaceAll("<br>", ""));  
                                }
                                  
                            }
                         }
                    }  
                }) 
                colData.push(datas);
        })
    }
    
    window.event.returnValue = false; 
   

    // 写入文件
    Efw('common_tabledown',{'form':form ,'colName':colName ,'colData':colData }); 

}