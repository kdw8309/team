/*
--상품일련번호 관리객체
create sequence seq_product_p_num

-- idx관리시 1씩 증가 시키고 싶으면 아래 애를 붙여라
increment by 1
start with 1

drop table product

create table product
(
	k_l_idx		int					not null,		--카테고리 대
	k_s_idx		varchar2(500)		not null,		--카테고리 소
	p_num		varchar2(100)		not null,		--상품번호
	p_name		varchar2(100)		not null,		--상품명
	p_company	varchar2(100)		not null,		--출판사
	p_price		int					not null,		--가격
	p_saleprice	int					not null,		--할인가격
	p_stock		int					not null,		--재고량
	p_image1	varchar2(4000)		not null,		--대표사진
	p_image2	varchar2(4000)				,		--사진
	p_image3	varchar2(4000)				,		--사진
	p_date		date				not null,		--등록일자
	p_hit		int					not null,		--조회수
	p_content	clob				not null,		--상품설명
	p_sell_cnt	int					not null		--판매수
	p_delete_yn	char(1)				default 'y'		--삭제처리
)

--기본키
alter table product
	add constraint pk_product_p_idx primary key(p_idx);
	
--외래키1
alter table product
	add constraint fk_kategorie_l_k_l_idx foreign key(k_l_idx) references kategorie_l(k_l_idx)
	
--외래키2
alter table product
	add constraint fk_kategorie_s_k_s_idx foreign key(k_s_idx) references kategorie_s(k_s_idx)
	
--unique
alter table product
	add constraint unque_product_p_num unique(p_num);
	
--셈플디비


select * from product



*/