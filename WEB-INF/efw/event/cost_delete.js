var cost_delete = {};
cost_delete.name = "削除画面";
cost_delete.paramsFormat = {
	"delKey":null,
};

cost_delete.fire = function (params) {

	var ret = new Result();



	// セッションチェック
	sessionCheck(ret);
	

	
    
	
	var deleteResult = db.change(
		"COST",
		"deleteCostInfo",
		{
			delKey : params["delKey"],
			shopid : getShopId(),
			
		}
	);


	return ret.navigate("cost.jsp");

};



