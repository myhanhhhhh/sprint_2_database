create database sprint_2;
use sprint_2;

create table app_roles(
id int primary key auto_increment,
name varchar(250),
is_deleted boolean default 0
);

create table app_users(
id int primary key auto_increment,
user_name varchar(250),
password varchar(250),
email varchar (250),
is_online boolean default 0,
is_deleted boolean default 0
);

create table user_roles (
id int primary key auto_increment,
app_user_id int,
app_role_id int,
foreign key(app_user_id) references app_users(id),
foreign key(app_role_id) references app_roles(id)
);

create table customers(
id int primary key auto_increment,
name varchar(250),
birthday date,
gender varchar(50),
phone varchar(50),
address varchar(250),
id_user int,
foreign key(id_user) references app_users(id)
);

create table categories(
id_category int primary key auto_increment,
name varchar(250)
);

create table products(
id_product int primary key auto_increment,
name varchar(250),
weight double ,
price double, 
brand varchar(250),
origin varchar(250),
`description` longtext,
quantity int,
id_category int,
foreign key(id_category) references categories(id_category)
);

create table images(
id_image  int primary key auto_increment,
name varchar(250),
id_product int,
foreign key(id_product) references products(id_product)

);

create table orders(
id_order int primary key auto_increment,
date_of_order date,
time_of_order time,
total_money double,
id_user int,
foreign key(id_user) references app_users(id)
);

create table order_details(
id_order_detail int primary key auto_increment,
quantity int,
price_order double,
id_order int, 
id_product int,
foreign key(id_order) references orders(id_order),
foreign key(id_product) references products(id_product)
);

create table carts(
id_cart int primary key auto_increment,
quantity_of_order int,
id_user int,
id_product int,
foreign key(id_user) references app_users(id),
foreign key(id_product) references products(id_product)
);



