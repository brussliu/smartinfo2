var study_uploadpic = {};
study_uploadpic.name = "写真アップロード";
study_uploadpic.paramsFormat = {
	"#picfile1":null,	"#picfile1_tb":null,
	"#picfile2":null,	"#picfile2_tb":null,
	"#picfile3":null,	"#picfile3_tb":null,
	"#picfile4":null,	"#picfile4_tb":null,
	"#picfile5":null,	"#picfile5_tb":null,
	"#picfile6":null,	"#picfile6_tb":null,
	"#picfile7":null,	"#picfile7_tb":null,
	"#picfile8":null,	"#picfile8_tb":null,
	"#picfile9":null,	"#picfile9_tb":null,
	"#picfile10":null,	"#picfile10_tb":null,
	"#picfile11":null,	"#picfile11_tb":null,
	"#picfile12":null,	"#picfile12_tb":null,
	"#picfile13":null,	"#picfile13_tb":null,
	"#picfile14":null,	"#picfile14_tb":null,
	"#picfile15":null,	"#picfile15_tb":null,
	"#picfile16":null,	"#picfile16_tb":null,
	"#picfile17":null,	"#picfile17_tb":null,
	"#picfile18":null,	"#picfile18_tb":null,
	"#picfile19":null,	"#picfile19_tb":null,
	"#picfile20":null,	"#picfile20_tb":null,
};

study_uploadpic.fire = function (params) {

	var ret = new Result();

	for(var i = 1;i <= 20;i ++){

		var content = params["#picfile"+i];
		var content_tb = params["#picfile" + i + "_tb"];

		if(content != null && content != ""){

			//  检索
			db.change(
				"STUDY",
				"insertTempPic",
				{
					content : content,
					content_tb : content_tb
				}
			);

		}

	}

	ret.alert("写真をアップロード完了しました。");
	ret.eval("window.location.reload();");
  
	return ret;
};