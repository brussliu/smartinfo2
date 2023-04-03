var sending_format = {};
sending_format.name = "発送情報整備";
sending_format.paramsFormat = {
};

sending_format.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// 整備対象検索（未発送、未整備）
	var selectResult = db.change(
		"SENDING",
		"xxxxxx",
		{
			"shopid": getShopId(),
		}
	).getArray();

	// 検索結果をループする
	for (var i = 0; i < selectResult.length; i++) {

		// 1，郵便番号整備(XXXXXXX ⇒ XXX-XXXX)

		// 2，MST_住所情報 検索
		// 2-1，不存在的话、整备处理中止、保持未整备的状态

		// 2-2，存在的话（１件）
		// 住所全部是否包含检索结果的都道府県
			// 不是的话
				// 检索结果的都道府県 ⇒ DB.都道府県
				// 检索结果的市区町村 ⇒ DB.市区町村
				// 整备处理中止、保持未整备的状态
			// 是的话
				// 检索结果的都道府県 ⇒ DB.都道府県
				// 从住所全部中去掉都道府県以及前面的部分，只留都道府県后面的内容
		// 剩下的部分是否以检索结果的市区町村为开头文字
			// 不是的话
				// 检索结果的都道府県 ⇒ DB.都道府県
				// 检索结果的市区町村 ⇒ DB.市区町村
				// 整备处理中止、保持未整备的状态
			// 是的话
				// 检索结果的都道府県 ⇒ DB.都道府県
				// 检索结果的市区町村 ⇒ DB.市区町村
				// 从住所全部剩下的部分中去掉市区町村以及前面的部分，只留市区町村后面的内容 ⇒ DB.住所1
		
		// 3，收货人的名字
			// 把空格（全角半角）都去掉
			// 如果最后一个字是【様】、去掉
		
		// 4，电话号码

	}
 
	ret.eval('init();');
	return ret;
};