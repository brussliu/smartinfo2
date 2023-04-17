var shipacting_init = {};
shipacting_init.name = "代行発送情報管理画面初期表示";
shipacting_init.paramsFormat = {

};
 
shipacting_init.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// タイトル情報設定
	setTitleInfo(ret);

	setAuthorityInfo(ret, "10");
	
	var selectResult = db.select(
		"SHIPACTING",
		"searchshipacting",
		{
			"shopid": getShopId(),
		}
	).getArray();
 
	var resultHTML ='<tr>' +
		'<td style="width: 50px;" class="c"><input type="radio" name="choice" value="{no}" onclick="choice(this)"></input></td>' +
		'<td style="width: 155px" class="c">{no}</td>' +
		'<td style="width: 85px;" class="c">{status}</td>' +
		'<td style="width: 85px;" class="c">{pay}</td>' +

		'<td style="width: 100px;" class="r"><span class="r5">{jpmoney}</span></td>' +
		'<td style="width: 100px;" class="r"><span class="r5">{cnmoney}</span></td>' +
		'<td style="width: 100px;" class="c">{postal}</td>' +

		'<td style="width: 350px;" class="l">' +
		'<span class="l5">{address1}</span><br>' +
		'<span class="l5">{address2}</span><br>' +
		'<span class="l5">{address3}</span>' +
		'</td>' +
		'<td style="width: 100px;" class="l"><span class="l5">{name}</span></td>' +
		'<td style="width: 130px;" class="l"><span class="l5">{tel}</span></td>' +
		'<td style="width: 200px;" class="l"><span class="l5">{sendcontent}</span></td>' +
		'<td style="width: 60px;" class="r"><span class="r5">{num}</span></td>' +
		'<td style="width: 180px;" class="l"><span class="l5">{sendmethod}</span></td>' +
		'<td style="width: 180px;" class="r"><span class="r5">{remarks}</span></td>' +
		'<td style="width: 150px;" class="l"><span class="l5">{track}</span></td>' +
    '</tr>'
	ret.runat("#shipactingtable").remove("tr").append(resultHTML).withdata(selectResult);
	 
  	// 查询所有発送商品
	var select = db.select(
		"SHIPACTING",
		"queryshipactingmater",
		{	
			"shopid": getShopId()
		}
	).getArray();

	
	var resultHTML2 = "<option value='{no}' class='option'>{productname_cn}"+' '+"{num}</option>";

	ret.runat("#select_sendProduct").remove(".option").append(resultHTML2).withdata(select);
	ret.eval('changeColor();');

	ret.eval("$('#btn_update').attr('disabled', true);");
	ret.eval("$('#btn_del').attr('disabled', true);");

	var bpay = getAuthorityInfo(getShopId() ,'1001_04' );
	if(bpay){
		ret.eval("$('#btn_pay').attr('disabled', true);");
	}

	return ret;
};