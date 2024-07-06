var study_testword_downloadvoice = {};
study_testword_downloadvoice.name = "単語テスト開始";
study_testword_downloadvoice.paramsFormat = {

	"#hiddenBook": null,
	"#hiddenclassification": null,
	"#hiddenwordseq": null,

	"#hiddenWordE": null,
	"#hiddenWordJ": null,
	"#hiddenWordC": null,
	"#hiddenSen1E": null,
	"#hiddenSen1J": null,
	"#hiddenSen1C": null,
	"#hiddenSen2E": null,
	"#hiddenSen2J": null,
	"#hiddenSen2C": null,
	"type": null
};

study_testword_downloadvoice.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	var book = params["#hiddenBook"];
	var classification = params["#hiddenclassification"];
	var wordseq = params["#hiddenwordseq"];

	var type = params["type"];

	var word_e = params["#hiddenWordE"].replaceAll(" ", "%20").replaceAll("'", "%27");
	var sen1_e = params["#hiddenSen1E"].replaceAll(" ", "%20").replaceAll("'", "%27");
	var sen2_e = params["#hiddenSen2E"].replaceAll(" ", "%20").replaceAll("'", "%27");

	var path = "D://apache-tomcat-9.0.30/webapps/smartinfo2/mp3/" + book + "/" + classification + "/";

	path.debug("11111111111111111111111111111111111111111111");
	if (!absfile.exists(path)){
		absfile.makeDir(path);
	}
	
	//java start D:\apache-tomcat-9.0.30\webapps\smartinfo2\mp3 キクタン Day01 12345 word please
	// java -classpath D:/tools/ start
	if(word_e != null && word_e != ''){
		cmd.execute(
			["java","-classpath", "D:/apache-tomcat-9.0.30/webapps/smartinfo2/java/", "start",
				"D:\\apache-tomcat-9.0.30\\webapps\\smartinfo2\\mp3", book, classification, wordseq, "word",type,word_e]);
		path.debug("2222222222222222222222222222222222222222222222");
	}
	if(sen1_e != null && sen1_e != ''){
		cmd.execute(
			["java","-classpath", "D:/apache-tomcat-9.0.30/webapps/smartinfo2/java/", "start",
				"D:\\apache-tomcat-9.0.30\\webapps\\smartinfo2\\mp3", book, classification, wordseq, "sen1",type,sen1_e]);
		path.debug("33333333333333333333333333333333333333333333333");
	}
	if(sen2_e != null && sen2_e != ''){
		cmd.execute(
			["java","-classpath", "D:/apache-tomcat-9.0.30/webapps/smartinfo2/java/", "start",
				"D:\\apache-tomcat-9.0.30\\webapps\\smartinfo2\\mp3", book, classification, wordseq, "sen2",type,sen2_e]);
	}

	ret.runat("body").withdata(
		{
			"#hiddenMp3" : "got"
			
		}
	)
	// 画面へ結果を返す
	return ret;

};
