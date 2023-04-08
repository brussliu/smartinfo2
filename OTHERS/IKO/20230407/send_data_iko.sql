delete from "TRN_発送情報";

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
	T."注文番号",
	NULL,
	NULL,
	NULL,
	
	to_timestamp(T."注文時間",'yyyy-MM-dd hh24:mi:ss'),
	to_timestamp(T."支払時間",'yyyy-MM-dd hh24:mi:ss'),
	case when T."発送期限" = '' then null else to_timestamp(T."発送期限",'yyyy-MM-dd hh24:mi:ss') end,
	case when T."残り日数" = '' then null else to_number(T."残り日数",'999999') end,
	
	n."ASIN番号",
	n."SKU番号",
	n."商品管理番号",
	n."商品種別",
	n."分類１",
	n."分類２",
	n."商品名称",
	NULL,
	to_number(T."商品数量",'999999'),
	T."購入者メール",
	T."購入者名称",
	T."購入者電話番号",
	
	T."宛先国",
	T."宛先郵便番号" ,
	T."宛先都道府県",
	T."宛先住所市",
	T."宛先住所１",
	T."宛先住所２",
	T."宛先住所３",
	T."宛先郵便番号" || ' ' ||T."宛先都道府県" || ' ' ||T."宛先住所市" || ' ' ||T."宛先住所１" || ' ' ||T."宛先住所２" || ' ' ||T."宛先住所３" ,
	T."宛先名称",
	
	'1',
	'A.AmazonFBM',
	NULL,
	CASE WHEN T."発送状態" = '発送済' THEN '2.発送済' ELSE'1.未発送'  END,
	NULL,
	NULL,
	substr( N."商品種別", 4 ),
	to_timestamp(T."発送期限",'yyyy-MM-dd hh24:mi:ss'),
	
	'Smart-Bear',
	CURRENT_TIMESTAMP,
	CURRENT_TIMESTAMP 
 FROM
	"ZZZ_INPUT_発送情報_AMAZON" T LEFT JOIN "MST_出品マスタ情報" N ON N."SKU番号" = T."SKU番号";

 
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
	T."注文番号",
	NULL,
	NULL,
	
	NULL,
	NULL,
	NULL,
	NULL,
	
	NULL,
	NULL,
	T."販売者商品コード",
	NULL,
	NULL,
	NULL,
	T."商品名",
	NULL,
	cast (T."数量" as int),
	
	NULL,
	T."購入者名",
	T."電話番号",
	
	NULL,
	T."郵便番号" ,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	T."お届け先",
	T."受取人名",
	
	'1',
	'B.Qoo10発送',
	NULL,
	CASE WHEN T."発送状態" = '発送済' THEN '2.発送済' ELSE'1.未発送'  END,
	NULL,
	NULL,
	NULL,
	to_timestamp(T."発送日",'yyyyMMdd'),
	'Smart-Bear',
	CURRENT_TIMESTAMP,
	CURRENT_TIMESTAMP 
 FROM
	"ZZZ_INPUT_発送情報_QOO10" T;