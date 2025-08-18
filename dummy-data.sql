
INSERT INTO user (id, name, email_id, ph_no, role, password) VALUES
('admin1', 'Admin User', 'admin@college.edu', '9876543210', 'admin', 'adminpass'),
('staff1', 'Class Staff', 'staff@college.edu', '9876543211', 'staff', 'staffpass');

INSERT INTO class (id, name, section, year, created_by, updated_by) VALUES
('class_csa_s5', 'CSA S5 CSE', 'A', '2023', 'admin1', 'admin1');

INSERT INTO student (id, name, email_id, ph_no, roll_no, class_id, created_by, updated_by) VALUES
('stu_001', 'Sabin', 'sabin@college.edu', '9447823456', 52, 'class_csa_s5', 'staff1', 'staff1'),
('stu_002', 'Gautham', 'gautham@college.edu', '9447823457', 33, 'class_csa_s5', 'staff1', 'staff1'),
('stu_003', 'Geo', 'geo@college.edu', '9447823458', 34, 'class_csa_s5', 'staff1', 'staff1'),
('stu_004', 'Shawkath', 'shawkath@college.edu', '9447823459', 44, 'class_csa_s5', 'staff1', 'staff1'),
('stu_005', 'Sherin', 'sherin@college.edu', '9447823460', 54, 'class_csa_s5', 'staff1', 'staff1'),
('stu_006', 'Madhan', 'madhan@college.edu', '9447823461', 56, 'class_csa_s5', 'staff1', 'staff1'),
('stu_007', 'Amil', 'amil@college.edu', '9447823462', 18, 'class_csa_s5', 'staff1', 'staff1');

INSERT INTO fund_transaction (id, class_id, transaction_type, amount, description, reference_id, transaction_date, created_by) VALUES
('ft_001', 'class_csa_s5', 'DEPOSIT', 50000.00, 'Class Fund Opening', 'REF001', '2023-09-01', 'staff1'),
('ft_002', 'class_csa_s5', 'EXPENSE', 12000.00, 'Lab Equipment', 'REF002', '2023-09-05', 'staff1'),
('ft_003', 'class_csa_s5', 'DEPOSIT', 25000.00, 'College Grant', 'REF003', '2023-09-10', 'staff1');

INSERT INTO fund_balance (id, class_id, balance) VALUES
('fb_001', 'class_csa_s5', 63000.00);

INSERT INTO event_details (id, name, type, cost, description, event_date, deadline, class_id, created_by, updated_by)
VALUES
('event_001', 'Tech Fest', 'Academic', 300, 'Department Event', '2023-10-20 10:00:00', '2023-10-15', 'class_csa_s5', 'staff1', 'staff1'),
('event_002', 'Farewell', 'Social', 200, 'Class farewell event', '2023-11-10 15:00:00', '2023-11-05', 'class_csa_s5', 'staff1', 'staff1');

INSERT INTO payment (id, student_id, payment_method, total_amt, payment_status, transaction_id, reciept_number, notes, updated_by, created_by)
VALUES
('pay_001', 'stu_001', 'Cash', 300, 'Paid', 1111, 5001, 'Paid for Tech Fest', 'staff1', 'staff1'),
('pay_002', 'stu_002', 'Online', 300, 'Paid', 1112, 5002, 'Paid for Tech Fest', 'staff1', 'staff1'),
('pay_003', 'stu_003', 'UPI', 200, 'Paid', 1113, 5003, 'Paid for Farewell', 'staff1', 'staff1'),
('pay_004', 'stu_004', 'Online', 500, 'Paid', 1114, 5004, 'Paid for both events', 'staff1', 'staff1');

INSERT INTO payment_details (id, payment_id, event_id, amount, discount, final_amt)
VALUES
('pd_001', 'pay_001', 'event_001', 300, 0, 300),
('pd_002', 'pay_002', 'event_001', 300, 0, 300),
('pd_003', 'pay_003', 'event_002', 200, 0, 200),
('pd_004', 'pay_004', 'event_001', 300, 0, 300),
('pd_005', 'pay_004', 'event_002', 200, 0, 200);

