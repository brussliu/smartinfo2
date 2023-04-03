var sending_update = {};
sending_update.name = "発送情報更新ボタン押下";
sending_update.paramsFormat = {
	"orderno": null
};

sending_update.fire = function (params) {
	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var orderno = parseInt(params["orderno"]);

	var selectResult = db.select(
		"SENDING",
		"searchbyorderno",
		{
			"orderno":orderno,
			"shopid": getShopId(),
		}
	).getSingle();

	ret.runat("#select_sub1").remove(".option");
	ret.runat("#select_sub2").remove(".option");

	ret.runat("#sending_inputdialog").withdata(
		{
			"#select_type": selectResult["type"],
			"#select_send": selectResult["send"],
			"#text_no": selectResult["no"],

			// "#select_product": selectResult["productno"] == null ? '--' : selectResult["productno"],
			// "#select_sub1": selectResult["sub1"] == null ? '--' : selectResult["sub1"],
			// "#select_sub2": selectResult["sub2"] == null ? '--' : selectResult["sub2"],
			"#text_productname": selectResult["productname"],

			"#text_num": selectResult["num"],

			"#text_mail": selectResult["mail"],
			"#text_prefecture": selectResult["prefectures"],
			"#text_city": selectResult["city"],
			"#text_address1": selectResult["address1"],
			"#text_address2": selectResult["address2"],
			"#text_address3": selectResult["address3"],
			"#td_addressall":  selectResult["addressall"],
			
			"#text_name": selectResult["name"],
			"#text_phone": selectResult["phone"],
			"#text_remark": selectResult["remark"],
			"#text_sendcontent": selectResult["sendcontent"]
			
		}
	);

	//　分類１、分類２の内容を検索する

	// 商品管理番号
	var product = selectResult["productno"];
	// 分類１
	var sub1 = selectResult["sub1"];
	// 分類２
	var sub2 = selectResult["sub2"];

	if(product != null && product != ''){

		// ret.runat("#sending_inputdialog").withdata(
		// 	{
		// 		"#select_product": selectResult["productno"],
		// 	}
		// );
		ret.eval("$('#select_product').val('" + product + "');");

		var selectResult1 = db.select(
			"SENDING",
			"searchsub1",
			{
				"product":product,
				"shopid": getShopId(),
			}
		).getArray();

		if(selectResult1.length > 0){

			var resultHTML1 = "<option value='{sub1}'class='option' >{sub1}</option>";
			ret.runat("#select_sub1").append(resultHTML1).withdata(selectResult1);

		}

		var sub1_select = sub1 == null ? '‐‐‐‐' : sub1;
		ret.eval("$('#select_sub1').val('" + sub1_select + "');");
			

		var selectResult2 = db.select(
			"SENDING",
			"searchsub2Bysub1",
			{
				"product":product,
				"sub1":sub1,
				"shopid": getShopId(),
			}
		).getArray();

		if(selectResult2.length > 0){

			var resultHTML2 = "<option value='{sub2}'class='option' >{sub2}</option>";
			ret.runat("#select_sub2").append(resultHTML2).withdata(selectResult2);

		}

		var sub2_select = sub2 == null ? '‐‐‐‐' : sub2;
		ret.eval("$('#select_sub2').val('" + sub2_select + "');");


	}else{

		ret.eval("$('#select_product').get(0).selectedIndex = 0;");
	}



	

	ret.eval('sending_inputdialog.dialog("open");');

	return ret;
};