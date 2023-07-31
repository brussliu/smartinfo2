delete from "RES_注文ペイメント情報";
INSERT into "RES_注文ペイメント情報"
SELECT 
		to_timestamp( T."日付時間",'yyyy/MM/dd hh24:mi:ss    ')
		,T."決済番号"
		,T."トランザクションの種類"
		,T."注文番号"
		,T."SKU"
		,T."説明"
		, case when  T."数量" = '' then 0 else cast(T."数量" as int) END
		, T."Amazon出品サービス" 
		, T."フルフィルメント"  
		, T."市町村" 
		, T."都道府県"  
		, T."郵便番号"  
		, T."税金徴収型"  
		, cast(T."商品売上" as money)
		, cast(T."商品の売上税" as money)
		, cast(T."配送料" as money)
		, cast(T."配送料の税金" as money) 
		, cast(T."ギフト包装手数料" as money) 
		, cast(T."ギフト包装クレジットの税金" as money) 
		, cast(T."Amazonポイントの費用" as money) 
		, cast(T."プロモーション割引額" as money)
		, cast(T."プロモーション割引の税金" as money) 
		, T."源泉徴収税を伴うマーケットプレイス" 
		, cast(T."手数料" as money) 
		, cast(T."FBA 手数料" as money) 
		, cast(T."トランザクションに関するその他の手数料" as money) 
		, cast(T."その他" as money) 
		, cast(T."合計" as money) 
		,'Smart-Bear'
		,CURRENT_TIMESTAMP
		,CURRENT_TIMESTAMP			
FROM   "ZZZ_INPUT_売上詳細情報" T
WHERE  T."トランザクションの種類"  in ( '注文', '返金') ;
