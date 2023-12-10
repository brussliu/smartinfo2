var shipactingmaster_querypic = {};
shipactingmaster_querypic.name = "代行発送商品検索写真アップロード";
shipactingmaster_querypic.paramsFormat = {

};

shipactingmaster_querypic.fire = function (params) {
	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var selectResult = db.select(
		"SHIPACTINGMASTER",
		"searchpic",
		{
			"shopid": getShopId()
		}
	).getSingle();

	ret.eval("$('#img_pic2').attr('src','"+selectResult["pic"]+"');")
	ret.eval("$('#img_pic2').css('display','block');")
  
	return ret;
};