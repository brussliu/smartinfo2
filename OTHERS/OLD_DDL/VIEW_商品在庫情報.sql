CREATE OR REPLACE VIEW public."VIEW_商品在庫情報" AS 
 SELECT COALESCE(detail."出品者SKU", mst."SKU番号") AS "SKU番号",
    COALESCE(detail."ASIN 1", mst."ASIN番号") AS "ASIN番号",
        CASE
            WHEN ((mst."商品種別")::text = '親商品'::text) THEN NULL::text
            WHEN (fba."在庫数量" IS NULL) THEN 'FBM'::text
            WHEN (detail."数量" IS NULL) THEN 'FBA'::text
            WHEN ((fba."在庫数量" IS NOT NULL) AND ((fba."在庫数量")::integer > 0)) THEN 'FBA'::text
            ELSE 'FBM'::text
        END AS "発送方式",
    detail."数量" AS "FBM在庫数量",
    fba."在庫数量" AS "FBA在庫数量",
    stock."LOCAL在庫数量",
    stock."ONBOARD在庫数量",
    (COALESCE(to_number((detail."数量")::text, '9999'::text), (0)::numeric) + COALESCE(to_number((fba."在庫数量")::text, '9999'::text), (0)::numeric)) AS "販売中在庫合計",
    (COALESCE(to_number((stock."LOCAL在庫数量")::text, '9999'::text), (0)::numeric) + COALESCE(to_number((stock."ONBOARD在庫数量")::text, '9999'::text), (0)::numeric)) AS "予備在庫合計",
    (((COALESCE(to_number((detail."数量")::text, '9999'::text), (0)::numeric) + COALESCE(to_number((fba."在庫数量")::text, '9999'::text), (0)::numeric)) + COALESCE(to_number((stock."LOCAL在庫数量")::text, '9999'::text), (0)::numeric)) + COALESCE(to_number((stock."ONBOARD在庫数量")::text, '9999'::text), (0)::numeric)) AS "全体在庫合計"
   FROM ((("INPUT_出品詳細情報" detail
     FULL JOIN "NEW_出品マスタ情報" mst ON ((((detail."出品者SKU")::text = (mst."SKU番号")::text) AND ((detail."ASIN 1")::text = (mst."ASIN番号")::text))))
     LEFT JOIN "INPUT_FBA在庫情報" fba ON ((((COALESCE(detail."出品者SKU", mst."SKU番号"))::text = (fba."SKU番号")::text) AND ((COALESCE(detail."ASIN 1", mst."ASIN番号"))::text = (fba."ASIN番号")::text) AND ((fba."販売可否状態")::text = 'SELLABLE'::text))))
     LEFT JOIN "NEW_在庫情報" stock ON ((((COALESCE(detail."出品者SKU", mst."SKU番号"))::text = (stock."SKU番号")::text) AND ((COALESCE(detail."ASIN 1", mst."ASIN番号"))::text = (stock."ASIN番号")::text))));
