var delivery_box={};
delivery_box.name="箱詰め";
delivery_box.paramsFormat={
	"deliveryno":null

};
delivery_box.fire=function(params){

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };
 
	var deliveryno = params["deliveryno"];

	var resultHTML = 
	"<tr>" +
		"<td style='width: 90px;'>{pno}</td>" +
		"<td style='width: 160px;'>{sub1}</td>" +
		"<td style='width: 160px;'>{sub2}</td>" +
		"<td style='width: 120px;'>{asin}</td>" +
		"<td style='width: 150px;'>{sku}</td>" +
		"<td style='width: 120px;'>{label}</td>" +
		"<td style='width: 80px;'>{quantity}</td>" +
		"<td style='width: 80px;'>0</td>" +
		"<td style='width: 80px;'>0</td>" +
	"</tr>";

	var selectResult = db.select(
		"DELIVERY",
		"searchDeliveryInfo",
		{
			no:deliveryno,
			shopid: getShopId()
		}
	).getArray();

	ret.runat("#boxinfobody").remove("tr");

	ret.runat("#boxinfobody").append(resultHTML).withdata(selectResult);
 

	return ret.eval("delivery_box_inputdialog.dialog('open');");


};
