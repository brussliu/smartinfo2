var shipacting_choice = {};
shipacting_choice.name = "代行発送情報管理画面按钮初始化";
shipacting_choice.paramsFormat = {
	"opt":null
};
 
shipacting_choice.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };
	var shopid = getShopId();
	var opt = params["opt"];
	 

	// var bnew = getAuthorityInfo(shopid ,'1001_01' );
	// var bupdate = getAuthorityInfo(shopid ,'1001_02' );
	// var bdel = getAuthorityInfo(shopid ,'1001_03' );
	if(opt == 'update'){ 
		var bupdate = getAuthorityInfo(shopid ,'1001_04' );

		if(bupdate){
			ret.eval("$('#btn_update').attr('disabled', false);");
		}else{
			ret.eval("$('#btn_update').attr('disabled', true);");
		} 
	}
	if(opt == 'pay'){ 
		var bpay = getAuthorityInfo(shopid ,'1001_04' );

		if(bpay){
			ret.eval("$('#btn_pay').attr('disabled', false);");
		}else{
			ret.eval("$('#btn_pay').attr('disabled', true);");
		} 
	}
 
	return ret;
};