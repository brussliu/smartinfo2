var delivery_outputdeliveryfile={};
delivery_outputdeliveryfile.name="納品作成用ファイル出力";
delivery_outputdeliveryfile.paramsFormat={
	"no":"required:true;display-name:納品No;",
};
var shopname = "";
delivery_outputdeliveryfile.fire=function(params){
	
	var ret = new Result();

	shopname = params["#shop"];

	var deliveryno =  getShopId();
 


	var skuResult = db.select(
		"DELIVERY",
		"selectSkuList",
		{
			col0:deliveryno
		}
	).getArray();

	file.remove("output/test.txt");
	file.makeFile("output/test.txt");

	var csvWriter = new CSVWriter("output/test.txt", ",", "\"", "MS932");

	// var ary = [
	// 	["PlanName	" + deliveryname],
	// 	["AddressName	" + shopname],
	// 	["AddressFieldOne	浮間３－１－３７－４１１号室"],
	// 	["AddressFieldTwo	"],
	// 	["AddressCity	北区"],
	// 	["AddressCountryCode	JP"],
	// 	["AddressStateOrRegion	東京都"],
	// 	["AddressPostalCode	1150051"],
	// 	["	"],
	// 	["MerchantSKU	Quantity"],
	// 	[""],
	// ];

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

	for(var i = 0;i < skuResult.length;i ++){

		var dary = [skuResult[i]["skuinfo"]];

		csvWriter.writeLine(dary);

	}

	ret.attach("output/test.txt")
	.saveas("納品用ファイル_" + deliveryno + ".txt");

	return (ret);

};