var shipacting_acceptance = {};
shipacting_acceptance.name = "代行発送情報受入ボタン押下";
shipacting_acceptance.paramsFormat = {
	"#td_no":null,
	"#select_sendProduct":null,
	"#text_num":null,
	"#text_postal":null,
	"#text_address1":null,
	"#text_address2":null,
	"#text_address3":null,
	"#text_name":null,
	"#text_tel":null,
	"#text_remarks":null,
	"#select_sendMethod":null,
	"#text_jpMoney":null,
	"#text_cnMoney": null,
	"#text_track":null,
	
};
 
shipacting_acceptance.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var shopid = getShopId();

	// 発送商品：
	var sendProduct = params["#select_sendProduct"];
	// 数量：
	var num = params["#text_num"];
	// 郵便番号：
	var postal = params["#text_postal"];
	// 住所①：
	var address1 = params["#text_address1"];
	// 住所②：
	var address2 = params["#text_address2"];
	// 住所③：
	var address3 = params["#text_address3"];
	// 名前：
	var name = params["#text_name"];
	// 電話番号：
	var tel = params["#text_tel"];
	// 備考：
	var remarks = params["#text_remarks"];
	// 管理番号
	var no = params["#td_no"];
	// 発送方法：
	var sendMethod = params["#select_sendMethod"];
	// 発送費用-jp
	var jpMoney = params["#text_jpMoney"];
	// 発送費用-cn
	var cnMoney = params["#text_cnMoney"];	
	// 追跡番号：
	var track = params["#text_track"];

	var state = getAuthorityInfo( shopid,'btn-1002_01');
	
	if(state){
		// データ更新
		var updateResult = db.change(
			"SHIPACTING",
			"updateshipacting3",
			{
				"no":no,
				"sendProduct":sendProduct == ''?null:parseInt(sendProduct),
				"num":num == ''?null:parseInt(num),
				"postal":postal,
				"address1":address1,
				"address2" :address2,
				"address3":address3,
				"name":name,
				"tel":tel,
				"remarks":remarks,
				"sendMethod":sendMethod,
				"jpMoney":jpMoney == ''?null:parseInt(jpMoney),
				"cnMoney":cnMoney,
				"track":track,
				"shopid": shopid
			}
		);
	
		//　発送情報へInsert
		var insertResult = db.change(
			"SHIPACTING",
			"saveshipactingmaster",
			{
				"no":no,
				"sendProduct":sendProduct == ''?null:parseInt(sendProduct),
				"num":num == ''?null:parseInt(num),
				"postal":postal,
				"address1":address1,
				"address2" :address2,
				"address3":address3,
				"name":name,
				"tel":tel,
				"remarks":remarks,
				"sendMethod":sendMethod,
				// "jpMoney":jpMoney == ''?null:parseInt(jpMoney),
				// "cnMoney":cnMoney,
				"track":track,
				"shopid": shopid
			}
		);
		
	}
 	ret.eval("init();")
	ret.eval("choice('0');");
	ret.eval(" shipacting_inputdialog.dialog('close');");
	return ret;
};