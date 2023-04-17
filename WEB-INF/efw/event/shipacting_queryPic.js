var shipacting_queryPic = {};
shipacting_queryPic.name = "代行発送情報発送商品";
shipacting_queryPic.paramsFormat = {
	"#select_sendProduct" : null
};
 
shipacting_queryPic.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };
	var sendProduct = params["#select_sendProduct"];


	// 查询発送商品图片
	var select = db.select(
		"SHIPACTING",
		"queryshipactingmaterByNo",
		{	
			"no":parseInt( sendProduct),
			"shopid": getShopId()
		}
	).getSingle();

	if(select["pic"] !=null && select["pic"] != ''&& select["pic"] != undefined){
	// 商品写真
	ret.eval("$('#img_pic').attr('src','"+select["pic"]+"');");
	}else{
	ret.eval("$('#img_pic').attr('src','img/wz.png');");
	}

	return ret;
};