pno 제품테이블 기본키 참조하는 외래키
rno 리뷰 기본키
score 평점(0~9)
id 
title
content
age_group 연령대

create table tbl_review (
	pno number references tbl_product(pno),
	rno number primary key,
	score number(1) not null,
	id varchar2(30) references tbl_member(id),
	title varchar2(120) not null,
	content varchar2(500) not null,
	age_group varchar2(15) not null
)

drop table tbl_review

delete tbl_review

select * from tbl_review