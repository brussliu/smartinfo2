var scan_init = {};
scan_init.name = "商品スキャン画面初期表示";
scan_init.paramsFormat = {

};
 
scan_init.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// タイトル情報設定
	setTitleInfo(ret);

	var selectResult = db.select(
		"SCAN",
		"searchProductList",
		{
			"shopid": getShopId(),
		}
	).getArray();
 
	var resultHTML ='<tr>' +
	'<td style="width: 50px;" class="c"><input type="radio" value="{listno}" name="choice" onclick="choice({listno})" ></input></td>' +
	'<td style="width: 160px;" class="c">{listno}</td>' +
	'<td style="width: 250px;" class="l"><span class="l5">{listname}</span></span></td>' +
	'<td style="width: 400px;" class="l"><span class="l5">{listcontent}</span></td>' +
	'<td style="width: 150px;" class="r"><span class="r5">{num}</span></td>' +
	'<td style="width: 150px;" class="c">{status}</td>' +
    '</tr>'
	ret.runat("#scantable").remove("tr").append(resultHTML).withdata(selectResult);
	 
		// 检索商品管理番号
		var selectResult1 = db.select(
			"SCAN",
			"searchproducno",
			{
				"shopid": getShopId()
			}
		).getArray();
	
		var resultHTML1 = "<option value='{value}' class='option' >{text}</option>";
		ret.runat("#select_productno").remove(".option").append(resultHTML1).withdata(selectResult1);
	 
		// 检索リストNO
		var selectResult2 = db.select(
			"SCAN",
			"searchproduclistno",
			{
				"shopid": getShopId()
			}
		).getArray();

		var resultHTML2 = "<option value='{value}' class='option' >{text}</option>";
		ret.runat("#select_listno").remove(".option").append(resultHTML2).withdata(selectResult2);
	 
	ret.eval("changeColor();");
	return ret;
};