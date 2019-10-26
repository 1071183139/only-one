# only-one

数据备份
mysqldump –uroot –p dailyfresh_13 > ~/Desktop/dailyfresh_13.sql.
按提示输入mysql的密码

数据恢复
mysql -uroot –p dailyfresh_13 < dailyfresh_13.sql
