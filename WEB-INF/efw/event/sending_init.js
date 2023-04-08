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
		'<td style="width: 50px;" class="c"><input type="checkbox" name="choice" onchange="choice(1)"></input><input type="hidden" id="orderno" value="{orderno}"><input type="hidden" value="{flg}"></td>' +
		'<td style="width: 130px;" class="l"><span class="l5">{type}</span></td>' +
		'<td style="width: 180px;" class="c"><span>{traceno}</span></td>' +
		'<td style="width: 120px;" class="c">{state}</td>' +
		'<td style="width: 200px;" class="c">{no}</td>' +
		'<td style="width: 240px;" class="c">{orderdate}</td>' +
		'<td style="width: 600px;" class="l">' +
		'	<span class="l5 lh">{asin}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="l5 lh">{sku}</span><br>' +
		'	<span class="l5 lh">{productname}</span>' +
		'</td>' +
		'<td style="width: 100px;" class="r"><span class="r5">{num}</span></td>' +
		// '<td style="width: 100px;" class="r"><span class="r5">{money} 円</span></td>' +
		'<td style="width: 100px;" class="c">{mail}</td>' +
		'<td style="width: 400px;" class="l">' +
		'	<span class="l5 lh">{prefectures}&nbsp;&nbsp;&nbsp;&nbsp;{city}</span><br>' +
		'	<span class="l5 lh">{address1}</span><br>' +
		'	<span class="l5 lh">{address2}&nbsp;&nbsp;&nbsp;&nbsp;{address3}</span></td>' +
		'<td style="width: 120px;" class="l"><span class="l5">{name}</span></td>' +
		'<td style="width: 160px;" class="l"><span class="l5">{phone}</span></td>' +
		'<td style="width: 240px;" class="c">{senddate}</td>' +
		'<td style="width: 200px;" class="l"><span class="l5">{send}</span></input></td>' +
		'<td style="width: 300px;" class="l"><span class="l5">{remark}</span></td>' +
		'<td style="width: 200px;" class="l"><span class="l5">{sendcontent}</span></td>' +
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

 
	ret.eval("changeColor();");
	return ret;
};