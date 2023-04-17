var shipacting_choice = {};
shipacting_choice.name = "代行発送情報管理画面按钮初始化";
shipacting_choice.paramsFormat = {
	// "val":null,
	// "status":null,
	// "pay":null,
};
 
shipacting_choice.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };
	var shopid = getShopId();
	var val = params["val"];
	var status = params["status"];
	var pay = params["pay"];

	// var bnew = getAuthorityInfo(shopid ,'1001_01' );
	// var bupdate = getAuthorityInfo(shopid ,'1001_02' );
	// var bdel = getAuthorityInfo(shopid ,'1001_03' );
	var bpay = getAuthorityInfo(shopid ,'1001_04' );



	// if(v == 'init'){
	// 	if(bnew){
	// 		ret.eval("$('#btn_new').attr('disabled', false);");
	// 	}else{
	// 		ret.eval("$('#btn_new').attr('disabled', true);");
	// 	}
	// 	ret.eval("$('#btn_update').attr('disabled', true);");
	// 	ret.eval("$('#btn_del').attr('disabled', true);");
	// 	ret.eval("$('#btn_pay').attr('disabled', true);"); 
	// }else{

		// if(status == '1.新　規' ){ 
		// 	if(bnew){
		// 		ret.eval("$('#btn_new').attr('disabled', false);");
		// 	}else{
		// 		ret.eval("$('#btn_new').attr('disabled', true);");
		// 	}
		// 	if(bupdate){
		// 		ret.eval("$('#btn_update').attr('disabled', false);");
		// 	}else{
		// 		ret.eval("$('#btn_update').attr('disabled', true);");
		// 	}
		// 	if(bdel){
		// 		ret.eval("$('#btn_del').attr('disabled', false);");
		// 	}else{
		// 		ret.eval("$('#btn_del').attr('disabled', true);");
		// 	}
			
		// }else{
		// 		if(bnew){
		// 			ret.eval("$('#btn_new').attr('disabled', false);");
		// 		}else{
		// 			ret.eval("$('#btn_new').attr('disabled', true);");
		// 		}
		// 		ret.eval("$('#btn_update').attr('disabled', true);");
		// 		ret.eval("$('#btn_del').attr('disabled', true);");
									
		// }
		// if(pay == '1.未支払'){
				if(bpay){
					ret.eval("$('#btn_pay').attr('disabled', false);");
				}else{
					ret.eval("$('#btn_pay').attr('disabled', true);");
				} 		
		// }else{
		// 	ret.eval("$('#btn_pay').attr('disabled', true);");
		// }

	// }

	// if(v == '0'){
	// 	if(bnew){
	// 	    ret.eval("$('#btn_new').attr('disabled', false);");
	// 	}else{
	// 	    ret.eval("$('#btn_new').attr('disabled', true);");
	// 	}
	// 	ret.eval("$('#btn_update').attr('disabled', true);");
	// 	ret.eval("$('#btn_del').attr('disabled', true);");
	// }else{ 
	// 	if(bnew){
	// 	    ret.eval("$('#btn_new').attr('disabled', false);");
	// 	}else{
	// 	    ret.eval("$('#btn_new').attr('disabled', true);");
	// 	}
	// 	if(bupdate){
	// 		ret.eval("$('#btn_update').attr('disabled', false);");
	// 	}else{
	// 		ret.eval("$('#btn_update').attr('disabled', true);");
	// 	}
	// 	if(bdel){
	// 	    ret.eval("$('#btn_del').attr('disabled', false);");
	// 	}else{
	// 	    ret.eval("$('#btn_del').attr('disabled', true);");
	// 	}
	  
	// }


 
	 
	return ret;
};