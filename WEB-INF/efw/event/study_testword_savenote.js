var study_testword_savenote = {};
study_testword_savenote.name = "写真アップロード";
study_testword_savenote.paramsFormat = {

	"#signContent":null,
	"#signContent_tb":null,
	"flg":null,

};

study_testword_savenote.fire = function (params) {

	var ret = new Result();

	var content = params["#signContent"];
	var content_tb = params["#signContent_tb"];

	var flg = params["flg"];

	if(content != null && content != ""){

		//  检索
		db.change(
			"STUDY",
			"insertTempNote",
			{
				flg : flg,
				content : content,
				content_tb : content_tb
			}
		);

	}

	// ret.alert("保存しました。");

	ret.eval("overSave();");
  
	return ret;
};