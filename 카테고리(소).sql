/*
	
	drop table kategorie_s

	create table kategorie_s
	(
	k_s_idx 			varchar2(500) 		not null	,		--å ���� Ex) �Ƶ� 1, ���� 2, ���� 3,
	k_s_delete_yn		char(1)				default 'y'	,		--����ó��
	k_l_idx				int					not null			--ū ī�װ� ����
	)
	
	--�⺻Ű
	alter table kategorie_s
		add constraint pk_kategorie_s_k_s_idx primary key(k_s_idx);
		
	--�ܷ�Ű
	alter table kategorie_s
		add constraint fk_kategorie_l_k_l_idx foreign key(k_l_idx) references kategorie_l(k_l_idx)







*/