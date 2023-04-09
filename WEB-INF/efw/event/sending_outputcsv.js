var sending_outputcsv = {};
sending_outputcsv.name = "クリックポスト用CSV出力";
sending_outputcsv.paramsFormat = {

};

sending_outputcsv.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// 処理対象検索（未発送、整備済み、クリックポスト）
	var selectResult = db.select(
		"SENDING",
		"selectClickpostInfo",
		{
			"shopid": getShopId(),
		}
	).getArray();


	if(selectResult.length <= 0){

		return ret.alert("処理対象がありません。");

	}

	file.remove(getShopId()+"/download/clickpost.csv");
	file.makeFile(getShopId()+"/download/clickpost.csv");

	// file.remove("output/clickpost.csv");
	// file.makeFile("output/clickpost.csv");

	var csvWriter = new CSVWriter(getShopId()+"/download/clickpost.csv", ",", "", "MS932");

	var ary = ["お届け先郵便番号,お届け先氏名,お届け先敬称,お届け先住所1行目,お届け先住所2行目,お届け先住所3行目,お届け先住所4行目,内容品"];

	csvWriter.writeLine(ary);


	for(var i = 0;i < selectResult.length;i ++){

		var ary = new Array(1);

		var line = 	selectResult[i]["postno"].replaceAll(",","、") + "," +
					selectResult[i]["name"].replaceAll(",","、") + "," +
					selectResult[i]["sama"].replaceAll(",","、") + "," +
					selectResult[i]["address1"].replaceAll(",","、") + "," +
					selectResult[i]["address2"].replaceAll(",","、") + "," +
					selectResult[i]["address3"].replaceAll(",","、") + "," +
					selectResult[i]["address4"].replaceAll(",","、") + "," +
					selectResult[i]["shipcontent"].replaceAll(",","、");

		ary[0] = line;

		csvWriter.writeLine(ary);

	}

	ret.attach(getShopId()+"/download/clickpost.csv").saveas("クリックポスト作成用.csv");

	return ret;
};