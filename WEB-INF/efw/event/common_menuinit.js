var common_menuinit={};
common_menuinit.name="メニュー画面初期化";//
common_menuinit.paramsFormat={ 

};

common_menuinit.fire=function(params){   //

	var ret = new Result();

	// セッションチェック
	sessionCheck(ret);

	ret.debug("MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM");

	// タイトル情報設定
	setTitleInfo(ret);
	
	return ret;

};

