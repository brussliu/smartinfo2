var common_tabledown = {};
common_tabledown.name = "tabledown";
common_tabledown.paramsFormat = { 
	"form":null,
	"colName":null,
	"colData":null
}; 
 
common_tabledown.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };
	var form = params["form"];
	var colName = params["colName"];
	var colData = params["colData"];
	var  tempFilePathName = writeEcl(form, colName, colData);

 
	ret.attach(tempFilePathName)
	.saveas(form+ (new Date()).format("yyyyMMdd") + ".xlsx")
	.deleteAfterDownload();
	 
	return ret;
};