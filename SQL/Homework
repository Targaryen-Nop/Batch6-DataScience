.mode markdown
.header on

create table orders(
  order_ID int primary key ,
  employee_id INT,
  customer_id int,
  menu_id int,
  ordertype_id int,
  amount int ,
  FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (menu_id) REFERENCES menu(menu_id),
  FOREIGN KEY (ordertype_id) REFERENCES ordertype(ordertype_id)
);


  
create table employee(
  employee_id int primary key ,
  fname varchar(255),
  lname varchar(255),
  city varchar(255)
);

create table customer(
  customer_id int primary key ,
  fname varchar(255),
  lname varchar(255),
  city varchar(255),
  tel varchar(10)
);

create table menu(
  menu_id int primary key ,
  mname varchar(255),
  price int(10)
);

create table ordertype(
  ordertype_id int primary key ,
  type varchar(255)
);

insert into ordertype(ordertype_id,type)
values ('1','delivery'),('2','walk-in');


insert into menu(menu_id,mname,price)
values ('1','fired rice',20),('2','fired egg',10),('3','noodle',10);

insert into customer(customer_id,fname,lname,city,tel)
values 
('1','Lana','Targaryen','Endland','0647525298'),
('2','Mob','Stark','Poland','0857562972'),
('3','Jemie','Lannister','Brazil','0837482572'),
('4','Arya','Stark','USA','0817123512');


insert into employee(employee_id,fname,lname,city)
values 
('1','Tywin','Lannister','Poland'),
('2','Jon','Snow','Algeria'),
('3','Eddard','Stark','Germany'),
('4','Cersei','Cersei','Iceland');



insert into orders(order_id,employee_id,customer_id,menu_id,ordertype_id,amount)
values 
  ('01','03','04','01','01',2),
  ('02','01','01','03','02',3),
  ('03','02','02','02','02',4),
  ('04','04','03','01','01',5);

select order_id,menu.mname as Food ,price,amount,price*amount as Total from orders join menu 
on orders.menu_id = menu.menu_id;



select 
*
  from (
  select 
  order_id,
  e.fname as empname,  
  e.lname as lastname,
  e.city,
  c.fname as custname,
  c.city as custcity,
  c.tel,
  m.mname as food,
  m.price,
  o.amount,
  m.price*o.amount as total,
  ot.type
  from orders  o
join menu  m 
on o.menu_id = m.menu_id
join customer  c
on o.customer_id = c.customer_id
join employee  e
on o.employee_id = e.employee_id
join ordertype  ot
on o.ordertype_id = ot.ordertype_id
)  ; 

with sub as (select 
  order_id,
  e.fname as empname,  
  e.lname as lastname,
  e.city,
  c.fname as custname,
  c.city as custcity,
  c.tel,
  m.mname as food,
  m.price,
  o.amount,
  m.price*o.amount as total,
  ot.type
  from orders  o
join menu  m 
on o.menu_id = m.menu_id
join customer  c
on o.customer_id = c.customer_id
join employee  e
on o.employee_id = e.employee_id
join ordertype  ot
on o.ordertype_id = ot.ordertype_id)


  
select 
order_id,
empname || " " || lastname as Employee,
total
from sub
where total >= 40;


with sub1 as (select 
  order_id,
  e.fname as empname,  
  e.lname as lastname,
  e.city,
  c.fname as custname,
  c.city as custcity,
  c.tel,
  m.mname as food,
  m.price,
  o.amount,
  m.price*o.amount as total,
  ot.type
  from orders  o
join menu  m 
on o.menu_id = m.menu_id
join customer  c
on o.customer_id = c.customer_id
join employee  e
on o.employee_id = e.employee_id
join ordertype  ot
on o.ordertype_id = ot.ordertype_id)



select 
order_id,
empname || " " || lastname as Employee,
food,
total
from sub1
where total >= 40 and food = "fired rice";

