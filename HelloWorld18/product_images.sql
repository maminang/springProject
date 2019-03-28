pno 제품 테이블 기본키 참조
pino 기본키
fullname 이미지파일 경로
order_no 정렬순서용

create table tbl_product_images (
	pno number references tbl_product(pno),
	pino number primary key,
	fullname varchar2(150) not null,
	order_no number not null
)

drop table tbl_product_images

select * from tbl_product_images