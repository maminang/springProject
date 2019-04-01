select * from TBL_JUNHO;

create table tbl_menu (
	order_no number primary key,
	category varchar2(60) not null,
	href varchar2(120) not null
)

drop table tbl_menu

insert into TBL_MENU values(1,'신제품', '/product/newProduct')
insert into TBL_MENU values(2,'베스트셀러', 'bestSeller')
insert into TBL_MENU values(3,'시트러스', 'citrus')
insert into TBL_MENU values(4,'플로랄', 'floral')
insert into TBL_MENU values(5,'프루티', 'fruity')
insert into TBL_MENU values(6,'스파이시', 'spicy')
insert into TBL_MENU values(7,'라이트 플로랄', 'lightFloral')
insert into TBL_MENU values(8,'우디', 'woody')

select * from TBL_MENU
delete TBL_MENU where order_no = 1

update tbl_menu (1)