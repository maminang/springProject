id
pw
name
e-mail
address
phone
point
가입한 날짜

iNo - id가 기본키역할을 할수 있으니까 뺏어요


CREATE TABLE tbl_member(
id varchar2(30) PRIMARY KEY,
pw varchar2(30) not null,
name varchar2(30) not null,
email varchar2(150) not null,
address varchar2(150),
phone number,
birth date not null,
point number default 0,
signUpDate date default sysdate
)

insert into tbl_member (id,pw,name,email,address,phone,birth) values ('NamepeN', 'qlalfqjsgh', '임하민', 'maminang@gmail.com','서울특별시 성북구 장위동 111-111 중앙빌라 111호', 010-2334-4290, '1996-09-06')
insert into tbl_member (id,pw,name,email,address,phone) values ('maminang', 'qlalfqjsgh', '임하민', 'maminang@gmail.com','서울특별시 성북구 장월로 11길 11-1 중앙빌라 112호', 010-2334-4290, '2019-03-28')

select * from tbl_member

drop table tbl_member







