var delivery_outputdeliveryfile = {};
delivery_outputdeliveryfile.name = "納品作成用ファイル出力";
delivery_outputdeliveryfile.paramsFormat = {
	"deliveryno": null,
};

delivery_outputdeliveryfile.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// 納品NO
	deliveryno = params["deliveryno"];

	var skuResult = db.select(
		"DELIVERY",
		"selectSkuList",
		{
			col0: deliveryno,
			shopid: getShopId()
		}
	).getArray();

	file.remove(getShopId()+"/download/deliveryfile.txt");
	file.makeFile(getShopId()+"/download/deliveryfile.txt");

	var csvWriter = new CSVWriter(getShopId()+"/download/deliveryfile.txt", ",", "\"", "MS932");

	var ary = [
		["このシートに記入する前にExampleタブを確認してください										"],
		["								"],
		["Default prep owner	Seller									"],
		["Default labeling owner	Seller									"],
		["										"],
		["										"],
		["		任意			任意：メーカー梱包のSKUにのみ使用					"],
		["Merchant SKU	Quantity	Prep owner	Labeling owner	Expiration date (MM/DD/YYYY)	Units per box 	Number of boxes	Box length (cm)	Box width (cm)	Box height (cm)	Box weight (kg)"],
		[""]
	];

	csvWriter.writeAllLines(ary);

	for (var i = 0; i < skuResult.length; i++) {

			var dary = [skuResult[i]["skuinfo"]];

			csvWriter.writeLine(dary);
	}

	ret.attach(getShopId()+"/download/deliveryfile.txt")
		.saveas("納品用ファイル_" + deliveryno + ".txt");

	return (ret);

};

