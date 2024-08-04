var study_test_add_save = {};
study_test_add_save.name = "テスト情報管理画面保存";
study_test_add_save.paramsFormat = {
	"#opt_academicyear":null,
	"#text_name":null,
	"#text_to":null,
	"#text_from":null,
	"#td_content1":null,
	"#opt":null,
	"comprehensive":null,
	"monotechnical":null,
	"tags":null,
	"seq":null,
	
};

study_test_add_save.fire = function (params) {

	var ret = new Result();
	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	var shopid = getShopId();
	// 学年
	var academicyear = params["#opt_academicyear"];
	// 名称
	var tname = params["#text_name"];
	// 期間
	var to = params["#text_to"];
	var from = params["#text_from"];
	// 内容
	var content1 = params["#td_content1"];
	var opt = params["#opt"];

	// 	総合成績
	var comprehensivemap = params["comprehensive"];
	var comprehensive = comprehensivemap["table_inputdialog2"]
	// 单科
	var monotechnical = params["monotechnical"];
	// 单科目录
	var tags = params["tags"];

	 
	if(opt == 'new'){
		
		// seq
		var newData =new Date().format("yyyyMMdd-HHmmss");
		// TRN_テスト情報
		var insertResult1 = db.change(
			"STUDYTEST",
			"savestudytest",
			{
				"seq":newData,
				"academicyear":academicyear,
				"tname":tname,
				"to":to,
				"from":from,
				"img" :content1, 
				"shopid": shopid,
			}
		);
		// 综合
		if(comprehensive[0] != ''){
			var insertResult2 = db.change(
				"STUDYTEST",
				"savestudytestcomprehensive",
				{
					"seq":newData,
					"score":comprehensive[0],
					"fulls":comprehensive[1],
					"gradeaverage":comprehensive[2],
					"yearaverage":comprehensive[3], 
					"academicrank1":comprehensive[4],
					"academicrank2":comprehensive[5],
					"academicyear1":comprehensive[6],
					"academicyear2":comprehensive[7], 
					"shopid": shopid,
				}
			);
		}
		// 单科
		if(tags.length>0 && tags != ''){
			for(var i=0;i<tags.length;i++){
				var insertResult3 = db.change(
					"STUDYTEST",
					"savestudytestmonotechnical",
					{
						"seq":newData,
						"tags":tags[i],
						"col1":monotechnical[tags[i]][0],
						"col2":monotechnical[tags[i]][1],
						"col3":monotechnical[tags[i]][2],
						"col4":monotechnical[tags[i]][3],
						"col5":monotechnical[tags[i]][4],
						"col6":monotechnical[tags[i]][5],
						"col7":monotechnical[tags[i]][6],
						"col8":monotechnical[tags[i]][7],
						"col9":monotechnical[tags[i]][8],
						"col10":monotechnical[tags[i]][9], 
						"shopid": shopid,
					}
				);
			}
		}
	}

	if(opt == 'update'){
		var seq = params["seq"];
		// TRN_テスト情報
		var updateResult1 = db.change(
			"STUDYTEST",
			"updatestudytest",
			{
				"seq":seq,
				"academicyear":academicyear,
				"tname":tname,
				"to":to,
				"from":from,
				"img" :content1, 
				"shopid": shopid 
			}
		);
		// 综合
		
		if(comprehensive[0] != ''){
			var updateResult2 = db.change(
				"STUDYTEST",
				"updatestudytestcomprehensive",
				{
					"seq":seq,
					"score":comprehensive[0],
					"fulls":comprehensive[1],
					"gradeaverage":comprehensive[2],
					"yearaverage":comprehensive[3], 
					"academicrank1":comprehensive[4],
					"academicrank2":comprehensive[5],
					"academicyear1":comprehensive[6],
					"academicyear2":comprehensive[7], 
					"shopid": shopid
				}
			);
		}else{
			// 单科
			if(tags.length>0 && tags != ''){
				for(var i=0;i<tags.length;i++){
					var updateResult3 = db.change(
						"STUDYTEST",
						"updatestudytestmonotechnical",
						{
							"seq":seq,
							"tags":tags[i],
							"col1":monotechnical[tags[i]][0],
							"col2":monotechnical[tags[i]][1],
							"col3":monotechnical[tags[i]][2],
							"col4":monotechnical[tags[i]][3],
							"col5":monotechnical[tags[i]][4],
							"col6":monotechnical[tags[i]][5],
							"col7":monotechnical[tags[i]][6],
							"col8":monotechnical[tags[i]][7],
							"col9":monotechnical[tags[i]][8],
							"col10":monotechnical[tags[i]][9], 
							"shopid": shopid,
						}
					);
				}
			}
		}
	
	}


 
	ret.eval(" study_test_inputdialog.dialog('close');");  
	ret.eval(" init();");  
	// 画面へ結果を返す
	return ret;

};
