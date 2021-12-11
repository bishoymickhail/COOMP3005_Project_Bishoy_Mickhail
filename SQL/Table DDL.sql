create table publisher
	(publisher_name		varchar(20), 
	 publisher_id		varchar(7) NOT NULL, 
	 address		varchar(30),
	 email			varchar(30) NOT NULL,
	 phone_number		varchar(11),
	 bank_account_number	numeric(7,0) NOT NULL,
	 primary key (publisher_id)
	);

create table book
	(book_title		varchar(15),
	 ISBN			varchar(7) NOT NULL,
	 num_pages		numeric(3,0),
	 price			numeric(5,2),
	 publisher_id		varchar(7),
	 amount_sold		numeric(5,0),
	 publisher_fee		numeric(5,2),
	 primary key (ISBN),
	 foreign key (publisher_id) references publisher,
	 foreign key (book_title) references book_info
	);

create table book_info
	(book_title		varchar(15),
	 author_name		varchar(15),
	 genre			varchar(15),
	 primary key (book_title)
	);

create table inventory
	(book_title			varchar(15), 
	 ISBN				varchar(20), 
	 quantity			numeric(5,0), 
	 threshold			numeric(5,0),
	 primary key (ISBN),
	 foreign key (ISBN) references book
	);
	
create table users
	(name			varchar(15) NOT NULL, 
	 user_name		varchar(20) NOT NULL, 
	 password		varchar(20) NOT NULL,
	 email			varchar(30) NOT NULL,
	 address		varchar(30),
	 phone			varchar(11),
	 type			varchar(15) NOT NULL,
	 primary key (user_name, email)
	);
	
create table checkout_cart
	(ISBN 		varchar(20),
	 book_title	varchar(15),
	 price		numeric(7,2),
	 quantity	numeric(5,0),
	 user_name	varchar(20),
	 primary key(ISBN, user_name), 
	 foreign key (user_name) references users,
	 foreign key (ISBN) references book
	);
	
create table orders
	(order_num		varchar(15) NOT NULL,
	 user_name		varchar(20),
	 primary key (order_num), 
	 foreign key (user_name) references users
	);

create table orders_info
	(order_num		varchar(15) NOT NULL,
	 order_total_price	numeric(7,2),
	 tracking_num		varchar(15),
	 shipping_company	varchar(20),
	 date			DATE,
	 primary key (order_num), 
	 foreign key (order_num) references orders
	);