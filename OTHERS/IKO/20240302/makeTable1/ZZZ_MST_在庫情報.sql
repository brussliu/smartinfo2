drop table public."ZZZ_MST_�݌ɏ��";

create table public."ZZZ_MST_�݌ɏ��" (
    "SKU�ԍ�" character varying(12)
  , "ASIN�ԍ�" character varying(20)
  , "FBA�݌�" int
  , "FBM�݌�" int
  , "LOCAL�݌�" int
  , "�r���݌�_����" int
  , "�r���݌�_�d��" int
  , "�b��t���O" int
  , "�X��ID" character varying(20)
  , "�o�^����" timestamp(6) without time zone
  , "�X�V����" timestamp(6) without time zone

  , PRIMARY KEY ("SKU�ԍ�", "ASIN�ԍ�", "�b��t���O", "�X��ID")
);