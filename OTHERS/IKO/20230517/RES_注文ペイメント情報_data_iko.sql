delete from "RES_�����y�C�����g���";
INSERT into "RES_�����y�C�����g���"
SELECT 
		to_timestamp( T."���t����",'yyyy/MM/dd hh24:mi:ss    ')
		,T."���ϔԍ�"
		,T."�g�����U�N�V�����̎��"
		,T."�����ԍ�"
		,T."SKU"
		,T."����"
		, case when  T."����" = '' then 0 else cast(T."����" as int) END
		, T."Amazon�o�i�T�[�r�X" 
		, T."�t���t�B�������g"  
		, T."�s����" 
		, T."�s���{��"  
		, T."�X�֔ԍ�"  
		, T."�ŋ������^"  
		, cast(T."���i����" as money)
		, cast(T."���i�̔����" as money)
		, cast(T."�z����" as money)
		, cast(T."�z�����̐ŋ�" as money) 
		, cast(T."�M�t�g��萔��" as money) 
		, cast(T."�M�t�g��N���W�b�g�̐ŋ�" as money) 
		, cast(T."Amazon�|�C���g�̔�p" as money) 
		, cast(T."�v�����[�V���������z" as money)
		, cast(T."�v�����[�V���������̐ŋ�" as money) 
		, T."���򒥎��ł𔺂��}�[�P�b�g�v���C�X" 
		, cast(T."�萔��" as money) 
		, cast(T."FBA �萔��" as money) 
		, cast(T."�g�����U�N�V�����Ɋւ��邻�̑��̎萔��" as money) 
		, cast(T."���̑�" as money) 
		, cast(T."���v" as money) 
		,'Smart-Bear'
		,CURRENT_TIMESTAMP
		,CURRENT_TIMESTAMP			
FROM   "ZZZ_INPUT_����ڍ׏��" T
WHERE  T."�g�����U�N�V�����̎��"  in ( '����', '�ԋ�') ;
