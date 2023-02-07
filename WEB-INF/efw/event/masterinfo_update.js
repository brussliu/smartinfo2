var masterinfo_update={};
masterinfo_update.name="インポート画面更新";
masterinfo_update.paramsFormat={
	"flg":null,
    "asin":null,
    "sku":null,

	"#asinspan":null,
    "#skuspan":null,
	"#label":null,

	"#newproducttype":null,
	"#newproducttype2":null,

	"#newproductno":null,
	"#newproductno2":null,
	"#fba":null,

	"#pre":null,
	"#sub1":null,
	"#sub2":null,

	"#price1":null,
	"#price2":null,
	"#price3":null,

	"#productname":null,
	"oldpre":null,
    "oldsub1":null,
    "oldsub2":null,
	"oldproductno":null,

};
var SHOP_ID = session.get("SHOP_ID");
 

masterinfo_update.fire=function(params){
	
	var ret = new Result();
    var asin;
    var sku;
	var flg = params["flg"];
    if(flg=="1"){
        asin = params["asin"];
        sku =  params["sku"];
    }else if(flg=="0"){
        asin = params["#asinspan"];
        sku =  params["#skuspan"];
    }
	
 
	var label = params["#label"];

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

	if(newproductno2==""){
		no=newproductno;
	}else{
		no=newproductno2;
	}
	var fba = params["#fba"];

	var preproduct = params["#pre"];
	var sub1 = params["#sub1"];
	var sub2 = params["#sub2"];

	var price1 = params["#price1"];
	var price2 = params["#price2"];
	var price3 = params["#price3"];
	
	var productname = params["#productname"];

	var oldpre = params["oldpre"];
	var oldsub1 = params["oldsub1"];
	var oldsub2 = params["oldsub2"];
	var oldproductno = params["oldproductno"];
 if(flg=="1"){
    var selectResult = db.change(
		"MASTER",
		"udatemasterinfoflg1",
		{
		
		 
			asin : asin,
			sku : sku,

			label : label,
			type : type,
			no : no,

			fba : fba,
			preproduct : preproduct,
			sub1 : sub1,

			sub2 : sub2,
			productname : productname,
		    shopid : SHOP_ID,

			oldpre:oldpre ,
			oldsub1 : oldsub1,
			oldsub2:oldsub2 ,
			oldproductno : oldproductno
		}
	);

	selectResult.debug("udatemasterinfoflg1");
 }else if(flg=="0"){
    var selectResult = db.change(
		"MASTER",
		"udatemasterinfoflg0",
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
			productname : productname,
		    shopid : SHOP_ID
		}
	); 
	selectResult.debug("udatemasterinfoflg0");
 }
 
 
	
    if(preproduct=="亲商品"){
    var selectResult2 = db.change(
		"MASTER",
		"udatemasterinfosub",
		{
			no : no,
			preproduct : preproduct,
 
			price1 : price1,
			price2 : price2,

			price3 : price3,
		    shopid : SHOP_ID
		}
	);}
 
 
 
	var script = "location.reload ();";
	// 画面へ結果を返す
	return ret.eval(script);

};
