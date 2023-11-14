var purchase_ivfile = {};
purchase_ivfile.name = "IVファイル";
purchase_ivfile.paramsFormat = {
	"purchaseno": null
};

purchase_ivfile.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };
	var excel = new Excel(getShopId() +"/templates/INVOICE_LIST.xlsx"); 
	var tempFilePathName = file.getTempFileName(); 
	var sheetNames = excel.getSheetNames();

	var purchaseno = params["purchaseno"];
	// 追跡番号
	var selectResult1 = db.select("PURCHASE", "selecttracknumber", {no:purchaseno,shopid: getShopId()}).getSingle();
	// 设置追跡番号
	var tracknumbe = 'F12'
	excel.setCell(sheetNames[0], tracknumbe ,selectResult1['tracknumber']) ; 

	// 仕入数量
	var selectResult2 = db.select("PURCHASE", "selectnumber", {no:purchaseno,shopid: getShopId()}).getArray();
	var e_no = 'J';
	var e_num = 'G';
	var maxRow = 53;
	
	for(var i=21; i<maxRow;i++)
	{ 	
		if('TOTAL' == excel.getValue(sheetNames[0],'A'+i)){
			break;
		}
		var now_no = excel.getValue(sheetNames[0],e_no+i); 
		for(var j = 0; j<selectResult2.length; j++){ 
			
			if(now_no == selectResult2[j]['productno']){

				excel.setCell(sheetNames[0], e_num+i ,selectResult2[j]['num']);
				break;
			}
			if(j == selectResult2.length-1) {

				excel.delRow(sheetNames[0],i-1 ,1 ); 
				i -=1;
			}
		}

	}
  
	excel.save(tempFilePathName); 
	ret.attach(tempFilePathName)
	.saveas(getShopId()+"IVファイル"+ (new Date()).format("yyyyMMdd") + ".xlsx")
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