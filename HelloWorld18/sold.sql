pno 제품테이블 참조
amount_sold 얼마나 팔렸는지

create table tbl_sold (
	pno number references tbl_product,
	amount_sold number default 0
)

select * from tbl_

insert into 