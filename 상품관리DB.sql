/*
--��ǰ�Ϸù�ȣ ������ü
create sequence seq_product_p_num

-- idx������ 1�� ���� ��Ű�� ������ �Ʒ� �ָ� �ٿ���
increment by 1
start with 1

drop table product

create table product
(
	k_l_idx		int					not null,		--ī�װ� ��
	k_s_idx		varchar2(500)		not null,		--ī�װ� ��
	p_num		varchar2(100)		not null,		--��ǰ��ȣ
	p_name		varchar2(100)		not null,		--��ǰ��
	p_company	varchar2(100)		not null,		--���ǻ�
	p_price		int					not null,		--����
	p_saleprice	int					not null,		--���ΰ���
	p_stock		int					not null,		--���
	p_image1	varchar2(4000)		not null,		--��ǥ����
	p_image2	varchar2(4000)				,		--����
	p_image3	varchar2(4000)				,		--����
	p_date		date				not null,		--�������
	p_hit		int					not null,		--��ȸ��
	p_content	clob				not null,		--��ǰ����
	p_sell_cnt	int					not null		--�Ǹż�
	p_delete_yn	char(1)				default 'y'		--����ó��
)

--�⺻Ű
alter table product
	add constraint pk_product_p_idx primary key(p_idx);
	
--�ܷ�Ű1
alter table product
	add constraint fk_kategorie_l_k_l_idx foreign key(k_l_idx) references kategorie_l(k_l_idx)
	
--�ܷ�Ű2
alter table product
	add constraint fk_kategorie_s_k_s_idx foreign key(k_s_idx) references kategorie_s(k_s_idx)
	
--unique
alter table product
	add constraint unque_product_p_num unique(p_num);
	
--���õ��


select * from product



*/