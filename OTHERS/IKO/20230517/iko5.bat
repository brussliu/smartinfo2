@ECHO OFF

SET PGPATH=D:\PostgreSQL\11\bin\psql

SET DATABASE=smartinfo2
SET DBUSR=postgres
SET PGPASSWORD=12345678
SET IPADDRESS=localhost
SET PORT=5432


%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_�y�C�����g���_data_iko.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f RES_�񒍕��y�C�����g���_data_iko.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f RES_�����y�C�����g���_data_iko.sql


pause