INSERT INTO event_purchase (id, event_details_id, student_id, payment_id, created_by, purchase_status, purchase_date)
VALUES
('ep_001', 'event_001', 'stu_001', 'pay_001', 'staff1', 'Confirmed', '2023-10-01'),
('ep_002', 'event_001', 'stu_002', 'pay_002', 'staff1', 'Confirmed', '2023-10-02'),
('ep_003', 'event_002', 'stu_003', 'pay_003', 'staff1', 'Confirmed', '2023-11-01'),
('ep_004', 'event_001', 'stu_004', 'pay_004', 'staff1', 'Confirmed', '2023-10-03'),
('ep_005', 'event_002', 'stu_004', 'pay_004', 'staff1', 'Confirmed', '2023-11-02');




mysql> update user
    -> set role="admin"
    -> where email_id="staff@college.edu";
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from user;
+--------+-------------+-------------------+------------+-------+-----------+---------------------+---------------------+
| id     | name        | email_id          | ph_no      | role  | password  | created_at          | updated_at          |
+--------+-------------+-------------------+------------+-------+-----------+---------------------+---------------------+
| admin1 | Admin User  | admin@college.edu | 9876543210 | admin | adminpass | 2025-08-04 14:02:35 | 2025-08-04 14:02:35 |
| staff1 | Class Staff | staff@college.edu | 9876543211 | admin | staffpass | 2025-08-04 14:02:35 | 2025-08-04 14:11:28 |
+--------+-------------+-------------------+------------+-------+-----------+---------------------+---------------------+
2 rows in set (0.00 sec)

mysql> INSERT INTO event_details (id, name, type, cost, description, event_date, deadline, class_id, created_by, updated_by)
    -> VALUES
    -> ('event_001', 'Tech Fest', 'Academic', 300, 'Department Event', '2023-10-20 10:00:00', '2023-10-15', 'class_csa_s5', 'staff1', 'staff1'),
    -> ('event_002', 'Farewell', 'Social', 200, 'Class farewell event', '2023-11-10 15:00:00', '2023-11-05', 'class_csa_s5', 'staff1', 'staff1');
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO payment (id, student_id, payment_method, total_amt, payment_status, transaction_id, reciept_number, notes, updated_by, created_by)
    -> VALUES
    -> ('pay_001', 'stu_001', 'Cash', 300, 'Paid', 1111, 5001, 'Paid for Tech Fest', 'staff1', 'staff1'),
    -> ('pay_002', 'stu_002', 'Online', 300, 'Paid', 1112, 5002, 'Paid for Tech Fest', 'staff1', 'staff1'),
    -> ('pay_003', 'stu_003', 'UPI', 200, 'Paid', 1113, 5003, 'Paid for Farewell', 'staff1', 'staff1'),
    -> ('pay_004', 'stu_004', 'Online', 500, 'Paid', 1114, 5004, 'Paid for both events', 'staff1', 'staff1');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO payment_details (id, payment_id, event_id, amount, discount, final_amt)
    -> VALUES
    -> ('pd_001', 'pay_001', 'event_001', 300, 0, 300),
    -> ('pd_002', 'pay_002', 'event_001', 300, 0, 300),
    -> ('pd_003', 'pay_003', 'event_002', 200, 0, 200),
    -> ('pd_004', 'pay_004', 'event_001', 300, 0, 300),
    -> ('pd_005', 'pay_004', 'event_002', 200, 0, 200);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO event_purchase (id, event_details_id, student_id, payment_id, created_by, purchase_status, purchase_date)
    -> VALUES
    -> ('ep_001', 'event_001', 'stu_001', 'pay_001', 'staff1', 'Confirmed', '2023-10-01'),
    -> ('ep_002', 'event_001', 'stu_002', 'pay_002', 'staff1', 'Confirmed', '2023-10-02'),
    -> ('ep_003', 'event_002', 'stu_003', 'pay_003', 'staff1', 'Confirmed', '2023-11-01'),
    -> ('ep_004', 'event_001', 'stu_004', 'pay_004', 'staff1', 'Confirmed', '2023-10-03'),
    -> ('ep_005', 'event_002', 'stu_004', 'pay_004', 'staff1', 'Confirmed', '2023-11-02');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from event_purchase;
