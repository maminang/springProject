id 는 멤버테이블의 id 참조
pno 는 제품테이블의 pno 참조

create table tbl_shopping_cart (
	id varchar2(30) references tbl_member(id),
	pno number references tbl_product(pno)
)

insert into tbl_shopping_cart values ('NamepeN', 1)
insert into tbl_shopping_cart values ('NamepeN', 2, 1)

select * from tbl_shopping_cart order by pno asc
delete from tbl_shopping_cart

select * from tbl_shopping_cart where id = 'NamepeN'

select amount from tbl_shopping_cart where id = 'NamepeN' and pno=1


id = NamepeN인 회원의 장바구니 목록을 뽑아오고 싶다면

select pno from tbl_shopping_cart where id = 'NamepeN'
으로 pno리스트 뽑아오고 (지금은 pno{1,2}가 나옴)




select * from tbl_product where pno = 1 OR pno = 2
로 장바구니 리스트 뽑아올수 있음 
스프링 동적쿼리로 or pno = ?가 몇개 붙는지를 구현할수 있을거 같음