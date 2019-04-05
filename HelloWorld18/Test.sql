SELECT * FROM USER_TABLES;

select * from TBL_FAQ

오라클 칼럼 수정
https://blog.naver.com/huni-region/220964375937

alter table tbl_faq add (qStatus varchar2(10) );
alter table tbl_faq modify ( qStatus number );



alter table tbl_faq add (qanswer varchar2(3000) );


insert into tbl_faq (idnbr, quser, qpassword, qtitle, qcontent, qtype, qfile, qphone, email, qStatus, qanswer) 
		values(51, '질문자', '비밀번호', '질문제목', '질문내용', '질문유형 option으로 받을 예정', '첨부파일', '전화번호0101', '이메일주소', 1, null)

		
select * from tbl_attach


select * from tbl_user