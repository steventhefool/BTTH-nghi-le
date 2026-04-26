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
    book_name varchar (100) not null,
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
    email varchar (50) not null unique,
    phone varchar(11) not null unique,
    registration_date date default (current_date)
);

insert into authors (full_name, birth_year, nationality)
	values ('Conan Doyle', '1959', 'England'),
	('Nguyễn Ngọc Ngạn', '1945', 'Việt Nam'),
    ('Tô Hoài', '1920', 'Việt Nam')
;

insert into books (book_name, category, author_id, price, publish_year) 
values ('Cuộc điều tra màu đỏ', 'Trinh thám', 1, 125000, 1987),
	('Dế Mèn phiêu lưu ký', 'Phiêu lưu', 3, 100000, 1941),
    ('Lúc gần sáng', 'Kinh dị', 2, 110000, 1986),
    ('Những người đàn bà ở lại', 'Kinh dị', 2, 145000, 1979),  
    ('Trên lối mòn hậu chiến', 'Kinh dị', 2, 180000, 1989),
    ('Chung một mái nhà', 'Hài kịch', 2, 198000, 2008),
    ('The Lost World', 'Khoa học viễn tưởng', 1, 200000, 1912),
    ('Người con gái xóm Cung', 'Văn học lãng mạn', 3, 210000, 2017)
;

insert into customers (full_name, email, phone) 
values ('Hoàng Dương Nam', 'hoangduongnampb.2k6@gmail.com', '0899769862'),
	('Huỳnh La Tiến Lộc', 'huynhlatienlui@gmail.com', '0897654321'),
    ('Lu Nhựt Đình', 'Top1ashe@gmail.com', '0987867542'),
    ('Hồ Quốc Khải', 'thangngoailai@gmail.com', '0123456789'),
    ('À nhía', 'anhia@gmail.com', '04536272819')
;

insert into customers () 
values ('Lê Hà Thanh Sang', 'anhia@gmail.com', '0981726354'); -- Do ở trong bảng có ghi thêm một ràng buộc cho email và phone là unique đây là ràng buộc độc nhất trong bảng chỉ có một giá trị như này nên khong insert được
