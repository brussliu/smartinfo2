var masterinfo_search={};
masterinfo_search.name="インポート画面検索";
masterinfo_search.paramsFormat={
	"producttype":null,
	"#productno":null,
	"#keyword":null,
	"displayflg2":null,




};
var SHOP_ID = session.get("SHOP_ID");
 
masterinfo_search.fire=function(params){
	
	var ret = new Result();

	var pdArr = params["producttype"];
	var productno = params["#productno"];
	var keyword = params["#keyword"].toUpperCase();
	var displayflg2 = params["displayflg2"];
	var type="";
	for(let i=0;i<pdArr.length;i++){
		
		if(i==pdArr.length-1){
			type += "'"+pdArr[i]+"'"
		}else{
			type += "'"+pdArr[i]+"',";
		}
	}
	 
	type.debug("2222")
		
		type.debug("1aaaaa")
	var selectResult = db.select(
		"MASTER",
		"selectmasterinfo",
		{
		
			shopid : SHOP_ID,
			ptype : type,
			productno : productno,
			keyword : keyword
		
		}
	).getArray();

 
	selectResult.debug("zzzzzzzzzzzzzzzz");

	var resultHTML =
		"<tr>" +
		"<td style='width: 70px;' class='c'><button class='btn' id='update'onclick='masterinfo_inputdialog.dialog('open');'>更新</button></td>" +
		"<td style='width: 140px;' class='l'><span class='l5'>{type}</span></td>" +
		"<td style='width: 80px;' class='c'>{no}</td>" +
		"<td style='width: 70px;' class='c'>{preproduct}</td>" +
		"<td style='width: 160px;' class='l'><span class='l5'>{sub1}</span></td>" +
		"<td style='width: 160px;' class='l'><span class='l5'>{sub2}</span></td>" +
		"<td style='width: 150px;' class='c'>{asin}</td>" +
		"<td style='width: 120px;' class='c'>{sku}</td>" +
		"<td style='width: 120px;' class='c'>{label}</td>" +
		"<td style='width: 80px;' class='r'><span class='r5'>{price}</span></td>" +
		"<td style='width: 160px;' class='l'><span class='l5'>{fba}</span></td>" +
		"<td style='width: 800px;' class='l'><span>{name}</span></td>" +
		"</tr>";

	ret.runat("#stocktable").remove("tr").append(resultHTML).withdata(selectResult);

	var script = "$('.c_detail_header').show();$('.c_detail_content').show();";
	ret.eval(script);

	// 画面へ結果を返す
	return ret;

};
