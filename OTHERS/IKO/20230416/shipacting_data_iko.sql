delete from "MST_代行発送情報";

insert into "MST_代行発送情報"
	(
	   "管理番号" 
	  , "お届け先-郵便番号" 
	  , "お届け先-住所1" 
	  , "お届け先-住所2" 
	  , "お届け先-住所3" 
	  , "お届け先-名前" 
	  , "お届け先-電話番号" 
	  , "備考" 

	  , "商品管理番号" 
	  , "商品数量" 
	  , "発送方法" 
	  , "ステータス" 
	  , "追跡番号" 
	  , "支払状態" 
	  , "発送費用（円）" 
	  , "発送費用（元）" 
	  , "請求先店舗ID" 
	  
	  , "店舗ID" 
	  , "登録日時" 
	  , "更新日時" 
		)
 SELECT 
	T."NO",
	T."POST_NO",
	T."ADDRESS1",
	T."ADDRESS2",
	T."ADDRESS3",
	T."NAME",
	T."TEL",
	T."BIKO",
	
	to_number(T."SHIP_CONTENT",'999999'),
	T."SHIP_COUNT",
	case	 when T."SHIP_DIV" = 'C' then '01.クリックポスト'
			 when T."SHIP_DIV" = 'Y' then '03.ゆうパケット'
			 when T."SHIP_DIV" = 'S' then '02.普通便' end ,
	case 	when T."STATUS" = '0' then '1.新　規'
			when T."STATUS" = '5' then '2.受入済'
			when T."STATUS" = '8' then '3.発送済' end ,
	T."TRACKING_NO",
	case 	when T."PAY_STATUS" = '1' then '2.支払済'
			else  '1.未支払' end ,
	T."FEE",
	T."AMOUNT",
	'Smart-Bear',
	'zhixun',
	CURRENT_TIMESTAMP,
	CURRENT_TIMESTAMP 
 FROM
	"ZZZ_TEMP_発送情報" T 
 WHERE
	T."STATUS" in ('0','5','8');
