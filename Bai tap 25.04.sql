create database bookwormDB;
use bookwormDB;

create table authors (
	id int primary key auto_increment,
    full_name varchar (20) not null,
    birth_year year not null,
    nationality varchar (20) not null
);

create table books (
	id int primary key auto_increment,
    book_name varchar (20) not null,
    category varchar (20) not null,
    author_id int not null,
	
    constraint fk_author_id
		foreign key (author_id)
        references authors (id),
	
    price int not null default 0,
    constraint check_price
		check (price >0),
    publish_year year not null
);

create table customers (
	id int primary key auto_increment,
    full_name varchar (20) not null,
    email varchar (20) not null unique,
    phone varchar(11) not null unique,
    registration_date date default (current_date)
);
