@ECHO OFF

SET PGPATH=D:\PostgreSQL\11\bin\psql

SET DATABASE=smartinfo2
SET DBUSR=postgres
SET PGPASSWORD=12345678
SET IPADDRESS=localhost
SET PORT=5432

%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f MST_�݌ɏ��.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f MST_�o�i�}�X�^���.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f MST_�o�i�}�X�^���_BACKUP.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f MST_���Ɏd���������ʏ��.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f MST_�̔����ʏ��.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f MST_�萔�����ς�z���.sql

%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_FBA���o�׏��.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_FBA�݌ɏo�׏��.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_FBA�݌ɏ��.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_�r�W�l�X���|�[�g-1.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_�r�W�l�X���|�[�g-2.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_�r�W�l�X���|�[�g-3.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_�r�W�l�X���|�[�g-4.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_�y�C�����g���.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_�����݌ɕۊǎ萔�������z���.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_�o�׏��.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_�ԕi���.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_�ԑ����L�������˗��ڍ׏��.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_�ԑ��������.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_�S�o�i���.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_�S�������.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_�萔�����ς�z���.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_�݌ɕۊǎ萔�����.sql

%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f RES_�����݌ɕۊǎ萔�������z���.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f RES_�݌ɕۊǎ萔�����.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f RES_�������.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f RES_�����y�C�����g���.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f RES_�񒍕��y�C�����g���.sql

%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f HIS_�y�C�����g���.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f HIS_�����݌ɕۊǎ萔�������z���.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f HIS_�݌ɕۊǎ萔�����.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f HIS_�������.sql

%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f TRN_�f�[�^��������.sql


%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f ZZZ_NEW_�o�i�}�X�^���.sql


pause
