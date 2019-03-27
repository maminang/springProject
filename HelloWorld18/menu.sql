select * from TBL_JUNHO;

create table tbl_menu (
	category varchar2(60),
	href varchar2(120)
)

insert into TBL_MENU values('시트러스', 'citrus')
insert into TBL_MENU values('플로랄', 'floral')
insert into TBL_MENU values('프루티', 'fruity')
insert into TBL_MENU values('스파이시', 'spicy')
insert into TBL_MENU values('라이트 플로랄', 'lightFloral')
insert into TBL_MENU values('우디', 'woody')

select * from TBL_MENU
delete TBL_MENU