+--------+------------------+------------+------------+---------------------+---------------------+------------+-----------------+---------------+
| id     | event_details_id | student_id | payment_id | updated_at          | created_at          | created_by | purchase_status | purchase_date |
+--------+------------------+------------+------------+---------------------+---------------------+------------+-----------------+---------------+
| ep_001 | event_001        | stu_001    | pay_001    | 2025-08-04 14:12:52 | 2025-08-04 14:12:52 | staff1     | Confirmed       | 2023-10-01    |
| ep_002 | event_001        | stu_002    | pay_002    | 2025-08-04 14:12:52 | 2025-08-04 14:12:52 | staff1     | Confirmed       | 2023-10-02    |
| ep_003 | event_002        | stu_003    | pay_003    | 2025-08-04 14:12:52 | 2025-08-04 14:12:52 | staff1     | Confirmed       | 2023-11-01    |
| ep_004 | event_001        | stu_004    | pay_004    | 2025-08-04 14:12:52 | 2025-08-04 14:12:52 | staff1     | Confirmed       | 2023-10-03    |
| ep_005 | event_002        | stu_004    | pay_004    | 2025-08-04 14:12:52 | 2025-08-04 14:12:52 | staff1     | Confirmed       | 2023-11-02    |
+--------+------------------+------------+------------+---------------------+---------------------+------------+-----------------+---------------+
5 rows in set (0.00 sec)

mysql> uppdate event_purchase
    -> update event_purchase
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'uppdate event_purchase
update event_purchase' at line 1
mysql> update event_purchase
    -> set id="ep_001"
    -> update event_purchase;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'update event_purchase' at line 3
mysql> update event_purchase
    -> set purchase_status="Approved"
    -> where id="ep_001";
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from event_purchase;
+--------+------------------+------------+------------+---------------------+---------------------+------------+-----------------+---------------+
| id     | event_details_id | student_id | payment_id | updated_at          | created_at          | created_by | purchase_status | purchase_date |
+--------+------------------+------------+------------+---------------------+---------------------+------------+-----------------+---------------+
| ep_001 | event_001        | stu_001    | pay_001    | 2025-08-04 14:12:52 | 2025-08-04 14:12:52 | staff1     | Approved        | 2023-10-01    |
| ep_002 | event_001        | stu_002    | pay_002    | 2025-08-04 14:12:52 | 2025-08-04 14:12:52 | staff1     | Confirmed       | 2023-10-02    |
| ep_003 | event_002        | stu_003    | pay_003    | 2025-08-04 14:12:52 | 2025-08-04 14:12:52 | staff1     | Confirmed       | 2023-11-01    |
| ep_004 | event_001        | stu_004    | pay_004    | 2025-08-04 14:12:52 | 2025-08-04 14:12:52 | staff1     | Confirmed       | 2023-10-03    |
| ep_005 | event_002        | stu_004    | pay_004    | 2025-08-04 14:12:52 | 2025-08-04 14:12:52 | staff1     | Confirmed       | 2023-11-02    |
+--------+------------------+------------+------------+---------------------+---------------------+------------+-----------------+---------------+
5 rows in set (0.01 sec)

mysql> alter student
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'student' at line 1
mysql> alter table student
    -> alter column class_id type varchar(50);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'type varchar(50)' at line 2
mysql> alter table student
    -> alter column class_id varchar(50);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'varchar(50)' at line 2
mysql> alter table student
    -> modify column class_id varchar(50);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+------------+-------------+------+-----+-------------------+-----------------------------------------------+
| Field      | Type        | Null | Key | Default           | Extra                                         |
+------------+-------------+------+-----+-------------------+-----------------------------------------------+
| id         | varchar(40) | NO   | PRI | NULL              |                                               |
| name       | varchar(30) | NO   |     | NULL              |                                               |
| email_id   | varchar(30) | YES  |     | NULL              |                                               |
| ph_no      | varchar(15) | YES  |     | NULL              |                                               |
| roll_no    | int         | YES  |     | NULL              |                                               |
| class_id   | varchar(50) | YES  | MUL | NULL              |                                               |
| created_by | varchar(40) | YES  | MUL | NULL              |                                               |
| updated_by | varchar(40) | YES  | MUL | NULL              |                                               |
| created_at | timestamp   | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updated_at | timestamp   | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+------------+-------------+------+-----+-------------------+-----------------------------------------------+
10 rows in set (0.01 sec)

