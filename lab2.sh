mysql> show tables;
ERROR 1046 (3D000): No database selected
mysql> use myorders;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+--------------------+
| Tables_in_myorders |
+--------------------+
| assessment         |
| st_contact_info    |
| stud_sub_assess    |
| student            |
| subject            |
| user               |
+--------------------+
6 rows in set (0.00 sec)

mysql> desc student;
+----------+-----------------------+------+-----+---------+----------------+
| Field    | Type                  | Null | Key | Default | Extra          |
+----------+-----------------------+------+-----+---------+----------------+
| st_id    | int(10) unsigned      | NO   | PRI | NULL    | auto_increment |
| fname    | varchar(20)           | YES  |     | NULL    |                |
| lname    | varchar(20)           | YES  |     | NULL    |                |
| email    | varchar(40)           | NO   | UNI | NULL    |                |
| gender   | enum('female','male') | YES  |     | NULL    |                |
| birthday | date                  | YES  |     | NULL    |                |
| passowrd | int(10) unsigned      | NO   | UNI | NULL    |                |
+----------+-----------------------+------+-----+---------+----------------+
7 rows in set (0.00 sec)

mysql> show student;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'student' at line 1
mysql> select * from student;
Empty set (0.00 sec)

mysql> insert into student values (null,'mahmoud','wael','mahmoud_wael@gmail.com','male','23/7/1989',password('wael') );
Query OK, 1 row affected, 2 warnings (0.07 sec)

mysql> select * from student;
+-------+---------+-------+------------------------+--------+------------+----------+
| st_id | fname   | lname | email                  | gender | birthday   | passowrd |
+-------+---------+-------+------------------------+--------+------------+----------+
|     1 | mahmoud | wael  | mahmoud_wael@gmail.com | male   | 0000-00-00 |        0 |
+-------+---------+-------+------------------------+--------+------------+----------+
1 row in set (0.00 sec)

mysql> insert into student values (null,'mahmoud','wael','mahmoud_wael@gmail.com','male','23/7/1989','password("wael")' );
ERROR 1062 (23000): Duplicate entry 'mahmoud_wael@gmail.com' for key 'email'
mysql> insert into student values (null,'mahmoud','wael','mahmoud_wael1@gmail.com','male','23/7/1989','password("wael")' );
ERROR 1062 (23000): Duplicate entry '0' for key 'passowrd'
mysql> insert into student values (null,'mahmoud','wael','mahmoud_wael1@gmail.com','male','1989-07-23','password("wael")' );
ERROR 1062 (23000): Duplicate entry '0' for key 'passowrd'
mysql> insert into student values (null,'mahmoud','wael','mahmoud_wael1@gmail.com','male','1989-07-23',password("wael") );
ERROR 1062 (23000): Duplicate entry '0' for key 'passowrd'
mysql> insert into student values (null,'mahmoud','wael','mahmoud_wael1@gmail.com','male','1989-07-23',password("111") );
ERROR 1062 (23000): Duplicate entry '0' for key 'passowrd'
mysql> alter table student modify password varchar(70) not null;
ERROR 1054 (42S22): Unknown column 'password' in 'student'
mysql> alter table student modify passowrd varchar(70) not null;
Query OK, 1 row affected (0.30 sec)
Records: 1  Duplicates: 0  Warnings: 0

mysql> desc student;
+----------+-----------------------+------+-----+---------+----------------+
| Field    | Type                  | Null | Key | Default | Extra          |
+----------+-----------------------+------+-----+---------+----------------+
| st_id    | int(10) unsigned      | NO   | PRI | NULL    | auto_increment |
| fname    | varchar(20)           | YES  |     | NULL    |                |
| lname    | varchar(20)           | YES  |     | NULL    |                |
| email    | varchar(40)           | NO   | UNI | NULL    |                |
| gender   | enum('female','male') | YES  |     | NULL    |                |
| birthday | date                  | YES  |     | NULL    |                |
| passowrd | varchar(70)           | NO   | UNI | NULL    |                |
+----------+-----------------------+------+-----+---------+----------------+
7 rows in set (0.00 sec)

mysql> insert into student values (null,'mahmoud','wael','mahmoud_wael1@gmail.com','male','1989-07-23',password("wael") );
Query OK, 1 row affected (0.07 sec)

mysql> show student;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'student' at line 1
mysql> select * from student;
+-------+---------+-------+-------------------------+--------+------------+-------------------------------------------+
| st_id | fname   | lname | email                   | gender | birthday   | passowrd                                  |
+-------+---------+-------+-------------------------+--------+------------+-------------------------------------------+
|     1 | mahmoud | wael  | mahmoud_wael@gmail.com  | male   | 0000-00-00 | 0                                         |
|     7 | mahmoud | wael  | mahmoud_wael1@gmail.com | male   | 1989-07-23 | *50D43D57BB27B575CE8183844DA7318EBB4A4D7F |
+-------+---------+-------+-------------------------+--------+------------+-------------------------------------------+
2 rows in set (0.00 sec)

