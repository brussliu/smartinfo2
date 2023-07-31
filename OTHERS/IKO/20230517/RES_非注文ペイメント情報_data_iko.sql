delete from "RES_非注文ペイメント情報";

insert into "RES_非注文ペイメント情報"
	(
			"日付/時間" 
			, "決済番号"
			, "トランザクションの種類" 
			, "注文番号" 
			, "SKU" 
			, "説明" 
			, "合計" 
			, "店舗ID" 
			, "登録日時" 
			, "更新日時" 
		)  
		 SELECT 
			to_timestamp( T."日付時間",'yyyy/MM/dd hh24:mi:ss    ')
			,T."決済番号"
			,T."トランザクションの種類"
			,T."注文番号"
			,T."SKU"
			,T."説明"
			,cast(T."合計" as money)
			,'Smart-Bear'
		    ,CURRENT_TIMESTAMP
		    ,CURRENT_TIMESTAMP
			
		FROM "ZZZ_INPUT_売上詳細情報" T
		WHERE  T."トランザクションの種類" not in ( '注文', '返金');
