var shipactingmaster_update = {};
shipactingmaster_update.name = "代行発送情報更新ボタン押下";
shipactingmaster_update.paramsFormat = {
	"no" : null
};
 
shipactingmaster_update.fire = function (params) {

	var ret = new Result();
	var no = params["no"];
	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };
 

	var selectResultObj = db.select(
		"SHIPACTINGMASTER",
		"queryshipactingmasterByNo",
		{
			"no" : parseInt(no),
			"shopid": getShopId(),
		}
	).getSingle();
 

	ret.runat("#shipactingmaster_inputdialog").withdata(
		{
			// 管理番号
			"#td_no":selectResultObj["no"].toString(),
			// 商品分類
			"#select_protype":selectResultObj["type"],
			// 所有者
			"#select_possessor":selectResultObj["possessor"],
			// 商品名
			"#text_product":selectResultObj["productname"],
			// 分類①
			"#text_sub1":selectResultObj["sub1"],
			// 分類②
			"#text_sub2":selectResultObj["sub2"],
			// 商品名称（中国語）
			"#td_productname":selectResultObj["productname_cn"],		
			// 商品名称（日本語）
			"#text_jpproductname":selectResultObj["productname_jp"],
			// 数量
			"#text_num":parseInt( selectResultObj["num"]),
			// 備考
			"#text_remark":selectResultObj["remark"],
  
		} 
	);
	// 商品写真
	ret.eval("$('#img_pic2').attr('src','"+selectResultObj["pic"]+"');");
	ret.eval("$('#img_pic2').css('display','block');")
	ret.eval("shipactingmaster_inputdialog.dialog('open');");

	return ret;
};