mysql> delete from student where password='0';
ERROR 1054 (42S22): Unknown column 'password' in 'where clause'
mysql> delete from student where passowrd='0';
Query OK, 1 row affected (0.08 sec)

mysql> select * from student;
+-------+---------+-------+-------------------------+--------+------------+-------------------------------------------+
| st_id | fname   | lname | email                   | gender | birthday   | passowrd                                  |
+-------+---------+-------+-------------------------+--------+------------+-------------------------------------------+
|     7 | mahmoud | wael  | mahmoud_wael1@gmail.com | male   | 1989-07-23 | *50D43D57BB27B575CE8183844DA7318EBB4A4D7F |
+-------+---------+-------+-------------------------+--------+------------+-------------------------------------------+
1 row in set (0.00 sec)

mysql> insert into student set fname='somebody',lname='somebody's father',passowrd='unknown';
    '> 
    '> \c
    '> 
    '> (;
    '> '
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 's father',passowrd='unknown';

\c

(;
'' at line 1
mysql> insert into student set fname='somebody',lname="somebody's father",passowrd="password('unknown');
    "> "
    -> ;
Query OK, 1 row affected, 1 warning (0.08 sec)

mysql> select * from student;
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
| st_id | fname    | lname             | email                   | gender | birthday   | passowrd                                  |
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
|     7 | mahmoud  | wael              | mahmoud_wael1@gmail.com | male   | 1989-07-23 | *50D43D57BB27B575CE8183844DA7318EBB4A4D7F |
|     8 | somebody | somebody's father |                         | NULL   | NULL       | password('unknown');
                     |
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
2 rows in set (0.00 sec)

mysql> insert into student set fname='somebody',lname="somebody's father",passowrd="password('unknown')";
ERROR 1062 (23000): Duplicate entry '' for key 'email'
mysql> insert into student set fname='somebody',lname="somebody's father",email='somebody@yahoo.com',passowrd="password('unknown')";
Query OK, 1 row affected (0.05 sec)

mysql> select * from student;
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
| st_id | fname    | lname             | email                   | gender | birthday   | passowrd                                  |
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
|     7 | mahmoud  | wael              | mahmoud_wael1@gmail.com | male   | 1989-07-23 | *50D43D57BB27B575CE8183844DA7318EBB4A4D7F |
|     8 | somebody | somebody's father |                         | NULL   | NULL       | password('unknown');
                     |
|    10 | somebody | somebody's father | somebody@yahoo.com      | NULL   | NULL       | password('unknown')                       |
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
3 rows in set (0.00 sec)

mysql> delete from student where password='password('unknown');';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'unknown');'' at line 1
mysql> delete from student where email='';
Query OK, 1 row affected (0.07 sec)

mysql> select * from student;
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
| st_id | fname    | lname             | email                   | gender | birthday   | passowrd                                  |
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
|     7 | mahmoud  | wael              | mahmoud_wael1@gmail.com | male   | 1989-07-23 | *50D43D57BB27B575CE8183844DA7318EBB4A4D7F |
|    10 | somebody | somebody's father | somebody@yahoo.com      | NULL   | NULL       | password('unknown')                       |
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
2 rows in set (0.00 sec)

mysql> update student set passowrd="password('unknown)" where gender='null';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> select * from student;
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
| st_id | fname    | lname             | email                   | gender | birthday   | passowrd                                  |
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
|     7 | mahmoud  | wael              | mahmoud_wael1@gmail.com | male   | 1989-07-23 | *50D43D57BB27B575CE8183844DA7318EBB4A4D7F |
|    10 | somebody | somebody's father | somebody@yahoo.com      | NULL   | NULL       | password('unknown')                       |
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
2 rows in set (0.00 sec)

mysql> update student set passowrd="password('unknown)" where gender=NULL;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> select * from student;
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
| st_id | fname    | lname             | email                   | gender | birthday   | passowrd                                  |
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
|     7 | mahmoud  | wael              | mahmoud_wael1@gmail.com | male   | 1989-07-23 | *50D43D57BB27B575CE8183844DA7318EBB4A4D7F |
|    10 | somebody | somebody's father | somebody@yahoo.com      | NULL   | NULL       | password('unknown')                       |
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
2 rows in set (0.00 sec)

mysql> update student set passowrd="password('unknown)" where gender=ISNULL();
ERROR 1582 (42000): Incorrect parameter count in the call to native function 'ISNULL'
mysql> update student set passowrd="password('unknown)" where gender=ISNULL(1);
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> select * from student;
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
| st_id | fname    | lname             | email                   | gender | birthday   | passowrd                                  |
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
|     7 | mahmoud  | wael              | mahmoud_wael1@gmail.com | male   | 1989-07-23 | *50D43D57BB27B575CE8183844DA7318EBB4A4D7F |
|    10 | somebody | somebody's father | somebody@yahoo.com      | NULL   | NULL       | password('unknown')                       |
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
2 rows in set (0.00 sec)

