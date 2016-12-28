drop table address

create table address(
no number  not null,
name varchar(20)  not null,
phone varchar(20)  not null,
zipcode varchar(6)  not null,
address varchar(200)  not null,
address1 varchar(100)  not null,
wdate date not  null,
primary key(no)
)


select nvl(max(no),0)+1 from ADDRESS
--create
insert into ADDRESS(no,name,phone,zipcode,address,address1,wdate)
values ((select nvl(max(no),0)+1 from ADDRESS),'후추','010-2571-3495','12345','서울','강서구',sysdate)
--reade
select * from address where no = 1;

select no,name,phone,zipcode,address,address1,to_char(wdate,'yyyy-mm-dd') as wdate from ADDRESS
--update
update address set name='윤'
where no=1;
--delete
delete from ADDRESS
where no =1 ;
--list
select no,name,phone,to_char(wdate,'yyyy-mm-dd') as wdate from address
order by no desc


update address set 
phone='adsf' 
where no = 1

