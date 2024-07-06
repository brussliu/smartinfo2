<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="efw" uri="efw" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>写真アップロード</title>
	<efw:Client/>

	<script>

		(function ($) {
            $.getUrlParam = function (name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        })(jQuery);

		function selectPic(obj){
			$("#picfile").click();
		}

		function changepic(obj) {

			$("#imgIcon").hide();

			var filelist = $("#picfile")[0].files;


			if(filelist.length > 20){

				alert("画像ファイルは20個を超えました!");
				return;
			}

			for (var i = 0; i < filelist.length; i++) {

				var f = filelist[i];
				
				// 示例：创建一个FileReader来读取Blob内容
				var reader = new FileReader();

				reader.onload = function(e) {

					var blobContent = e.target.result;

					// 画像表示
					displayPic(blobContent);

					// 縮略図生成及び設定
					makeTbPic(blobContent);

					// 元ファイル設定
					setPic(blobContent);


				};

				reader.readAsDataURL(f); // 读取为DataURL（base64编码）
				
    		}

			$("#btn_upload").show();

		}

		function setPic(content){

			for(var i = 1;i <= 20;i ++){

				if($("#picfile" + i).val() == null || $("#picfile" + i).val() == ""){

					$("#picfile" + i).val(content);
					return;
				}
			}

		}

		function makeTbPic(content){

			// 縮略図生成
			var image = new Image();
			image.src = content;

			image.onload = function(){

				square = 500 / image.height;

				canvas = document.createElement('canvas');
				context = canvas.getContext('2d');

				imageWidth = Math.round(square * image.width);
				imageHeight = Math.round(square * image.height);

				canvas.width = imageWidth;
				canvas.height = imageHeight;

				context.clearRect(0, 0, imageWidth, imageHeight);
				context.drawImage(this, 0, 0, imageWidth, imageHeight);

				var data = canvas.toDataURL('image/jpeg',0.6);

				for(var i = 1;i <= 20;i ++){

					if($("#picfile" + i + "_tb").val() == null || $("#picfile" + i + "_tb").val() == ""){

						$("#picfile" + i + "_tb").val(data);
						return;
					}
				}

			};

		}

		function displayPic(content){

			var count = $("#allpic").children().length;
			var no = count - 3;

			var divhtml = "<div id='imgPreview' class='picdiv'><img src='#' class='img' id='img" + no + "'/></div>";
			$("#btnDiv").prev().before(divhtml);
			$("#img" + no).attr("src",content);
			$("#img" + no).show();

		}

		// function delpic(obj){

		// 	$(obj).parent().remove();

		// 	var picno = $(obj).attr("id").replaceAll("img","");

		// 	var filelist = $("#picfile")[0].files.splice(picno, 1);

		// }
		

		function upload(){

			Efw('study_uploadpic');
		}

	</script>
   	<style>
		#allpic {
			width: 100%;
			height: 100%;
		}
		#imgIcon{
			border-width: 1px;
			border-style: solid;
			width: 600px;
			height: 600px;
			border-color: gray;
			margin:auto;
			text-align: center;
		}
		.picdiv {
			text-align: center;
			margin-top: 10px;
		}
		.img {
			width: 600px;
			display: none;
		}

		#btnDiv{
			width: 600px;
			height: 100px;
			margin:auto;
			text-align: center;
		}

		#btn_upload {
			width: 400px;
			height: 100px;
			background: rgb(240, 240, 240);
			font-size: 42px;
			border: 1px solid rgb(206, 205, 205);
			box-shadow: 5px 5px 2px #888888;
			cursor: pointer;
			margin:auto;
			/* display: none; */
        }
    </style>
</head>
<body style="background-color:lightblue;">
	<div id="allpic">
		<div id="imgIcon">
			<img src="img/pic.png" id="icon" style='width: 300px;height: 300px;padding-top: 100px;' onclick='selectPic(this);'>
		</div>
		<br/>
		<div id="btnDiv">
			<input type="button" id="btn_upload" value="アップロード" onclick="upload()"/>
		</div>
		<input type="file" id="picfile" style="display: none;" onchange='changepic(this)' multiple>

	</div>

	<input type="hidden" id="picfile1">
	<input type="hidden" id="picfile2">
	<input type="hidden" id="picfile3">
	<input type="hidden" id="picfile4">
	<input type="hidden" id="picfile5">
	<input type="hidden" id="picfile6">
	<input type="hidden" id="picfile7">
	<input type="hidden" id="picfile8">
	<input type="hidden" id="picfile9">
	<input type="hidden" id="picfile10">
	<input type="hidden" id="picfile11">
	<input type="hidden" id="picfile12">
	<input type="hidden" id="picfile13">
	<input type="hidden" id="picfile14">
	<input type="hidden" id="picfile15">
	<input type="hidden" id="picfile16">
	<input type="hidden" id="picfile17">
	<input type="hidden" id="picfile18">
	<input type="hidden" id="picfile19">
	<input type="hidden" id="picfile20">

	<input type="hidden" id="picfile1_tb">
	<input type="hidden" id="picfile2_tb">
	<input type="hidden" id="picfile3_tb">
	<input type="hidden" id="picfile4_tb">
	<input type="hidden" id="picfile5_tb">
	<input type="hidden" id="picfile6_tb">
	<input type="hidden" id="picfile7_tb">
	<input type="hidden" id="picfile8_tb">
	<input type="hidden" id="picfile9_tb">
	<input type="hidden" id="picfile10_tb">
	<input type="hidden" id="picfile11_tb">
	<input type="hidden" id="picfile12_tb">
	<input type="hidden" id="picfile13_tb">
	<input type="hidden" id="picfile14_tb">
	<input type="hidden" id="picfile15_tb">
	<input type="hidden" id="picfile16_tb">
	<input type="hidden" id="picfile17_tb">
	<input type="hidden" id="picfile18_tb">
	<input type="hidden" id="picfile19_tb">
	<input type="hidden" id="picfile20_tb">
</body>

</html>