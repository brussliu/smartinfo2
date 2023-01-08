var global = {};
global.name = "システム初期化";

//var SHOP_ID = session.get("SHOP_ID");
var SHOP_ID = "";

/**
 * グローバルイベント実行関数
 */
global.fire = function () {



};
function excute(flg_file01, flg_file02, flg_file03, flg_file04, flg_file05, flg_file06,
				flg_file07, flg_file08, flg_file09, flg_file10, flg_file11, flg_file12,
				flg_file13, flg_file14, flg_file15, flg_file16, flg_file17, flg_file18) {
					
					// --------------------------------↓↓↓確認済↓↓↓--------------------------------
					excute_02_r1();
					excute_11_r1();
					excute_12_r1();

					excute_04_r2();
					excute_04_r3();
					excute_14_r4();
					excute_15_r5();

					excute_02_h1();
					excute_04_h2();
					excute_14_h3();
					excute_15_h4();

					excute_01_m1();

					excute_m1_m2();
					excute_02_m2();
					excute_03_m2();

					excute_m1_m3();
					excute_r1_m3();




					// --------------------------------↑↑↑確認済↑↑↑--------------------------------

					// --------------------------------↓↓↓実装中↓↓↓--------------------------------



					// excute_m1_m5();
					// excute_13_m5();


							
}
function excute_15_r5() {
	SHOP_ID = session.get("SHOP_ID");
	var nowTime = new Date();

	var updateResult = db.change(
		"IMPORT",
		"update_15_r5",
		{
			"shopId": SHOP_ID, 
			"nowTime": nowTime
		}
	);

	var insertResult = db.change(
		"IMPORT",
		"insert_15_r5",
		{
			"shopId": SHOP_ID,
			"nowTime": nowTime
		}
	);
}

function excute_14_r4() {
	SHOP_ID = session.get("SHOP_ID");
	var now = new Date();
	

	var updateResult = db.change(
		"IMPORT",
		"update_14_r4",
		{
			"shopId": SHOP_ID, 
			"nowTime": now
		}
	);

	var insertResult = db.change(
		"IMPORT",
		"insert_14_r4",
		{
			"shopId": SHOP_ID,
			"nowTime": now
		}
	);
}

function excute_m1_m5() {

	SHOP_ID = session.get("SHOP_ID");

	var updateResult = db.change("IMPORT", "excute_m1_m5", {"shopId": SHOP_ID});

}
function excute_13_m5() {

	SHOP_ID = session.get("SHOP_ID");

	var updateResult = db.change("IMPORT", "excute_13_m5", {"shopId": SHOP_ID});

}

function excute_m1_m3() {

	SHOP_ID = session.get("SHOP_ID");

	var updateResult = db.change("IMPORT", "excute_m1_m3", {"shopId": SHOP_ID});

}

function excute_r1_m3() {

	SHOP_ID = session.get("SHOP_ID");

	var updateResult1 = db.change("IMPORT", "excute_r1_m3_01", {"shopId": SHOP_ID});
	var updateResult2 = db.change("IMPORT", "excute_r1_m3_02", {"shopId": SHOP_ID});
	var updateResult3 = db.change("IMPORT", "excute_r1_m3_03", {"shopId": SHOP_ID});
	var updateResult4 = db.change("IMPORT", "excute_r1_m3_04", {"shopId": SHOP_ID});
	var updateResult5 = db.change("IMPORT", "excute_r1_m3_05", {"shopId": SHOP_ID});
	var updateResult6 = db.change("IMPORT", "excute_r1_m3_06", {"shopId": SHOP_ID});
	var updateResult7 = db.change("IMPORT", "excute_r1_m3_07", {"shopId": SHOP_ID});

}

function excute_m1_m2() {

	SHOP_ID = session.get("SHOP_ID");

	var updateResult = db.change("IMPORT", "excute_m1_m2", {"shopId": SHOP_ID});

}

function excute_02_m2() {

	SHOP_ID = session.get("SHOP_ID");

	var updateResult = db.change("IMPORT", "excute_02_m2", {"shopId": SHOP_ID});

}

function excute_03_m2() {

	SHOP_ID = session.get("SHOP_ID");

	var updateResult = db.change("IMPORT", "excute_03_m2", {"shopId": SHOP_ID});

}

function excute_01_m1() {

	SHOP_ID = session.get("SHOP_ID");

	var today = new Date();
	var nowTime = today.format("yyyy-MM-dd HH:mm:ss");

	// var selectResult = db.select(
	// 	"IMPORT",
	// 	"excute_01_m1_00",
	// 	{
	// 		"shopId": SHOP_ID
	// 	}
	// ).getSingle();

	// var backDateTime = selectResult["backupdatetime"];

	// backDateTime.debug("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");

	var updateResult01 = db.change("IMPORT", "excute_01_m1_01", {"shopId": SHOP_ID, "nowTime": today});
	var updateResult02 = db.change("IMPORT", "excute_01_m1_02", {"shopId": SHOP_ID, "nowTime": today});
	var updateResult03 = db.change("IMPORT", "excute_01_m1_03", {"shopId": SHOP_ID, "nowTime": today});
	var updateResult04 = db.change("IMPORT", "excute_01_m1_04", {"shopId": SHOP_ID, "nowTime": today});
	var updateResult05 = db.change("IMPORT", "excute_01_m1_05", {"shopId": SHOP_ID, "nowTime": today});

}



