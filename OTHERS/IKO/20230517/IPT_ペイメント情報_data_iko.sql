update "TRN_�d���Ǘ�" T1
set 
"�������A" = to_timestamp( T2."������",'yyyy/MM/dd'), 
"�������@" = to_timestamp( T2."�d���m���",'yyyy/MM/dd')
from "ZZZ_�d���Ǘ�" T2
where T1."�d��NO" = T2."�d��NO";