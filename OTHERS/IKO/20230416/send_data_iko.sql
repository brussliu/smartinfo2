delete from "TRN_発送情報" where "区分" = 'C.代行発送';
insert into "TRN_発送情報"
	(
	   "Amazon注文番号" 
	  , "Qoo10注文番号" 
	  , "代行発送管理番号" 
	  , "自行発送管理番号" 

	  , "受注日時" 
	  , "支払日時" 
	  , "出荷期限日時" 
	  , "期限日数" 

	  , "ASIN番号" 
	  , "SKU番号" 
	  , "商品管理番号" 
	  , "商品種別" 
	  , "分類１" 
	  , "分類２" 
	  , "商品名称" 
	  , "オプション内容" 
	  , "数量" 

	  , "購入者メール" 
	  , "購入者氏名" 
	  , "購入者電話番号" 

	  , "お届け先-国" 
	  , "お届け先-郵便番号" 
	  , "お届け先-都道府県" 
	  , "お届け先-市区町村" 
	  , "お届け先-住所1" 
	  , "お届け先-住所2" 
	  , "お届け先-住所3" 
	  , "お届け先-住所全部" 
	  , "お届け先-名前" 
	  
	  , "情報整備フラグ" 
	  , "区分" 
	  , "発送方法" 
	  , "ステータス" 
	  , "備考" 
	  , "追跡番号" 
	  , "発送内容" 
	  , "発送日時"
	  
	  , "店舗ID" 
	  , "登録日時" 
	  , "更新日時" 
		) 
 SELECT 
	NULL,
	NULL,
	T."NO",
	NULL,
	
	NULL,
	NULL,
	NULL,
	NULL,
	
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	(select "NAME_CN" from "ZZZ_MASTER_発送商品マスタ情報5" WHERE  "P_ID" = cast (T."SHIP_CONTENT" as int)),
	NULL,
	cast (T."SHIP_COUNT" as int),
	
	NULL,
	T."NAME",
	T."TEL",
	
	NULL,
	T."POST_NO",
	(select "都道府県"  from "MST_住所情報" where "郵便番号" = T."POST_NO" ),
	(select "市区町村"  from "MST_住所情報" where "郵便番号" = T."POST_NO" ),
	T."ADDRESS1",
	T."ADDRESS2",
	T."ADDRESS3",
	NULL,
	T."NAME",
	
	'1',
	'C.代行発送',
	case	 when T."SHIP_DIV" = 'C' then '01.クリックポスト'
			 when T."SHIP_DIV" = 'Y' then '03.ゆうパケット'
			 when T."SHIP_DIV" = 'S' then '02.普通便' end ,
	case 	when T."STATUS" = '0' then '1.未発送'
			when T."STATUS" = '5' then '1.未発送'
			when T."STATUS" = '8' then '2.発送済' end ,
	T."BIKO",
	T."TRACKING_NO",
	(select "NAME_JP" from "ZZZ_MASTER_発送商品マスタ情報5" WHERE  "P_ID" = cast (T."SHIP_CONTENT" as int)),
	NULL,

	'Smart-Bear',
	CURRENT_TIMESTAMP,
	CURRENT_TIMESTAMP 
 FROM
	"ZZZ_TEMP_発送情報" T
 where
	T."STATUS" in ('0','5','8');