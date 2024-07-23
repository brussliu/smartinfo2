var study_testword_cancelkey = {};
study_testword_cancelkey.name = "キー押下";
study_testword_cancelkey.paramsFormat = {

	"keycode": null,

};

study_testword_cancelkey.fire = function (params) {

	var ret = new Result();

	var keycode = params["keycode"];

	var file = "D://apache-tomcat-9.0.30/webapps/smartinfo2/key/" + keycode + ".key";

	if (absfile.exists(file)){
		absfile.remove(file);
	}
	

	// 画面へ結果を返す
	return ret;

};