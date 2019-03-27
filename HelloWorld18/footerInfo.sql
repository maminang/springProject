
create table tbl_footerinfo (
	companyname varchar2(60),
	representative varchar2(60),
	bsns_reg_no varchar2(24),
	cmnct_saler_report varchar2(60),
	address varchar2(150),
	partnership_email varchar2(150),
	phone_number varchar2(24),
	work_hour varchar2(100),
	account_holder varchar2(300),
	facebook_address varchar2(150),
	kakaotalk_address varchar2(150),
	instagram_address varchar2(150),
	copyright varchar2(150)
)

insert into tbl_footerinfo values (
	'데모네요',
	'임하민',
	'123-45-67890',
	'제 2019-서울강서-0715 호 사업자정보확인',
	' 서울특별시 성북구 장월로 11길 11-1 중앙빌라 111호',
	'maminang@naver.com',
	'010-1234-5678',
	'09시~18시',
	'국민 123456-12-123456 홍길동',
	'https://www.facebook.com/demoneyo',
	'kakao링크',
	'insta링크',
	'Copyright © 2019 데모네요. All rights reserved.'
)

select * from tbl_footerinfo