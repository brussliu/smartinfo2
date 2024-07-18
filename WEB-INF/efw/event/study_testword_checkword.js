var study_testword_checkword = {};
study_testword_checkword.name = "写真アップロード";
study_testword_checkword.paramsFormat = {

	"testno":null,
	"subno":null,
	"kbn":null,
	"book":null,
	"classification":null,
	"wordseq":null,

	"checkresult":null,
}
study_testword_checkword.fire = function (params) {

	var ret = new Result();

	var testno = params["testno"];
	var subno = parseInt(params["subno"]);
	var kbn = params["kbn"];

	var checkresult = params["checkresult"];
	//  检索
	db.change(
		"STUDY",
		"updateCheckResult1",
		{
			testno : testno,
			subno : subno,
			kbn : kbn,
			checkresult : checkresult
		}
	);

	//  检索
	var result = db.change(
		"STUDY",
		"updateCheckResult2",
		{
			testno : testno,
			subno : subno
		}
	);

	if(result == 1){
		ret.eval("changeColor('" + testno + "','" + subno +"');");
	}
	
	// ret.alert("写真をアップロード完了しました。");
	// ret.eval("window.location.reload();");
  
	return ret;
};