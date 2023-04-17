var common_menuinit={};
common_menuinit.name="メニュー画面初期化";//
common_menuinit.paramsFormat={ 

};

common_menuinit.fire=function(params){   //

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	// タイトル情報設定
	setTitleInfo(ret);

	setAuthorityInfo(ret, "03");
	
	return ret;

};

