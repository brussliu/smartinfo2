CREATE OR REPLACE VIEW public."V_単語情報リスト" AS 
SELECT 
  data."書籍" AS book,
  data."分類" AS classification,
  data."単語SEQ" AS wordseq,
  data.testtimes,
  data.all_right,
  data.per,
  data."単語_英語" AS word_e,
  data."単語_日本語" AS word_j,
  data."単語_中国語" AS word_c,
  data.word_right,
  data.word_wrong,
  data."例句1_英語" AS sen1_e,
  data."例句1_日本語" AS sen1_j,
  data."例句1_中国語" AS sen1_c,
  data.sen1_right,
  data.sen1_wrong,
  data."例句2_英語" AS sen2_e,
  data."例句2_日本語" AS sen2_j,
  data."例句2_中国語" AS sen2_c,
  data.sen2_right,
  data.sen2_wrong
FROM (
  SELECT 
    t."書籍",
    t."分類",
    t."単語SEQ",
    t."単語_英語",
    t."単語_日本語",
    t."単語_中国語",
    t."例句1_英語",
    t."例句1_日本語",
    t."例句1_中国語",
    t."例句2_英語",
    t."例句2_日本語",
    t."例句2_中国語",
    t."登録ID",
    t."更新ID",
    t."登録日時",
    t."更新日時",
    d.book,
    d.classification,
    d.wordseq,
    d.testtimes,
    d.word_right,
    d.word_wrong,
    d.sen1_right,
    d.sen1_wrong,
    d.sen2_right,
    d.sen2_wrong,
    d.all_right,
    d."time",
    CASE
        WHEN d.testtimes = 0 OR d.testtimes IS NULL THEN NULL
        ELSE round(d.all_right / d.testtimes,2) * 100
    END AS per
  FROM 
    "STY_単語情報" t
    LEFT JOIN 
      ( 
        SELECT 
          a."書籍" AS book,
          a."分類" AS classification,
          a."単語SEQ" AS wordseq,
          count(a."テスト番号") AS testtimes,
          sum(CASE WHEN a."判定結果_単語" = '○' THEN 1 ELSE 0 END) AS word_right,
          sum(CASE WHEN a."判定結果_単語" = '×' THEN 1 ELSE 0 END) AS word_wrong,
          sum(CASE WHEN a."判定結果_例句1" = '○' THEN 1 ELSE 0 END) AS sen1_right,
          sum(CASE WHEN a."判定結果_例句1" = '×' THEN 1 ELSE 0 END) AS sen1_wrong,
          sum(CASE WHEN a."判定結果_例句2" = '○' THEN 1 ELSE 0 END) AS sen2_right,
          sum(CASE WHEN a."判定結果_例句2" = '×' THEN 1 ELSE 0 END) AS sen2_wrong,
          sum(
              CASE WHEN 
                a."判定結果_単語" in ('○','-') AND a."判定結果_例句1" in ('○','-') AND a."判定結果_例句2" in ('○','-') THEN 1
                  ELSE 0
              END) AS all_right,
          sum(a."時間") AS "time"
        FROM 
          "STY_単語テスト詳細情報" a
          LEFT JOIN "STY_単語情報" b 
            ON a."書籍" = b."書籍" AND a."分類" = b."分類" AND a."単語SEQ" = b."単語SEQ"
          LEFT JOIN "STY_単語テスト情報" c
            ON a."テスト番号" = c."テスト番号"
        WHERE 
          a."ステータス" in ('8','9')
          AND
          c."テスト区分" = '1'
        GROUP BY 
          a."書籍", a."分類", a."単語SEQ"
      ) d 
    ON t."書籍" = d.book AND t."分類" = d.classification AND t."単語SEQ" = d.wordseq
) data;