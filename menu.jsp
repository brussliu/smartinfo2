<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="efw" uri="efw" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Smart-Infoメニュー</title>
	<efw:Client/>
	<script>
  	</script>
  	   <style>
      .menuHeader {
      	width: 750px;
      	height: 40px;
      	background-color: blue;
      	color: white;
      	font-size: 20px;
      	font-weight: bold;
      }
      .menuHeader2 {
      	width: 1506px;
      	height: 40px;
      	background-color: blue;
      	color: white;
      	font-size: 20px;
      	font-weight: bold;
      }
    </style>
</head>
<body style="background-color:ghostwhite;">
<table style="width:1500px;" border="1">
	<tr>
		<td>
			<div class="menuHeader">&nbsp;Smart-Bear(新店)メニュー222222222222222</div>
		</td>
		<td>
			<div class="menuHeader">&nbsp;代発送メニュー</div>
		</td>
	</tr>
	<tr>
		<td><div style="text-align:center"><br>
			<input type=button value= "データ導入"style="width:400px;height: 40px;" onclick="Efw('menu_goto',{page:'upload.jsp'})">
			<br><br>
			<!--
			<input type=button value="商品情報" style="width:400px;height: 40px;" onclick="Efw('menu_goto',{page:'si_product.jsp',shop:'Smart-Bear'})">
			<br><br>
			<input type=button value="注文情報" style="width:400px;height: 40px;" onclick="Efw('menu_goto',{page:'si_order.jsp',shop:'Smart-Bear'})">
			<br><br>
			-->
			<input type=button value="在庫情報" style="width:400px;height: 40px;" onclick="Efw('menu_goto',{page:'stock.jsp',shop:'Smart-Bear'})">
			<br><br>
			<!--
			<input type=button value="在庫情報" style="width:400px;height: 40px;" onclick="Efw('outputstock',{shop:'Smart-Bear'})">
			<br><br>
			-->
			<input type=button value="仕入管理" style="width:400px;height: 40px;" onclick="Efw('menu_goto',{page:'purchase.jsp',shop:'Smart-Bear'})">
			<br><br>
			<input type=button value="納品管理" style="width:400px;height: 40px;" onclick="Efw('menu_goto',{page:'delivery.jsp',shop:'Smart-Bear'})">
			<br><br>
			<input type=button value="販売情報" style="width:400px;height: 40px;" onclick="Efw('menu_goto',{page:'si_sellinfo.jsp',shop:'Smart-Bear'})">
			<br><br>
			<input type=button value="売上情報" style="width:400px;height: 40px;" onclick="Efw('menu_goto',{page:'earnings.jsp',shop:'Smart-Bear'})">
			<br><br>
		</div></td>
		<td><div style="text-align:center;"><br>
			<input type=button value="発送商品管理" style="width:400px;height: 40px;" onclick="Efw('menu_goto',{page:'shipactingmaster_list.jsp',shop:'Smart-Bear'})">
			<br><br>
			<input type=button value="代行発送管理" style="width:400px;height: 40px;" onclick="Efw('menu_goto',{page:'shipacting_list.jsp',shop:'Smart-Bear'})">
			<br><br>
		</div></td>
	</tr>
</table>
<table style="width:1506px;" border="1">
	<tr>
		<td>
			<div class="menuHeader2">&nbsp;共通メニュー</div>
		</td>
	</tr>
	<tr>
		<td><div style="text-align:center"><br>
			<input type=button value="発送管理" style="width:400px;height: 40px;" onclick="Efw('menu_goto',{page:'si_ship.jsp',shop:'Smart-Bear'})">
			<br><br>
			<input type=button value="商品スキャン" style="width:400px;height: 40px;" onclick="Efw('menu_goto',{page:'si_scan.jsp',shop:'Smart-Bear'})">
			<br><br>
			<input type=button value="ラベル番号印刷用データ出力" style="width:400px;height: 40px;" onclick="Efw('outputlabeldata')">
			<br><br>
			<input type=button value="マスタ修復" style="width:400px;height: 40px;" onclick="Efw('master/repairmaster')">
			<br><br>
			<input type="text" id="delno" style="width: 190px;height: 32px;">
			<input type=button value="仕入削除" style="width:100px;height: 40px;" onclick="Efw('purchase/delpurchase')">
			<input type=button value="納品削除" style="width:100px;height: 40px;" onclick="Efw('delivery/deldelivery')">
			<br><br>
		</div></td>
	</tr>
</table>

</body>
</html>