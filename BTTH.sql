create database bookwormDB;
use bookwormDB;

create table authors (
	id int primary key auto_increment,
    full_name varchar (20) not null,
    birth_year int not null,
    nationality varchar (20) not null
);

create table books (
	id int primary key auto_increment,
    book_name varchar (100) not null,
    category varchar (20) not null,
    author_id int not null,
	
    constraint fk_author_id
		foreign key (author_id)
        references authors (id),
	
    price int not null default 0,
    constraint check_price
		check (price >0),
    publish_year int not null
);

create table customers (
	id int primary key auto_increment,
    full_name varchar (20) not null,
    email varchar (50) not null unique,
    phone varchar(11) not null unique,
    registration_date date default (current_date)
);

insert into authors (full_name, birth_year, nationality)
	values ('Conan Doyle', '1859', 'England'),
	('Nguyễn Ngọc Ngạn', '1945', 'Việt Nam'),
    ('Tô Hoài', '1920', 'Việt Nam'),
    ('Hoàng Dương Nam', '2006', 'Việt Nam') 
;

insert into books (book_name, category, author_id, price, publish_year) 
values ('Cuộc điều tra màu đỏ', 'Trinh thám', 1, 12500, 1887),
	('Dế Mèn phiêu lưu ký', 'Phiêu lưu', 3, 100000, 1941),
    ('Lúc gần sáng', 'Kinh dị', 2, 11000, 1986),
    ('Những người đàn bà ở lại', 'Kinh dị', 2, 14500, 1979),  
    ('Trên lối mòn hậu chiến', 'Kinh dị', 2, 18000, 1989),
    ('Chung một mái nhà', 'Hài kịch', 2, 198000, 2008),
    ('The Lost World', 'Khoa học viễn tưởng', 1, 20000, 1912),
    ('Người con gái xóm Cung', 'Văn học lãng mạn', 3, 210000, 2017),
    ('Giáo án LOL hủy diệt', 'Kiến thức', 4, 190000, 2025)
;

insert into customers (full_name, email, phone) 
values ('Hoàng Dương Nam', 'hoangduongnampb.2k6@gmail.com', '0899769862'),
	('Huỳnh La Tiến Lộc', 'huynhlatienlui@gmail.com', '0897654321'),
    ('Lu Nhựt Đình', 'Top1ashe@gmail.com', '0987867542'),
    ('Hồ Quốc Khải', 'thangngoailai@gmail.com', '0123456789'),
    ('À nhía', 'anhia@gmail.com', '04536272819')
;

select * from books;
select * from books where category = 'Trinh thám' and price < 100000;

select * from customers where email like '%@gmail.com';

select * from books order by price desc limit 3;

update books set price = price *0.9 where publish_year <2020;
