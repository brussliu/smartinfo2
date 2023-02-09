var masterinfo_update = {};
masterinfo_update.name = "インポート画面更新";
masterinfo_update.paramsFormat = {

	"oldasin": null,
	"oldsku": null,

	"type": null,
	"no": null,
	"preproduct": null,
	"sub1": null,
	"sub2": null,

	"#flg": null,
	"#asin": null,
	"#sku": null,
	"#label": null,

	"#newproducttype": null,
	"#newproducttype2": null,

	"#newproductno": null,
	"#newproductno2": null,
	"#fba": null,

	"#pre": null,
	"#sub1": null,
	"#sub2": null,

	"#price1": null,
	"#price2": null,
	"#price3": null,

	"#productname": null,
	"flg": null,

};
var SHOP_ID = session.get("SHOP_ID");

function isNULL(value){
	if(value==null){
		return "";
	}
	return value;
}
 
masterinfo_update.fire = function (params) {

	var ret = new Result();
	var oldasin= params["oldasin"];
	var oldsku= params["oldsku"];
	var oldtype= params["type"];
	var oldno= params["no"];
	var oldpreproduct= params["preproduct"];
	var oldsub1= params["sub1"];
	var oldsub2= params["sub2"];

	 


	var asin= params["#asin"];
	var sku= params["#sku"];
	var label = params["#label"];

	var newproducttype = params["#newproducttype"];
	var newproducttype2 = params["#newproducttype2"];
	var type = "";
	if (newproducttype2 == "") {
		type = newproducttype;
	} else {
		type = newproducttype2;
	}
	var newproductno = params["#newproductno"];
	var newproductno2 = params["#newproductno2"];
	var no = "";

	if (newproductno2 == "") {
		no = newproductno;
	} else {
		no = newproductno2;
	}
	var fba = params["#fba"];

	var preproduct = params["#pre"];
	var sub1 = params["#sub1"];
	var sub2 = params["#sub2"];

	var price1 = params["#price1"];
	var price2 = params["#price2"];
	var price3 = params["#price3"];

	var productname = params["#productname"];
	var flg = params["flg"];
 
	// 暂定为1时，更新dialog数据
	if (flg == "1") {

			// sl:ASIN,SKU,LABEL初始化
			var selectResult = db.select(
				"MASTER",
				"searchASL",
				{}
			).getArray();
			selectResult.debug("---------------searchASL");
			var resultHTML3 = "<select style='width: 150px;height: 30px;' id='asinselect'>"+
			"<option value=''></option></select> ";
			ret.runat("#asin").remove("*").append(resultHTML3);


			 
	
		// 暂定为1时，查询该条数据
		var selectResult1 = db.select(
			"MASTER",
			"searchmasterinfoflg1",
			{
				shopid: SHOP_ID,
				oldtype:oldtype,
				oldno: oldno,
				oldpreproduct: oldpreproduct,
				oldsub1: oldsub1,
				oldsub2: oldsub2
				
			}
		).getArray();

		selectResult1.debug("=============searchmasterinfoflg1");

		var label = "$('#label').html('"+isNULL(selectResult1[0].label)+"'); ";
		ret.eval(label);
		label.debug("=============label");
	} else if (flg == "0") {
		// 暂定为0时，更新dialog数据
		var selectResult1 = db.select(
			"MASTER",
			"searchmasterinfoflg0",
			{
				shopid: SHOP_ID,
				oldasin:oldasin,
				oldsku: oldsku,
			}
		).getArray();

		
		selectResult1.debug("searchmasterinfoflg0");
 	// 存放更新前asin，sku数据
		var oldasins = "$('#asin').data('oldasins','"+selectResult1[0].asin+"'); ";
		ret.eval(oldasins);
		var oldasku = "$('#sku').data('oldskus','"+selectResult1[0].sku+"'); ";
		ret.eval(oldasku);

		//为asin,sku,label赋值 
		var asin = "$('#asin').html('"+selectResult1[0].asin+"'); ";
		ret.eval(asin);
		asin.debug("=============asin");
		var sku = "$('#sku').html('"+selectResult1[0].sku+"'); ";
		ret.eval(sku);
		var label = "$('#label').html('"+selectResult1[0].label+"'); ";
		ret.eval(label);
 

	}
	// 存放更新前商品分类，管理番号，亲子区分，分类一，分类二数据
	var oldtype = "$('#newproducttype2').data('oldtype','"+selectResult1[0].type+"'); ";
	ret.eval(oldtype);
	var oldno = "$('#newproductno2').data('oldno','"+selectResult1[0].no+"'); ";
	ret.eval(oldno);
	var oldpreproduct = "$('#preproduct').data('oldpreproduct','"+selectResult1[0].preproduct+"'); ";
	ret.eval(oldpreproduct);
	var oldsub1 = "$('#sub1').data('oldsub1','"+selectResult1[0].sub1+"'); ";
	ret.eval(oldsub1);
	var oldsub2 = "$('#sub2').data('oldsub2','"+selectResult1[0].sub2+"'); ";
	ret.eval(oldsub2);

	var oldtype1 = "console.log($('#newproducttype2').data('oldtype')) ";
	ret.eval(oldtype1);

	// 为dialog赋值
	var newproducttype = "$('#newproducttype').val('"+selectResult1[0].type+"'); ";
	ret.eval(newproducttype);
	ret.debug("=============ret");

	var newproducttype2 = "$('#newproducttype2').val();";
	ret.eval(newproducttype2);
	newproducttype2.debug("=============newproducttype2");

	var newproductno = "$('#newproductno').val('"+selectResult1[0].no+"'); ";
	ret.eval(newproductno);

	var newproductno2 = "$('#newproductno2').empty();";
	ret.eval(newproductno2);
	newproductno2.debug("=============newproductno2");

	var preproduct = "$('#preproduct').val('"+selectResult1[0].preproduct+"');";
	ret.eval(preproduct);
	preproduct.debug("=============preproduct");

	var fba = "$('#fba').val('"+selectResult1[0].fba+"'); ";
	ret.eval(fba);
	fba.debug("=============fba");

	var sub1 = "$('#sub1').val('"+isNULL(selectResult1[0].sub1)+"'); ";
	ret.eval(sub1);
	
	var sub2 = "$('#sub2').val('"+isNULL(selectResult1[0].sub2)+"'); ";
	ret.eval(sub2);
	sub2.debug("=============sub2");

	var price1 = "$('#price1').val('"+Number(selectResult1[0].price1)+"'); ";
	ret.eval(price1);
	price1.debug("=============price1");

	var price2 = "$('#price2').val('"+Number(selectResult1[0].price2) +"'); ";
	ret.eval(price2);
	price2.debug("=============price2");

	var price3 = "$('#price3').val('"+Number(selectResult1[0].price3)+"'); ";
	ret.eval(price3);
	price3.debug("=============price3");

	var productname = "$('#productname').val('"+selectResult1[0].name+"'); ";
	ret.eval(productname);
	productname.debug("=============productname");
 



	// var script = "searchmasterinfo();";
	// ret.eval(script);
	// 画面へ結果を返す
	return ret;

};
