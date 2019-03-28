rno 리뷰테이블 기본키를 참조하는 외래키
rino 기본키
fullname 이미지파일 경로

create table tbl_review_images (
	rno number references tbl_review(rno),
	rino number primary key,
	fullname varchar2(150) not null
)

drop table tbl_review_images