-- Add books to the Store

select * from book where ISBN = ' ISBN ';
select quantity from inventory where ISBN = 'ISBN ';
update inventory set quantity = ' quantityInventory ' where ISBN = 'ISBN ';

-- add book if it doesn't exist

insert into publisher values ('pub_name ', 'pub_id' ,'address', ' email','phoneNum ',bNum ); --first must add the new publisher
insert into book_info values (' title ',' author ', ' genre ');		-- then add too book_info
insert into book values (' title ', ' newIsbn ',numPages ,price , ' pub_id ',0 ,pub_fee ); --then add to book
insert into inventory values ('title ', 'newIsbn'," + amount ,threshold); -- then update the ivnentory

-- remove books: this will only remove from the inventory and chnage the quantity to the specified amount

select quantity from inventory where ISBN = ' ISBN ';
update inventory set quantity =  numBooks ;

-- generate reports
------- Sales by author
select * from book natural join (select * from book_info where author_name = ' author ');
------- Sales by dates (between two dates given)
select order_total_price from orders_info where date >= ' fD ' and date <= ' sD ';

