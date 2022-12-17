CREATE OR REPLACE VIEW public."VIEW_商品詳細情報" AS 
 SELECT (mst.req_no)::integer AS req_no,
    ( SELECT count(*) AS count
           FROM "NEW_出品マスタ情報"
          WHERE (("NEW_出品マスタ情報"."商品管理番号")::text = (mst."商品管理番号")::text)) AS subpq,
    ( SELECT count(DISTINCT COALESCE("NEW_出品マスタ情報"."サイズ", ''::character varying)) AS count
           FROM "NEW_出品マスタ情報"
          WHERE ((("NEW_出品マスタ情報"."商品管理番号")::text = (mst."商品管理番号")::text) AND (("NEW_出品マスタ情報"."商品種別")::text = '子商品'::text) AND ((COALESCE("NEW_出品マスタ情報"."色", ''::character varying))::text = (COALESCE(mst."色", ''::character varying))::text))) AS subcq,
        CASE
            WHEN ((mst."商品種別")::text = '親商品'::text) THEN (0)::bigint
            ELSE row_number() OVER (PARTITION BY mst."商品管理番号", mst."商品種別", mst."色" ORDER BY (mst.req_no)::integer)
        END AS sizeindex,
    mst."商品分類",
    mst."商品管理番号",
    mst."商品種別",
    mst."色",
    mst."サイズ",
    mst."仕入価格",
    COALESCE(detail."出品者SKU", mst."SKU番号") AS "SKU番号",
    COALESCE(detail."ASIN 1", mst."ASIN番号") AS "ASIN番号",
    fba."ラベル番号",
        CASE
            WHEN (v_stock."発送方式" = 'FBA'::text) THEN (c_fba."合計")::numeric
            ELSE ((c_fbm."合計")::numeric - (185)::numeric)
        END AS "想定利益",
    detail."商品名",
    detail."価格",
        CASE
            WHEN (((mst."商品種別")::text = '子商品'::text) AND (detail."出品者SKU" IS NULL)) THEN '出品削除済'::text
            WHEN (mst."SKU番号" IS NULL) THEN 'マスタに未登録'::text
            ELSE '正常'::text
        END AS "出品ステータス"
   FROM ((((("INPUT_出品詳細情報" detail
     FULL JOIN "NEW_出品マスタ情報" mst ON ((((detail."出品者SKU")::text = (mst."SKU番号")::text) AND ((detail."ASIN 1")::text = (mst."ASIN番号")::text))))
     LEFT JOIN "INPUT_FBA在庫情報" fba ON ((((COALESCE(detail."出品者SKU", mst."SKU番号"))::text = (fba."SKU番号")::text) AND ((COALESCE(detail."ASIN 1", mst."ASIN番号"))::text = (fba."ASIN番号")::text) AND ((fba."販売可否状態")::text = 'SELLABLE'::text))))
     LEFT JOIN "VIEW_商品在庫情報" v_stock ON ((((COALESCE(detail."出品者SKU", mst."SKU番号"))::text = (v_stock."SKU番号")::text) AND ((COALESCE(detail."ASIN 1", mst."ASIN番号"))::text = (v_stock."ASIN番号")::text))))
     LEFT JOIN ( SELECT "INPUT_売上詳細情報"."SKU",
            "INPUT_売上詳細情報"."商品売上",
            "INPUT_売上詳細情報"."手数料",
            "INPUT_売上詳細情報"."配送料",
            "INPUT_売上詳細情報"."FBA 手数料",
            "INPUT_売上詳細情報"."合計",
            row_number() OVER (PARTITION BY "INPUT_売上詳細情報"."SKU" ORDER BY "INPUT_売上詳細情報"."日付時間" DESC) AS rn
           FROM "INPUT_売上詳細情報"
          WHERE ((("INPUT_売上詳細情報"."トランザクションの種類")::text = '注文'::text) AND (("INPUT_売上詳細情報"."フルフィルメント")::text = 'Amazon'::text) AND (("INPUT_売上詳細情報"."数量")::text = '1'::text) AND ((("INPUT_売上詳細情報"."郵便番号")::text ~ '^[0-9]{7}'::text) OR (("INPUT_売上詳細情報"."郵便番号")::text ~ '^[0-9]{3}-[0-9]{4}'::text)))) c_fba ON ((((COALESCE(detail."出品者SKU", mst."SKU番号"))::text = (c_fba."SKU")::text) AND (c_fba.rn = 1))))
     LEFT JOIN ( SELECT "INPUT_売上詳細情報"."SKU",
            "INPUT_売上詳細情報"."商品売上",
            "INPUT_売上詳細情報"."手数料",
            "INPUT_売上詳細情報"."配送料",
            "INPUT_売上詳細情報"."FBA 手数料",
            "INPUT_売上詳細情報"."合計",
            row_number() OVER (PARTITION BY "INPUT_売上詳細情報"."SKU" ORDER BY "INPUT_売上詳細情報"."日付時間" DESC) AS rn
           FROM "INPUT_売上詳細情報"
          WHERE ((("INPUT_売上詳細情報"."トランザクションの種類")::text = '注文'::text) AND (("INPUT_売上詳細情報"."フルフィルメント")::text = '出品者'::text) AND (("INPUT_売上詳細情報"."数量")::text = '1'::text))) c_fbm ON ((((COALESCE(detail."出品者SKU", mst."SKU番号"))::text = (c_fbm."SKU")::text) AND (c_fbm.rn = 1))));
