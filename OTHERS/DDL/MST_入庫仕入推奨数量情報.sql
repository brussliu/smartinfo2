drop table public."MST_όΙdό§Κξρ";

create table public."MST_όΙdό§Κξρ" (
    "SKUΤ" character varying(12)
  , "ASINΤ" character varying(20)
  , "έΙΜΒ\ϊ" int
  , "ΫLΚΜΒ\ϊ" int
  , "§[iΚ" int
  , "§dόΚ" int
  , "XάID" character varying(20)
  , "o^ϊ" timestamp(6) without time zone
  , "XVϊ" timestamp(6) without time zone

  , PRIMARY KEY ("SKUΤ", "ASINΤ", "XάID")
);