pno 기본키
eng_name 제품 영어이름
kr_name 제품 한글이름
prdct_dscrp(PRODUCT_DESCRIPTIONS) 제품 소개
volume 용량
price 가격
category 카테고리

create table tbl_product (
	pno number primary key,
	eng_name varchar2(100) not null,
	kr_name varchar2(100) not null,
	prdct_dscrp varchar2(600),
	volume number not null,
	price number not null,
	category varchar2(100) not null
)

select * from tbl_product

drop table tbl_product

insert into tbl_product values (
1,
'Lime Basil & Mandarin Cologne',
'라임 바질 앤 만다린 코롱',
'조 말론 런던의 시그니처 향. 열정적인 허브의 독특한 조합으로 이루어져 있습니다. 카리브해의 산들바람에서 실려온 듯한 라임향에 톡 쏘는 바질과 향기로운 백리향이 더해져서 독특한 조합을 만들어냅니다. 현대적인 감각의 클래식한 향입니다.',
30,
93000,
'citrus'
)

insert into tbl_product values (
2,
'Lime Basil & Mandarin Cologne',
'라임 바질 앤 만다린 코롱',
'조 말론 런던의 시그니처 향. 열정적인 허브의 독특한 조합으로 이루어져 있습니다. 카리브해의 산들바람에서 실려온 듯한 라임향에 톡 쏘는 바질과 향기로운 백리향이 더해져서 독특한 조합을 만들어냅니다. 현대적인 감각의 클래식한 향입니다.',
100,
186000,
'citrus'
)