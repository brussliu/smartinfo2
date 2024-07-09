var study_displaynote = {};
study_displaynote.name = "写真アップロード";
study_displaynote.paramsFormat = {
	"flg":null,
};

study_displaynote.fire = function (params) {

	var ret = new Result();

	var flg = params["flg"];


	//  检索
	var noteResult = db.select(
		"STUDY",
		"selectTbNote",
		{
		}
	).getSingle();

	var seq = noteResult["seq"];

	db.change(
		"STUDY",
		"updateTbNote",
		{
			seq : seq,
			userid : getUserId(),
			userid : getUserId()
		}
	);

	// ret.runat("body").withdata(
	// 	{

	// 		"#hiddenBook" : noteResult["note"]
			
	// 	}
	// );
	ret.eval("adddisplaynote(" + flg + ",'" + noteResult["note"] + "')");
  
	return ret;
};