col POLL_QUESTION for a10;
col POLL_LINK for a10;
col POLL_EXPLAIN  for a10;
col EXAMPLE_CONTANT for a10;
col EXAMPLE_LINK for a10;
col  MEMBER_DETAIL_ADDRESS for a10;
col  MEMBER_IMAGE for a10;
col MEMBER_EMAIL  for a10;
col MEMBER_CELLPHONE_NUMBER for a10;
col  MEMBER_PW for a10;
col MEMBER_ID for a10;
col NOTICE_CONTANT for a10;
col  NOTICE_TITLE for a10;
col NOTICE_FILE for a10;
col  QNA_TITLE for a10;
col QNA_CATEGORY for a10;
col QNA_CONTANT  for a10;
col QNA_ANSWER  for a10;
col SET_CONSTRAINT_NAME  for a10;
col CONSTRAINT_NAME for a10;
col  for a10;

select pp.poll_example_number, e.example_number, example_order, example_link, example_contant, example_type, count(*)
	from example e, poll_example pe, poll_participate pp
	where e.example_number=pe.example_number
	and pp.poll_example_number=pe.poll_example_number 
	and pp.poll_number=41
	group by pp.poll_example_number, example_order, example_link, example_contant, example_type,e.example_number
	order by pp.poll_example_number;
	
	

	select * from poll_participate pp, poll_example pe 
where pe.poll_example_number=pp.poll_example_number
and pp.poll_number=41


<!--나이 성별 지역 있는지 확인-->
select * from survey_constraint sc, set_constraint st, add_constraint ac
where ac.set_constraint_number=st.set_constraint_number
and sc.constraint_number=st.constraint_number
and (st.constraint_number=(select constraint_number from survey_constraint where constraint_name='나이')
or st.constraint_number=(select constraint_number from survey_constraint where constraint_name='성별')
or st.constraint_number=(select constraint_number from survey_constraint where constraint_name='지역'));


select count(*) from add_constraint;

update poll 
set poll_condition=6
where poll_number=1;

update poll 
set poll_condition=6
where poll_number=64;

update poll 
set poll_condition=6
where poll_number=69;

update poll 
set poll_condition=6
where poll_number=70;

update poll 
set poll_condition=6
where poll_number=1;

insert into survey_constraint values (survey_constraint_seq.nextval, )
insert into example values (example_seq.nextval, 1, null, 'good', 3);
insert into example values (example_seq.nextval, 2, null, 'bad', 3);

insert into example values (example_seq.nextval,1, null, '1', 4);
insert into example values (example_seq.nextval,2, null, '2', 4);
insert into example values (example_seq.nextval,3, null, '3', 4);
insert into example values (example_seq.nextval,4, null, '4', 4);
insert into example values (example_seq.nextval,5, null, '5', 4);