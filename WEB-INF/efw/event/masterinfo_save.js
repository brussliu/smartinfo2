var masterinfo_save={};
masterinfo_save.name="インポート画面新规";
masterinfo_save.paramsFormat={
	"flg":null,
	"#asin":null,
	"#sku":null,

	"#label":null,
	"#newproducttype":null,
	"#newproducttype2":null,

	"#newproductno":null,
	"#newproductno2":null,
	"#fba":null,

	"#preproduct":null,
	"#sub1":null,
	"#sub2":null,

	"#price1":null,
	"#price2":null,
	"#price3":null,

	"#productname":null,



};
var SHOP_ID = session.get("SHOP_ID");
 
function change(params){
	if(params=='-'){
		params='';
	}
	return params;
}
masterinfo_save.fire=function(params){
	
	var ret = new Result();

	var flg = params["flg"];
	var asin = change(params["#asin"]);
	var sku =  change(params["#sku"]);

	var label = change(params["#label"]);

	var newproducttype = params["#newproducttype"];
	var newproducttype2 = params["#newproducttype2"];
	var type="";
	if(newproducttype2==""){
		type=newproducttype;
	}else{
		type=newproducttype2;
	}
	var newproductno = params["#newproductno"];
	var newproductno2 = params["#newproductno2"];
	var no="";
	if(newproducttype2==""){
		no=newproductno;
	}else{
		no=newproductno2;
	}
	var fba = params["#fba"];

	var preproduct = params["#preproduct"];
	var sub1 = params["#sub1"];
	var sub2 = params["#sub2"];

	var price1 = params["#price1"];
	var price2 = params["#price2"];
	var price3 = params["#price3"];
	
	var productname = params["#productname"];

 
 
 
	var selectResult = db.change(
		"MASTER",
		"savemasterinfo",
		{
		
			flg : flg,
			asin : asin,
			sku : sku,

			label : label,
			type : type,
			no : no,

			fba : fba,
			preproduct : preproduct,
			sub1 : sub1,

			sub2 : sub2,
			price1 : price1,
			price2 : price2,

			price3 : price3,
			productname : productname,
		    shopid : SHOP_ID
		}
	);

 
	selectResult.debug("save");

 
	var script = "location.reload ();";
	// 画面へ結果を返す
	return ret.eval(script);

};