mysql> update student set passowrd="password('unknown)" where gender IS NULL;
Query OK, 1 row affected (0.07 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from student;
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
| st_id | fname    | lname             | email                   | gender | birthday   | passowrd                                  |
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
|     7 | mahmoud  | wael              | mahmoud_wael1@gmail.com | male   | 1989-07-23 | *50D43D57BB27B575CE8183844DA7318EBB4A4D7F |
|    10 | somebody | somebody's father | somebody@yahoo.com      | NULL   | NULL       | password('unknown)                        |
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
2 rows in set (0.01 sec)

mysql> update student set passowrd="password('unknown')" where gender IS NULL;
Query OK, 1 row affected (0.09 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from student;
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
| st_id | fname    | lname             | email                   | gender | birthday   | passowrd                                  |
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
|     7 | mahmoud  | wael              | mahmoud_wael1@gmail.com | male   | 1989-07-23 | *50D43D57BB27B575CE8183844DA7318EBB4A4D7F |
|    10 | somebody | somebody's father | somebody@yahoo.com      | NULL   | NULL       | password('unknown')                       |
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
2 rows in set (0.00 sec)

mysql> update student set passowrd=password('unknown') where gender IS NULL;
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from student;
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
| st_id | fname    | lname             | email                   | gender | birthday   | passowrd                                  |
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
|     7 | mahmoud  | wael              | mahmoud_wael1@gmail.com | male   | 1989-07-23 | *50D43D57BB27B575CE8183844DA7318EBB4A4D7F |
|    10 | somebody | somebody's father | somebody@yahoo.com      | NULL   | NULL       | *9F41B36FDD383F6F7523A10C2C133FC2B190A1EA |
+-------+----------+-------------------+-------------------------+--------+------------+-------------------------------------------+
2 rows in set (0.00 sec)

mysql> select * from student where gender='male';
+-------+---------+-------+-------------------------+--------+------------+-------------------------------------------+
| st_id | fname   | lname | email                   | gender | birthday   | passowrd                                  |
+-------+---------+-------+-------------------------+--------+------------+-------------------------------------------+
|     7 | mahmoud | wael  | mahmoud_wael1@gmail.com | male   | 1989-07-23 | *50D43D57BB27B575CE8183844DA7318EBB4A4D7F |
+-------+---------+-------+-------------------------+--------+------------+-------------------------------------------+
1 row in set (0.00 sec)

mysql> select count(gender) from student where gender='female';
+---------------+
| count(gender) |
+---------------+
|             0 |
+---------------+
1 row in set (0.00 sec)

mysql> select * from student where birthday<'1992-10-01';
+-------+---------+-------+-------------------------+--------+------------+-------------------------------------------+
| st_id | fname   | lname | email                   | gender | birthday   | passowrd                                  |
+-------+---------+-------+-------------------------+--------+------------+-------------------------------------------+
|     7 | mahmoud | wael  | mahmoud_wael1@gmail.com | male   | 1989-07-23 | *50D43D57BB27B575CE8183844DA7318EBB4A4D7F |
+-------+---------+-------+-------------------------+--------+------------+-------------------------------------------+
1 row in set (0.00 sec)

mysql> select * from student where birthday<'1992-10-01' and gender='male';
+-------+---------+-------+-------------------------+--------+------------+-------------------------------------------+
| st_id | fname   | lname | email                   | gender | birthday   | passowrd                                  |
+-------+---------+-------+-------------------------+--------+------------+-------------------------------------------+
|     7 | mahmoud | wael  | mahmoud_wael1@gmail.com | male   | 1989-07-23 | *50D43D57BB27B575CE8183844DA7318EBB4A4D7F |
+-------+---------+-------+-------------------------+--------+------------+-------------------------------------------+
1 row in set (0.00 sec)

mysql> select * from student where birthday<'1992-10-01' and gender='female';
Empty set (0.00 sec)

mysql> select count(st_id) * from student where birthday<'1992-10-01' and gender='female';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from student where birthday<'1992-10-01' and gender='female'' at line 1
mysql> select count(st_id) from student where birthday<'1992-10-01' and gender='female';
+--------------+
| count(st_id) |
+--------------+
|            0 |
+--------------+
1 row in set (0.00 sec)

mysql> desc subject;
+--------+------------------+------+-----+---------+----------------+
| Field  | Type             | Null | Key | Default | Extra          |
+--------+------------------+------+-----+---------+----------------+
| sub_id | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(30)      | NO   |     | NULL    |                |
+--------+------------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

mysql> exit
