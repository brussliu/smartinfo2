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
		

		
}
function excute_02_r1() {
	SHOP_ID = session.get("SHOP_ID");
	var today = new Date();
	var nowTime = today.format("yyyy-MM-dd HH:mm:ss");

	var updateResult = db.change(
		"IMPORT",
		"update_02_r1",
		{
			"shopId": SHOP_ID, 
			"nowTime": nowTime
		}
	);

	var insertResult = db.change(
		"IMPORT",
		"insert_02_r1",
		{
			"shopId": SHOP_ID,
			"nowTime": nowTime
		}
	);
}
function excute_04_r1() {
	SHOP_ID = session.get("SHOP_ID");
	var today = new Date();
	var nowTime = today.format("yyyy-MM-dd HH:mm:ss");

	var updateResult = db.change(
		"IMPORT",
		"update_04_r1",
		{
			"shopId": SHOP_ID, 
			"nowTime": nowTime
		}
	);

	var insertResult = db.change(
		"IMPORT",
		"insert_04_r1",
		{
			"shopId": SHOP_ID,
			"nowTime": nowTime
		}
	);
}
function excute_11_r1() {
	SHOP_ID = session.get("SHOP_ID");
	var today = new Date();
	var nowTime = today.format("yyyy-MM-dd HH:mm:ss");

	var updateResult = db.change(
		"IMPORT",
		"update_11_r1",
		{
			"shopId": SHOP_ID, 
			"nowTime": nowTime
		}
	);

	var insertResult = db.change(
		"IMPORT",
		"insert_11_r1",
		{
			"shopId": SHOP_ID,
			"nowTime": nowTime
		}
	);
}
function excute_12_r1() {
	SHOP_ID = session.get("SHOP_ID");
	var today = new Date();
	var nowTime = today.format("yyyy-MM-dd HH:mm:ss");

	var updateResult = db.change(
		"IMPORT",
		"update_12_r1",
		{
			"shopId": SHOP_ID, 
			"nowTime": nowTime
		}
	);

	var insertResult = db.change(
		"IMPORT",
		"insert_12_r1",
		{
			"shopId": SHOP_ID,
			"nowTime": nowTime
		}
	);
}

function h1() {
	    SHOP_ID = session.get("SHOP_ID");
	var today = new Date();
	var nowTime = today.format("yyyy-MM-dd HH:mm:ss");

	var deleteResult = db.change(//插入 删除用change ,检索用select;
		"IMPORT",
		"deleteFile_h1",
		{
			 "shopId": SHOP_ID //放这个的意思是什么

		}
	);//导入数据去重数据

	var insertResult = db.change(//插入 删除用change ,检索用select;
		"IMPORT",
		"insertFile_h1",
		{
			"shopId": SHOP_ID,
			"nowTime": nowTime
		}
	);//导入数据库
}
function h2() {
	SHOP_ID = session.get("SHOP_ID");
	var today = new Date();
	var nowTime = today.format("yyyy-MM-dd HH:mm:ss");

	var deleteResult = db.change(//插入 删除用change ,检索用select;
		"IMPORT",
		"deleteFile_h2",
		{
			"shopId": SHOP_ID

		}
	);//导入数据去重数据

	var insertResult = db.change(//插入 删除用change ,检索用select;
		"IMPORT",
		"insertFile_h2",
		{
			"shopId": SHOP_ID,
			"nowTime": nowTime
		}
	);//导入数据库

}
function h3() {
	SHOP_ID = session.get("SHOP_ID");
	var today = new Date();
	var nowTime = today.format("yyyy-MM-dd HH:mm:ss");

	var deleteResult = db.change(//插入 删除用change ,检索用select;
		"IMPORT",
		"deleteFile_h3",
		{
			"shopId": SHOP_ID

		}
	);//导入数据去重数据

	var insertResult = db.change(//插入 删除用change ,检索用select;
		"IMPORT",
		"insertFile_h3",
		{
			"shopId": SHOP_ID,
			"nowTime": nowTime
		}
	);//导入数据库

}
function h4() {
	SHOP_ID = session.get("SHOP_ID");
	var today = new Date();
	var nowTime = today.format("yyyy-MM-dd HH:mm:ss");

	var deleteResult = db.change(//插入 删除用change ,检索用select;
		"IMPORT",
		"deleteFile_h4",
		{
			"shopId": SHOP_ID

		}
	);//导入数据去重数据

	var insertResult = db.change(//插入 删除用change ,检索用select;
		"IMPORT",
		"insertFile_h4",
		{
			"shopId": SHOP_ID,
			"nowTime": nowTime
		}
	);//导入数据库

}





