var study_testword_wrong = {};
study_testword_wrong.name = "単語テスト開始";
study_testword_wrong.paramsFormat = {

	"testno": null,

};

study_testword_wrong.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	// タイトル情報設定
	setTitleInfo(ret);

	var testnoArr = params["testno"].split(",");

	var testnoStr = "";
	for(var i=0;i <testnoArr.length;i ++){
	
		if(i == testnoArr.length-1){
			testnoStr += "'"+testnoArr[i]+"'"
		}else{
			testnoStr += "'"+testnoArr[i]+"',";
		}
	
	}

	//  检索
	var selectResult = db.select(
		"STUDY",
		"selectWrongWord",
		{
			testno : testnoStr,
		}
	).getArray();

	if(selectResult.length <= 0){
		ret.eval("alert('誤り単語がないので、再テストできません！');");
		return ret;
	}

	// テスト番号
	var testno = new Date().format('yyyyMMdd-HHmmss');
	var book = selectResult[0]["book"];


	var classificationArr = new Array();
	// 単語テスト詳細情報
	for(var i = 0;i < selectResult.length;i++){

		if(classificationArr.indexOf(selectResult[i]["classification"]) == -1){
			classificationArr.push(selectResult[i]["classification"]);
		}

		db.change(
			"STUDY",
			"insertTestDetailInfo",
			{
				testno : testno,
				subno : i+1,
				book : selectResult[i]["book"],
				classification : selectResult[i]["classification"],
				wordseq : selectResult[i]["wordseq"],
				userid : getUserId()
			}
		);
	}
	var classificationStr = processArray(classificationArr);

	// 単語テスト情報
	db.change(
		"STUDY",
		"insertTestInfo",
		{
			testno : testno,
			book : book,
			classification : classificationStr,
			div1 : "誤り単語",
			div2 : "1",
			div3 : "0",
			count : selectResult.length,
			userid : getUserId()
		}
	);

	// 画面へ結果を返す
	return ret.navigate("study_testword.jsp");

};
function addOne(dayString){
    // 使用正则表达式匹配 "Day" 后面的数字部分
    const match = dayString.match(/^Day(\d+)$/);
    
    if (match) {
        // 提取数字部分，并转换为整数
        let number = parseInt(match[1], 10);
        // 数字加 1
        number += 1;
        // 格式化数字为两位数，并拼接回 "Day" 前缀
        const newDayString = "Day" + padNumberWithZeros(number,2);
        return newDayString;
    } else {
        // 如果输入字符串格式不匹配，返回原字符串
        return dayString;
    }
}

function padNumberWithZeros(number, length) {
    // 将数字转换为字符串
    let numberStr = number + '';
    // 计算需要补的零的数量
    while (numberStr.length < length) {
        numberStr = '0' + numberStr;
    }
    return numberStr;
}


function processArray(arr) {

    // 对数组进行排序
    let sortedArray = arr.slice().sort();

    console.log(sortedArray);

    // 处理连续数字
    let result = [];
    let str = sortedArray[0];

    for (let i = 1; i < sortedArray.length; i++) {

        var day = sortedArray[i];

        if (addOne(sortedArray[i-1]) == day) {

            if(str == null || str.indexOf("～") == -1){
                str = sortedArray[i-1] + "～" + day;
            }else{
                str = str.substr(0,6) + day;
            }
            
        }else{
            result.push(str);
            str = sortedArray[i];
        }
    }
    result.push(str);

    // 返回结果字符串
    return result.join(', ');
}