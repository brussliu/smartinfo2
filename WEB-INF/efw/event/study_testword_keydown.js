var study_testword_keydown = {};
study_testword_keydown.name = "キー押下";
study_testword_keydown.paramsFormat = {

	"keycode": null,

};

study_testword_keydown.fire = function (params) {

	var ret = new Result();

	var keycode = params["keycode"];

	var file = "D://apache-tomcat-9.0.30/webapps/smartinfo2/key/" + keycode + ".key";

	if (!absfile.exists(file)){
		absfile.makeFile(file);
	}
	

	// 画面へ結果を返す
	return ret;

};