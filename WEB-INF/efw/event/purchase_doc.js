var purchase_doc = {};
purchase_doc.name = "仕入ファイル";
purchase_doc.paramsFormat = {
	"purchaseno": null
};

purchase_doc.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var purchaseno = params["purchaseno"];

	 
	var selectResult = db.select("PURCHASE", "selectpurchasedoc", {no:purchaseno,shopid: getShopId()}).getArray();
 
	var excel = new Excel(getShopId() +"/templates/SUPPLIER_LIST.xlsx"); 
	var sheetNames = excel.getSheetNames();
	var tempFilePathName = file.getTempFileName(); 

	//创建一个集合存放仕入商品管理番号  
	var purchasenoList =  new Array();
	var temp = ''; 
	for(var n=0;n<selectResult.length; n++){
		temp =selectResult[n]["productno"];
		if(purchasenoList.length == 0){
				purchasenoList.push(temp);
		}else{ 
			for(var l=0; l<purchasenoList.length;l++){
				if(temp == purchasenoList[l]){ 
					break;
				}
				if(l == purchasenoList.length-1){ 
					purchasenoList.push(temp);
				}
			} 
		} 
	} 

	// 当前表名sheetName最大行数
	var maxRow= 0;
 
	// 遍历所有sheetName
	for(var q=0; q<sheetNames.length; q++){

		var optFlg = false;

		maxRow = queryMaxRow(excel, sheetNames[q],excel.getMaxRow(sheetNames[q])) ;
		// if(sheetNames[q] == 'Sheet1'){ 
		// 	break;
		// }
		// 需要删除的商品管理番号
		var delNo = '';
		// 起始删除位
		var delStart = 0;
		// 结束删除位
		var delEnd = 0;
		// 缓存集合
		var cacheList =new Array();
		// 缓存番号
		var cacheNo ='';
		// 用表中数据比较仕入数据
		for(var w=3; w<=maxRow; w++){  
			// 当前行的商品管理番号无数量
			if(excel.getValue(sheetNames[q],'B'+w) == delNo){
				// 当前表最后一行
				if(w == maxRow){
					if(delStart != delEnd){
	
						var delnum =delEnd - delStart +1
						excel.delRow(sheetNames[q],delStart ,delnum ); 
					} 
				}else{
					delEnd = w;
					continue ;
				}
			
			}else{
				if(delStart != delEnd){ 

					var delnum =delEnd - delStart ;
					excel.delRow(sheetNames[q],delStart ,delnum );
					delEnd = delStart;
					w = delStart ;  
					continue ;
				} 
				if(excel.getValue(sheetNames[q],'B'+w) == cacheNo){
						// 为当前行仕入价格，数量赋值
						for(var t=0;t<cacheList.length; t++){

							if(excel.getValue(sheetNames[q],'C'+w) == cacheList[t]['asin']
							&&  excel.getValue(sheetNames[q],'D'+w) == cacheList[t]['sku'] ){

								excel.setCell(sheetNames[q],'I'+w ,cacheList[t]['purchaseprice']) ;
								excel.setCell(sheetNames[q],'J'+w ,cacheList[t]['num']);

								optFlg = true;
							}
						}  
					
				}else{
					// 清空缓存列表
					cacheList = [];
					cacheNo = '';
					// 表中番号与purchasenoList中番号对比,存在获取缓存番号，不存在获取删除番号
					for(var e=0; e<purchasenoList.length; e++){
						if(excel.getValue(sheetNames[q],'B'+w) == purchasenoList[e]){ 

							cacheNo = excel.getValue(sheetNames[q],'B'+w);
							break ;
						}
						if(e == purchasenoList.length-1){ 

							delNo = excel.getValue(sheetNames[q],'B'+w);
							delStart = w-1;
							w -=1; 
						} 
					}  

					if( cacheNo != ''){
						// 存入缓存列表
						for(var r=0; r<selectResult.length; r++){
							if(selectResult[r]['productno'] == cacheNo){

								cacheList.push(selectResult[r]);
							}
						}
						w -=1; 
					}
				}
				
				
			} 
		 
		}

		if(optFlg == false){

			excel.removeSheet(sheetNames[q])
		}


	}
   
	excel.save(tempFilePathName); 
	ret.attach(tempFilePathName)
	.saveas(getShopId()+"仕入ファイル_"+ (new Date()).format("yyyyMMdd") + ".xlsx")
	.deleteAfterDownload();
	  
	// 画面へ結果を返す
	return ret;

};
 
//  获取最大行数
 function queryMaxRow(excel,sheet,row){
	while(excel.getValue(sheet,"B"+row) =="" || excel.getValue(sheet,"B"+row) == null){
					row -= 1;
		}
		return row; 
 }