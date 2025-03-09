<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="efw" uri="efw" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>写真アップロード</title>
	<link href="img/favicon.ico" rel="icon" type="image/x-icon" />
	<efw:Client/>

	<script>

		function upload(){
			Efw('zzz_outputwrongquestion');
		}

	</script>
   	<style>

		.btn {
			margin: auto;
			width: 400px;
			height: 100px;
			background: rgb(240, 240, 240);
			font-size: 42px;
			border: 1px solid rgb(206, 205, 205);
			box-shadow: 5px 5px 2px #888888;
			cursor: pointer;
        }
    </style>
</head>
<body style="background-color:ghostwhite;">
	<div>
		<input type='button' id='btn_upload' value="出力" class="btn" onclick="upload()"/>
	</div>

</body>

</html>