@ECHO OFF

SET PGPATH=C:\"Program Files"\PostgreSQL\11\bin\psql

SET DATABASE=postgres
SET DBUSR=postgres
SET PGPASSWORD=12345678
SET IPADDRESS=localhost
SET PORT=5432


SET SVPATH=D:\01.Backup\%d%_%t%

%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_FBA未出荷情報.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_FBA在庫出荷情報.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_FBA在庫情報.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_ビジネスレポート-1.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_ビジネスレポート-2.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_ビジネスレポート-3.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_ビジネスレポート-4.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_ペイメント情報.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_長期在庫保管手数料請求額情報.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_出荷情報.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_返品情報.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_返送所有権放棄依頼詳細情報.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_返送推奨情報.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_全出品情報.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_全注文情報.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_手数料見積り額情報.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f IPT_在庫保管手数料情報.sql

%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f RES_長期在庫保管手数料請求額情報.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f RES_在庫保管手数料情報.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f RES_注文情報.sql

%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f HIS_ペイメント情報.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f HIS_長期在庫保管手数料請求額情報.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f HIS_在庫保管手数料情報.sql
%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f HIS_注文情報.sql

%PGPATH% -h %IPADDRESS% -p %PORT% -d %DATABASE% -U %DBUSR% -f TRN_データ導入履歴.sql


pause
