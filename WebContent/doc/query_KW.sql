select g.gender_number, g.gender_name, count(*) 
from lip_member lm, poll_participate pp, gender g
where lm.member_number=pp.member_number
and lm.gender_number=g.gender_number
and poll_number=#pollNumber#
group by g.gender_number, g.gender_name;

select a.age_number, a.age_name, count(*) 
from lip_member lm, poll_participate pp, age a
where lm.member_number=pp.member_number
and lm.age_number=a.age_number
and poll_number=#pollNumber#
group by a.age_number, a.age_name;

	select pp.poll_example_number, e.example_number, example_order, example_link, example_contant, example_type, count(*)
	from example e, poll_example pe, poll_participate pp
	where e.example_number=pe.example_number
	and pp.poll_example_number=pe.poll_example_number
	and pp.poll_number=28
	group by pp.poll_example_number, example_order, example_link, example_contant, example_type,e.example_number
	order by pp.poll_example_number;

select * from poll_comment;

select * from MULTIPOLL mp, multipoll_poll_example mpe
			 where mp.multipoll_number=mpe.multipoll_number
			 
			 update example
set example_contant
='별 세개'
where example_number=39;

			 update example
set example_contant
='별 네개'
where example_number=40;

			 update example
set example_contant
='별 다섯개'
where example_number=41;
