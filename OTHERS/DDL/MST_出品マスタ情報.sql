drop table public."MST_�o�i�}�X�^���";

create table public."MST_�o�i�}�X�^���" (
    "SKU�ԍ�" character varying(12)
  , "ASIN�ԍ�" character varying(20)
  , "LABEL�ԍ�" character varying(20)
  , "���i�Ǘ��ԍ�" character varying(20)
  , "�e�q�敪" character varying(20)
  , "���i���" character varying(50)
  , "���ނP" character varying(100)
  , "���ނQ" character varying(100)
  , "�d�����i" numeric(10,2)
  , "FBM��������" character varying(50)
  , "���i����" character varying(500)
  , "�d���\�񉿊i�i���j" numeric(10,2)
  , "�d���\�񉿊i�i�h���j" numeric(10,2)
  , "�b��t���O" int
  , "�X��ID" character varying(20)
  , "�o�^����" timestamp(6) without time zone
  , "�X�V����" timestamp(6) without time zone

  , PRIMARY KEY ("SKU�ԍ�", "ASIN�ԍ�", "�b��t���O", "�X��ID")
);
