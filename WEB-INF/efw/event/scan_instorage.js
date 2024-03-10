var scan_instorage = {};
scan_instorage.name = "在庫変更";
scan_instorage.paramsFormat = {
	"listno" : null
};
 
scan_instorage.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var listno = params["listno"];

	// 商品NO与名称
		var select1 = db.select(
			"SCAN",
			"queryNoAndName",
			{
				"listno" : listno,
				"shopid": getShopId()
			}
		).getSingle(); 
		var no = select1['no'];
		var name = select1['name'];
		// 共计
		var select2 = db.select(
			"SCAN",
			"sumScanByListno",
			{
				"listno" : listno,
				"shopid": getShopId()
			}
		).getSingle();
		var sumnumber = select2['sumnumber']; 
	// 商品信息
		var select3 = db.select(
			"SCAN",
			"queryProductDetailByListno",
			{
				"listno" : listno,
				"shopid": getShopId()
			}
		).getArray();
		var resultHTML =
		"<tr>" +
		"<td style='width: 90px;'>{productno}</td>" +    // 商品管理番号
		"<td style='width: 160px;'>{sub1}</td>" +  // 分類①
		"<td style='width: 160px;'>{sub2}</td>" +  // 分類②
		"<td style='width: 120px;'>{asin}</td>" +  // ASIN
		"<td style='width: 150px;'>{sku}</td>" +   // SKU
		"<td style='width: 120px;'>{label}</td>" + // LABEL
		"<td style='width: 80px;'>{num}</td>" +    // 数量
		"</tr>";
		ret.runat("#instoragetable").remove("tr").append(resultHTML).withdata(select3);
	 

		ret.eval('inputInstorage("'+no +'","'+name+'","'+sumnumber+'");');   
		return ret;
};