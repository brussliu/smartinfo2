drop table public."STY_�P����";

create table public."STY_�P����" (
    "����" character varying(50) not null
  , "����" character varying(20) not null
  , "�P��SEQ" integer not null

  , "�P��_�p��" character varying(500)
  , "�P��_���{��" character varying(500)
  , "�P��_������" character varying(500)

  , "���1_�p��" character varying(500)
  , "���1_���{��" character varying(500)
  , "���1_������" character varying(500)
  
  , "���2_�p��" character varying(500)
  , "���2_���{��" character varying(500)
  , "���2_������" character varying(500)

  , "�o�^ID" character varying(20)
  , "�X�VID" character varying(20)
  , "�o�^����" timestamp(6) without time zone
  , "�X�V����" timestamp(6) without time zone
  , primary key ("����", "����", "�P��SEQ")
);