var zzz_uploadwrongquestion = {};
zzz_uploadwrongquestion.name = "問題アップロード";
zzz_uploadwrongquestion.paramsFormat = {
	"#productpicStr":null,
	"#productpic":null,
	"#picwidth":null,
	"#picheight":null
};

zzz_uploadwrongquestion.fire = function (params) {

	var ret = new Result();

	// var picStr = params["#productpicStr"];
	var pic = params["#productpic"];

	var picwidth = params["#picwidth"];
	var picheight = params["#picheight"];

	// var rangeFrom = "";
	// var rangeTo = "";

	file.saveUploadFiles("upload/wq");

	// ファイル名称
	var fa = pic.split("\\");
	var f = fa[fa.length - 1];
	var k = f.split(".")[1];

	file.rename("upload/wq/" + f, (new Date()).format("yyyyMMdd-HHmmss") + "_" + picwidth + "_" + picheight + "_END" + "." + k);

	// var tempFilePathName = file.getTempFileName();

	// var excel = new Excel("common/templates/WRONGQUESTION.xlsx");

	// // テンプレートA
	// var templeteList = [
	// 	{sheetName:	"A",	picRangeFrom:	"R1C14",	picRangeTo:	"R53C38"}
	// ];

	// for(var i=0;i<templeteList.length;i++){

	// 	var templete = templeteList[i];

	// 	templete.sheetName.debug("sheetName");
	// 	templete.picRangeFrom.debug("picRangeFrom");
	// 	templete.picRangeTo.debug("picRangeTo");

	// 	var range = getRange(templete.picRangeFrom,templete.picRangeTo, picwidth,picheight);

	// 	excel.addShapeInRange(
	// 		templete.sheetName,
	// 		range[0],
	// 		range[1],
	// 		"temp",
	// 		"pic",
	// 		"",
	// 		parseInt(range[2]),
	// 		parseInt(range[3]),
	// 		parseInt(range[4]),
	// 		parseInt(range[5])
	// 		);

	// 	excel.replacePicture(templete.sheetName,"Picture 1","upload/" + f);

	// }

	// excel.setActiveSheet("A").save(tempFilePathName);

	// ret.attach(tempFilePathName)
	// .saveas((new Date()).format("yyyyMMdd-HHmmss") + ".xlsx")
	// .deleteAfterDownload();

	ret.eval("alert('写真をアップロードしました！');");

	return ret.navigate("uploadwrongquestion.jsp");
};

function getRange(from , to, picwidth, picheight){

	var from_r = getRFromString(from);
	var from_c = getCFromString(from);
	var to_r = getRFromString(to);
	var to_c = getCFromString(to);

	var row = to_r - from_r + 1;
	var col = to_c - from_c + 1;

	var row_display = Math.round(picheight * col / picwidth);
	var col_display = Math.round(picwidth * row / picheight);

	var display_from_c = "";
	var display_to_c = "";
	var display_from_r = "";
	var display_to_r = "";

	var cellpx = 20;

	var x1 = 0;
	var x2 = 0;
	var y1 = 0;
	var y2 = 0;

	if(row > row_display){

		display_from_c = from_c;
		display_to_c = to_c;

		// 上寄せ
		display_from_r = from_r;
		display_to_r = display_from_r + row_display - 1;

		// // 下寄せ
		// var display_to_r = to_r;
		// var display_from_r = display_to_r - row_display + 1;

		var s = picheight * col / picwidth - row_display;

		if(s == 0){
			x2 = cellpx;
			y2 = cellpx;
		}else if(s > 0){
			display_to_r = display_to_r + 1;
			x2 = cellpx;
			y2 = s * cellpx;
		}else{
			//display_to_r = display_to_r - 1;
			x2 = cellpx;
			y2 = cellpx + s * cellpx;
		}

	}else{

		display_from_r = from_r;
		display_to_r = to_r;

		// // 左寄せ
		// var display_from_c = from_c;
		// var display_to_c = display_from_c + col_display - 1;

		// // 右寄せ
		// var display_to_c = to_c;
		// var display_from_c = display_to_c - col_display + 1;

		// 中寄せ
		display_from_c = from_c + Math.round((col - col_display) / 2);
		display_to_c = display_from_c + col_display - 1;

		var s = picwidth * row / picheight - col_display;

		if(s == 0){
			x2 = cellpx;
			y2 = cellpx;
		}else if(s > 0){
			//display_to_c = display_to_c + 1;
			x2 = s * cellpx;
			y2 = cellpx;
		}else{
			display_to_c = display_to_c - 1;
			x2 = cellpx + s * cellpx;
			y2 = cellpx;
		}

	}

	var returnValue = [
		getColByNo(display_from_c) + display_from_r
		,
		getColByNo(display_to_c) + display_to_r
		,
		String(x1)
		,
		String(y1)
		,
		String(x2)
		,
		String(y2)
	];



	return returnValue;

}

function getColByNo(colno){

	var a = colno / 26;
	var b = colno % 26;

	if(a > 1){
		return getColByNo(Math.floor((colno - 1) / 26)) + returnCol(b);
	}else{
		return returnCol(b);
	}
}




function returnCol(col){

	var colArray = [
		"Z",
		"A",
		"B",
		"C",
		"D",
		"E",
		"F",
		"G",
		"H",
		"I",
		"J",
		"K",
		"L",
		"M",
		"N",
		"O",
		"P",
		"Q",
		"R",
		"S",
		"T",
		"U",
		"V",
		"W",
		"X",
		"Y"
	];

	return colArray[col];

}

function getCFromString(str){


	var index = str.indexOf("C");
	var c = str.substr(index+1);

	return parseInt(c);
}
function getRFromString(str){

	var index = str.indexOf("C");
	var r = str.substring(1,index);

	return parseInt(r);
}