drop table public."TRN_�[�i����";

create table public."TRN_�[�i����" (
    "�[�iNO" character varying(20)
  , "SKU�ԍ�" character varying(50)
  , "ASIN�ԍ�" character varying(50)
  , "����" integer
  , "��̐���" integer
  , "�X��ID" character varying(20)
  , "�o�^����" timestamp(6) without time zone
  , "�X�V����" timestamp(6) without time zone

  , PRIMARY KEY ("�[�iNO", "SKU�ԍ�", "ASIN�ԍ�", "�X��ID")
);