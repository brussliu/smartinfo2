var scan_implement = {};
scan_implement.name = "実行";
scan_implement.paramsFormat = {
	"typeval" : null,
	"listno" : null
};
 
scan_implement.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var typeval = params["typeval"];
	var listno = params["listno"];
    var state = '';
	// LOCAL1-入庫   ⇒　列表的数量加到Local1上
	 if(typeval == '1'){
		var update1 = db.change(
			"SCAN",
			"addLocal1",
			{
				"listno" : listno,
				"shopid": getShopId()
			}
		);
		state = '2.入庫济';
	 }
	//  LOCAL1-出庫   ⇒　从Local1上减掉
	 if(typeval == '2'){
		var update2 = db.change(
			"SCAN",
			"minusLocal1",
			{
				"listno" : listno,
				"shopid": getShopId()
			}
		);
		state = '2.出庫济';
	}
	// LOCAL1⇒LOCAL2-移動   ⇒　从Local1上减掉加到Local2上
	if(typeval == '3'){
		var update3 = db.change(
			"SCAN",
			"minusLocal1AddLocal2",
			{
				"listno" : listno,
				"shopid": getShopId()
			}
		);
		state = '2.移動済(1→2)';
	}
	// LOCAL2⇒LOCAL1-移動   ⇒　从Local2上减掉加到Local1上
	if(typeval == '4'){
		var update4 = db.change(
			"SCAN",
			"minusLocal2AddLocal1",
			{
				"listno" : listno,
				"shopid": getShopId()
			}
		);
		state = '2.移動済(2→1)';
	}
	var update5 = db.change(
		"SCAN",
		"updateState",
		{
			"listno" : listno,
			"state" : state,
			"shopid": getShopId()
		}
	);

	ret.eval('scan_instorage_inputdialog.dialog("close");');
	ret.eval("init();");
	ret.eval("choice('init');");
		return ret;
};