var sending_update = {};
sending_update.name = "発送情報更新ボタン押下";
sending_update.paramsFormat = {
	"orderno": null
};

sending_update.fire = function (params) {
	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var orderno =parseInt(  params["orderno"]);


	var selectResult = db.select(
		"SENDING",
		"searchbyorderno",
		{
			"orderno":orderno,
			"shopid": getShopId(),
		}
	).getSingle();

	if (selectResult["prefectures"] != null && selectResult["prefectures"] != '') {

		ret.runat("#sending_inputdialog")
			.withdata(
				{
					"#select_type": selectResult["type"],
					"#select_send": selectResult["send"],
					"#text_no": selectResult["no"],

					"#select_product": selectResult["productno"],
					"#select_sub1": selectResult["sub1"],
					"#select_sub2": selectResult["sub2"],
					"#text_productname": selectResult["productno"]+' ' +selectResult["sub1"]+' '+selectResult["sub2"],

					"#text_num": selectResult["num"],
					"#text_money": selectResult["money"] + "円",

					"#text_mail": selectResult["mail"],
					"#text_address1": selectResult["prefectures"],
					"#text_address2": selectResult["city"],
					"#text_address3":  selectResult["address1"]+' ' +selectResult["address2"]+' '+selectResult["address3"],

					"#text_name": selectResult["name"],
					"#text_phone": selectResult["phone"],
					"#text_remark": selectResult["remark"]
				 
				}
			);

	} else {
		ret.runat("#sending_inputdialog")
			.withdata(
				{
					"#select_type": selectResult["type"],
					"#select_send": selectResult["send"],
					"#text_no": selectResult["no"],

					"#select_product": selectResult["productno"],
					"#select_sub1": selectResult["sub1"],
					"#select_sub2": selectResult["sub2"],
					"#text_productname": selectResult["productno"]+' ' +selectResult["sub1"]+' '+selectResult["sub2"],

					"#text_num": selectResult["num"],
					"#text_money": selectResult["money"] + "円",

					"#text_mail": selectResult["mail"],
					"#text_address1": '',
					"#text_address2": '',
					"#text_address3":  selectResult["addressall"],

					"#text_name": selectResult["name"],
					"#text_phone": selectResult["phone"],
					"#text_remark": selectResult["remark"]
				 
				}
			);

	}

	ret.eval('sending_inputdialog.dialog("open");')
	return ret;
};