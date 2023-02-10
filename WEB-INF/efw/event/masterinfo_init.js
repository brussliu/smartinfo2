var masterinfo_init = {};
masterinfo_init.name = "インポート画面初期表示";
masterinfo_init.paramsFormat = {

};
var SHOP_ID = session.get("SHOP_ID");

masterinfo_init.fire = function (params) {

	var ret = new Result();

	// if(SHOP_ID == null|| SHOP_ID == ""){
	// 	return ret.navigate("login.jsp");
	// }


	// sl:商品管理番号初始化
	var selectResult1 = db.select(
		"MASTER",
		"searchproducno",
		{
			"shopId": SHOP_ID
		}
	).getArray();

	var resultHTML = "<option value='{value}'class='option' >{text}</option>";

	ret.runat("#productno").remove("option .option").append(resultHTML).withdata(selectResult1);
	ret.runat("#newproductno").remove("option .option").append(resultHTML).withdata(selectResult1);

	// sl:商品分类初始化
	var selectResult = db.select(
		"MASTER",
		"searchproducttype",
		{
			"shopId": SHOP_ID
		}
	).getArray();
	selectResult.debug(selectResult[0].value);
	var resultHTML = "<input type='checkbox' checked value='{value}'>&nbsp;{text}&nbsp;&nbsp;";

	ret.runat("#producttype").remove("*").append(resultHTML).withdata(selectResult);
	var resultHTML1 = "<option value='{value}'class='option' >{value}</option>";
	ret.runat("#newproducttype").remove("option .option").append(resultHTML1).withdata(selectResult);

	return ret;
};