mysql> ALTER TABLE user
    -> ADD COLUMN address VARCHAR(100);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc user;
+------------+--------------+------+-----+-------------------+-----------------------------------------------+
| Field      | Type         | Null | Key | Default           | Extra                                         |
+------------+--------------+------+-----+-------------------+-----------------------------------------------+
| id         | varchar(40)  | NO   | PRI | NULL              |                                               |
| name       | varchar(30)  | NO   |     | NULL              |                                               |
| email_id   | varchar(30)  | NO   |     | NULL              |                                               |
| ph_no      | varchar(15)  | NO   |     | NULL              |                                               |
| role       | varchar(20)  | NO   |     | NULL              |                                               |
| password   | varchar(200) | NO   |     | NULL              |                                               |
| created_at | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updated_at | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
| address    | varchar(100) | YES  |     | NULL              |                                               |
+------------+--------------+------+-----+-------------------+-----------------------------------------------+
9 rows in set (0.00 sec)

mysql> alter table user
    -> drop column address;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc user;
+------------+--------------+------+-----+-------------------+-----------------------------------------------+
| Field      | Type         | Null | Key | Default           | Extra                                         |
+------------+--------------+------+-----+-------------------+-----------------------------------------------+
| id         | varchar(40)  | NO   | PRI | NULL              |                                               |
| name       | varchar(30)  | NO   |     | NULL              |                                               |
| email_id   | varchar(30)  | NO   |     | NULL              |                                               |
| ph_no      | varchar(15)  | NO   |     | NULL              |                                               |
| role       | varchar(20)  | NO   |     | NULL              |                                               |
| password   | varchar(200) | NO   |     | NULL              |                                               |
| created_at | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updated_at | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+------------+--------------+------+-----+-------------------+-----------------------------------------------+
8 rows in set (0.00 sec)

mysql> alter table event_details
    -> rename event_date to event_day;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'to event_day' at line 2
mysql> alter table event_details
    -> rename column event_date to event_day;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc event_details;
+-------------+-------------+------+-----+-------------------+-------------------+
| Field       | Type        | Null | Key | Default           | Extra             |
+-------------+-------------+------+-----+-------------------+-------------------+
| id          | varchar(40) | NO   | PRI | NULL              |                   |
| name        | varchar(30) | NO   |     | NULL              |                   |
| type        | varchar(30) | NO   |     | NULL              |                   |
| updated_at  | timestamp   | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
| cost        | int         | NO   |     | NULL              |                   |
| description | varchar(30) | NO   |     | NULL              |                   |
| event_day   | timestamp   | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
| deadline    | date        | YES  |     | NULL              |                   |
| class_id    | varchar(40) | YES  | MUL | NULL              |                   |
| created_by  | varchar(30) | YES  | MUL | NULL              |                   |
| updated_by  | varchar(30) | YES  | MUL | NULL              |                   |
| created_at  | timestamp   | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
+-------------+-------------+------+-----+-------------------+-------------------+
12 rows in set (0.00 sec)

mysql> alter table fund_transaction
    -> rename table fund_transaction to fund_transfers;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'table fund_transaction to fund_transfers' at line 2
mysql> rename table fund_transcation to fund_transfers;
rename table fund_transcation to fund_transfers;
^C
mysql> alter table fund_transaction rename table fund_transaction to fund_transfers;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'table fund_transaction to fund_transfers' at line 1
mysql> rename table fund_transaction to fund_transfers;
Query OK, 0 rows affected (0.02 sec)

mysql> desc fund_transfers;
+------------------+---------------+------+-----+-------------------+-------------------+
| Field            | Type          | Null | Key | Default           | Extra             |
+------------------+---------------+------+-----+-------------------+-------------------+
| id               | varchar(40)   | NO   | PRI | NULL              |                   |
| class_id         | varchar(40)   | YES  | MUL | NULL              |                   |
| transaction_type | varchar(30)   | NO   |     | NULL              |                   |
| amount           | decimal(20,0) | NO   |     | NULL              |                   |
| description      | varchar(200)  | NO   |     | NULL              |                   |
| reference_id     | varchar(100)  | NO   |     | NULL              |                   |
| transaction_date | date          | NO   |     | NULL              |                   |
| created_by       | varchar(40)   | YES  | MUL | NULL              |                   |
| created_at       | timestamp     | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
+------------------+---------------+------+-----+-------------------+-------------------+
9 rows in set (0.01 sec)

