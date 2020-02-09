create table tbl_product_detail(
	pno number references tbl_product(pno),
	volume number not null,
	price number not null
)

select * from tbl_product_detail

drop table tbl_product_detail