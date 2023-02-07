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
var selectResult = db.select(
	"MASTER",
	"searchproducno",
	{
		"shopId":SHOP_ID
	}
).getArray();

var resultHTML = "<option value='{value}'class='option' >{text}</option>";

ret.runat("#productno").remove("option .option").append(resultHTML).withdata(selectResult);
ret.runat("#newproductno").remove("option .option").append(resultHTML).withdata(selectResult);

// sl:商品分类初始化
var selectResult = db.select(
	"MASTER",
	"searchproducttype",
	{
		"shopId":SHOP_ID
	}
).getArray();

var resultHTML = "<input type='checkbox' checked value='{value}'>&nbsp;{text}&nbsp;&nbsp;";

ret.runat("#producttype").remove("*").append(resultHTML).withdata(selectResult);
var resultHTML1 = "<option value='{value}'class='option' >{text}</option>";
ret.runat("#newproducttype").remove("option .option").append(resultHTML1).withdata(selectResult);
// sl:商品信息初始化
var s1="$('.c_detail_header').hide();";
var s2="$('.c_detail_content').hide();";


// sl:ASIN,SKU,LABEL初始化
var selectResult = db.select(
	"MASTER",
	"searchASL",
	{}
).getArray();
selectResult.debug("searchASL");
var resultHTML3 = "<option value='{asin}'class='asin' >{asin}</option>";
ret.runat("#asinselect").remove("option .asin").append(resultHTML3).withdata(selectResult);
var resultHTML4 = "<option value='{sku}'class='sku' >{sku}</option>";
ret.runat("#skuselect").remove("option .sku").append(resultHTML4).withdata(selectResult);

var resultHTML5 = "<span style='display: none;'>{label}</span>"
ret.runat("#label").append(resultHTML5).withdata(selectResult);
 
	return ret.eval(s1).eval(s2);

};