drop table public."ZZZ_TEMP_î≠ëóèÓïÒ";
 
 create table public."ZZZ_TEMP_î≠ëóèÓïÒ" (
  "NO" character varying(20) default NULL
  , "POST_NO" character varying(10) default NULL
  , "ADDRESS1" character varying(200) default NULL
  , "ADDRESS2" character varying(200) default NULL
  , "ADDRESS3" character varying(200) default NULL
  , "NAME" character varying(100) default NULL
  , "TEL" character varying(50) default NULL
  , "SHIP_CONTENT_DIV" character varying(2) default NULL
  , "SHIP_CONTENT" character varying(200) default NULL
  , "SHIP_COUNT" integer
  , "SHIP_DIV" character varying(1) default NULL
  , "BIKO" character varying(200) default NULL
  , "TRACKING_NO" character varying(20) default NULL
  , "STATUS" character varying(1) default NULL
  , "PAY_STATUS" character varying(1) default NULL
  , "FEE" integer
  , "FEE_DIV" character varying(1) default NULL
  , "AMOUNT" integer
);
