var labelprinting_init = {};
labelprinting_init.name = "LABEL印刷画面初期表示";
labelprinting_init.paramsFormat = {

};


labelprinting_init.fire = function (params) {
	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// タイトル情報設定
	setTitleInfo(ret);

	// sl:商品管理番号初始化
	var selectResult1 = db.select(
		"LABELPRINTING",
		"searchproducno",
		{
			"shopid": getShopId(),
		}
	).getArray();

	var resultHTML1 = "<option value='{value}'class='option' >{text}</option>";

	ret.runat("#select_productno").remove("option .option").append(resultHTML1).withdata(selectResult1);
 
	ret.runat("#labeltable").remove("tr");

	var selectResult2 = db.select( 
		"LABELPRINTING",
		"searchlabelprinting",
		 {"shopid":getShopId() } ).getArray();

		//  检索代納商品
	if(selectResult2 != null && selectResult2 != ''){
		for(var i=0; i<selectResult2.length; i++){
			var label = selectResult2[i]["label"];
			var record = new Record([selectResult2[i]]).getArray();

			var selectResult3 = db.select( 
				"LABELPRINTING",
				"searchAliLabelprinting1",
				 {
					 "label" : label,
					 "shopid":getShopId() 
				 },
				 "jdbc/efw2" 
				 ).getSingle();
				 
				 var count = selectResult3["数量"] == null? '':selectResult3["数量"] ;
				 var resultHTML2 = '<tr>' +
				 '<td style="width: 70px;" class="c"><input type="checkbox" name="label"  value="{label}" onchange="check(this)"></input></td>' +
				 '<td style="width: 140px;" class="l"><span class="l5">{type}</span></td>' +
				 '<td style="width: 100px;" class="c">{productno}</td>' +
				 '<td style="width: 160px;" class="l"><span class="l5">{sub1}</span></td>' +
				 '<td style="width: 160px;" class="l"><span class="l5">{sub2}</span></td> ' + 
				 '<td style="width: 150px;" class="r"><span class="r5">{label}</span></td>' +
				 '<td style="width: 300px;" class="c">{remark}</td>' + 
				 '<td style="width: 127px;" class="l"><span class="l5">'+count+'</span></td>   ' +                
				 '</tr>' ;
				 
			ret.runat("#labeltable").append(resultHTML2).withdata(record);
		}

	}

	//  检索自納商品
	var selectResult4 = db.select( 
		"LABELPRINTING",
		"searchAliLabelprinting2",
		 { 
			 "shopid":getShopId() 
		 },
		 "jdbc/efw2" 
		 ).getArray();

		 var resultHTML3 = '<tr>' +
		 '<td style="width: 70px;" class="c"><input type="checkbox" name="label"  value="{label番号}"  onchange="check(this)"></input></td>' +
		 '<td style="width: 140px;" class="l"><span class="l5">{商品区分}</span></td>' +
		 '<td style="width: 100px;" class="c">{商品管理番号}</td>' +
		 '<td style="width: 160px;" class="l"><span class="l5">{分類１}</span></td>' +
		 '<td style="width: 160px;" class="l"><span class="l5">{分類２}</span></td> ' + 
		 '<td style="width: 150px;" class="r"><span class="r5">{label番号}</span></td>' +
		 '<td style="width: 300px;" class="c"></td>' + 
		 '<td style="width: 127px;" class="l"><span class="l5">{数量}</span></td>   ' +                
		 '</tr>' ;
		 ret.runat("#labeltable").append(resultHTML3).withdata(selectResult4);

		  
	return ret;
};