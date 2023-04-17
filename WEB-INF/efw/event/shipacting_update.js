var shipacting_update = {};
shipacting_update.name = "代行発送情報更新ボタン押下";
shipacting_update.paramsFormat = {
	"no" : null
};
 
shipacting_update.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var no = params["no"];

	var shopid = getShopId();

	var selectResultObj = db.select(
		"SHIPACTING",
		"queryshipactingByNo1",
		{
			"no" : no,
			"shopid": shopid
		}
	).getSingle();
 

	ret.runat("#shipacting_inputdialog").withdata(
		{
			// 管理番号：
			"#td_no":selectResultObj["no"],
			// 発送商品：
			"#select_sendProduct":selectResultObj["kno"],
			// 数量：
			"#text_num":selectResultObj["num"],
			// 郵便番号：
			"#text_postal":selectResultObj["postal"],
			// 住所①：
			"#text_address1":selectResultObj["address1"],
			// 住所②：
			"#text_address2":selectResultObj["address2"],		
			// 住所③：
			"#text_address3":selectResultObj["address3"],
			// 名前：
			"#text_name":selectResultObj["name"],
			// 電話番号：
			"#text_tel":selectResultObj["tel"],
			// 備考：
			"#text_remarks":selectResultObj["remarks"],
			// 発送方法：
			"#select_sendMethod":selectResultObj["sendmethod"],
			// 発送費用-jp：
			"#text_jpMoney":selectResultObj["jpmoney"],
			// 発送費用-cn：
			"#text_cnMoney":selectResultObj["cnmoney"],
			// 追跡番号：
			"#text_track":selectResultObj["track"],

		}
	);

	if(selectResultObj["pic"] !=null && selectResultObj["pic"] != ''&& selectResultObj["pic"] != undefined){
		// 商品写真
		ret.eval("$('#img_pic').attr('src','"+selectResultObj["pic"]+"');");
	}else{
		ret.eval("$('#img_pic').attr('src','img/wz.png');");
	}	

	// 権限あり
	 var state = getAuthorityInfo(shopid, 'btn-1002_01');

	 if(state){
		 // DIV　表示
		ret.eval("$('.bortop').css('display','table-cell');");
		ret.eval("$('.borbom').css('display','table-cell');");
		// ボタン　表示
		ret.eval("$('.btn-1002_01').css('display','block');");

	 }else{
		// DIV　表示
		ret.eval("$('.bortop').css('display','none');");
		ret.eval("$('.borbom').css('display','none');");
		// ボタン　表示
		ret.eval("$('.btn-1002_01').css('display','none');");
	 }

	ret.eval("shipacting_inputdialog.dialog('open');");

	return ret;
};