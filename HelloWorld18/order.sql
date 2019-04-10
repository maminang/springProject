create table tbl_order (
	ono number primary key,
	name varchar2(30) not null,
	address varchar2(200) not null,
	postNum varchar2(15) not null,
	DTL_ADRES varchar2(50) not null,
	phone varchar2(50),
	total_price number not null,
	order_date date default sysdate,
	shipping_memo varchar2(180) not null,
	payment_status varchar2(5) not null
)

drop table tbl_order

create table tbl_order_detail (
	odno number primary key,
	ono number references tbl_order(ono),
	pno number references tbl_product(pno),
	volume number not null,
	price number not null,
	amount number not null
)

drop table tbl_order_detail
