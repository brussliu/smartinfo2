delete from "TRN_[iΎΧ";

insert into "TRN_[iΎΧ"
select
T."[iNO",
T."SKUΤ",
T."ASINΤ",
to_number(T."Κ",'999999'),
to_number(T."σΜΚ",'999999'),

'Smart-Bear',
current_timestamp,
current_timestamp
from
"ZZZ_[iΎΧ" T;