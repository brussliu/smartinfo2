delete from "ZZZ_MST_�݌ɏ��";
INSERT into "ZZZ_MST_�݌ɏ��"
SELECT 
		MST."SKU�ԍ�",
		MST."ASIN�ԍ�",
		MST."FBA�݌�",
		MST."FBM�݌�",
		MST."LOCAL�݌�",
		MST."�r���݌�_����",
		MST."�r���݌�_�d��",
		MST."�b��t���O",
		MST."�X��ID",
		MST."�o�^����",
		MST."�X�V����"
					
FROM   "MST_�݌ɏ��" MST
