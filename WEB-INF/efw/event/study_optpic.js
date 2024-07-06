var study_optpic = {};
study_optpic.name = "写真アップロード";
study_optpic.paramsFormat = {
	"#productpicStr":null,
	"#shopid":null
};

study_optpic.fire = function (params) {

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