drop table public."RES_���i�ʍL�����ה�p";

create table public."RES_���i�ʍL�����ה�p" (
    "�N��" character varying(20)
  , "SKU�ԍ�" character varying(12)
  , "ASIN�ԍ�" character varying(20)
  , "�X�e�[�^�X" character varying(10)
  , "�^�C�v" character varying(10)
  , "�X�|���T�[�v���_�N�g�L���̗��p���i" character varying(20)
  , "����(JPY)" integer
  , "ROAS" numeric(10,2)
  , "�R���o�[�W������" numeric(10,4)
  , "�C���v���b�V������" integer
  , "�N���b�N��" integer
  , "�N���b�N��(CTR)" numeric(10,4)
  , "�L����(JPY)" numeric(10,2)
  , "���σN���b�N�P��(CPC)(JPY)" numeric(10,2)
  , "����" integer
  , "ACOS" numeric(10,4)
  , "�V�K�ڋq�̒���" integer
  , "�V�K�ڋq�̒����䗦" numeric(10,2)
  , "�V�K�ڋq�̔���(JPY)" integer
  , "�V�K�ڋq�̔���䗦" numeric(10,2)
  , "�r���[�A�u���C���v���b�V����" integer
  , "�X��ID" character varying(20)
  , "�o�^����" timestamp(6) without time zone
  , "�X�V����" timestamp(6) without time zone
  , PRIMARY KEY ("�N��", "SKU�ԍ�", "ASIN�ԍ�", "�X��ID")
);