var purchase_save = {};
purchase_save.name = "仕入情報管理画面保存";
purchase_save.paramsFormat = {
	"#td_no":null,
	"#text_purchase":null,
	"#opt_ship":null,
	
	"#date_entrydate":null,
	"#date_forwarddate1":null,
	"#date_forwarddate2":null,
	
	"#date_completiondate":null,

	"#number_productamountRMB":null,
	"#opt_monetaryunit1":null,
	"#number_productamountRY":null,

	"#number_shipamountRMB":null,
	"#opt_monetaryunit2":null,
	"#number_shipamountRY":null,

	"#number_faxamountRMB":null,
	"#opt_monetaryunit3":null,
	"#number_faxamountRY":null,

	"#number_rate":null,
	"#text_totalRMB":null,
	"#text_totalRY":null,

	"#file_ProContent":null,
	"#text_track":null


};

purchase_save.fire = function (params) {

	var ret = new Result();
	// セッションチェック
	sessionCheck(ret);

	var no = params["#td_no"];
	var purchase = params["#text_purchase"];
	var ship = params["#opt_ship"];
	
	var entrydate = params["#date_entrydate"];
	var forwarddate1 = params["#date_forwarddate1"];
	var forwarddate2 = params["#date_forwarddate2"];

	var completiondate = params["#date_completiondate"];

	var productamountRMB = params["#number_productamountRMB"];
	var monetaryunit1 = params["#opt_monetaryunit1"];
	var productamountRY = params["#number_productamountRY"];
		unit(monetaryunit1,productamountRMB,productamountRY);
	var shipamountRMB = params["#number_shipamountRMB"];
	var monetaryunit2 = params["#opt_monetaryunit2"];
	var shipamountRY = params["#number_shipamountRY"];
	unit(monetaryunit2,shipamountRMB,shipamountRY);
	var faxamountRMB = params["#number_faxamountRMB"];
	var monetaryunit3 = params["#opt_monetaryunit3"];
	var faxamountRY = params["#number_faxamountRY"];
	unit(monetaryunit3,faxamountRMB,faxamountRY);
	var rate = params["#number_rate"];
	var totalRMB = params["#text_totalRMB"];

	var totalRY = params["#text_totalRY"];
	var ProContent = params["#file_ProContent"];
	var track = params["#text_track"];


	var selectResult = db.change(
		"PURCHASE",
		"savepurchase",
		{
			no: new Date().format("yyyyMMdd-HHmmss"),
			purchase: purchase,
			ship: ship,

			entrydate: entrydate,
			forwarddate1: forwarddate1,
			forwarddate2: forwarddate2,
			
			completiondate: completiondate,

			productamountRMB: productamountRMB,
			productamountRY: productamountRY,

			shipamountRMB: shipamountRMB,
			shipamountRY: shipamountRY,

			faxamountRMB: faxamountRMB,
			faxamountRY: faxamountRY,

			rate: rate,
			totalRMB: totalRMB,
			totalRY: totalRY,
			track: track,
			shopid: getShopId()
		}
	);

	selectResult.debug('------savepurchase----')
	ret.eval("purchase_detail_inputdialog.dialog('close');");
	ret.eval("init();");
	// 画面へ結果を返す
	return ret;

};

function unit(unit,cny,jpy){
	var zh;
	if(unit== "CNY"){
		zh=cny;
		cny=jpy;
		jpy=zh;
	}
}