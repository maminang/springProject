iNo
id
name
birth
e-mail
address
phone
point
가입한 날짜
찜
구매내역
장바구니

CREATE TABLE tbl_member(
iNo number PRIMARY KEY,
id varchar2(30) not null,
name varchar2(30) not null,
birth date not null,
email varchar2(30) not null,
address varchar2(30),
phone number,
point number,
signUpDate date default sysdate
)

CREATE TABLE tbl_cart(
column1 DATE_TYPE1 PRIMARY KEY,
column2 DATE_TYPE2,
column3 DATE_TYPE3,
column4 DATE_TYPE4
)

drop table tbl_member







