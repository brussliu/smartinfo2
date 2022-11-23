var searchhistory={};
searchhistory.name="データ導入履歴検索";
searchhistory.paramsFormat={
	"#shop":null
};
var shopname = "";
searchhistory.fire=function(params){
	
	var ret = new Result();

	shopname = params["#shop"];

	var historyResult = db.select(
		"UPLOAD",
		"searchHistory",
		{shop:shopname}
	);

	var masterArr = historyResult.seek("importtype","eq","master").getArray();
	// var productArr = historyResult.seek("importtype","eq","product").getArray();
	// var fbaArr = historyResult.seek("importtype","eq","fba").getArray();
	// var orderArr = historyResult.seek("importtype","eq","order").getArray();

	var pfoArr = historyResult.seek("importtype","eq","pfo").getArray();

	var localstockArr = historyResult.seek("importtype","eq","localstock").getArray();
	var onboardstockArr = historyResult.seek("importtype","eq","onboardstock").getArray();
	var deliveryArr = historyResult.seek("importtype","eq","delivery").getArray();

	if(masterArr.length > 0){
		ret.runat("#mastertable").withdata(
			{
				".importtime": masterArr[0].importtime,
				".importcount": masterArr[0].importcount
			}
		);
	}

	if(pfoArr.length > 0){
		ret.runat("#producttable").withdata(
			{
				".importtime": pfoArr[0].importtime,
				".importcount": pfoArr[0].importcount
			}
		);
	}

	// if(productArr.length > 0){
	// 		ret.runat("#producttable").withdata(
	// 			{
	// 				".importtime": productArr[0].importtime,
	// 				".importcount": productArr[0].importcount
	// 			}
	// 	);
	// }

	// if(fbaArr.length > 0){
	// 	ret.runat("#fbatable").withdata(
	// 		{
	// 			".importtime": fbaArr[0].importtime,
	// 			".importcount": fbaArr[0].importcount
	// 		}
	// 	);
	// }

	// if(orderArr.length > 0){
	// 	ret.runat("#ordertable").withdata(
	// 		{
	// 			".importtime": orderArr[0].importtime,
	// 			".importcount": orderArr[0].importcount
	// 		}
	// 	);
	// }

	if(localstockArr.length > 0){
		ret.runat("#localstocktable").withdata(
			{
				".importtime": localstockArr[0].importtime,
				".importcount": localstockArr[0].importcount
			}
		);
	}

	if(onboardstockArr.length > 0){
		ret.runat("#onboardstocktable").withdata(
			{
				".importtime": onboardstockArr[0].importtime,
				".importcount": onboardstockArr[0].importcount
			}
		);
	}

	if(deliveryArr.length > 0){
		ret.runat("#deliverytable").withdata(
			{
				".importtime": deliveryArr[0].importtime,
				".importcount": deliveryArr[0].importcount
			}
		);
	}

	// 画面へ結果を返す
	return ret;

};
