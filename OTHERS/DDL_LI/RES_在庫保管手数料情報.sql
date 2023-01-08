drop table public."RES_�ڎ챣�����������";

create table public."RES_�ڎ챣�����������" (
  "ASIN" character varying(20)
  , fnsku character varying(20)
  , "��Ʒ��" character varying(500)
  , "Fulfillment center" character varying(20)
  , "Country code" character varying(20)
  , "Longest side" numeric(7, 2)
  , "Median side" numeric(7, 2)
  , "Shortest side" numeric(7, 2)
  , "Measurement units" character varying(20)
  , weight character varying(20)
  , "Weight units" character varying(20)
  , "Item volume" character varying(20)
  , "Volume units" character varying(20)
  , "Product size tier" character varying(20)
  , "Average quantity on hand" numeric(7, 2)
  , "Average quantity pending removal" numeric(7, 2)
  , "Total item volume (est.)" character varying(50)
  , "Month of charge" character varying(50)
  , "Storage rate" numeric(7, 2)
  , "ͨ؛" character varying(50)
  , "Monthly storage fee (est.)" numeric(7, 2)
  , category character varying(50)
  , "Total Incentive Amount" numeric(7, 2)
  , breakdown_incentive_fee_amount character varying(50)
  , average_quantity_customer_orders numeric(7, 2)
  , "���nID" character varying(20)
  , "���h�Օr" timestamp(6) without time zone
  , "�����Օr" timestamp(6) without time zone
);
