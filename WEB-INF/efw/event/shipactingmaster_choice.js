var shipactingmaster_choice = {};
shipactingmaster_choice.name = "代行発送商品管理画面按钮初始化";
shipactingmaster_choice.paramsFormat = {
	//"val":null
};
 
shipactingmaster_choice.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };
	var shopid = getShopId();
	//var val = params["val"];
	 
	var bnew = getAuthorityInfo(shopid ,'0901_01' );
	var bupdate = getAuthorityInfo(shopid ,'0901_02' );
	var bdel = getAuthorityInfo(shopid ,'0901_03' );
	 
	// if(val == 'init'){
	// 	if(bnew){
	// 	    ret.eval("$('#btn_new').attr('disabled', false);");
	// 	}else{
	// 	    ret.eval("$('#btn_new').attr('disabled', true);");
	// 	}
	// 	ret.eval("$('#btn_update').attr('disabled', true);");
	// 	ret.eval("$('#btn_del').attr('disabled', true);");
	 
	// }else{ 
		// if(bnew){
		//     ret.eval("$('#btn_new').attr('disabled', false);");
		// }else{
		//     ret.eval("$('#btn_new').attr('disabled', true);");
		// }
		if(bupdate){
			ret.eval("$('#btn_update').attr('disabled', false);");
		}else{
			ret.eval("$('#btn_update').attr('disabled', true);");
		}
		if(bdel){
		    ret.eval("$('#btn_del').attr('disabled', false);");
		}else{
		    ret.eval("$('#btn_del').attr('disabled', true);");
		}
	 
	// }


 
	 
	return ret;
};