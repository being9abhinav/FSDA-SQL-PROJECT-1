create database FSDA 
use FSDA
Create table shopping_history ( 
product varchar (20) not null,
quantity int not null,
unit_price int not null)

Insert shopping_history values ('milk', 3, 10), ('bread', 7, 3), ('bread', 5, 2)

select * from shopping_history

select product, sum(quantity*unit_price) as total_price from shopping_history
group by product

Create table phones ( `name` varchar (20) not null unique, phone_number int not null unique) 
Insert into phones values ('Jack', 1234), ('Lene', 3333), ('Mark', 9999), ('Anna', 7582)
Create table calls ( id int not null unique, caller int not null, callee int not null, duration int not null)
 insert into calls values(25,1234,7582,8),(7,9999,7582,1),(18,9999,3333,4),(2,7582,3333,3),(3,3333,1234,1),(21,3333,1234,1)

select * from calls

with cte as ((select caller as phone_no, sum(duration) as duration from calls group by caller) 
               UNION
               (select callee as phone_no, sum(duration) as duration from calls group by callee))
 select p.`name` from phones p join cte c on p.phone_number=c.phone_no
 group by `name`
 having sum(duration)>=10
 
 Create table phones1 ( `name` varchar (20) not null unique, phone_number int not null unique)
Insert into phones1 values ('John', 6356), ('Addison', 4315), ('Kate', 8003), ('Ginny', 9831) 

 insert into calls1 values(65,8003,9831,7),(100,9831,8003,3),(145,4315,9831,18)

select * from phones1
select * from calls1

with call_details1 as


(Select caller as phn_no, sum(duration) as duration from calls1 group by caller 
Union
Select callee as phn_no, sum(duration) as duration from calls1 group by callee)
Select p1. `name` from phones1 p1 join call_details1 cd1 on p1.phone_number = cd1.phn_no
Group by `name` having sum(duration) >=10 order by p1. `name`


TASK – 3
Create table transactions ( 
amount int not null,
`date` date not null) 
Insert transactions values (1000,'2020-01-06'), (-10,'2020-01-14'), (-75,'2020-01-20'), 
 (-5,'2020-01-25'), (-4,'2020-01-29'), (2000,'2020-03-10'), (-75,'2020-03-12'), 
 (-20,'2020-03-15'), (40,'2020-03-15'), (-50,'2020-3-17'), (200,'2020-10-10'), 
 (-200,'2020-10-10')
Select * from transactions

select sum(t1.balance)-sum(t2.balance)
from
(select 1 as id,  sum(amount) as balance from transactions) as t1
join
(select 1 as id, count(date)*11 as balance from transactions where month(date)=03) as t2
on t1.id=t2.id

Create table transactions1 ( amount int not null, `date` date not null) 
Insert into transactions1 values (1,'2020-06-29') 
Insert into transactions1 values (35,'2020-02-20')
Insert into transactions1 values (-50,'2020-02-03') 
Insert into transactions1 values (-1,'2020-02-26') 
Insert into transactions1 values (-200,'2020-08-01') 
Insert into transactions1 values (-44,'2020-02-07')
Insert into transactions1 values (-5,'2020-02-25')
Insert into transactions1 values (1,'2020-06-29') 
Insert into transactions1 values (1,'2020-06-29') 
Insert into transactions1 values (-100,'2020-12-29')
Insert into transactions1 values (-100,'2020-12-30')
Insert into transactions1 values (-100,'2020-12-31') 

select * from transactions1

select (t1.balance) - (t2.credit_charge) as total_balance from
(Select 1 as id, sum(amount) as balance from transactions1) as t1 join
(Select 1 as id, count(`date`)*10 as credit_charge from (select *from transactions1 limit 4,5) as tt) as t2
On t1.id = t2.id

TASK – 3(3rd question)
Create table transactions2 ( 
amount int not null, 
`date` date not null) 
Insert transactions2 values (6000,'2020-04-03'), (5000,'2020-04-02'),
 (4000,'2020-04-01'), (3000,'2020-03-01'),
 (2000,'2020-02-01'), (1000,'2020-01-01')
 
 
 Select t1.balance - t2.credit_charge as total_balance from
(Select 1 as id, sum(amount) as balance from transactions2) as t1 join
(Select 1 as id, count(`date`)*10 as credit_charge from (select * from transactions2) as tt) as t2
On t1.id = t2.id