create table tbl_charge_history(
	id references tbl_member(id),
	point number not null,
	chargedate date default sysdate
)

drop table tbl_charge_history

select * from tbl_charge_history