mysql> SELECT *
    -> FROM event_details
    -> WHERE cost BETWEEN 300 AND 500;
+-----------+-----------+----------+---------------------+------+------------------+---------------------+------------+--------------+------------+------------+---------------------+
| id        | name      | type     | updated_at          | cost | description      | event_day           | deadline   | class_id     | created_by | updated_by | created_at          |
+-----------+-----------+----------+---------------------+------+------------------+---------------------+------------+--------------+------------+------------+---------------------+
| event_001 | Tech Fest | Academic | 2025-08-04 14:12:49 |  300 | Department Event | 2023-10-20 10:00:00 | 2023-10-15 | class_csa_s5 | staff1     | staff1     | 2025-08-04 14:12:49 |
+-----------+-----------+----------+---------------------+------+------------------+---------------------+------------+--------------+------------+------------+---------------------+
1 row in set (0.00 sec)

mysql> select *
    -> from student
    -> where name like 'a%';
+---------+------+------------------+------------+---------+--------------+------------+------------+---------------------+---------------------+
| id      | name | email_id         | ph_no      | roll_no | class_id     | created_by | updated_by | created_at          | updated_at          |
+---------+------+------------------+------------+---------+--------------+------------+------------+---------------------+---------------------+
| stu_007 | Amil | amil@college.edu | 9447823462 |      18 | class_csa_s5 | staff1     | staff1     | 2025-08-04 14:02:35 | 2025-08-04 14:02:35 |
+---------+------+------------------+------------+---------+--------------+------------+------------+---------------------+---------------------+
1 row in set (0.00 sec)

mysql> select * from student where name like 's%';
+---------+----------+----------------------+------------+---------+--------------+------------+------------+---------------------+---------------------+
| id      | name     | email_id             | ph_no      | roll_no | class_id     | created_by | updated_by | created_at          | updated_at          |
+---------+----------+----------------------+------------+---------+--------------+------------+------------+---------------------+---------------------+
| stu_001 | Sabin    | sabin@college.edu    | 9447823456 |      52 | class_csa_s5 | staff1     | staff1     | 2025-08-04 14:02:35 | 2025-08-04 14:02:35 |
| stu_004 | Shawkath | shawkath@college.edu | 9447823459 |      44 | class_csa_s5 | staff1     | staff1     | 2025-08-04 14:02:35 | 2025-08-04 14:02:35 |
| stu_005 | Sherin   | sherin@college.edu   | 9447823460 |      54 | class_csa_s5 | staff1     | staff1     | 2025-08-04 14:02:35 | 2025-08-04 14:02:35 |
+---------+----------+----------------------+------------+---------+--------------+------------+------------+---------------------+---------------------+
3 rows in set (0.00 sec)
mysql> select * FROM event_details where cost = (SELECT MAX(cost) FROM event_details);
+-----------+-----------+----------+---------------------+------+------------------+---------------------+------------+--------------+------------+------------+---------------------+
| id        | name      | type     | updated_at          | cost | description      | event_day           | deadline   | class_id     | created_by | updated_by | created_at          |
+-----------+-----------+----------+---------------------+------+------------------+---------------------+------------+--------------+------------+------------+---------------------+
| event_001 | Tech Fest | Academic | 2025-08-04 14:19:11 |  300 | Department Event | 2023-10-20 10:00:00 | 2023-10-15 | class_csa_s5 | staff1     | staff1     | 2025-08-04 14:19:11 |
+-----------+-----------+----------+---------------------+------+------------------+---------------------+------------+--------------+------------+------------+---------------------+
1 row in set (0.00 sec)
mysql> select AVG(cost) AS average_event_cost from event_details;
+--------------------+
| average_event_cost |
+--------------------+
|           250.0000 |
+--------------------+
1 row in set (0.00 sec)




