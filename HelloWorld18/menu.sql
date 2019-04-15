select * from TBL_JUNHO;

create table tbl_menu (
	order_no number primary key,
	category varchar2(60) not null,
	href varchar2(120) not null
)

drop table tbl_menu

insert into TBL_MENU values(1,'신제품', '/product/newProduct')
insert into TBL_MENU values(2,'베스트셀러', '/product/bestSeller')
insert into TBL_MENU values(3,'시트러스', '/product/list/citrus')
insert into TBL_MENU values(4,'플로랄', '/product/list/floral')
insert into TBL_MENU values(5,'프루티', '/product/list/fruity')
insert into TBL_MENU values(6,'스파이시', '/product/list/spicy')
insert into TBL_MENU values(7,'라이트 플로랄', '/product/list/lightFloral')
insert into TBL_MENU values(8,'우디', '/product/list/woody')

select * from TBL_MENU
delete TBL_MENU where order_no = 2

update tbl_menu (1)