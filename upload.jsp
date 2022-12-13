<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="efw" uri="efw" %> 

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>データ導入</title>
	<!--
	<script src="jquery-3.6.0.min.js"></script>
	-->
	<efw:Client/>

	<script>
        function init(){
			Efw('import_initimport');
		}
		function setInit(objectname,importdate,importcount){
			$("#"+objectname).html(importdate);
			$("#"+objectname).next().html(importcount);
		}
  	</script>
	<style>
		.td1,.td3,.td5,.td6 {
			text-align :center
		}
		.td2,.td4 {
			padding-left: 10px
		}
		.datatr {
			height: 35px;
		}
	</style>
</head>

<body style="background-color:ghostwhite;" onload="init()">

<div style="font-size: 30px;color: blue;width: 100%;position: relative;" id="pagehead">
	<img src="img/home.png" style="width: 64px;height: 64px;" onclick="window.location.href = '/smartinfo2/'">
	データ導入
	<input type="button" id="import" style="width: 148px;height: 30px;position: absolute;bottom: 0px;right: 0px;" value="導入" onclick="Efw('import_importfile')">
</div>
<hr>
<table border="1" style="width: 100%;">
	<tr style="background-color:rgba(86, 86, 207, 0.696) ;height: 50px;">
		<th style="width:5%">No</th>
		<th style="width:35%">ファイル名称</th>
		<th style="width:8%">更新時間</th>
		<th style="width:32%;">添付ファイル</th>
		<th style="width:12%">前回導入日時</th>
		<th style="width:8%">前回導入件数</th>
		
	</tr>
	<tr class="datatr">
		<td class="td1">1</td>
		<td class="td2">すべての出品商品のレポート</td>
		<td class="td3">1回／日</td>
		<td class="td4"><input type="file" id="importfile_01" ></td>
		<td class="td5" id="file01"></td>
		<td class="td6"></td>
	</tr>
	<tr class="datatr">
		<td class="td1">2</td>
		<td class="td2">全注文レポート</td>
		<td class="td3">1回／日</td>
		<td class="td4"><input type="file" id="importfile_02"></td>
		<td class="td5" id="file02"></td>
		<td class="td6"></td>
	</tr>
	<tr class="datatr">
		<td class="td1">3</td>
		<td class="td2">FBA在庫レポート</td>
		<td class="td3">1回／日</td>
		<td class="td4"><input type="file" id="importfile_03"></td>
		<td class="td5" id="file03"></td>
		<td class="td6"></td>
	</tr>
	<tr class="datatr">
		<td class="td1">4</td>
		<td class="td2">ペイメントレポート</td>
		<td class="td3">1回／日</td>
		<td class="td4"><input type="file" id="importfile_04"></td>
		<td class="td5" id="file04"></td>
		<td class="td6"></td>
	</tr>
	<tr class="datatr">
		<td class="td1">5</td>
		<td class="td2">FBA未出荷レポート</td>
		<td class="td3">随時</td>
		<td class="td4"><input type="file" id="importfile_05"></td>
		<td class="td5" id="file05"></td>
		<td class="td6"></td>
	</tr>
	<tr class="datatr">
		<td class="td1">6</td>
		<td class="td2">Qoo10未出荷レポート</td>
		<td class="td3">随時</td>
		<td class="td4"><input type="file" id="importfile_06"></td>
		<td class="td5" id="file06"></td>
		<td class="td6"></td>
	</tr>
	<tr class="datatr">
		<td class="td1">7</td>
		<td class="td2">日付別_売上およびトラフィック</td>
		<td class="td3">？？？</td>
		<td class="td4"><input type="file" id="importfile_07"></td>
		<td class="td5" id="file07"></td>
		<td class="td6"></td>
	</tr>
	<tr class="datatr">
		<td class="td1">8</td>
		<td class="td2">日付別_詳細ページ 売上・トラフィック</td>
		<td class="td3">？？？</td>
		<td class="td4"><input type="file" id="importfile_08"></td>
		<td class="td5" id="file08"></td>
		<td class="td6"></td>
	</tr>
	<tr class="datatr">
		<td class="td1">9</td>
		<td class="td2">日付別_パフォーマンス</td>
		<td class="td3">？？？</td>
		<td class="td4"><input type="file" id="importfile_09"></td>
		<td class="td5" id="file09"></td>
		<td class="td6"></td>
	</tr>
	<tr class="datatr">
		<td class="td1">10</td>
		<td class="td2">ASIN別_詳細ページ 売上・トラフィック</td>
		<td class="td3">？？？</td>
		<td class="td4"><input type="file" id="importfile_10"></td>
		<td class="td5" id="file10"></td>
		<td class="td6"></td>
	</tr>
	<tr class="datatr">
		<td class="td1">11</td>
		<td class="td2">FBA在庫出荷レポート</td>
		<td class="td3">1回／週</td>
		<td class="td4"><input type="file" id="importfile_11"></td>
		<td class="td5" id="file11"></td>
		<td class="td6"></td>
	</tr>
	<tr class="datatr">
		<td class="td1">12</td>
		<td class="td2">出荷レポート</td>
		<td class="td3">1回／週</td>
		<td class="td4"><input type="file" id="importfile_12"></td>
		<td class="td5" id="file12"></td>
		<td class="td6"></td>
	</tr>
	<tr class="datatr">
		<td class="td1">13</td>
		<td class="td2">手数料見積り額レポート</td>
		<td class="td3">1回／週</td>
		<td class="td4"><input type="file" id="importfile_13"></td>
		<td class="td5" id="file13"></td>
		<td class="td6"></td>
	</tr>
	<tr class="datatr">
		<td class="td1">14</td>
		<td class="td2">在庫保管手数料レポート</td>
		<td class="td3">月初</td>
		<td class="td4"><input type="file" id="importfile_14"></td>
		<td class="td5" id="file14"></td>
		<td class="td6"></td>
	</tr>
	<tr class="datatr">
		<td class="td1">15</td>
		<td class="td2">長期在庫保管手数料請求額レポート</td>
		<td class="td3">月初</td>
		<td class="td4"><input type="file" id="importfile_15"></td>
		<td class="td5" id="file15"></td>
		<td class="td6"></td>
	</tr>
	<tr class="datatr">
		<td class="td1">16</td>
		<td class="td2">返品レポート</td>
		<td class="td3">1回／月</td>
		<td class="td4"><input type="file" id="importfile_16"></td>
		<td class="td5" id="file16"></td>
		<td class="td6"></td>
	</tr>
	<tr class="datatr">
		<td class="td1">17</td>
		<td class="td2">返送推奨レポート</td>
		<td class="td3">1回／月</td>
		<td class="td4"><input type="file" id="importfile_17"></td>
		<td class="td5" id="file17"></td>
		<td class="td6"></td>
	</tr>
	<tr class="datatr">
		<td class="td1">18</td>
		<td class="td2">返送所有権の放棄依頼の詳細レポート</td>
		<td class="td3">1回／月</td>
		<td class="td4"><input type="file" id="importfile_18"></td>
		<td class="td5" id="file18"></td>
		<td class="td6"></td>
	</tr>
</table>
</body>
</html>