drop table public."TEMP_UPLOADPIC";

create table public."TEMP_UPLOADPIC" (
    "PICNO" serial primary key
  , "PIC" character varying(99999)
  , "�X��ID" character varying(20)
  , "�o�^����" timestamp(6) without time zone
  , "�X�V����" timestamp(6) without time zone
);