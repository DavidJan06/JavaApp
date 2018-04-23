/*
Created		23. 04. 2018
Modified		23. 04. 2018
Project		JavaApp
Model		
Company		
Author		David Jan
Version		0.2
Database		mySQL 5 
*/


Create table users (
	id Serial NOT NULL,
	username Varchar(50) NOT NULL,
	password Varchar(50) NOT NULL,
	firstname Varchar(50) NOT NULL,
	lastname Varchar(50) NOT NULL,
	email Varchar(50) NOT NULL,
	admin Int NOT NULL,
 Primary Key (id)) ENGINE = MyISAM;

Create table ads (
	id Serial NOT NULL,
	category_id Bigint UNSIGNED NOT NULL,
	title Varchar(100) NOT NULL,
	cost Float NOT NULL,
 Primary Key (id)) ENGINE = MyISAM;

Create table categories (
	id Serial NOT NULL,
	category_id Bigint UNSIGNED NOT NULL,
	name Varchar(50) NOT NULL,
	description Text,
 Primary Key (id)) ENGINE = MyISAM;

Create table pictures (
	id Serial NOT NULL,
	ad_id Bigint UNSIGNED NOT NULL,
	name Varchar(50) NOT NULL,
	url Varchar(150) NOT NULL,
 Primary Key (id)) ENGINE = MyISAM;

Create table orders (
	id Serial NOT NULL,
	user_id Bigint UNSIGNED NOT NULL,
	date Date NOT NULL,
 Primary Key (id)) ENGINE = MyISAM;

Create table ads_orders (
	id Serial NOT NULL,
	ad_id Bigint UNSIGNED NOT NULL,
	order_id Bigint UNSIGNED NOT NULL,
	quantity Float NOT NULL,
 Primary Key (id)) ENGINE = MyISAM;

Create table avatars (
	id Serial NOT NULL,
	user_id Bigint UNSIGNED NOT NULL,
	name Varchar(50) NOT NULL,
	url Varchar(150) NOT NULL,
 Primary Key (id)) ENGINE = MyISAM;


Alter table orders add Foreign Key (user_id) references users (id) on delete  restrict on update  restrict;
Alter table avatars add Foreign Key (user_id) references users (id) on delete  restrict on update  restrict;
Alter table pictures add Foreign Key (ad_id) references ads (id) on delete  restrict on update  restrict;
Alter table ads_orders add Foreign Key (ad_id) references ads (id) on delete  restrict on update  restrict;
Alter table ads add Foreign Key (category_id) references categories (id) on delete  restrict on update  restrict;
Alter table categories add Foreign Key (category_id) references categories (id) on delete  restrict on update  restrict;
Alter table ads_orders add Foreign Key (order_id) references orders (id) on delete  restrict on update  restrict;


