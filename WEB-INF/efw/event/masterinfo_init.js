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

var resultHTML = "<option value=''></option><option value='{value}' >{text}</option>";

ret.runat("#productno").remove("option").append(resultHTML).withdata(selectResult);


// sl:商品分类初始化
var selectResult = db.select(
	"MASTER",
	"searchproducttype",
	{
		"shopId":SHOP_ID
	}
).getArray();
selectResult.debug("zzzzzzzzzzzzzzzz");
var resultHTML = "<input type='checkbox' checked value='{value}'>&nbsp;&nbsp;{text}";

ret.runat("#producttype").remove("*").append(resultHTML).withdata(selectResult);

// sl:商品信息初始化
var s1="$('.c_detail_header').hide();";
var s2="$('.c_detail_content').hide();";


// sl:检索结果初始化

	return ret.eval(s1).eval(s2);




};