function excute_15_r3() {
	SHOP_ID = session.get("SHOP_ID");
	var today = new Date();
	var nowTime = today.format("yyyy-MM-dd HH:mm:ss");

	var updateResult = db.change(
		"IMPORT",
		"update_15_r3",
		{
			"shopId": SHOP_ID, 
			"nowTime": nowTime
		}
	);

	var insertResult = db.change(
		"IMPORT",
		"insert_15_r3",
		{
			"shopId": SHOP_ID,
			"nowTime": nowTime
		}
	);
}
function excute_14_r2() {
	SHOP_ID = session.get("SHOP_ID");
	var now = new Date();
	

	var updateResult = db.change(
		"IMPORT",
		"update_14_r2",
		{
			"shopId": SHOP_ID, 
			"nowTime": now
		}
	);

	var insertResult = db.change(
		"IMPORT",
		"insert_14_r2",
		{
			"shopId": SHOP_ID,
			"nowTime": now
		}
	);
}


function excute_04_r2() {
	SHOP_ID = session.get("SHOP_ID");
	var now = new Date();

	var updateResult = db.change(
		"IMPORT",
		"update_04_r2",
		{
			"shopId": SHOP_ID, 
			"nowTime": now
		}
	);

	var insertResult = db.change(
		"IMPORT",
		"insert_04_r2",
		{
			"shopId": SHOP_ID,
			"nowTime": now
		}
	);
}

function excute_04_r3() {
	SHOP_ID = session.get("SHOP_ID");
	var now = new Date();

	var insertResult = db.change(
		"IMPORT",
		"insert_04_r3",
		{
			"shopId": SHOP_ID,
			"nowTime": now
		}
	);
}


function excute_02_r1() {
	SHOP_ID = session.get("SHOP_ID");
	var now = new Date();

	var updateResult = db.change(
		"IMPORT",
		"update_02_r1",
		{
			"shopId": SHOP_ID, 
			"nowTime": now
		}
	);

	var insertResult = db.change(
		"IMPORT",
		"insert_02_r1",
		{
			"shopId": SHOP_ID,
			"nowTime": now
		}
	);
}
// function excute_04_r1() {
// 	SHOP_ID = session.get("SHOP_ID");
// 	var now = new Date();

// 	var updateResult = db.change(
// 		"IMPORT",
// 		"update_04_r1",
// 		{
// 			"shopId": SHOP_ID, 
// 			"nowTime": now
// 		}
// 	);

// 	var insertResult = db.change(
// 		"IMPORT",
// 		"insert_04_r1",
// 		{
// 			"shopId": SHOP_ID,
// 			"nowTime": now
// 		}
// 	);
// }
function excute_11_r1() {
	SHOP_ID = session.get("SHOP_ID");
	var now = new Date();

	var updateResult = db.change(
		"IMPORT",
		"update_11_r1",
		{
			"shopId": SHOP_ID, 
			"nowTime": now
		}
	);

	var insertResult = db.change(
		"IMPORT",
		"insert_11_r1",
		{
			"shopId": SHOP_ID,
			"nowTime": now
		}
	);
}
function excute_12_r1() {
	SHOP_ID = session.get("SHOP_ID");
	var now = new Date();

	var updateResult = db.change(
		"IMPORT",
		"update_12_r1",
		{
			"shopId": SHOP_ID, 
			"nowTime": now
		}
	);

	var insertResult = db.change(
		"IMPORT",
		"insert_12_r1",
		{
			"shopId": SHOP_ID,
			"nowTime": now
		}
	);
}


function excute_02_h1() {
	    SHOP_ID = session.get("SHOP_ID");
	var today = new Date();
	var nowTime = today.format("yyyy-MM-dd HH:mm:ss");

	var deleteResult = db.change(//插入 删除用change ,检索用select;
		"IMPORT",
		"deleteFile_02_h1",
		{
			 "shopId": SHOP_ID //放这个的意思是什么

		}
	);//导入数据去重数据

	var insertResult = db.change(//插入 删除用change ,检索用select;
		"IMPORT",
		"insertFile_02_h1",
		{
			"shopId": SHOP_ID,
			"nowTime": nowTime
		}
	);//导入数据库
}
function excute_04_h2() {
	SHOP_ID = session.get("SHOP_ID");
	var today = new Date();
	var nowTime = today.format("yyyy-MM-dd HH:mm:ss");

	var deleteResult = db.change(//插入 删除用change ,检索用select;
		"IMPORT",
		"deleteFile_04_h2",
		{
			"shopId": SHOP_ID

		}
	);//导入数据去重数据

	var insertResult = db.change(//插入 删除用change ,检索用select;
		"IMPORT",
		"insertFile_04_h2",
		{
			"shopId": SHOP_ID,
			"nowTime": nowTime
		}
	);//导入数据库

}
function excute_14_h3() {
	SHOP_ID = session.get("SHOP_ID");
	var today = new Date();
	var nowTime = today.format("yyyy-MM-dd HH:mm:ss");

	var deleteResult = db.change(//插入 删除用change ,检索用select;
		"IMPORT",
		"deleteFile_14_h3",
		{
			"shopId": SHOP_ID

		}
	);//导入数据去重数据

	var insertResult = db.change(//插入 删除用change ,检索用select;
		"IMPORT",
		"insertFile_14_h3",
		{
			"shopId": SHOP_ID,
			"nowTime": nowTime
		}
	);//导入数据库

}
function excute_15_h4() {
	SHOP_ID = session.get("SHOP_ID");
	var today = new Date();
	var nowTime = today.format("yyyy-MM-dd HH:mm:ss");

	var deleteResult = db.change(//插入 删除用change ,检索用select;
		"IMPORT",
		"deleteFile_15_h4",
		{
			"shopId": SHOP_ID

		}
	);//导入数据去重数据

	var insertResult = db.change(//插入 删除用change ,检索用select;
		"IMPORT",
		"insertFile_15_h4",
		{
			"shopId": SHOP_ID,
			"nowTime": nowTime
		}
	);//导入数据库

}





