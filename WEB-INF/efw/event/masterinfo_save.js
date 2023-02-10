var masterinfo_save = {};
masterinfo_save.name = "インポート画面新规";
masterinfo_save.paramsFormat = {
	"#asin": null,
	"#sku": null,

	"#label": null,
	"#newproducttype": null,
	"#newproducttype2": null,

	"#newproductno": null,
	"#newproductno2": null,
	"#fba": null,

	"#preproduct": null,
	"#sub1": null,
	"#sub2": null,

	"#price1": null,
	"#price2": null,
	"#price3": null,

	"#productname": null,
	"#opt": null,

	"oldasins": null,
	"oldskus": null,

	"oldtype": null,
	"oldno": null,
	"oldpreproduct": null,

	"oldsub1": null,
	"oldsub2": null,
	"flg" : null,

};
var SHOP_ID = session.get("SHOP_ID");

function change(params) {
	if (params == '-') {
		params = '';
	}
	return params;
}
masterinfo_save.fire = function (params) {

	var ret = new Result();

	var flg = params["flg"];
	var asin = change(params["#asin"]);
	var sku = change(params["#sku"]);

	var label = change(params["#label"]);

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

	var preproduct = params["#preproduct"];
	var sub1 = params["#sub1"];
	var sub2 = params["#sub2"];

	var price1 = params["#price1"];
	var price2 = params["#price2"];
	var price3 = params["#price3"];

	var productname = params["#productname"];
	var opt = params["#opt"];

	var oldasins = params["oldasins"];
	var oldskus = params["oldskus"];

	var oldtype = params["oldtype"];
	var oldno = params["oldno"];
	var oldpreproduct = params["oldpreproduct"];

	var oldsub1 = params["oldsub1"];
	var oldsub2 = params["oldsub2"];
	// 判断新规or更新
	if (opt == "new") {

		// 亲子区分为親商品时新规
		if (preproduct == '親商品') {
			// sl:新规-親商品
			var selectResult = db.change(
				"MASTER",
				"savemasterinfopre",
				{
					type: type,
					no: no,

					preproduct: preproduct,
					productname: productname,
					shopid: SHOP_ID
				}
			);
			selectResult.debug("-----------------savemasterinfopre");
		} else if (preproduct == '子商品') {	// 亲子区分为子商品时新规
			// sl:新规-子商品
			var selectResult = db.change(
				"MASTER",
				"savemasterinfosub",
				{
					type: type,
					no: no,
					fba: fba,

					preproduct: preproduct,
					sub1: sub1,
					sub2: sub2,

					price1: price1,
					price2: price2,
					price3: price3,

					productname: productname,
					shopid: SHOP_ID
				}
			);
			selectResult.debug("-----------------savemasterinfosub");
		}
	} else if (opt == "update") {
		// 当暂定为1时，更新
		if (flg == '1') {

			if (preproduct == '親商品') {
				// 当暂定为1,亲子区分为親商品时，更新
				var selectResult = db.change(
					"MASTER",
					"udatemasterinfoflg1pre",
					{
						asin: asin,
						sku: sku,
						label: label,

						type: type,
						no: no,
						fba: fba,

						preproduct: preproduct,
						productname: productname,
						shopid: SHOP_ID,

						oldno: oldno,
						oldtype: oldtype,
						oldpreproduct: oldpreproduct,
						// oldsub1: oldsub1,
						// oldsub2: oldsub2
					}
				);
				selectResult.debug("-----------------udatemasterinfoflg1pre");
				// 親商品时，更新子商品价格
				var selectResult3 = db.change(
					"MASTER",
					"udatemasterinfosubprice",
					{
						no: oldno,
						price1: price1,
						price2: price2,
						price3: price3,
						shopid: SHOP_ID
					}
				);
				selectResult3.debug("-----------------udatemasterinfosubprice");
			} else if (preproduct == '子商品') {
				// 当暂定为1,亲子区分为子商品时，更新
				var selectResult = db.change(
					"MASTER",
					"udatemasterinfoflg1sub",
					{
						asin: asin,
						sku: sku,
						label: label,

						type: type,
						no: no,
						fba: fba,

						preproduct: preproduct,
						sub1: sub1,
						sub2: sub2,

						price1: price1,
						price2: price2,
						price3: price3,

						productname: productname,
						shopid: SHOP_ID,

						oldno: oldno,
						oldtype: oldtype,
						oldpreproduct: oldpreproduct,
						oldsub1: oldsub1,
						oldsub2: oldsub2
					}
				);

				selectResult.debug("-----------------udatemasterinfoflg1sub");
			}



		} else if (flg == "0") {

			if (preproduct == '親商品') {
				// 当暂定为0，亲子区分为親商品时,更新
				var selectResult = db.change(
					"MASTER",
					"udatemasterinfoflg0pre",
					{
						type: type,
						no: no,
						fba: fba,
						preproduct: preproduct,
						productname: productname,
						shopid: SHOP_ID,
						oldasin: oldasins,
						oldsku: oldskus,
					}
				);

				selectResult.debug("-----------------udatemasterinfoflg0pre");
				// 親商品时，更新子商品价格
				var selectResult3 = db.change(
					"MASTER",
					"udatemasterinfosubprice",
					{
						no: oldno,
						price1: price1,
						price2: price2,
						price3: price3,
						shopid: SHOP_ID
					}
				);

				selectResult3.debug("-----------------udatemasterinfosubprice");

			} else if (preproduct == '子商品') {

				// 当暂定为0，亲子区分为子商品时,更新
				var selectResult = db.change(
					"MASTER",
					"udatemasterinfoflg0sub",
					{
						type: type,
						no: no,
						fba: fba,

						preproduct: preproduct,
						sub1: sub1,
						sub2: sub2,

						price1: price1,
						price2: price2,
						price3: price3,

						productname: productname,
						shopid: SHOP_ID,
						oldasin: oldasins,
						oldsku: oldskus
					}
				);
				selectResult.debug("-----------------udatemasterinfoflg0sub");
			}
		}
	}





var script = "searchmasterinfo();";
// var script = "location.reload ();";
// var script1 = "searchmasterinfo();";
	// 画面へ結果を返す
	return ret.eval(script);

};
