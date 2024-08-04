CREATE OR REPLACE VIEW public."V_�P���񃊃X�g" AS 
SELECT 
  data."����" AS book,
  data."����" AS classification,
  data."�P��SEQ" AS wordseq,
  data.testtimes,
  data.all_right,
  data.per,
  data."�P��_�p��" AS word_e,
  data."�P��_���{��" AS word_j,
  data."�P��_������" AS word_c,
  data.word_right,
  data.word_wrong,
  data."���1_�p��" AS sen1_e,
  data."���1_���{��" AS sen1_j,
  data."���1_������" AS sen1_c,
  data.sen1_right,
  data.sen1_wrong,
  data."���2_�p��" AS sen2_e,
  data."���2_���{��" AS sen2_j,
  data."���2_������" AS sen2_c,
  data.sen2_right,
  data.sen2_wrong
FROM (
  SELECT 
    t."����",
    t."����",
    t."�P��SEQ",
    t."�P��_�p��",
    t."�P��_���{��",
    t."�P��_������",
    t."���1_�p��",
    t."���1_���{��",
    t."���1_������",
    t."���2_�p��",
    t."���2_���{��",
    t."���2_������",
    t."�o�^ID",
    t."�X�VID",
    t."�o�^����",
    t."�X�V����",
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
    "STY_�P����" t
    LEFT JOIN 
      ( 
        SELECT 
          a."����" AS book,
          a."����" AS classification,
          a."�P��SEQ" AS wordseq,
          count(a."�e�X�g�ԍ�") AS testtimes,
          sum(CASE WHEN a."���茋��_�P��" = '��' THEN 1 ELSE 0 END) AS word_right,
          sum(CASE WHEN a."���茋��_�P��" = '�~' THEN 1 ELSE 0 END) AS word_wrong,
          sum(CASE WHEN a."���茋��_���1" = '��' THEN 1 ELSE 0 END) AS sen1_right,
          sum(CASE WHEN a."���茋��_���1" = '�~' THEN 1 ELSE 0 END) AS sen1_wrong,
          sum(CASE WHEN a."���茋��_���2" = '��' THEN 1 ELSE 0 END) AS sen2_right,
          sum(CASE WHEN a."���茋��_���2" = '�~' THEN 1 ELSE 0 END) AS sen2_wrong,
          sum(
              CASE WHEN 
                a."���茋��_�P��" in ('��','-') AND a."���茋��_���1" in ('��','-') AND a."���茋��_���2" in ('��','-') THEN 1
                  ELSE 0
              END) AS all_right,
          sum(a."����") AS "time"
        FROM 
          "STY_�P��e�X�g�ڍ׏��" a
          LEFT JOIN "STY_�P����" b 
            ON a."����" = b."����" AND a."����" = b."����" AND a."�P��SEQ" = b."�P��SEQ"
          LEFT JOIN "STY_�P��e�X�g���" c
            ON a."�e�X�g�ԍ�" = c."�e�X�g�ԍ�"
        WHERE 
          a."�X�e�[�^�X" in ('8','9')
          AND
          c."�e�X�g�敪" = '1'
        GROUP BY 
          a."����", a."����", a."�P��SEQ"
      ) d 
    ON t."����" = d.book AND t."����" = d.classification AND t."�P��SEQ" = d.wordseq
) data;