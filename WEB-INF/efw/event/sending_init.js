var sending_init = {};
sending_init.name = "発送情報管理画面初期表示";
sending_init.paramsFormat = {

};
 
sending_init.fire = function (params) {
	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// タイトル情報設定
	setTitleInfo(ret);

	var selectResult = db.select(
		"SENDING",
		"searchsending",
		{
			"shopid": getShopId(),
		}
	).getArray();
 
	var resultHTML ='<tr>' +
		'<td style="width: 50px;" class="c"><input type="checkbox" name="choice"></input><input type="hidden" id="orderno" value="{orderno}"></input></td>' +
		'<td style="width: 130px;" class="l"><span class="l5">{type}</span></td>' +
		'<td style="width: 180px;" class="c"><input type="text" style="width: 170px;height: 30px;"></td>' +
		'<td style="width: 120px;" class="c">{state}</td>' +
		'<td style="width: 220px;" class="c">{no}</td>' +
		'<td style="width: 140px;" class="c">{orderdate}</td>' +
		'<td style="width: 300px;" class="l">' +
		'	<span class="l5 lh">{productname}</span><br>' +
		'	<span class="l5 lh"></span><br>' +
		'	<span class="l5 lh"></span>' +
		'</td>' +
		'<td style="width: 100px;" class="r"><span class="r5">{num}</span></td>' +
		'<td style="width: 100px;" class="r"><span class="r5">{money} 円</span></td>' +
		'<td style="width: 100px;" class="c">{mail}</td>' +
		'<td style="width: 400px;" class="l">' +
		'	<span class="l5 lh">{prefectures}{addressall}</span><br>' +
		'	<span class="l5 lh">{city}</span><br>' +
		'	<span class="l5 lh">{address1}'+' '+'{address2}'+' '+'{address3}</span></td>' +
		'<td style="width: 120px;" class="l"><span class="l5">{name}</span></td>' +
		'<td style="width: 150px;" class="l"><span class="l5">{phone}</span></td>' +
		'<td style="width: 200px;" class="l"><span class="l5">{send}</span></td>' +
		'<td style="width: 300px;" class="l"><span class="l5">{remark}</span></td>' +
    '</tr>'
	ret.runat("#sendingtable").remove("tr").append(resultHTML).withdata(selectResult);
	 
 	// 発送商品
	 var selectResult1 = db.select(
		"SENDING",
		"searchproducno",
		{
			"shopid": getShopId()
		}
	).getArray();

 
	var resultHTML1 = "<option value='{value}'class='option' >{text}</option>";

	ret.runat("#select_product").remove("option .option").append(resultHTML1).withdata(selectResult1);

	return ret;
};