
update  "MST_�݌ɏ��" 
set
"LOCAL�݌�"= to_number(T."LOCAL�݌ɐ���",'999999'),
"�r���݌�_�d��"=to_number(T."ONBOARD�݌ɐ���",'999999')
from
"ZZZ_NEW_�݌ɏ��" T
where
T."SKU�ԍ�" = "MST_�݌ɏ��"."SKU�ԍ�"
and
T."ASIN�ԍ�" = "MST_�݌ɏ��"."ASIN�ԍ�"
;