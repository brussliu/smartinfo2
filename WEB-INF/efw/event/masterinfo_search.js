var masterinfo_search={};
masterinfo_search.name="インポート画面検索";
masterinfo_search.paramsFormat={
	"producttype":null,
	"#productno":null,
	"#keyword":null,
	"#notenough":null,
	//"displayflg2":null,
	//"#displayItem1":null

};
 
masterinfo_search.fire=function(params){
	
	var ret = new Result();

	var pdArr = params["producttype"];
	var productno = params["#productno"];
	var keyword = params["#keyword"].toUpperCase();
	var notenough = params["#notenough"];

	//var displayflg2 = params["displayflg2"];
	var type="";
	for(let i=0;i<pdArr.length;i++){
		
		if(i==pdArr.length-1){
			type += "'"+pdArr[i]+"'"
		}else{
			type += "'"+pdArr[i]+"',";
		}
	}
	 
 
	//var subhtml = displayflg2 == "1" ? "" : "style='display: none;'";
 
	var selectResult = db.select(
		"MASTER",
		"selectmasterinfo",
		{
		
			shopid : getShopId(),
			ptype : type,
			productno : productno,
			keyword : keyword
		
		}
	).getArray();

 
	var resultHTML =
		"<tr>" +
		"<td style='width: 70px;' class='c'><button class='btn' id='update' onclick='updatedialog(this);'>更新</button><input type='hidden' id='flg' value='{flg}'></input></td>" +
		"<td style='width: 140px;' class='l'><span class='l5'>{type}</span></td>" +
		"<td style='width: 80px;' class='c'>{no}</td>" +
		"<td style='width: 70px;' class='c'>{preproduct}</td>" +
		"<td style='width: 160px;' class='l'><span class='l5'>{sub1}</span></td>" +
		"<td style='width: 160px;' class='l'><span class='l5'>{sub2}</span></td>" +
		"<td style='width: 150px;' class='c display2'>{asin}</td>" +
		"<td style='width: 150px;' class='c display2'>{sku}</td>" +
		"<td style='width: 150px;' class='c display2'>{label}</td>" +
		// "<td  " + subhtml +      "style='width: 150px;' class='c display2'>{asin}</td>" +
		// "<td  " + subhtml +      " style='width: 150px;' class='c display2'>{sku}</td>" +
		// "<td  " + subhtml +      "style='width: 150px;' class='c display2'>{label}</td>" +
		"<td style='width: 80px;' class='r'><span class='r5'>{price}</span></td>" +
		"<td style='width: 160px;' class='l'><span class='l5'>{fba}</span></td>" +
		"<td style='width: 800px;' class='l'><span>{name}</span></td>" +
		"</tr>";

	ret.runat("#stocktable").remove("tr").append(resultHTML).withdata(selectResult);
	 
	// var script = "$('.c_detail_header').show();$('.c_detail_content').show();";
	// ret.eval(script);

	ret.show('.c_detail_header').show('.c_detail_content');

	//notenough.debug("YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");

	if(notenough != null && notenough != ""){
		ret.eval("changeColor(1)");
	}else{
		ret.eval("changeColor(0)");
	}

	// 画面へ結果を返す
	return ret;

};
