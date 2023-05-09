var labelprinting_save = {};
labelprinting_save.name = "LABEL印刷画面保存";
labelprinting_save.paramsFormat = {
 
	"#select_productno": null,
	"#select_sub1": null,
	"#select_sub2": null,

	"#text_productno": null,
	"#text_sub1": null,
	"#text_sub2": null,
	"#text_label": null,
	"#text_remark": null,
 
	"choice": null,

};

labelprinting_save.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// 操作区分
	var choice = params["choice"];
 
	if (choice == "自納商品") {
 
		var productno = params["#select_productno"]; 
		var sub1 = params["#select_sub1"]  == '‐‐‐‐' ? '' :params["#select_sub1"];
		var sub2 = params["#select_sub2"]  == '‐‐‐‐' ? '' :params["#select_sub2"];
		 
		// 查询商品信息
		var selectResult1 = db.select(
			"LABELPRINTING",
			"searchLabel",
			{
				"productno": productno,
				"sub1": sub1,
				"sub2": sub2,
				"shopid": getShopId(),
			}
		).getArray();
	 
		// 添加至页面
		var resultHTML = '<tr>' +
		'<td style="width: 70px;" class="c"><input type="checkbox" name="label"  value="{label}"  onchange="check(this)"></input></td>' +
		'<td style="width: 140px;" class="l"><span class="l5">自納商品</span></td>' +
		'<td style="width: 100px;" class="c">'+productno+'</td>' +
		'<td style="width: 160px;" class="l"><span class="l5">'+sub1+'</span></td>' +
		'<td style="width: 160px;" class="l"><span class="l5">'+sub2+'</span></td> ' + 
		'<td style="width: 150px;" class="r"><span class="r5">{label}</span></td>' +
		'<td style="width: 300px;" class="c"></td>' + 
		'<td style="width: 127px;" class="l"><span class="l5"></span></td>   ' +                
		'</tr>' ;
		ret.runat("#labeltable").append(resultHTML).withdata(selectResult1);
	 
	}
	if (choice == "代納商品") {
 
		var label = params["#text_label"];
		var productno = params["#text_productno"];
		var sub1 = params["#text_sub1"];
		var sub2 = params["#text_sub2"];
		var remark = params["#text_remark"];
		 
		var insertResult = db.change(
			"LABELPRINTING",
			"insertLabelprinting",
			{
				"productno": productno,
				"sub1": sub1,
				"sub2": sub2,
				"label": label,
				"remark": remark,
				"shopid": getShopId(),
			}
		);
	 
	//  添加至页面
		var resultHTML2 = '<tr>' +
		'<td style="width: 70px;" class="c"><input type="checkbox" name="label"  value="'+label+'"  onchange="check(this)"></input></td>' +
		'<td style="width: 140px;" class="l"><span class="l5">代納商品</span></td>' +
		'<td style="width: 100px;" class="c">'+productno+'</td>' +
		'<td style="width: 160px;" class="l"><span class="l5">'+sub1+'</span></td>' +
		'<td style="width: 160px;" class="l"><span class="l5">'+sub2+'</span></td> ' + 
		'<td style="width: 150px;" class="r"><span class="r5">'+label+'</span></td>' +
		'<td style="width: 300px;" class="c">'+remark+'</td>' + 
		'<td style="width: 127px;" class="l"><span class="l5"></span></td>   ' +                
		'</tr>' ;

		var arr = new Record([{'a':'1'}]).getArray();
		ret.runat("#labeltable").append(resultHTML2).withdata(arr);
	}
 

	// 画面へ結果を返す
	ret.eval("labelprinting_inputdialog.dialog('close');");
	

	return ret;

};