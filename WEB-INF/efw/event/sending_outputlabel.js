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
		"selectUnsentInfo",
		{
			"shopid": getShopId(),
		}
	).getArray();


	if(selectResult.length <= 0){

		return ret.alert("処理対象がありません。");

	}

	// ipt_発送情報 ⇒ res_発送情報 TODO
	var insertResult = db.change(
		"SENDING",
		"insertResSendInfo",
		{
			"shopid": getShopId(),
		},
		"jdbc/efw2"
	);

	// ipt_発送情報 を　全件削除する TODO
	var delResult = db.change(
		"SENDING",
		"delIptSend",
		{
			"shopid": getShopId(),
		},
		"jdbc/efw2"
	);

	// Label情報を挿入する TODO
	for(var i = 0; i < selectResult.length; i ++){
		var record = new Record([selectResult[i]]).getSingle();

		var senderPostno = '115-0051'; //発送元-郵便番号
		var senderAddress1 = '東京都 北区'; //発送元-都道府県市区町村
		var senderAddress2 = '浮間３－１－３７'; //発送元-住所
		var senderName = 'Smart-Bear'; //発送元-宛先

		var insertResult = db.change(
			"SENDING",
			"insertLabelInfo",
			{
				"orderno": record["orderno"] ,
				"postno": record["postno"] ,
				"address1": record["address1"] ,
				"address2": record["address2"] ,
				"address3": record["address3"] ,

				"address4": record["address4"] ,
				"name": record["name"] ,
				"shipcontent": record["shipcontent"] ,
				"senderPostno": senderPostno ,
				"senderAddress1": senderAddress1 ,

				"senderAddress2": senderAddress2 ,
				"senderName": senderName ,
				"type": record["type"] ,
				"shopid": getShopId()

			},
			"jdbc/efw2"
		);

	}


	return ret;
};