var study_menuinit={};
study_menuinit.name="メニュー画面初期化";//
study_menuinit.paramsFormat={ 

};

study_menuinit.fire=function(params){   //

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// タイトル情報設定
	setTitleInfo(ret);
	
	return ret;

};

