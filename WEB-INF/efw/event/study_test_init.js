var study_test_init = {};
study_test_init.name = "テスト情報管理画面初期表示";
study_test_init.paramsFormat = {
	"#testname":null, 
	"#subject":null,
};

study_test_init.fire = function (params) {

	var ret = new Result();
	// セッションチェック
	if(sessionCheck(ret) == false){return ret};
 
	ret.runat("#studytesttable").remove("tr")
	var testname = params["#testname"] == ''? null : params["#testname"];
	var subject = params["#subject"] == ''? null : params["#subject"];
	//  检索
	var selectResult = db.select(
		"STUDYTEST",
		"selectstudytest",
		{
			"testname":testname,
			"subject":subject,
			"shopid": getShopId()

		}
	).getArray();

 
	

	if(selectResult !=null && selectResult != ''){	
		for(var i = 0; i<selectResult.length ;i++){
			var img2html = ''
			var img3html = ''
			var record = new Record([selectResult[i]]).getSingle();
			// 内容SEQ
			var contentlist2 = record['contentseq2'].split(',');
			// 内容クリアSEQ
			var contentlist3 = record['contentseq3'].split(',');
 
			if(contentlist2 !=null && contentlist2 != ''){
			
				for(var l =0; l<contentlist2.length; l++){
					img2html = img2html + '<a href="'+contentlist2[l] +'" target="_blank"><img src="'+contentlist2[l] +'" class="aimg" ></a>&nbsp;'
				}
	
			}
			if(contentlist3 !=null && contentlist3 != ''){
				for(var q =0; q<contentlist3.length; q++){
					img3html = img3html + '<a href="'+contentlist3[q] +'" target="_blank"><img src="'+contentlist3[q] +'" class="aimg" ></a>&nbsp;'
				}
			}
			// onchange="check(this)"
			var resultHTML =
			' <tr class="header">'+
				' <td style="width: 50px;text-align: center;" ><input type="radio" name="seq"  value="{seq}"  /></td>'+
				' <td style="width: 150px" class="c">{seq}</td>'+
				' <td style="width: 100px;" class="l">{academicyear}</td>'+
		
				' <td style="width: 220px;" class="l"><a href="{contentseq1}" target="_blank">{tname}</a></td>'+
				' <td style="width: 220px;text-align: center;"  >{fromto}</td>'+
		
				' <td style="width: 100px;" class="c">{project}</td>'+
				' <td style="width: 200px;text-align: center;"> '+
				img2html +
				' </td>'+
				' <td style="width: 200px;text-align: center;">'+
				img3html +
				' </td>'+
				' <td style="width: 80px;" class="r">{score}</td>'+
				' <td style="width: 80px;" class="r">{fulls}</td>'+
				' <td style="width: 80px;" class="r">{gradeaverage}</td>'+
				' <td style="width: 80px;" class="r">{yearaverage}</td>'+
				' <td style="width: 100px;" class="r">{academicrank}</td>'+
				' <td style="width: 100px;" class="r">{academicyear2}</td> '+
			' </tr>'
			var record2 = new Record([record]).getArray();
			ret.runat("#studytesttable").append(resultHTML).withdata(record2);
		}
	}


 

	// var script = "$('.c_detail_header').show();$('.c_detail_content').show();";
	// ret.eval(script);
	// ret.eval(" changeColor();");  
	// 画面へ結果を返す
	return ret;

};
