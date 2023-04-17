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

		var shopid = $.getUrlParam('shopid');

		function uplaodPic(obj){
			$(obj).next().click();
		}

		function changepic(obj) {

			$(obj).parent().css("display", "none");

			var reads = new FileReader();

			f = $(obj)[0].files[0];

			reads.readAsDataURL(f);
			reads.onload = function(e) {

				$(obj).parent().next().attr("src",this.result);
				$(obj).parent().next().css("display", "block");

				var image = new Image();
				image.src=e.target.result;
				image.onload = function(){

					//square = 0.2;   //定义画布的大小，也就是图片压缩之后的像素
					square = 500 / image.height;

					canvas = document.createElement('canvas'); //创建canvas元素
					context = canvas.getContext('2d');

					imageWidth = Math.round(square*image.width);    //压缩图片的大小
					imageHeight = Math.round(square*image.height);

					canvas.width = imageWidth;
					canvas.height = imageHeight;
					context.clearRect(0, 0, imageWidth, imageHeight);  //在给定矩形内清空一个矩形
					context.drawImage(this, 0, 0, imageWidth, imageHeight);
					var data = canvas.toDataURL('image/jpeg',0.6);

					$(obj).parent().next().next().val(data);

					$("#btn_upload").show();
				};

			};
		}

		function upload(){
			Efw('shipactingmaster_uploadpic');
		}

	</script>
   	<style>
		:root {
		/* COLORS */
		--white: #e9e9e9;
		--gray: #333;
		--blue: #0367a6;
		--lightblue: #008997;

		/* SIZES */
		--max-width: 758px;
		--max-height: 420px;

		font-size: 24px;
		font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
			Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
		}

		body {
		align-items: center;
		background-color: var(--white);
		background-attachment: fixed;
		background-position: center;
		background-repeat: no-repeat;
		background-size: cover;
		display: grid;
		height: 100vh;
		place-items: center;
		}
		.img {
			height: 600px;
			width: 600px;
			display: none;
		}
		.picdiv{
			/* margin-left: 50px; */
			/* float: center;  */
			border-width: 1px;
			border-style: solid;
			width: 600px;height: 600px;
			border-color: gray;
			margin:auto;
		}
		.btn {
			margin: auto;
			width: 400px;
			height: 100px;
			background: rgb(240, 240, 240);
			font-size: 42px;
			border: 1px solid rgb(206, 205, 205);
			box-shadow: 5px 5px 2px #888888;
			cursor: pointer;
			display: none;
        }
    </style>
</head>
<body style="background-color:ghostwhite;">
	写真を撮る際に、正方形を選択してください。
	<div style="display: inline;width: 100%;height: 100%;text-align: center;" id="allpic">
		<div id='imgPreview' class='picdiv'>
			<div id='prompt' style='text-align: center;'>
				<img src='img/pic.png' id="icon" style='width: 300px;height: 300px;padding-top: 100px;' onclick='uplaodPic(this);'>
				<input type='file' id='productpic' style='display: none;' onchange='changepic(this)'>
			</div>
			<img src='#' id='img' class='img'/>
			<input type='hidden' id='productpicStr'>
		</div>
		<br/>
		<input type='button' id='btn_upload' value="アップロード" class="btn" onclick="upload()"/>
		<input type='hidden' id='shopid'>
	</div>

	<!-- <div style="width: 800px;height: 500px;">

		<input title="写真をアップロードください。" style="height: 80px;width: 500px;" type="file" id="picfile">

		<input type="text" name="fileShowName" id="fileShowName" readonly="readonly" style="height: 50px;width: 200px;"/>

		<input type="button" id="fileButton" name="fileButton" value="写真アップロード" onclick="$('#submitFile').click();" />

		<input name="submitFile" id="submitFile" type="file" style="display: none;" onchange="$('#fileShowName').val($(this).val());" />

	</div> -->

</body>
<script>
	$("#shopid").val(shopid);
</script>
</html>