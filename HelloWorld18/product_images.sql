pno 제품 테이블 기본키 참조
pino 기본키
fullname 이미지파일 경로

create table tbl_product_images (
	pno number references tbl_product(pno),
	pino number primary key,
	fullname varchar2(150) not null
)

drop table tbl_product_images

select * from tbl_product_images where pno = 19

update tbl_product_images set fullname = 'cc5f6b7e-888a-4f33-9a9a-a6428d3b2936_capture.png' where pino = 16

delete tbl_product_images

select fullname from tbl_product_images where pno=19