<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="efw" uri="efw" %> 

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>データ導入</title>
	<script src="jquery-3.6.0.min.js"></script>
	<efw:Client/>

	<script>
        function init(){
			Efw('import_initimport');
		}
		function setInit(objectname,importdate,importcount){
			$("#"+objectname).html(importdate);
			$("#"+objectname).next().html(importcount);
		}

			// function searchHistory(){
			// 	Efw('searchhistory');
			// }

			// function importData(){

			// 	var rd = $("input[name='opt_type']:checked").val();

			// 	Efw('uploadfile',{data:'liststock', liststock: rd});

			// }

  	</script>
    <style>

    </style>
</head>
<body style="background-color:ghostwhite;" onload="init()">

<div style="font-size: 30px;color: blue;display: inline-block;width: 100%" id="pagehead">
	データ導入
	<img src="img/home.png" style="width: 64px;height: 64px;" onclick="window.location.href = '/smartinfo2/'">
</div>
<div style="text-align: right;width: 95%;">
	<input type="button" id="import" style="width: 170px;height: 30px;background-color: rgb(199, 199, 227);" value="導入"
		onclick="Efw('import_importfile')">
</div>
<table border="1" style="width: 95%;height: 100%;">
	<tr style="background-color:rgba(86, 86, 207, 0.696) ;">
		<th style="width:5%">No</th>
		<th style="width:50%">ファイル名称</th>
		<th style="width:15%">更新時間</th>
		<th style="width:5%">添付ファイル</th>
		<th style="width:20%">前回導入日時</th>
		<th style="width:5%">前回導入件数</th>
		
	</tr>
	<tr align="center">
		<td>1</td>
		<td>すべての出品商品のレポート</td>
		<td>1回／日</td>
		<td>
			<input type="file" id="importfile_01" >
		</td>
		<td id="file01"></td><!---  动态显示怎么实现    --->
		<td></td>
	</tr>
	<tr align="center">
		<td>2</td>
		<td>全注文レポート</td>
		<td>1回／日</td>
		<td>
			<input type="file" id="importfile_02">
		</td>
		<td id="file02"></td>
		<td></td>
	</tr>
	<tr align="center">
		<td>3</td>
		<td>FBA在庫レポート</td>
		<td>1回／日</td>
		<td>
			<input type="file" id="importfile_03" >
		</td>
		<td id="file03"></td>
		<td></td>
	</tr>
	<tr align="center">
		<td>4</td>
		<td>ペイメントレポート</td>
		<td>1回／日</td>
		<td>
			<input type="file" id="importfile_04">
		</td>
		<td id="file04"></td>
		<td></td>
	</tr>
	<tr align="center">
		<td>5</td>
		<td>FBA未出荷レポート</td>
		<td>随時</td>
		<td>
			<input type="file" id="importfile_05">
		</td>
		<td id="file05"></td>
		<td></td>
	</tr>
	<tr align="center">
		<td>6</td>
		<td>Qoo10未出荷レポート</td>
		<td>随時</td>
		<td>
			<input type="file" id="importfile_06">
		</td>
		<td id="file06"></td>
		<td></td>
	</tr>
	<tr align="center">
		<td>7</td>
		<td>日付別_売上およびトラフィック</td>
		<td>？？？</td>
		<td>
			<input type="file" id="importfile_07">
		</td>
		<td id="file07"></td>
		<td></td>
	</tr>
	<tr align="center">
		<td>8</td>
		<td>日付別_詳細ページ 売上・トラフィック</td>
		<td>？？？</td>
		<td>
			<input type="file" id="importfile_08">
		</td>
		<td id="file08"></td>
		<td></td>
	</tr>
	<tr align="center">
		<td>9</td>
		<td>日付別_パフォーマンス</td>
		<td>？？？</td>
		<td>
			<input type="file" id="importfile_09">
		</td>
		<td id="file09"></td>
		<td></td>
	</tr>
	<tr align="center">
		<td>10</td>
		<td>ASIN別_詳細ページ 売上・トラフィック</td>
		<td>？？？</td>
		<td>
			<input type="file" id="importfile_10">
		</td>
		<td id="file10"></td>
		<td></td>
	</tr>
	<tr align="center">
		<td>11</td>
		<td>FBA在庫出荷レポート</td>
		<td>1回／週</td>
		<td>
			<input type="file" id="importfile_11">
		</td>
		<td id="file11"></td>
		<td></td>
	</tr>
	<tr align="center">
		<td>12</td>
		<td>出荷レポート</td>
		<td>1回／週</td>
		<td>
			<input type="file" id="importfile_12">
		</td>
		<td id="file12"></td>
		<td></td>
	</tr>
	<tr align="center">
		<td>13</td>
		<td>手数料見積り額レポート</td>
		<td>1回／週</td>
		<td>
			<input type="file" id="importfile_13">
		</td>
		<td id="file13"></td>
		<td></td>
	</tr>
	<tr align="center">
		<td>14</td>
		<td>在庫保管手数料レポート</td>
		<td>月初</td>
		<td>
			<input type="file" id="importfile_14" >
		</td>
		<td id="file14"></td>
		<td></td>
	</tr>
	<tr align="center">
		<td>15</td>
		<td>長期在庫保管手数料請求額レポート</td>
		<td>月初</td>
		<td>
			<input type="file" id="importfile_15">
		</td>
		<td id="file15"></td>
		<td></td>
	</tr>
	<tr align="center">
		<td>16</td>
		<td>返品レポート</td>
		<td>1回／月</td>
		<td>
			<input type="file" id="importfile_16">
		</td>
		<td id="file16"></td>
		<td></td>
	</tr>
	<tr align="center">
		<td>17</td>
		<td>返送推奨レポート</td>
		<td>1回／月</td>
		<td>
			<input type="file" id="importfile_17">
		</td>
		<td id="file17"></td>
		<td></td>
	</tr>
	<tr align="center">
		<td>18</td>
		<td>返送所有権の放棄依頼の詳細レポート</td>
		<td>1回／月</td>
		<td>
			<input type="file" id="importfile_18">
		</td>
		<td id="file18"></td>
		<td></td>
	</tr>


</table>
</body>
</html>