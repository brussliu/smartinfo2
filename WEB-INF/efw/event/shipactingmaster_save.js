var shipactingmaster_save = {};
shipactingmaster_save.name = "代行発送情報保存ボタン押下";
shipactingmaster_save.paramsFormat = {
	"#td_no":null,
	"#select_protype":null,
	"#select_possessor":null,
	"#td_productname":null,
	"#text_product":null,
	"#text_sub1":null,
	"#text_sub2":null,
	"#text_jpproductname":null,
	"#text_num":null,
	"#text_remark":null,
	"pic":null,
	"#opt": null
};
 
shipactingmaster_save.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };
 
	var opt = params["#opt"];
	// 商品分類
	var protype = params["#select_protype"];
	// 所有者
	var possessor = params["#select_possessor"];
	// 商品名称（中国語）
	var productname = params["#td_productname"];
	// 商品名
	var product = params["#text_product"];
	// 分類①
	var sub1 = params["#text_sub1"];
	// 分類②
	var sub2 = params["#text_sub2"];
	// 商品名称（日本語）
	var jpproductname = params["#text_jpproductname"];
	// 数量
	var num = params["#text_num"];
	// 備考
	var remark = params["#text_remark"];
	// 商品写真
	var pic = params["pic"];

	if(opt == 'new'){
		var insertResult = db.change(
			"SHIPACTINGMASTER",
			"saveshipactingmaster",
			{
				"protype":protype,
				"possessor":possessor,
				"product":product,
				"sub1":sub1,
				"sub2":sub2,
				"cnproductname" :product + '/' +sub1 + '/' +sub2,
				"jpproductname":jpproductname,
				"num":num == ''?null:parseInt(num),
				"remark":remark,
				"pic":pic,
				"shopid": getShopId(),
			}
		);
	} 

	if(opt == 'update'){
		// 管理番号
		var no = params["#td_no"];

		var updateResult = db.change(
			"SHIPACTINGMASTER",
			"updateshipactingmaster",
			{ 
				"no":parseInt(no),
				"protype":protype,
				"possessor":possessor,
				"productname":productname,
				"product":product,
				"sub1":sub1,
				"sub2":sub2,
				"cnproductname" :product + '/' +sub1 + '/' +sub2,
				"jpproductname":jpproductname,
				"num":num == ''?null:parseInt(num),
				"remark":remark,
				"pic":pic,
				"shopid": getShopId()
			}
		);

	}
 
 
 	ret.eval("init();")
	//ret.eval("choice('init');");
	ret.eval(" shipactingmaster_inputdialog.dialog('close');");
	return ret;
};