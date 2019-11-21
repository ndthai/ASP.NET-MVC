create database didongLimupa
go
use didongLimupa
go

--1 bảng admin
create table Admins (
	admin_id int identity primary key,
	admin_name nvarchar(100) not null,
	[image] nvarchar(200) not null,
	email nvarchar(100) not null,
	phone nvarchar(20) not null,
	password nvarchar(100) not null,
	address nvarchar(100) not null,
	gender bit, --0: Nữ, 1: Nam;
	created datetime Default Getdate(),
)
go

--2 bảng tài khoản khách hàng
create table Customers (
	cus_id int identity primary key,
	cus_name nvarchar(100) not null,
	email nvarchar(100) not null,
	phone nvarchar(20) not null,
	password nvarchar(100) not null,
	address nvarchar(100) not null,
	gender bit not null,
	created datetime Default Getdate()
)
go

--3 bảng danh mục
create table Categories (
	cate_id int identity primary key,
	name nvarchar(100) not null,
	[status] bit Default(1) --0: Ẩn, 1: Hiện;
)
go

--4 bảng thương hiệu
create table Brands (
	brand_id int identity primary key,
	name nvarchar(50) not null,
	logo nvarchar(200) not null,
	[status] bit Default(1) --0: Ẩn, 1: Hiện;
)
go

--5 bảng banner
create table Banners (
	banner_id int identity primary key,
	banner_name nvarchar(200) not null,
	link nvarchar(200),
	[status] bit Default(1) --0: Ẩn, 1: Hiện;
)
go

--6 bảng sản phẩm
create table Products (
	pro_id int identity primary key,
	nameProduct nvarchar(100) not null,
	price float not null,
	sale_price float not null,
	[status] bit default(1), --0: Ẩn, 1: Hiện;

	category_id int foreign key references Categories(cate_id),
	brand_id int foreign key references Brands(brand_id),
)
go

--7 bảng các thuộc tính của sp
create table Attributes (
	attribute_id int identity primary key,
	[image] nvarchar(100) not null,
	[description] ntext not null,
	screen nvarchar(200) not null,
	operating_system nvarchar(200) not null,
	camera_after nvarchar(200) not null, 
	camera_before nvarchar(200) not null,
	cpu nvarchar(200) not null,
	battery_capacity nvarchar(200) not null,
	size nvarchar(50) not null,
	pro_id int foreign key references Products(pro_id)
)
go

--8 bảng các màu
create table Colors (
	color_id int identity primary key,
	color_name nvarchar(200) not null,
	[status] bit Default(1)   --0: Ẩn, 1: Hiện;
)
go

--9 bảng màu sản phẩm
create table ProductColor (
	productColor_id int identity primary key,
	[image] nvarchar(200) not null,

	pro_id int foreign key references Products(pro_id),
	color_id int foreign key references Colors(color_id)
)
go

--10 bảng Ram
create table Rams (
	ram_id int identity primary key,
	ram_name nvarchar(200) not null,
	[status] bit Default(1)   --0: Ẩn, 1: Hiện;
)
go

--11 bảng Ram sản phẩm
create table ProductRam (
	productRam_id int identity primary key,
	ram_price float not null,
	ram_sale_price float not null,

	pro_id int foreign key references Products(pro_id),
	ram_id int foreign key references Rams(ram_id),
)
go

--12 bảng đơn hàng
create table [Order] (
	order_id int identity primary key,
	price float not null,
	email nvarchar(100) not null,
	phone nvarchar(20) not null,
	[address] nvarchar(100) not null,
	note ntext,
	order_date datetime Default Getdate(),
	[status] int Default(0) not null, -- 0: Chưa duyệt, 1: Đang duyệt, 2: Đã gửi

	cus_id int foreign key references Customers(cus_id)
)
go

--13 bảng chi tiết đơn hàng
create table Order_detail (
	orderDetail_id int identity primary key,
	quantity int not null,
	total_price float not null,
	sale_price float not null,

	order_id int foreign key references [Order](order_id),
	pro_id int foreign key references Products(pro_id),
)
go

-- bảng tin tức
create table News (
	news_id int identity primary key,
	title nvarchar(200) not null,
	[description] nvarchar(200) not null,
	content ntext not null,
	images nvarchar(200) not null,
	image_detail nvarchar(200),
	createby nvarchar(200),
	createdate datetime Default Getdate(),
	[status] bit Default(1)   --0: Ẩn, 1: Hiện;
)
go

-- bảng liên hệ
create table Contact (
	contact_id int identity primary key,
	contact_name nvarchar(100) not null,
	email nvarchar(100) not null,
	phone nvarchar(20) not null,
	[address] nvarchar(20) not null,
	[message] ntext not null,
	created datetime Default Getdate(),
	[status] bit Default(0) -- 0: chưa duyệt, 1: duyệt
)
go

