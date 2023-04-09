var sending_save = {};
sending_save.name = "発送情報新規ボタン押下";
sending_save.paramsFormat = {
	// 操作区分
	"#opt": null,
	// 区分
	"#select_type": null,
	// 発送方法
	"#select_send": null,
	// 注文番号
	"#text_no": null,
	// 商品管理番号
	"#select_product": null,
	// 分類１
	"#select_sub1": null,
	// 分類２
	"#select_sub2": null,
	// 商品名称
	"#text_productname": null,
	// 数量
	"#text_num": null,
	// 金額
	// "#text_money": null,
	// 郵便番号
	"#text_mail": null,
	// 都道府県
	"#text_prefecture": null,
	// 市区町村
	"#text_city": null,
	// 住所１
	"#text_address1": null,
	// 住所２
	"#text_address2": null,
	// 住所３
	"#text_address3": null,
	// 宛先
	"#text_name": null,
	// 電話番号
	"#text_phone": null,
	// 備考
	"#text_remark": null,
	// 発送内容
	"#text_sendcontent": null,
	// キー
	"orderno": null
	
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
 
	var mail = params["#text_mail"];

	var prefecture = params["#text_prefecture"];	
	var city = params["#text_city"];
	var address1 = params["#text_address1"];	
	var address2 = params["#text_address2"];
	var address3 = params["#text_address3"];
	var name = params["#text_name"];
	var phone = params["#text_phone"];
	var remark = params["#text_remark"];
	var sendcontent = params["#text_sendcontent"];

	var flg = '1';
	if(send == null || send == ''){
		flg = '0';
	}
	if(prefecture == null || prefecture == ''){
		flg = '0';
	}
	if(city == null || city == ''){
		flg = '0';
	}
	if(address1 == null || address1 == ''){
		flg = '0';
	}
	if(sendcontent == null || sendcontent == ''){
		flg = '0';
	}

	var addressall = 	(mail == null ? '' : mail) + ' ' + 
						(prefecture == null ? '' : prefecture) + ' ' + 
						(city == null ? '' : city) + ' ' + 
						(address1 == null ? '' : address1) + ' ' + 
						(address2 == null ? '' : address2) + ' ' + 
						(address3 == null ? '' : address3);

	addressall.debug("==============================================================");

	if(sub1 == '‐‐‐‐'){
		sub1 = null;
	}
	if(sub2 == '‐‐‐‐'){
		sub2 = null;
	}

	// 新規
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

				prefecture: prefecture,
				city: city,
				address1: address1,
				address2: address2,
				address3: address3,
				name: name,
				phone: phone,

				flg: flg,
				addressall: addressall,

				remark: remark,
				sendcontent: sendcontent,
				shopid: getShopId()
			}
		);
	}

	if(opt == 'update'){

		var orderno = parseInt(params["orderno"]);

		
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

				prefecture: prefecture,
				city: city,
				address1: address1,
				address2: address2,
				address3: address3,
				name: name,
				phone: phone,

				flg: flg,
				remark: remark,
				sendcontent: sendcontent,
				shopid: getShopId()
			}
		);


	}


	ret.eval('sending_inputdialog.dialog("close");');

	ret.eval('init();');
	ret.eval('choice("0");');
	
	return ret;
};