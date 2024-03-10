delete from "MST_在庫情報";
INSERT into "MST_在庫情報"
SELECT 
		MST."SKU番号",
		MST."ASIN番号",
		MST."FBA在庫",
		MST."FBM在庫",
		MST."LOCAL在庫",
		NULL,
		MST."途中在庫_入庫",
		MST."途中在庫_仕入",
		MST."暫定フラグ",
		MST."店舗ID",
		MST."登録日時",
		MST."更新日時"
					
FROM   "ZZZ_MST_在庫情報" MST
