drop table public."TRN_�d������";

create table public."TRN_�d������" (
  "�d��NO" character varying(20)
  , "SKU�ԍ�" character varying(50)
  , "ASIN�ԍ�" character varying(50)
  , "�P��" numeric(10,2)
  , "����" integer
  , "���z" numeric(10,2)
  , "�b��t���O" int
  , "�X��ID" character varying(20)
  , "�o�^����" timestamp(6) without time zone
  , "�X�V����" timestamp(6) without time zone

  , PRIMARY KEY ("�d��NO", "SKU�ԍ�", "ASIN�ԍ�", "�b��t���O", "�X��ID")
);