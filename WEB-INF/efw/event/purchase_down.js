var purchase_down = {};
purchase_down.name = "仕入";
purchase_down.paramsFormat = {
	"purchaseno": null,
	"filename": null,
	"suffix": null

};

purchase_down.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var purchaseno = params["purchaseno"];
	var filename = params["filename"];
	var suffix = params["suffix"];

	var selectResult1 = db.select
		("PURCHASE",
			"selectpurchase_file",
			{
				purchaseno: purchaseno,
				filename: filename,
				suffix: suffix,
				shopid: getShopId()
			}
		).getSingle();

	var files = getShopId() + "/purchasefile/" + purchaseno + "/"+ selectResult1["files"];

	ret.attach(files).saveas(filename + "." + suffix);
	return ret;

};
