var shipacting_save = {};
shipacting_save.name = "代行発送情報保存ボタン押下";
shipacting_save.paramsFormat = {
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
	"#opt":null,
};
 
shipacting_save.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };
	var shopid = getShopId();

	var opt = params["#opt"];
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


	if(opt == 'new'){
		var insertResult = db.change(
			"SHIPACTING",
			"saveshipacting",
			{
				"sendProduct":sendProduct == '' ? null : parseInt(sendProduct),
				"num":num == ''?null:parseInt(num),
				"postal":postal,
				"address1":address1,
				"address2" :address2,
				"address3":address3,
				"name":name,
				"tel":tel,
				"remarks":remarks,			
				"shopid": shopid,
			}
		);
	}

	if(opt == 'update'){

		// 管理番号
		var no = params["#td_no"];
			// 上の部分を保存する
			var updateResult = db.change(
				"SHIPACTING",
				"updateshipacting1",
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
					"shopid": shopid
				}
			);

			//　下の部分を保存する
			//　権限ある場合

			var state = getAuthorityInfo( shopid,'btn-1002_01');

			if(state){
				// 発送方法：
				var sendMethod = params["#select_sendMethod"];
				// 発送費用-jp
				var jpMoney = params["#text_jpMoney"];
				// 発送費用-cn
				var cnMoney = params["#text_cnMoney"];	
				// 追跡番号：
				var track = params["#text_track"];

				var updateResult = db.change(
					"SHIPACTING",
					"updateshipacting2",
					{
						"no":no,
						"sendMethod":sendMethod,
						"jpMoney":jpMoney == ''?null:parseInt(jpMoney),
						"cnMoney":cnMoney,
						"track":track,
						"shopid": shopid
					}
				);
		
			}
	
	}
 
 
 	ret.eval("init();")
	//ret.eval("choice('init');");
	ret.eval(" shipacting_inputdialog.dialog('close');");
	return ret;
};