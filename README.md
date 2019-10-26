# only-one

数据备份
mysqldump –uroot –p dailyfresh13 > ~/Desktop/dailyfresh.sql.
按提示输入mysql的密码

数据恢复
mysql -uroot –p dailyfresh13 < dailyfresh.sql
