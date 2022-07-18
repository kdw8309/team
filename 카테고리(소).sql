/*
	
	drop table kategorie_s

	create table kategorie_s
	(
	k_s_idx 			varchar2(500) 		not null	,		--책 종류 Ex) 아동 1, 문학 2, 과학 3,
	k_s_delete_yn		char(1)				default 'y'	,		--삭제처리
	k_l_idx				int					not null			--큰 카테고리 연동
	)
	
	--기본키
	alter table kategorie_s
		add constraint pk_kategorie_s_k_s_idx primary key(k_s_idx);
		
	--외래키
	alter table kategorie_s
		add constraint fk_kategorie_l_k_l_idx foreign key(k_l_idx) references kategorie_l(k_l_idx)







*/