drop table public."MST_ΜΚξρ";

create table public."MST_ΜΚξρ" (
    "SKUΤ" character varying(12)
  , "ASINΤ" character varying(20)
  , "ΜΚiΌίRϊΤj" int
  , "ΜΚiΌίVϊΤj" int
  , "ΜΚiΌίROϊΤj" int
  , "ΜΚiΌίUOϊΤj" int
  , "ΜΚiΌίXOϊΤj" int
  , "ΜΚiΌίPWOϊΤj" int
  , "ΜΚiΌίRUOϊΤj" int
  , "ΜΚiϊ½Οlj" numeric(10,5)
  , "XάID" character varying(20)
  , "o^ϊ" timestamp(6) without time zone
  , "XVϊ" timestamp(6) without time zone

  , PRIMARY KEY ("SKUΤ", "ASINΤ", "XάID")
);