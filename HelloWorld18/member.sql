id
pw
name
e-mail
address
phone
point
가입한 날짜
manager 일반 회원은 0 관리자는 1

iNo - id가 기본키역할을 할수 있으니까 뺏어요

SELECT COUNT(*) FROM tbl_member WHERE id = 'aaa'

CREATE TABLE tbl_member(
id varchar2(30) PRIMARY KEY,
pw varchar2(30) not null,
name varchar2(30) not null,
email varchar2(150) not null,
address varchar2(150),
phone varchar2(50),
birth date not null,
point number default 0,
signUpDate date default sysdate,
manager number default 0,
postNum number,
DTL_ADRES varchar2(50)
)

insert into tbl_member (id,pw,name,email,address,phone,birth) values ('NamepeN', 'qlalfqjsgh', '임하민', 'maminang@gmail.com','서울특별시 성북구 장위동 111-111 중앙빌라 111호', '010-2334-4290', '1996-09-06')
insert into tbl_member (id,pw,name,email,address,phone,birth) values ('maminang', 'qlalfqjsgh', '임하민', 'maminang@gmail.com','서울특별시 성북구 장월로 11길 11-1 중앙빌라 112호', '010-2334-4290', '2019-03-28')

select * from tbl_member

drop table tbl_member

alter table tbl_member modify phone varchar2(50)
alter table tbl_member add postNum number
alter table tbl_member add DTL_ADRES varchar2(50)

delete tbl_member







