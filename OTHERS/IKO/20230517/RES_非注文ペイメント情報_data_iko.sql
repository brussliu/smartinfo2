delete from "RES_�񒍕��y�C�����g���";

insert into "RES_�񒍕��y�C�����g���"
	(
			"���t/����" 
			, "���ϔԍ�"
			, "�g�����U�N�V�����̎��" 
			, "�����ԍ�" 
			, "SKU" 
			, "����" 
			, "���v" 
			, "�X��ID" 
			, "�o�^����" 
			, "�X�V����" 
		)  
		 SELECT 
			to_timestamp( T."���t����",'yyyy/MM/dd hh24:mi:ss    ')
			,T."���ϔԍ�"
			,T."�g�����U�N�V�����̎��"
			,T."�����ԍ�"
			,T."SKU"
			,T."����"
			,cast(T."���v" as money)
			,'Smart-Bear'
		    ,CURRENT_TIMESTAMP
		    ,CURRENT_TIMESTAMP
			
		FROM "ZZZ_INPUT_����ڍ׏��" T
		WHERE  T."�g�����U�N�V�����̎��" not in ( '����', '�ԋ�');
