rno 리뷰테이블 기본키를 참조하는 외래키
rino 기본키
fullname 이미지파일 경로
order_no 정렬순서용

create table tbl_review_images (
	rno number references tbl_review(rno),
	rino primary key,
	fullname varchar2(150) not null,
	order_no number not null
)

drop table tbl_review_images