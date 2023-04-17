var shipactingmaster_uploadpic = {};
shipactingmaster_uploadpic.name = "代行発送商品新規写真アップロード";
shipactingmaster_uploadpic.paramsFormat = {
	"#productpicStr":null,
	"#shopid":null
};

shipactingmaster_uploadpic.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	//if (sessionCheck(ret) == false) { return ret };

	var pic = params["#productpicStr"];

	var shopid = params["#shopid"];

	var insertResult = db.change(
		"SHIPACTINGMASTER",
		"insertUploadpic",
		{
			"pic": pic,
			"shopid": shopid
		}
	);

	ret.alert("写真をアップロード完了しました。");
	ret.eval("window.location.reload();");
  
	return ret;
};