var study_savenote = {};
study_savenote.name = "写真アップロード";
study_savenote.paramsFormat = {
	"#signContent":null,
	"#signContent_tb":null,
};

study_savenote.fire = function (params) {

	var ret = new Result();

	var content = params["#signContent"];
	var content_tb = params["#signContent_tb"];

	if(content != null && content != ""){

		//  检索
		db.change(
			"STUDY",
			"insertTempNote",
			{
				content : content,
				content_tb : content_tb
			}
		);

	}



	ret.alert("メモを保存しました。");
	ret.eval("closeWindow();");
  
	return ret;
};