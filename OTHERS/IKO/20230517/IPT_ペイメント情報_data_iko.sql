update "TRN_仕入管理" T1
set 
"発送日②" = to_timestamp( T2."発送日",'yyyy/MM/dd'), 
"発送日①" = to_timestamp( T2."仕入確定日",'yyyy/MM/dd')
from "ZZZ_仕入管理" T2
where T1."仕入NO" = T2."仕入NO";