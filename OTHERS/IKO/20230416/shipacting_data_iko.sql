delete from "MST_ãs­îñ";

insert into "MST_ãs­îñ"
	(
	   "ÇÔ" 
	  , "¨Í¯æ-XÖÔ" 
	  , "¨Í¯æ-Z1" 
	  , "¨Í¯æ-Z2" 
	  , "¨Í¯æ-Z3" 
	  , "¨Í¯æ-¼O" 
	  , "¨Í¯æ-dbÔ" 
	  , "õl" 

	  , "¤iÇÔ" 
	  , "¤iÊ" 
	  , "­û@" 
	  , "Xe[^X" 
	  , "ÇÕÔ" 
	  , "x¥óÔ" 
	  , "­ïpi~j" 
	  , "­ïpi³j" 
	  , "¿æXÜID" 
	  
	  , "XÜID" 
	  , "o^ú" 
	  , "XVú" 
		)
 SELECT 
	T."NO",
	T."POST_NO",
	T."ADDRESS1",
	T."ADDRESS2",
	T."ADDRESS3",
	T."NAME",
	T."TEL",
	T."BIKO",
	
	to_number(T."SHIP_CONTENT",'999999'),
	T."SHIP_COUNT",
	case	 when T."SHIP_DIV" = 'C' then '01.NbN|Xg'
			 when T."SHIP_DIV" = 'Y' then '03.ä¤pPbg'
			 when T."SHIP_DIV" = 'S' then '02.ÊÖ' end ,
	case 	when T."STATUS" = '0' then '1.V@K'
			when T."STATUS" = '5' then '2.óüÏ'
			when T."STATUS" = '8' then '3.­Ï' end ,
	T."TRACKING_NO",
	case 	when T."PAY_STATUS" = '1' then '2.x¥Ï'
			else  '1.¢x¥' end ,
	T."FEE",
	T."AMOUNT",
	'Smart-Bear',
	'zhixun',
	CURRENT_TIMESTAMP,
	CURRENT_TIMESTAMP 
 FROM
	"ZZZ_TEMP_­îñ" T 
 WHERE
	T."STATUS" in ('0','5','8');
