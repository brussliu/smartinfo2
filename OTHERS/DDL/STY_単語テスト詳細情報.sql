drop table public."STY_�P��e�X�g�ڍ׏��";

create table public."STY_�P��e�X�g�ڍ׏��" (
    "�e�X�g�ԍ�" character varying(20) 
  , "�}�ԍ�" integer

  , "����" character varying(50)
  , "����" character varying(20)
  , "�P��SEQ" integer

  , "�X�e�[�^�X" character varying(1)

  , "����_�P��" integer
  , "����_���1" integer
  , "����_���2" integer

  , "�菑�����e_�P��" text
  , "�菑�����e_���1" text
  , "�菑�����e_���2" text

  , "���茋��_�P��" character varying(10)
  , "���茋��_���1" character varying(10)
  , "���茋��_���2" character varying(10)

  , "����" integer

  , "�o�^ID" character varying(20)
  , "�X�VID" character varying(20)
  , "�o�^����" timestamp(6) without time zone
  , "�X�V����" timestamp(6) without time zone
  
  , primary key("�e�X�g�ԍ�","�}�ԍ�")
);
