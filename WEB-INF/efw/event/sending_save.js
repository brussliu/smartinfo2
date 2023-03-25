var sending_save = {};
sending_save.name = "発送情報新規ボタン押下";
sending_save.paramsFormat = {
	"#opt": null,
	"#select_type": null,
	"#select_send": null,
	"#text_no": null,
	"#select_product": null,
	"#select_sub1": null,
	"#select_sub2": null,
	"#text_productname": null,
	"#text_num": null,
	"#text_money": null,
	"#text_mail": null,
	"#text_address1": null,
	"#text_address2": null,
	"#text_address3": null,
	"#text_name": null,
	"#text_phone": null,
	"#text_remark": null,
	"#orderno": null
	
};

sending_save.fire = function (params) {
	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var opt = params["#opt"];

	var type = params["#select_type"];
	var send = params["#select_send"];
	var no = params["#text_no"];

	var product = params["#select_product"];
	var sub1 = params["#select_sub1"];
	var sub2 = params["#select_sub2"];
	var productname = params["#text_productname"];

	var num = parseInt( params["#text_num"]);
	var money = params["#text_money"];
	var mail = params["#text_mail"];
	var address1 = params["#text_address1"];	
	
	var address2 = params["#text_address2"];
	var address3 = params["#text_address3"];
	var name = params["#text_name"];
	var phone = params["#text_phone"];
	var remark = params["#text_remark"];

 
	if(opt == 'new'){


		var insertResult = db.change(
			"SENDING",
			"insertsending",
			{
				type: type,
				send: send,
				no: no,
				product: product,
				sub1: sub1,

				sub2: sub2,
				productname: productname,
				num: num,
			 
				mail: mail,

				address1: address1,
				address2: address2,
				address3: address3,
				name: name,
				phone: phone,

				remark: remark,
				shopid: getShopId()
			}
		);
	}

	if(opt == 'update'){

		var orderno = parseInt( params["#orderno"]);

		var updateResult = db.change(
			"SENDING",
			"updatesending",
			{
				orderno:orderno,
				type: type,
				send: send,
				no: no,
				product: product,
				sub1: sub1,

				sub2: sub2,
				productname: productname,
				num: num,
			 
				mail: mail,

				address1: address1,
				address2: address2,
				address3: address3,
				name: name,
				phone: phone,

				remark: remark,
				shopid: getShopId()
			}
		);
	}


	ret.eval('sending_inputdialog.dialog("close");')
	ret.eval('init();')
	return ret;
};