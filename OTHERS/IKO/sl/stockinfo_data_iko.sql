
update  "MST_�݌ɏ��" 
set
"LOCAL�݌�"=T."LOCAL�݌ɐ���",
"�r���݌�_�d��"=T."ONBOARD�݌ɐ���"
from
"ZZZ_NEW_�݌ɏ��" T
where
T."SKU�ԍ�" = "MST_�݌ɏ��"."SKU�ԍ�"
and
T."ASIN�ԍ�" = "MST_�݌ɏ��"."ASIN�ԍ�"
;