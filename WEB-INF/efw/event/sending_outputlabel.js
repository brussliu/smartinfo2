var sending_outputlabel = {};
sending_outputlabel.name = "普通便ラベル出力";
sending_outputlabel.paramsFormat = {

};

sending_outputlabel.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// 処理対象検索（未発送、普通便とゆうパケット）
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

	// ipt_発送情報 ⇒ res_発送情報 TODO
	var delResult = db.change(
		"SENDING",
		"XXXXXXXXXXXXXXXXXXXXXXX",
		{
			"shopid": getShopId(),
		},
		"jdbc/efw2"
	);

	// ipt_発送情報 を　全件削除する TODO
	var delResult = db.change(
		"SENDING",
		"XXXXXXXXXXXXXXXXXXXXXXX",
		{
			"shopid": getShopId(),
		},
		"jdbc/efw2"
	);

	// Label情報を挿入する TODO
	for(var i = 0; i < selectResult.length; i ++){
		
		var insertResult = db.change(
			"SENDING",
			"insertLabelInfo",
			{

			},
			"jdbc/efw2"
		);

	}


	return ret;
};