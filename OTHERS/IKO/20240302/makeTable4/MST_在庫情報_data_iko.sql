delete from "MST_�݌ɏ��";
INSERT into "MST_�݌ɏ��"
SELECT 
		MST."SKU�ԍ�",
		MST."ASIN�ԍ�",
		MST."FBA�݌�",
		MST."FBM�݌�",
		MST."LOCAL�݌�",
		NULL,
		MST."�r���݌�_����",
		MST."�r���݌�_�d��",
		MST."�b��t���O",
		MST."�X��ID",
		MST."�o�^����",
		MST."�X�V����"
					
FROM   "ZZZ_MST_�݌ɏ��" MST
