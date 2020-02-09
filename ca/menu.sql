select * from TBL_JUNHO;

create table tbl_menu (
	order_no number primary key,
	category varchar2(60) not null,
	href varchar2(120) not null
)

drop table tbl_menu

<<<<<<< HEAD
insert into TBL_MENU values(1,'All Product', '/product/list')
insert into TBL_MENU values(2,'베스트셀러', '/product/bestSeller')
insert into TBL_MENU values(3,'시트러스', '/product/list/citrus')
insert into TBL_MENU values(4,'플로랄', '/product/list/floral')
insert into TBL_MENU values(5,'프루티', '/product/list/fruity')
insert into TBL_MENU values(6,'스파이시', '/product/list/spicy')
insert into TBL_MENU values(7,'라이트 플로랄', '/product/list/lightFloral')
insert into TBL_MENU values(8,'우디', '/product/list/woody')
=======
insert into TBL_MENU values(1,'All Product', '/product/AllProduct')
insert into TBL_MENU values(2,'New Product', '/product/newProduct')
insert into TBL_MENU values(3,'Best Seller', '/product/bestSeller')
insert into TBL_MENU values(4,'Citrus', '/product/list/citrus')
insert into TBL_MENU values(5,'Floral', '/product/list/floral')
insert into TBL_MENU values(6,'Fruity', '/product/list/fruity')
insert into TBL_MENU values(7,'Spicy', '/product/list/spicy')
insert into TBL_MENU values(8,'Light Floral', '/product/list/lightFloral')
insert into TBL_MENU values(9,'Woody', '/product/list/woody')
insert into TBL_MENU values(10,'Cologne Intense', '/product/list/cologneIntense')

DELETE FROM TBL_MENU WHERE order_no=1;
DELETE FROM TBL_MENU WHERE order_no=2;
DELETE FROM TBL_MENU WHERE order_no=3;
DELETE FROM TBL_MENU WHERE order_no=4;
DELETE FROM TBL_MENU WHERE order_no=5;
DELETE FROM TBL_MENU WHERE order_no=6;
DELETE FROM TBL_MENU WHERE order_no=7;
DELETE FROM TBL_MENU WHERE order_no=8;
DELETE FROM TBL_MENU WHERE order_no=9;
DELETE FROM TBL_MENU WHERE order_no=10;

insert into TBL_MENU values(1,'newProduct', '/product/newProduct')
>>>>>>> refs/remotes/origin/eunju

select * from TBL_MENU
delete TBL_MENU where order_no = 1

update tbl_menu (1)