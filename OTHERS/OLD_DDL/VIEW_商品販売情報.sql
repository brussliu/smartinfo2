CREATE OR REPLACE VIEW public."VIEW_商品販売情報" AS 
 SELECT COALESCE(detail."出品者SKU", mst."SKU番号") AS "SKU番号",
    COALESCE(detail."ASIN 1", mst."ASIN番号") AS "ASIN番号",
    COALESCE(t1."前日数量", (0)::bigint) AS "前日数量",
    COALESCE(t2."7日間数量", (0)::bigint) AS "7日間数量",
    COALESCE(t3."30日間数量", (0)::bigint) AS "30日間数量",
    COALESCE(t4."60日間数量", (0)::bigint) AS "60日間数量",
    COALESCE(t5."90日間数量", (0)::bigint) AS "90日間数量"
   FROM (((((((("INPUT_出品詳細情報" detail
     FULL JOIN "NEW_出品マスタ情報" mst ON ((((detail."出品者SKU")::text = (mst."SKU番号")::text) AND ((detail."ASIN 1")::text = (mst."ASIN番号")::text))))
     LEFT JOIN "INPUT_FBA在庫情報" fba ON ((((COALESCE(detail."出品者SKU", mst."SKU番号"))::text = (fba."SKU番号")::text) AND ((COALESCE(detail."ASIN 1", mst."ASIN番号"))::text = (fba."ASIN番号")::text) AND ((fba."販売可否状態")::text = 'SELLABLE'::text))))
     LEFT JOIN "NEW_在庫情報" stock ON ((((COALESCE(detail."出品者SKU", mst."SKU番号"))::text = (stock."SKU番号")::text) AND ((COALESCE(detail."ASIN 1", mst."ASIN番号"))::text = (stock."ASIN番号")::text))))
     LEFT JOIN ( SELECT t."SKU番号",
            t."ASIN番号",
            sum((t."数量")::integer) AS "前日数量"
           FROM "INPUT_注文情報" t
          WHERE (((t."販売方")::text = 'Amazon.co.jp'::text) AND ("substring"((t."注文日時")::text, 1, 10) = to_char((CURRENT_DATE - '1 day'::interval), 'yyyy-mm-dd'::text)))
          GROUP BY t."SKU番号", t."ASIN番号") t1 ON ((((COALESCE(detail."出品者SKU", mst."SKU番号"))::text = (t1."SKU番号")::text) AND ((COALESCE(detail."ASIN 1", mst."ASIN番号"))::text = (t1."ASIN番号")::text))))
     LEFT JOIN ( SELECT t."SKU番号",
            t."ASIN番号",
            sum((t."数量")::integer) AS "7日間数量"
           FROM "INPUT_注文情報" t
          WHERE (((t."販売方")::text = 'Amazon.co.jp'::text) AND ("substring"((t."注文日時")::text, 1, 10) >= to_char((CURRENT_DATE - '7 days'::interval), 'yyyy-mm-dd'::text)))
          GROUP BY t."SKU番号", t."ASIN番号") t2 ON ((((COALESCE(detail."出品者SKU", mst."SKU番号"))::text = (t2."SKU番号")::text) AND ((COALESCE(detail."ASIN 1", mst."ASIN番号"))::text = (t2."ASIN番号")::text))))
     LEFT JOIN ( SELECT t."SKU番号",
            t."ASIN番号",
            sum((t."数量")::integer) AS "30日間数量"
           FROM "INPUT_注文情報" t
          WHERE (((t."販売方")::text = 'Amazon.co.jp'::text) AND ("substring"((t."注文日時")::text, 1, 10) >= to_char((CURRENT_DATE - '30 days'::interval), 'yyyy-mm-dd'::text)))
          GROUP BY t."SKU番号", t."ASIN番号") t3 ON ((((COALESCE(detail."出品者SKU", mst."SKU番号"))::text = (t3."SKU番号")::text) AND ((COALESCE(detail."ASIN 1", mst."ASIN番号"))::text = (t3."ASIN番号")::text))))
     LEFT JOIN ( SELECT t."SKU番号",
            t."ASIN番号",
            sum((t."数量")::integer) AS "60日間数量"
           FROM "INPUT_注文情報" t
          WHERE (((t."販売方")::text = 'Amazon.co.jp'::text) AND ("substring"((t."注文日時")::text, 1, 10) >= to_char((CURRENT_DATE - '60 days'::interval), 'yyyy-mm-dd'::text)))
          GROUP BY t."SKU番号", t."ASIN番号") t4 ON ((((COALESCE(detail."出品者SKU", mst."SKU番号"))::text = (t4."SKU番号")::text) AND ((COALESCE(detail."ASIN 1", mst."ASIN番号"))::text = (t4."ASIN番号")::text))))
     LEFT JOIN ( SELECT t."SKU番号",
            t."ASIN番号",
            sum((t."数量")::integer) AS "90日間数量"
           FROM "INPUT_注文情報" t
          WHERE (((t."販売方")::text = 'Amazon.co.jp'::text) AND ("substring"((t."注文日時")::text, 1, 10) >= to_char((CURRENT_DATE - '90 days'::interval), 'yyyy-mm-dd'::text)))
          GROUP BY t."SKU番号", t."ASIN番号") t5 ON ((((COALESCE(detail."出品者SKU", mst."SKU番号"))::text = (t5."SKU番号")::text) AND ((COALESCE(detail."ASIN 1", mst."ASIN番号"))::text = (t5."ASIN番号")::text))));
