var importfile = {};
importfile.name = "データ導入";//
importfile.paramsFormat = {

	// 商品マスタ情報　18
	"#importfile_01": null,//#
	"#importfile_02": null,
	"#importfile_03": null,//#
	"#importfile_04": null,
	"#importfile_05": null,//#
	"#importfile_06": null,
	"#importfile_07": null,//#
	"#importfile_08": null,
	"#importfile_09": null,//#
	"#importfile_10": null,
	"#importfile_11": null,//#
	"#importfile_12": null,
	"#importfile_13": null,//#
	"#importfile_14": null,
	"#importfile_15": null,//#
	"#importfile_16": null,
	"#importfile_17": null,//#
	"#importfile_18": null,

};

var num = 0;//履歴登録処理の件数
var registrationDate = "";//表里显示的时间

var SHOP_ID = session.get("SHOP_ID");

importfile.fire = function (params) {   //

	var ret = new Result();
	var flg_file01 = false;
	var flg_file02 = false;
	var flg_file03 = false;
	var flg_file04 = false;
	var flg_file05 = false;
	var flg_file06 = false;
	var flg_file07 = false;
	var flg_file08 = false;
	var flg_file09 = false;
	var flg_file10 = false;
	var flg_file11 = false;
	var flg_file12 = false;
	var flg_file13 = false;
	var flg_file14 = false;
	var flg_file15 = false;
	var flg_file16 = false;
	var flg_file17 = false;
	var flg_file18 = false;

	file.saveUploadFiles("upload");//importfile_01文件上传到upload文件 不写也可以上传

	if (params["#importfile_01"] != null && params["#importfile_01"] != "") {

		flg_file01 = true;
		var fa = params["#importfile_01"].split("\\");
		var f = fa[fa.length - 1];//取出文件名

		var today = new Date();
		registrationDate = today.format("yyyy-MM-dd HH:mm:ss");

		var csvReader = new CSVReader("upload/" + f, "\t");

		// データ全件削除
		var delResult = db.change(
			"IMPORT",//IMPORT.xml
			"delAllFile01",
			{}
		);

		//データ全件導入
		num = 0;
		csvReader.loopAllLines(import_01);//针对文件 aryField 的每一行执行一次方法import_01
		//履历表插入

		saveHistory(SHOP_ID, "file01", today, num);


	}
	
	if (params["#importfile_02"] != null && params["#importfile_02"] != "") {

		flg_file02 = true;

		// ******************数据读取****************** 
		var fa = params["#importfile_02"].split("\\");
		var f = fa[fa.length - 1];//取出文件名

		var today = new Date();
		registrationDate = today.format("yyyy-MM-dd HH:mm:ss");

		var csvReader = new CSVReader("upload/" + f, "\t", "\"", "MS932");
		// ******************数据读取******************

		// ******************核心逻辑操作******************
		// データ全件削除
		var delResult = db.change(
			"IMPORT",//IMPORT.xml
			"delAllFile02",
			{}
		);

		//データ全件導入
		num = 0;
		csvReader.loopAllLines(import_02);//针对文件 aryField 的每一行执行一次方法import_01
		// ******************核心逻辑操作******************	

		// ******************同等插入H1******************	
		//csvReader.loopAllLines(import_02_1);//针对文件 aryField 的每一行执行一次方法import_01_1


		//履历表插入
		saveHistory(SHOP_ID, "file02", today, num);



	}

	if (params["#importfile_03"] != null && params["#importfile_03"] != "") {

		flg_file03 = true;
		var fa = params["#importfile_03"].split("\\");
		var f = fa[fa.length - 1];//取出文件名

		var today = new Date();
		registrationDate = today.format("yyyy-MM-dd HH:mm:ss");

		var csvReader = new CSVReader("upload/" + f, "\t", "\"", "MS932");

		// データ全件削除
		var delResult = db.change(
			"IMPORT",//IMPORT.xml
			"delAllFile03",
			{}
		);

		//データ全件導入
		num = 0;
		csvReader.loopAllLines(import_03);//针对文件 aryField 的每一行执行一次方法import_01

		//履历表插入
		saveHistory(SHOP_ID, "file03", today, num);
	}

	if (params["#importfile_04"] != null && params["#importfile_04"] != "") {

		flg_file04 = true;
		var fa = params["#importfile_04"].split("\\");
		var f = fa[fa.length - 1];//取出文件名

		var today = new Date();
		registrationDate = today.format("yyyy-MM-dd HH:mm:ss");

		var csvReader = new CSVReader("upload/" + f, ",", "\"", "MS932");

		//var csvReader = new CSVReader("upload/" + f, ",");

		// データ全件削除
		var delResult = db.change(

			"IMPORT",//IMPORT.xml

			"delAllFile04",
			//执行到这里
			{}

		);

		//データ全件導入
		num = 0;

		csvReader.loopAllLines(import_04);//针对文件 aryField 的每一行执行一次方法import_01

		//履历表插入
		saveHistory(SHOP_ID, "file04", today, num);
	}

	if (params["#importfile_05"] != null && params["#importfile_05"] != "") {

		flg_file05 = true;
		var fa = params["#importfile_05"].split("\\");
		var f = fa[fa.length - 1];//取出文件名

		var today = new Date();
		registrationDate = today.format("yyyy-MM-dd HH:mm:ss");

		var csvReader = new CSVReader("upload/" + f, "\t", "\"", "MS932");

		// データ全件削除

		var delResult = db.change(
			"IMPORT",//IMPORT.xml
			"delAllFile05",
			{}
		);

		//データ全件導入
		num = 0;
		csvReader.loopAllLines(import_05);//针对文件 aryField 的每一行执行一次方法import_01

		//履历表插入
		saveHistory(SHOP_ID, "file05", today, num);
	}

	if (params["#importfile_06"] != null && params["#importfile_06"] != "") {

		flg_file06 = true;
		var fa = params["#importfile_06"].split("\\");
		var f = fa[fa.length - 1];//取出文件名

		var today = new Date();
		registrationDate = today.format("yyyy-MM-dd HH:mm:ss");

		var csvReader = new CSVReader("upload/" + f, "\t", "\"", "MS932");

		// データ全件削除
		var delResult = db.change(
			"IMPORT",//IMPORT.xml
			"delAllFile06",
			{}
		);

		//データ全件導入
		num = 0;
		csvReader.loopAllLines(import_06);//针对文件 aryField 的每一行执行一次方法import_01

		//履历表插入
		saveHistory(SHOP_ID, "file06", today, num);
	}

	if (params["#importfile_07"] != null && params["#importfile_07"] != "") {

		flg_file07 = true;
		var fa = params["#importfile_07"].split("\\");
		var f = fa[fa.length - 1];//取出文件名

		var today = new Date();
		registrationDate = today.format("yyyy-MM-dd HH:mm:ss");

		//var csvReader = new CSVReader("upload/" + f, ",","\"","MS932");
		var csvReader = new CSVReader("upload/" + f, ",");

		// データ全件削除
		var delResult = db.change(
			"IMPORT",//IMPORT.xml
			"delAllFile07",
			{}
		);

		//データ全件導入
		num = 0;
		csvReader.loopAllLines(import_07);//针对文件 aryField 的每一行执行一次方法import_01

		//履历表插入
		saveHistory(SHOP_ID, "file07", today, num);
	}

	if (params["#importfile_08"] != null && params["#importfile_08"] != "") {

		flg_file08 = true;
		var fa = params["#importfile_08"].split("\\");
		var f = fa[fa.length - 1];//取出文件名

		var today = new Date();
		registrationDate = today.format("yyyy-MM-dd HH:mm:ss");

		var csvReader = new CSVReader("upload/" + f, ",");
		//var csvReader = new CSVReader("upload/" + f, ",","\"","MS932");

		// データ全件削除
		var delResult = db.change(
			"IMPORT",//IMPORT.xml
			"delAllFile08",
			{}
		);
		//f.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		//データ全件導入
		num = 0;
		csvReader.loopAllLines(import_08);//针对文件 aryField 的每一行执行一次方法import_01
		//f.debug("22222222222222222222>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		//履历表插入
		saveHistory(SHOP_ID, "file08", today, num);
	}

	if (params["#importfile_09"] != null && params["#importfile_09"] != "") {

		flg_file09 = true;
		var fa = params["#importfile_09"].split("\\");
		var f = fa[fa.length - 1];//取出文件名

		var today = new Date();
		registrationDate = today.format("yyyy-MM-dd HH:mm:ss");

		//var csvReader = new CSVReader("upload/" + f, "\t","\"","MS932");
		//var csvReader = new CSVReader("upload/" + f, ",","\"","MS932");
		var csvReader = new CSVReader("upload/" + f, ",");

		// データ全件削除
		var delResult = db.change(
			"IMPORT",//IMPORT.xml
			"delAllFile09",
			{}
		);

		//データ全件導入
		num = 0;
		csvReader.loopAllLines(import_09);//针对文件 aryField 的每一行执行一次方法import_01

		//履历表插入
		saveHistory(SHOP_ID, "file09", today, num);
	}

	if (params["#importfile_10"] != null && params["#importfile_10"] != "") {

		flg_file10 = true;
		var fa = params["#importfile_10"].split("\\");
		var f = fa[fa.length - 1];//取出文件名

		var today = new Date();
		registrationDate = today.format("yyyy-MM-dd HH:mm:ss");

		//var csvReader = new CSVReader("upload/" + f, "\t","\"","MS932");
		//var csvReader = new CSVReader("upload/" + f, ",","\"","MS932");
		var csvReader = new CSVReader("upload/" + f, ",");

		// データ全件削除
		var delResult = db.change(
			"IMPORT",//IMPORT.xml
			"delAllFile10",
			{}
		);

		//データ全件導入
		num = 0;
		csvReader.loopAllLines(import_10);//针对文件 aryField 的每一行执行一次方法import_01

		//履历表插入
		saveHistory(SHOP_ID, "file10", today, num);
	}

	if (params["#importfile_11"] != null && params["#importfile_11"] != "") {

		flg_file11 = true;
		var fa = params["#importfile_11"].split("\\");
		var f = fa[fa.length - 1];//取出文件名

		var today = new Date();
		registrationDate = today.format("yyyy-MM-dd HH:mm:ss");

		//var csvReader = new CSVReader("upload/" + f, ",","\"","MS932");
		var csvReader = new CSVReader("upload/" + f, ",", "\"");
		//var csvReader = new CSVReader("upload/" + f, ",","\"","MS932");

		// データ全件削除
		var delResult = db.change(
			"IMPORT",//IMPORT.xml
			"delAllFile11",
			{}
		);

		//データ全件導入
		num = 0;
		csvReader.loopAllLines(import_11);//针对文件 aryField 的每一行执行一次方法import_01

		//履历表插入
		saveHistory(SHOP_ID, "file11", today, num);
	}

	if (params["#importfile_12"] != null && params["#importfile_12"] != "") {

		flg_file12 = true;
		var fa = params["#importfile_12"].split("\\");
		var f = fa[fa.length - 1];//取出文件名

		var today = new Date();
		registrationDate = today.format("yyyy-MM-dd HH:mm:ss");

		var csvReader = new CSVReader("upload/" + f, ",", "\"");
		//var csvReader = new CSVReader("upload/" + f, ",");

		// データ全件削除
		var delResult = db.change(
			"IMPORT",//IMPORT.xml
			"delAllFile12",
			{}
		);
		// f.debug("1111111111111111111111111111111111111111111111111111111111111111111");
		//データ全件導入
		num = 0;
		csvReader.loopAllLines(import_12);//针对文件 aryField 的每一行执行一次方法import_01
		// f.debug("222222222222222222222222222222222222222222222222222222222222");
		//履历表插入
		//aryField[0].length
		//var con = SELECT *  FROM `IPT_出荷情報`;

		saveHistory(SHOP_ID, "file12", today, num);

	}

	if (params["#importfile_13"] != null && params["#importfile_13"] != "") {

		flg_file13 = true;
		var fa = params["#importfile_13"].split("\\");
		var f = fa[fa.length - 1];//取出文件名

		var today = new Date();
		registrationDate = today.format("yyyy-MM-dd HH:mm:ss");

		var csvReader = new CSVReader("upload/" + f, ",", "\"", "MS932");

		// データ全件削除
		var delResult = db.change(
			"IMPORT",//IMPORT.xml
			"delAllFile13",
			{}
		);
		num = 0;
		//データ全件導入
		csvReader.loopAllLines(import_13);//针对文件 aryField 的每一行执行一次方法import_01

		//履历表插入
		saveHistory(SHOP_ID, "file13", today, num);
	}

	if (params["#importfile_14"] != null && params["#importfile_14"] != "") {

		flg_file14 = true;
		var fa = params["#importfile_14"].split("\\");
		var f = fa[fa.length - 1];//取出文件名

		var today = new Date();
		registrationDate = today.format("yyyy-MM-dd HH:mm:ss");

		var csvReader = new CSVReader("upload/" + f, ",", "\"", "MS932");

		// データ全件削除
		var delResult = db.change(
			"IMPORT",//IMPORT.xml
			"delAllFile14",
			{}
		);
		num = 0;
		//データ全件導入
		csvReader.loopAllLines(import_14);//针对文件 aryField 的每一行执行一次方法import_01

		//履历表插入
		saveHistory(SHOP_ID, "file14", today, num);
	}

	if (params["#importfile_15"] != null && params["#importfile_15"] != "") {

		flg_file15 = true;
		var fa = params["#importfile_15"].split("\\");
		var f = fa[fa.length - 1];//取出文件名

		var today = new Date();
		registrationDate = today.format("yyyy-MM-dd HH:mm:ss");

		var csvReader = new CSVReader("upload/" + f, ",", "\"", "MS932");

		// データ全件削除
		var delResult = db.change(
			"IMPORT",//IMPORT.xml
			"delAllFile15",
			{}
		);
		num = 0;
		//データ全件導入
		csvReader.loopAllLines(import_15);//针对文件 aryField 的每一行执行一次方法import_01

		//履历表插入
		saveHistory(SHOP_ID, "file15", today, num);
	}

	if (params["#importfile_16"] != null && params["#importfile_16"] != "") {

		flg_file16 = true;
		var fa = params["#importfile_16"].split("\\");
		var f = fa[fa.length - 1];//取出文件名

		var today = new Date();
		registrationDate = today.format("yyyy-MM-dd HH:mm:ss");

		var csvReader = new CSVReader("upload/" + f, ",", "\"", "MS932");

		// データ全件削除
		var delResult = db.change(
			"IMPORT",//IMPORT.xml
			"delAllFile16",
			{}
		);
		num = 0;
		//データ全件導入
		csvReader.loopAllLines(import_16);//针对文件 aryField 的每一行执行一次方法import_01

		//履历表插入
		saveHistory(SHOP_ID, "file16", today, num);
	}

	if (params["#importfile_17"] != null && params["#importfile_17"] != "") {

		flg_file17 = true;
		var fa = params["#importfile_17"].split("\\");
		var f = fa[fa.length - 1];//取出文件名

		var today = new Date();
		registrationDate = today.format("yyyy-MM-dd HH:mm:ss");

		var csvReader = new CSVReader("upload/" + f, ",", "\"", "MS932");

		// データ全件削除
		var delResult = db.change(
			"IMPORT",//IMPORT.xml
			"delAllFile17",
			{}
		);
		num = 0;
		//データ全件導入
		csvReader.loopAllLines(import_17);//针对文件 aryField 的每一行执行一次方法import_01

		//履历表插入
		saveHistory(SHOP_ID, "file17", today, num);

	}

	if (params["#importfile_18"] != null && params["#importfile_18"] != "") {

		flg_file18 = true;
		var fa = params["#importfile_18"].split("\\");
		var f = fa[fa.length - 1];//取出文件名

		var today = new Date();
		registrationDate = today.format("yyyy-MM-dd HH:mm:ss");

		var csvReader = new CSVReader("upload/" + f, ",", "\"", "MS932");

		// データ全件削除
		var delResult = db.change(
			"IMPORT",//IMPORT.xml
			"delAllFile18",
			{}
		);
		num = 0;
		//データ全件導入
		csvReader.loopAllLines(import_18);//针对文件 aryField 的每一行执行一次方法import_01

		//履历表插入
		saveHistory(SHOP_ID, "file18", today, num);
	}

	excute(flg_file01, flg_file02, flg_file03, flg_file04, flg_file05, flg_file06,
		flg_file07, flg_file08, flg_file09, flg_file10, flg_file11, flg_file12,
		flg_file13, flg_file14, flg_file15, flg_file16, flg_file17, flg_file18);

	return ret.navigate("upload.jsp");//跳转
};
function import_01(aryField, index) {//aryField第一个参数是当前行的数据（数组） index指的是行索引（第一行时index=0,第二行时index=1）........+1;

	if (index > 0) {

		var insertResult = db.change(//插入 删除用change ,检索用select;

			"IMPORT",
			"insertFile01",

			{
				"col0": aryField[0],
				"col1": aryField[1],
				"col2": aryField[2],
				"col3": aryField[3],
				"col4": aryField[4],
				"col5": aryField[5],
				"col6": aryField[6],
				"col7": aryField[7],
				"col8": aryField[8],
				"col9": aryField[9],
				"col10": aryField[10],
				"col11": aryField[11],
				"col12": aryField[12],
				"col13": aryField[13],
				"col14": aryField[14],
				"col15": aryField[15],
				"col16": aryField[16],
				"col17": aryField[17],
				"col18": aryField[18],
				"col19": aryField[19],
				"col20": aryField[20],
				"col21": aryField[21],
				"col22": aryField[22],
				"col23": aryField[23],
				"col24": aryField[24],
				"col25": aryField[25],
				"col26": aryField[26],
				"col27": aryField[27],
				"col28": aryField[28],
				"col29": aryField[29],
				"col30": aryField[30],
				"col31": aryField[31],
				"col32": aryField[32],
				"col33": aryField[33],
				"col34": aryField[34],
				"col35": aryField[35],
				"col36": aryField[36],
				"col37": aryField[37],
				"col38": aryField[38],
				"col39": aryField[39],
				"col40": aryField[40],
				"col41": aryField[41],
				"col42": aryField[41],
				"col43": aryField[43],
				"col44": SHOP_ID,
				"col45": registrationDate,
				"col46": registrationDate,
			}
		);//导入数据库
		num++;

	}
};
function import_02(aryField, index) {//aryField第一个参数是当前行的数据（数组） index指的是行索引（第一行时index=0,第二行时index=1）........+1;

	if (index > 0) {
		var insertResult = db.change(//插入 删除用change ,检索用select;
			"IMPORT",
			"insertFile02",
			{
				"col0": aryField[0],
				"col1": aryField[1],
				"col2": aryField[2],
				"col3": aryField[3],
				"col4": aryField[4],
				"col5": aryField[5],
				"col6": aryField[6],
				"col7": aryField[7],
				"col8": aryField[8],
				"col9": aryField[9],
				"col10": aryField[10],
				"col11": aryField[11],
				"col12": aryField[12],
				"col13": aryField[13],
				"col14": aryField[14],
				"col15": aryField[15],
				"col16": aryField[16],
				"col17": aryField[17],
				"col18": aryField[18],
				"col19": aryField[19],
				"col20": aryField[20],
				"col21": aryField[21],
				"col22": aryField[22],
				"col23": aryField[23],
				"col24": aryField[24],
				"col25": aryField[25],
				"col26": aryField[26],
				"col27": aryField[27],
				"col28": aryField[28],
				"col29": SHOP_ID,
				"col30": registrationDate,
				"col31": registrationDate,
			}
		);//导入数据库
		num++;
	}
};
function import_03(aryField, index) {//aryField第一个参数是当前行的数据（数组） index指的是行索引（第一行时index=0,第二行时index=1）........+1;

	if (index > 0) {
		var insertResult = db.change(
			"IMPORT",
			"insertFile03",
			{
				"col0": aryField[0],
				"col1": aryField[1],
				"col2": aryField[2],
				"col3": aryField[3],
				"col4": aryField[4],
				"col5": aryField[5],
				"col6": SHOP_ID,
				"col7": registrationDate,
				"col8": registrationDate,
			}
		);//导入数据库
		num++;
	}
};
function import_04(aryField, index) {//aryField第一个参数是当前行的数据（数组） index指的是行索引（第一行时index=0,第二行时index=1）........+1;

	if (index > 7) {

		var insertResult = db.change(//插入 删除用change ,检索用select;
			"IMPORT",
			"insertFile04",//加在这个后面？？？

			{
				"col0": aryField[0],
				"col1": aryField[1],
				"col2": aryField[2],
				"col3": aryField[3],
				"col4": aryField[4],
				"col5": aryField[5],
				"col6": aryField[6],
				"col7": aryField[7],
				"col8": aryField[8],
				"col9": aryField[9],
				"col10": aryField[10],
				"col11": aryField[11],
				"col12": aryField[12],
				"col13": aryField[13],
				"col14": aryField[14],
				"col15": aryField[15],
				"col16": aryField[16],
				"col17": aryField[17],
				"col18": aryField[18],
				"col19": aryField[19],
				"col20": aryField[20],
				"col21": aryField[21],
				"col22": aryField[22],
				"col23": aryField[23],
				"col24": aryField[24],
				"col25": aryField[25],
				"col26": aryField[26],
				"col27": aryField[27],				
				"col28": SHOP_ID,
				"col29": registrationDate,
				"col30": registrationDate
			}
		);//导入数据库
		num++;
	}
};
function import_05(aryField, index) {//aryField第一个参数是当前行的数据（数组） index指的是行索引（第一行时index=0,第二行时index=1）........+1;

	if (index > 0) {
		var insertResult = db.change(//插入 删除用change ,检索用select;
			"IMPORT",
			"insertFile05",
			{
				"col0": aryField[0],
				"col1": aryField[1],
				"col2": aryField[2],
				"col3": aryField[3],
				"col4": aryField[4],
				"col5": aryField[5],
				"col6": aryField[6],
				"col7": aryField[7],
				"col8": aryField[8],
				"col9": aryField[9],
				"col10": aryField[10],
				"col11": aryField[11],
				"col12": aryField[12],
				"col13": aryField[13],
				"col14": aryField[14],
				"col15": aryField[15],
				"col16": aryField[16],
				"col17": aryField[17],
				"col18": aryField[18],
				"col19": aryField[19],
				"col20": aryField[20],
				"col21": aryField[21],
				"col22": aryField[22],
				"col23": aryField[23],
				"col24": aryField[24],
				"col25": aryField[25],
				"col26": aryField[26],
				"col27": aryField[27],
				"col28": aryField[28],
				"col29": aryField[29],
				"col30": aryField[30],
				"col31": aryField[31],
				"col32": aryField[32],
				"col33": aryField[33],
				"col34": aryField[34],
				"col35": aryField[35],
				"col36": aryField[36],
				"col37": aryField[37],
				"col38": aryField[38],
				"col39": aryField[39],
				"col40": aryField[40],
				"col41": aryField[41],
				"col42": aryField[41],
				"col43": aryField[43],
				"col44": aryField[44],
				"col45": aryField[45],
				"col46": aryField[46],
				"col47": aryField[47],
				"col48": aryField[48],
				"col49": aryField[49],
				"col50": aryField[50],
				"col51": aryField[51],
				"col52": aryField[52],
				"col53": aryField[53],
				"col54": aryField[54],
				"col55": aryField[55],
				"col56": aryField[56],
				"col57": aryField[57],
				"col58": aryField[58],
				"col59": aryField[59],
				"col60": aryField[60],
				"col61": aryField[61],
				"col62": aryField[62],
				"col63": aryField[63],
				"col64": aryField[64],
				"col65": aryField[65],
				"col66": aryField[66],
				"col67": aryField[67],
				"col68": aryField[68],
				"col69": aryField[69],
				"col70": SHOP_ID,
				"col71": registrationDate,
				"col72": registrationDate,
			}
		);//导入数据库
		num++;
	}
};
// 第六个方法空的，没写 以后定义
function import_06(aryField, index) {//aryField第一个参数是当前行的数据（数组） index指的是行索引（第一行时index=0,第二行时index=1）........+1;

	// if(index > 0){
	// 	var insertResult = db.change(//插入 删除用change ,检索用select;
	// 		"IMPORT",
	// 		"insertFile07",//加在这个后面？？？
	// 		{
	// 			"col0":aryField[0],
	// 			"col1":aryField[1],
	// 			"col2":aryField[2],
	// 			"col3":aryField[3],
	// 			"col4":aryField[4],
	// 			"col5":aryField[5],
	// 			"col6":aryField[6],
	// 			"col7":aryField[7],
	// 			"col8":aryField[8],
	// 			"col9":aryField[9],
	// 			"col10":aryField[10],
	// 			"col11":aryField[11],
	// 			"col12":aryField[12],
	// 			"col13":aryField[13],
	// 			"col14":aryField[14],
	// 			"col15":aryField[15],
	// 			"col16":aryField[16],
	// 			"col17":aryField[17],
	// 			"col18":SHOP_ID,
	// 			"col19":registrationDate,
	// 			"col20":registrationDate,				
	// 		}
	// 	);//导入数据库
	//num++;
	// }
};
function import_07(aryField, index) {//aryField第一个参数是当前行的数据（数组） index指的是行索引（第一行时index=0,第二行时index=1）........+1;

	if (index > 0) {
		var insertResult = db.change(//插入 删除用change ,检索用select;
			"IMPORT",
			"insertFile07",//加在这个后面？？？
			{
				"col0": aryField[0],
				"col1": aryField[1],
				"col2": aryField[2],
				"col3": aryField[3],
				"col4": aryField[4],
				"col5": aryField[5],
				"col6": aryField[6],
				"col7": aryField[7],
				"col8": aryField[8],
				"col9": aryField[9],
				"col10": aryField[10],
				"col11": aryField[11],
				"col12": aryField[12],
				"col13": aryField[13],
				"col14": aryField[14],
				"col15": aryField[15],
				"col16": aryField[16],
				"col17": aryField[17],
				"col18": SHOP_ID,
				"col19": registrationDate,
				"col20": registrationDate,
			}
		);//导入数据库
		num++;
	}
};
function import_08(aryField, index) {//aryField第一个参数是当前行的数据（数组） index指的是行索引（第一行时index=0,第二行时index=1）........+1;

	if (index > 0) {
		var insertResult = db.change(//插入 删除用change ,检索用select;
			"IMPORT",
			"insertFile08",//加在这个后面？？？
			{
				"col0": aryField[0],
				"col1": aryField[1],
				"col2": aryField[2],
				"col3": aryField[3],
				"col4": aryField[4],
				"col5": aryField[5],
				"col6": aryField[6],
				"col7": aryField[7],
				"col8": aryField[8],
				"col9": aryField[9],
				"col10": aryField[10],
				"col11": aryField[11],
				"col12": aryField[12],
				"col13": aryField[13],
				"col14": SHOP_ID,
				"col15": registrationDate,
				"col16": registrationDate,
			}
		);//导入数据库
		num++;
	}
};
function import_09(aryField, index) {//aryField第一个参数是当前行的数据（数组） index指的是行索引（第一行时index=0,第二行时index=1）........+1;

	if (index > 0) {
		var insertResult = db.change(//插入 删除用change ,检索用select;
			"IMPORT",
			"insertFile09",//加在这个后面？？？

			{
				"col0": aryField[0],
				"col1": aryField[1],
				"col2": aryField[2],
				"col3": aryField[3],
				"col4": aryField[4],
				"col5": aryField[5],
				"col6": aryField[6],
				"col7": aryField[7],
				"col8": aryField[8],
				"col9": aryField[9],
				"col10": aryField[10],
				"col11": aryField[11],
				"col12": aryField[12],
				"col13": aryField[13],
				"col14": aryField[14],
				"col15": aryField[15],
				"col16": aryField[16],
				"col17": SHOP_ID,
				"col18": registrationDate,
				"col19": registrationDate,

			}
		);//导入数据库
		num++;
	}
};
function import_10(aryField, index) {//aryField第一个参数是当前行的数据（数组） index指的是行索引（第一行时index=0,第二行时index=1）........+1;

	if (index > 0) {
		var insertResult = db.change(//插入 删除用change ,检索用select;
			"IMPORT",
			"insertFile10",//加在这个后面？？？
			{
				"col0": aryField[0],
				"col1": aryField[1],
				"col2": aryField[2],
				"col3": aryField[3],
				"col4": aryField[4],
				"col5": aryField[5],
				"col6": aryField[6],
				"col7": aryField[7],
				"col8": aryField[8],
				"col9": aryField[9],
				"col10": aryField[10],
				"col11": aryField[11],
				"col12": aryField[12],
				"col13": aryField[13],
				"col14": aryField[14],
				"col15": aryField[15],
				"col16": aryField[16],
				"col17": aryField[17],
				"col18": aryField[18],
				"col19": aryField[19],
				"col20": aryField[20],
				"col21": aryField[21],
				"col22": SHOP_ID,
				"col23": registrationDate,
				"col24": registrationDate,
			}
		);//导入数据库
		num++;
	}
};
function import_11(aryField, index) {//aryField第一个参数是当前行的数据（数组） index指的是行索引（第一行时index=0,第二行时index=1）........+1;

	if (index > 0) {
		var insertResult = db.change(//插入 删除用change ,检索用select;
			"IMPORT",
			"insertFile11",//加在这个后面？？？
			{
				"col0": aryField[0],
				"col1": aryField[1],
				"col2": aryField[2],
				"col3": aryField[3],
				"col4": aryField[4],
				"col5": aryField[5],
				"col6": aryField[6],
				"col7": aryField[7],
				"col8": aryField[8],
				"col9": aryField[9],
				"col10": aryField[10],
				"col11": aryField[11],
				"col12": aryField[12],
				"col13": aryField[13],
				"col14": aryField[14],
				"col15": aryField[15],
				"col16": aryField[16],
				"col17": aryField[17],
				"col18": aryField[18],
				"col19": aryField[19],
				"col20": aryField[20],
				"col21": aryField[21],
				"col22": aryField[22],
				"col23": aryField[23],
				"col24": aryField[24],
				"col25": aryField[25],
				"col26": aryField[26],
				"col27": aryField[27],
				"col28": aryField[28],
				"col29": aryField[29],
				"col30": aryField[30],
				"col31": aryField[31],
				"col32": aryField[32],
				"col33": aryField[33],
				"col34": aryField[34],
				"col35": aryField[35],
				"col36": aryField[36],
				"col37": aryField[37],
				"col38": aryField[38],
				"col39": aryField[39],
				"col40": aryField[40],
				"col41": aryField[41],
				"col42": aryField[41],
				"col43": aryField[43],
				"col44": aryField[44],
				"col45": aryField[45],
				"col46": aryField[46],
				"col47": aryField[47],
				"col48": aryField[48],
				"col49": SHOP_ID,
				"col50": registrationDate,
				"col51": registrationDate,
			}
		);//导入数据库
		num++;
	}
};
function import_12(aryField, index) {//aryField第一个参数是当前行的数据（数组） index指的是行索引（第一行时index=0,第二行时index=1）........+1;

	if (index > 0) {
		var insertResult = db.change(//插入 删除用change ,检索用select;
			"IMPORT",
			"insertFile12",//加在这个后面？？？
			{
				"col0": aryField[0],
				"col1": aryField[1],
				"col2": aryField[2],
				"col3": aryField[3],
				"col4": aryField[4],
				"col5": aryField[5],
				"col6": aryField[6],
				"col7": aryField[7],
				"col8": aryField[8],
				"col9": aryField[9],
				"col10": aryField[10],
				"col11": aryField[11],
				"col12": aryField[12],
				"col13": aryField[13],
				"col14": aryField[14],
				"col15": SHOP_ID,
				"col16": registrationDate,
				"col17": registrationDate,
			}
		);//导入数据库
		num++;
	}
};
function import_13(aryField, index) {//aryField第一个参数是当前行的数据（数组） index指的是行索引（第一行时index=0,第二行时index=1）........+1;

	if (index > 0) {
		var insertResult = db.change(//插入 删除用change ,检索用select;
			"IMPORT",
			"insertFile13",//加在这个后面？？？
			{
				"col0": aryField[0],
				"col1": aryField[1],
				"col2": aryField[2],
				"col3": aryField[3],
				"col4": aryField[4],
				"col5": aryField[5],
				"col6": aryField[6],
				"col7": aryField[7],
				"col8": aryField[8],
				"col9": aryField[9],
				"col10": aryField[10],
				"col11": aryField[11],
				"col12": aryField[12],
				"col13": aryField[13],
				"col14": aryField[14],
				"col15": aryField[15],
				"col16": aryField[16],
				"col17": aryField[17],
				"col18": aryField[18],
				"col19": aryField[19],
				"col20": aryField[20],
				"col21": aryField[21],
				"col22": aryField[22],
				"col23": aryField[23],
				"col24": aryField[24],
				"col25": aryField[25],
				"col26": aryField[26],
				"col27": SHOP_ID,
				"col28": registrationDate,
				"col29": registrationDate,
			}
		);//导入数据库
		num++;
	}
};
function import_14(aryField, index) {//aryField第一个参数是当前行的数据（数组） index指的是行索引（第一行时index=0,第二行时index=1）........+1;

	if (index > 0) {
		var insertResult = db.change(//插入 删除用change ,检索用select;
			"IMPORT",
			"insertFile14",//加在这个后面？？？
			{
				"col0": aryField[0],
				"col1": aryField[1],
				"col2": aryField[2],
				"col3": aryField[3],
				"col4": aryField[4],
				"col5": aryField[5],
				"col6": aryField[6],
				"col7": aryField[7],
				"col8": aryField[8],
				"col9": aryField[9],
				"col10": aryField[10],
				"col11": aryField[11],
				"col12": aryField[12],
				"col13": aryField[13],
				"col14": aryField[14],
				"col15": aryField[15],
				"col16": aryField[16],
				"col17": aryField[17],
				"col18": aryField[18],
				"col19": aryField[19],
				"col20": aryField[20],
				"col21": aryField[21],
				"col22": aryField[22],
				"col23": aryField[23],
				"col24": aryField[24],
				"col25": SHOP_ID,
				"col26": registrationDate,
				"col27": registrationDate,
			}
		);//导入数据库
		num++;
	}
};
function import_15(aryField, index) {//aryField第一个参数是当前行的数据（数组） index指的是行索引（第一行时index=0,第二行时index=1）........+1;

	if (index > 0) {
		var insertResult = db.change(//插入 删除用change ,检索用select;
			"IMPORT",
			"insertFile15",//加在这个后面？？？
			{
				"col0": aryField[0],
				"col1": aryField[1],
				"col2": aryField[2],
				"col3": aryField[3],
				"col4": aryField[4],
				"col5": aryField[5],
				"col6": aryField[6],
				"col7": aryField[7],
				"col8": aryField[8],
				"col9": aryField[9],
				"col10": aryField[10],
				"col11": aryField[11],
				"col12": aryField[12],
				"col13": aryField[13],
				"col14": aryField[14],
				"col15": SHOP_ID,
				"col16": registrationDate,
				"col17": registrationDate,
			}
		);//导入数据库
		num++;
	}
};
function import_16(aryField, index) {//aryField第一个参数是当前行的数据（数组） index指的是行索引（第一行时index=0,第二行时index=1）........+1;

	if (index > 0) {
		var insertResult = db.change(//插入 删除用change ,检索用select;
			"IMPORT",
			"insertFile16",//加在这个后面？？？
			{
				"col0": aryField[0],
				"col1": aryField[1],
				"col2": aryField[2],
				"col3": aryField[3],
				"col4": aryField[4],
				"col5": aryField[5],
				"col6": aryField[6],
				"col7": aryField[7],
				"col8": aryField[8],
				"col9": aryField[9],
				"col10": aryField[10],
				"col11": aryField[11],
				"col12": SHOP_ID,
				"col13": registrationDate,
				"col14": registrationDate,
			}
		);//导入数据库
		num++;
	}
};
function import_17(aryField, index) {//aryField第一个参数是当前行的数据（数组） index指的是行索引（第一行时index=0,第二行时index=1）........+1;

	if (index > 0) {
		var insertResult = db.change(//插入 删除用change ,检索用select;
			"IMPORT",
			"insertFile17",//加在这个后面？？？
			{
				"col0": aryField[0],
				"col1": aryField[1],
				"col2": aryField[2],
				"col3": aryField[3],
				"col4": aryField[4],
				"col5": aryField[5],
				"col6": aryField[6],
				"col7": aryField[7],
				"col8": aryField[8],
				"col9": aryField[9],
				"col10": aryField[10],
				"col11": aryField[11],
				"col12": aryField[12],
				"col13": aryField[13],
				"col14": aryField[14],
				"col15": aryField[15],
				"col16": SHOP_ID,
				"col17": registrationDate,
				"col18": registrationDate,
			}
		);//导入数据库
		num++;
	}
};
function import_18(aryField, index) {//aryField第一个参数是当前行的数据（数组） index指的是行索引（第一行时index=0,第二行时index=1）........+1;

	if (index > 0) {
		var insertResult = db.change(//插入 删除用change ,检索用select;
			"IMPORT",
			"insertFile18",//加在这个后面？？？
			{
				"col0": aryField[0],
				"col1": aryField[1],
				"col2": aryField[2],
				"col3": aryField[3],
				"col4": aryField[4],
				"col5": aryField[5],
				"col6": aryField[6],
				"col7": aryField[7],
				"col8": aryField[8],
				"col9": aryField[9],
				"col10": aryField[10],
				"col11": aryField[11],
				"col12": aryField[12],
				"col13": aryField[13],
				"col14": aryField[14],
				"col15": SHOP_ID,
				"col16": registrationDate,
				"col17": registrationDate,
			}
		);//导入数据库
		num++;
	}
};
function saveHistory(shopId, fileId, importData, ct) {

	var historyResult = db.change(
		"IMPORT",
		"insertHistory",
		{
			"col0": shopId,
			"col1": fileId,
			"col2": importData,
			"col3": ct
		}
	);
};
function formatNumber(str) {

	if (str == null || str == "") {
		return str;
	} else {
		return str.replaceAll(",", "");
	}

};