drop table public."MST_�萔�����ς�z���";

create table public."MST_�萔�����ς�z���" (
  "sku"character varying(12)
  , "fnsku" character varying(20)
  , "asin" character varying(20)
  , "���i��" character varying(500)
  , "���i�O���[�v" character varying(50)
  , "�u�����h" character varying(50)
  , "�t���t�B�������g" character varying(50)
  , "��Ԓ�����" numeric(7, 2)
  , "���Ԃ̕�" numeric(7, 2)
  , "��ԒZ����" numeric(7, 2)
  , "�����Ǝ��͂̐��@" numeric(7, 2)
  , "���i�̐��@" character varying(50)
  , "���i�p�b�P�[�W�̏d��" numeric(7, 2)
  , "���i�d��" character varying(50)
  , "�ʉ�" character varying(50)
  , "�萔�����ς�z" money
  , "�̔��萔�����ς�z(��������)" money
  , "�J�e�S���[�ʐ��񗿌��ς�z" money
  , "�o�׍�Ǝ萔�����ς�z�i��������j" character varying(50)
  , "�����d�ʎ萔���̌��ς�z�i��������j" character varying(50)
  , "�z����s�萔�����ς�z�i��������j" money
  , "����̎萔�����ς�z�i���݂�Amazon�o�i�T�[�r" character varying(50)
  , "����̏o�׍�Ǝ萔���̌��ς�z�i��������" character varying(50)
  , "����̔����d�ʎ萔�����ς�z�i��������j" character varying(50)
  , "����̔z����s�萔���i��������j" character varying(50)
  , "�X��ID" character varying(20)
  , "�o�^����" timestamp(6) without time zone
  , "�X�V����" timestamp(6) without time zone
);