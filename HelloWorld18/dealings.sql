dno 기본키 (tbl_dealings_product에서 참조함)
name 이름
address 주소
email 이메일
total_price 총금액,
shipping_memo 배송메모
is_payed 지불되었는지 확인

회원 테이블 참조

create table tbl_dealings (
	dno number primary key,	
	name varchar2(50) not null,
	address varchar2(150) not null,
	email varchar2(150) not null,
	total_price number not null,
	shipping_memo varchar2(180),
	is_payed varchar2(5) default 'false' not null
)

drop table tbl_dealings