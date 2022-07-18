/*
	
	drop table kategorie_l

	create table kategorie_l
	(
	k_l_idx					int				not null	,		--책 종류(국내1,해외2,국내중고3,해외중고4
	k_l_delet_yn			char(1)			default 'y'			--삭제처리
	)
	
	--기본키
	alter table kategorie_l
		add constraint pk_kategorie_l_k_l_idx primary key(k_l_idx);




/*