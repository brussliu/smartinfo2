@ECHO OFF

SET PGPATH=D:\PostgreSQL\11\bin\psql

SET DATABASE=smartinfo2
SET DBUSR=postgres
SET PGPASSWORD=12345678
SET IPADDRESS=localhost
SET PORT=5432

%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f ZZZ_INPUT_�������.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f ZZZ_NEW_�݌ɏ��.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f ZZZ_�d������.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f ZZZ_�d���Ǘ�.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f ZZZ_�[�i����.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f ZZZ_�[�i�Ǘ�.sql


pause
