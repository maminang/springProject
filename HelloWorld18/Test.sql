SELECT * FROM USER_TABLES;

select * from TBL_FAQ

오라클 칼럼 수정
https://blog.naver.com/huni-region/220964375937

alter table tbl_faq add (qStatus varchar2(10) );
alter table tbl_faq modify ( qStatus number );



alter table tbl_faq add (qanswer varchar2(3000) );


insert into tbl_faq (idnbr, quser, qpassword, qtitle, qcontent, qtype, qfile, qphone, email, qStatus, qanswer) 
		values(7, '질문자', '비밀번호', '질문제목', '질문내용', '질문유형 option으로 받을 예정', '첨부파일', '전화번호0101', '이메일주소', 1, null)

		
		
select * from tbl_attach


select * from tbl_user

select * from tbl_faq
select max(bno) from tbl_faq


SELECT COLUMN_NAME, DATA_TYPE FROM all_tab_columns where table_name='tbl_faq'; 

select * form col where table_name='tbl_faq'


select * from tbl_board


select * from tbl_reply


create table tbl_reply (rno number, idnbr number, replyText varchar2(500), replyer varchar2(100))

select * from tbl_attach

예외가 너무 자주 터져서 컬러명 변경 고려
alter table tbl_faq rename column idnbr to bno;
