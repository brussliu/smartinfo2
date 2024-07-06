var study_word_downloadvoice = {};
study_word_downloadvoice.name = "単語テスト開始";
study_word_downloadvoice.paramsFormat = {
	"#opt_book" : null,
	"#opt_classification" : null,
};

study_word_downloadvoice.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	var book = params["#opt_book"];
	var classification = params["#opt_classification"];

	//  检索
	var selectResult = db.select(
		"STUDY",
		"selectWord",
		{
			book : book,
			dayfrom : classification,
			dayto : classification
		}
	).getArray();


	var mp3_path = "D:/apache-tomcat-9.0.30/webapps/smartinfo2/mp3/";

	// 単語テスト詳細情報
	for(var i = 0;i < selectResult.length;i++){

		var book = selectResult[i]["book"];
		var classification = selectResult[i]["classification"];
		var wordseq = selectResult[i]["seq"];

		// var type = "";
		var word_e = selectResult[i]["word_e"] == null ? "" : selectResult[i]["word_e"].replaceAll(" ", "%20").replaceAll("'", "%27").replaceAll("～", "~");
		var sen1_e = selectResult[i]["sen1_e"] == null ? "" : selectResult[i]["sen1_e"].replaceAll(" ", "%20").replaceAll("'", "%27").replaceAll("～", "~");
		var sen2_e = selectResult[i]["sen2_e"] == null ? "" : selectResult[i]["sen2_e"].replaceAll(" ", "%20").replaceAll("'", "%27").replaceAll("～", "~");
	
		var path = "D://apache-tomcat-9.0.30/webapps/smartinfo2/mp3/" + book + "/" + classification + "/";

		//////////////////////////////////////////////////////////////////////////////////////////
		var name0 = wordseq + "-word-0.mp3";
		var name1 = wordseq + "-word-1.mp3";
		if (!absfile.exists(path + name0) || !absfile.exists(path + name1)){
			if(word_e != null && word_e != ''){
				var args = new Array();

				args[0] = mp3_path;
				args[1] = book;
				args[2] = classification;
				args[3] = wordseq;
				args[4] = word_e;
				args[5] = "word";

				excuteJar("OptEnglishVoice",args);
			}
		}
		//////////////////////////////////////////////////////////////////////////////////////////
		var name0 = wordseq + "-sen1-0.mp3";
		var name1 = wordseq + "-sen1-1.mp3";
		if (!absfile.exists(path + name0) || !absfile.exists(path + name1)){
			if(sen1_e != null && sen1_e != ''){
				var args = new Array();

				args[0] = mp3_path;
				args[1] = book;
				args[2] = classification;
				args[3] = wordseq;
				args[4] = sen1_e;
				args[5] = "sen1";

				excuteJar("OptEnglishVoice",args);
			}
		}
		//////////////////////////////////////////////////////////////////////////////////////////
		var name0 = wordseq + "-sen2-0.mp3";
		var name1 = wordseq + "-sen2-1.mp3";
		if (!absfile.exists(path + name0) || !absfile.exists(path + name1)){
			if(sen2_e != null && sen2_e != ''){
				var args = new Array();

				args[0] = mp3_path;
				args[1] = book;
				args[2] = classification;
				args[3] = wordseq;
				args[4] = sen2_e;
				args[5] = "sen2";

				excuteJar("OptEnglishVoice",args);
			}
		}
		//////////////////////////////////////////////////////////////////////////////////////////
		// if (!absfile.exists(path)){
		// 	absfile.makeDir(path);
		// }
		
		// type = "0";

		// name = wordseq + "-" + type + "-" + "word" + ".mp3";
		// if (!absfile.exists(path + name)){
		// 	if(word_e != null && word_e != ''){
		// 		excuteClass("start", [mp3_path, book, classification, wordseq, "word",type,word_e]);
		// 	}
		// }

		// name = wordseq + "-" + type + "-" + "sen1" + ".mp3";
		// if (!absfile.exists(path + name)){
		// 	if(sen1_e != null && sen1_e != ''){
		// 		excuteClass("start", [mp3_path, book, classification, wordseq, "sen1",type,sen1_e]);
		// 	}
		// }

		// name = wordseq + "-" + type + "-" + "sen2" + ".mp3";
		// if (!absfile.exists(path + name)){
		// 	if(sen2_e != null && sen2_e != ''){
		// 		excuteClass("start", [mp3_path, book, classification, wordseq, "sen2",type,sen2_e]);
		// 	}
		// }

		// type = "1";
		// name = wordseq + "-" + type + "-" + "word" + ".mp3";
		// if (!absfile.exists(path + name)){
		// 	if(word_e != null && word_e != ''){
		// 		excuteClass("start", [mp3_path, book, classification, wordseq, "word",type,word_e]);
		// 	}
		// }

		// name = wordseq + "-" + type + "-" + "sen1" + ".mp3";
		// if (!absfile.exists(path + name)){
		// 	if(sen1_e != null && sen1_e != ''){
		// 		excuteClass("start", [mp3_path, book, classification, wordseq, "sen1",type,sen1_e]);
		// 	}
		// }

		// name = wordseq + "-" + type + "-" + "sen2" + ".mp3";
		// if (!absfile.exists(path + name)){
		// 	if(sen2_e != null && sen2_e != ''){
		// 		excuteClass("start", [mp3_path, book, classification, wordseq, "sen2",type,sen2_e]);
		// 	}
		// }

	}
	
	// 画面へ結果を返す
	return ret;

};
function processArray(arr) {

    // 对数组进行排序
    let sortedArray = arr.slice().sort();

    // 处理连续数字
    let result = [];
    let start = sortedArray[0];
    let end = sortedArray[0];

    for (let i = 1; i < sortedArray.length; i++) {
        if (sortedArray[i] == addOne(end + 1)) {
            end = sortedArray[i];
        } else {
            if (start == end) {
                result.push(start);
            } else {
                result.push(start + '～' + end);
            }
            start = sortedArray[i];
            end = sortedArray[i];
        }
    }

    // 添加最后一组数字
    if (start == end) {
        result.push(start);
    } else {
        result.push(start + '～' + end);
    }

    // 返回结果字符串
    return result.join(', ');
}