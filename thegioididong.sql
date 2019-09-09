create database thegioididong
go
use thegioididong
go

-- bảng tài khoản khách hàng và admin
create table Users (
	users_id int identity primary key,
	users_name nvarchar(100) not null,
	email nvarchar(100) not null,
	phone nvarchar(20) not null,
	password nvarchar(100) not null,
	group_name nvarchar(100) not null,
	address nvarchar(100),
	gender bit,
	created datetime
)
go

-- bảng danh mục
create table Categories (
	category_id int identity primary key,
	category_name nvarchar(100) not null,
	status bit
)
go

-- bảng nhà cung cấp
create table Supplier (
	supplier_id int identity primary key,
	supplier_name nvarchar(100) not null,
	address nvarchar(100),
	description ntext,
	status bit
)
go

-- bảng banner
create table Banner (
	banner_id int identity primary key,
	banner_name nvarchar(200),
	link nvarchar(200),
	category_id int foreign key references Categories(category_id),
	supplier_id int foreign key references Supplier(supplier_id),
	status bit
)
go

-- bảng các ảnh
create table Images (
	images_id int identity primary key,
	images_name nvarchar(200),
	link nvarchar(200),
	product_id int foreign key references Products(product_id),
	status bit
)

-- bảng các màu
create table Color (
	color_id int identity primary key,
	color_name nvarchar(200),
	product_id int foreign key references Products(product_id),
	status bit
)


-- bảng sản phẩm
create table Products (
	product_id int identity primary key,
	product_name nvarchar(100) not null,
	price float not null,
	saleprice float null,
	images nvarchar(200),
	content ntext,
	category_id int foreign key references Categories(category_id),
	supplier_id int foreign key references Supplier(supplier_id),
	images_id int foreign key references Images(images_id),
	color_id int foreign key references Color(color_id),
	guarantee int,
	screen nvarchar(200),
	operating_system nvarchar(200),
	camera_after nvarchar(200),
	camera_before nvarchar(200),
	cpu nvarchar(200),
	ram nvarchar(200),
	internal_memory nvarchar(200),
	memory_stick nvarchar(200),
	sim nvarchar(200),
	battery_capacity nvarchar(200),
	status bit
)
go

--bảng đơn hàng
create table [Order] (
	order_id int identity primary key,
	users_id int foreign key references Users(users_id),
	order_date datetime,
	fullname nvarchar(100) not null,
	email nvarchar(100) not null,
	phone nvarchar(20) not null,
	address ntext
)
go

-- bảng chi tiết đơn hàng
create table Order_detail (
	order_id int foreign key references [Order](order_id),
	product_id int foreign key references Products(product_id),
	quantity int,
	price float,
	totalprice float,
	primary key (order_id, product_id)
)
go

-- bảng tin tức
create table News (
	news_id int identity primary key,
	news_name nvarchar(200),
	images nvarchar(200),
	createby int foreign key references Users(users_id),
	content ntext,
	createdate datetime,
	status bit
)
go

-- bảng liên hệ
create table Contact (
	contact_id int identity primary key,
	contact_name nvarchar(100) not null,
	email nvarchar(100) not null,
	phone nvarchar(20) not null,
	comment ntext,
	created datetime
)
go

