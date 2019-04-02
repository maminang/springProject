dno 거래내역 테이블 기본키 참조
pno 제품 테이블 기본키 참조
amount 제품수량

create table tbl_dealings_products (
	dno number references tbl_dealings(dno),
	pno number references tbl_product(pno),
	amount number not null
)

drop table tbl_dealings_products

select tbl_dealings_products 

delete tbl_dealings_products