/*
	
	drop table kategorie_l

	create table kategorie_l
	(
	k_l_idx					int				not null	,		--å ����(����1,�ؿ�2,�����߰�3,�ؿ��߰�4
	k_l_delet_yn			char(1)			default 'y'			--����ó��
	)
	
	--�⺻Ű
	alter table kategorie_l
		add constraint pk_kategorie_l_k_l_idx primary key(k_l_idx);




/*