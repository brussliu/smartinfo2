var common_shoplistinit={};
common_shoplistinit.name="店舗選択画面初期化";//
common_shoplistinit.paramsFormat={ 

};

common_shoplistinit.fire=function(params){   //

	var ret = new Result();

	clearSessionForShopList();

	// セッションチェック
	if(sessionCheckForShopList(ret) == false){return ret};

	// タイトル情報設定
	setTitleInfoForShopList(ret);

	var selectResult = db.select(
		"COMMON",
		"searchShoplistInfo",
		{
			userid : getUserId(),
			smartid : getSmartId(),
			
		}
	).getArray();

	var resultHTML =
	'<tr><td><a class="link" onclick="selectShop(this.innerHTML);">{shopid}</a></td></tr>';

	ret.runat(".shoplist").remove("tr").append(resultHTML).withdata(selectResult);

	return ret;

};

