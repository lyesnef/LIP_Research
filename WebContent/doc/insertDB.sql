insert into region values(region_seq.nextval, '서울');
insert into region values(region_seq.nextval, '강원');
insert into region values(region_seq.nextval, '충청');
insert into region values(region_seq.nextval, '경기');
insert into region values(region_seq.nextval, '전라');
insert into region values(region_seq.nextval, '경상');
insert into region values(region_seq.nextval, '제주');

insert into age values(age_seq.nextval, '10대');
insert into age values(age_seq.nextval, '20대');
insert into age values(age_seq.nextval, '30대');
insert into age values(age_seq.nextval, '40대');
insert into age values(age_seq.nextval, '50대');
insert into age values(age_seq.nextval, '기타');

insert into gender values(1, '남');
insert into gender values(2, '여');

insert into postcode values(postcode_seq.nextval, '135', '091', '서울특별시 삼성1동');
insert into postcode values(postcode_seq.nextval, '135', '869', '서울특별시 삼성1동 52');
insert into postcode values(postcode_seq.nextval, '135', '865', '서울특별시 삼성1동 52~56');
insert into postcode values(postcode_seq.nextval, '135', '870', '서울특별시 삼성1동 57~75');
insert into postcode values(postcode_seq.nextval, '135', '871', '서울특별시 삼성1동 76~78');
insert into postcode values(postcode_seq.nextval, '135', '866', '서울특별시 삼성1동 79~80');
insert into postcode values(postcode_seq.nextval, '690', '824', '제주도 청귤로 7길20호');
insert into postcode values(postcode_seq.nextval, '576', '805', '전라도 김제시 요촌동 67-5');
insert into postcode values(postcode_seq.nextval, '135', '866', '강원도 철원군 동송읍 853-10 ');
insert into postcode values(postcode_seq.nextval, '135', '866', '경상도 함양군 함양읍 323-4 ');
insert into postcode values(postcode_seq.nextval, '355', '933', '충청남도 보령시 대천동 196-1 ');
insert into postcode values(postcode_seq.nextval, '487', '852', '경기도 포천시 일동면 기산리 81-16 ');

insert into lip_member values(lip_member_seq.nextval, '코액스 지하1층 나이키', 11000, 'KTF', 01098765432, 'admin.jpg', 'admin@lip.com', 'T', '2000/01/02', '1234567a', 'admin', 1, 1, 1, 3, 'T');

insert into banner values(banner_seq.nextval, 'team1.action', 'team1');
insert into banner values(banner_seq.nextval, 'team2.action', 'team2');
insert into banner values(banner_seq.nextval, 'team3.action', 'team3');
insert into banner values(banner_seq.nextval, 'team4.action', 'team4');

insert into category values(category_seq.nextval, '남과여,연애');
insert into category values(category_seq.nextval, '자동차,여행,장소');
insert into category values(category_seq.nextval, '영화,공연,음악,책');
insert into category values(category_seq.nextval, 'IT,SNS,모바일');
insert into category values(category_seq.nextval, '패션,쇼핑,뷰티');
insert into category values(category_seq.nextval, '육아,가정,교육');
insert into category values(category_seq.nextval, '연예,TV,스포츠');
insert into category values(category_seq.nextval, '가전,인테리어,가구');
insert into category values(category_seq.nextval, '음식,주류,기호');
insert into category values(category_seq.nextval, '금융,주거');
insert into category values(category_seq.nextval, '경제,사회');
insert into category values(category_seq.nextval, '기타');

insert into survey_constraint values(survey_constraint_seq.nextval, '성별');
insert into survey_constraint values(survey_constraint_seq.nextval, '나이');
insert into survey_constraint values(survey_constraint_seq.nextval, '지역');

insert into set_constraint values(set_constraint_seq.nextval, '남', 1);
insert into set_constraint values(set_constraint_seq.nextval, '여', 1);
insert into set_constraint values(set_constraint_seq.nextval, '10대', 2);
insert into set_constraint values(set_constraint_seq.nextval, '20대', 2);
insert into set_constraint values(set_constraint_seq.nextval, '30대', 2);
insert into set_constraint values(set_constraint_seq.nextval, '40대', 2);
insert into set_constraint values(set_constraint_seq.nextval, '50대', 2);
insert into set_constraint values(set_constraint_seq.nextval, '기타', 2);
insert into set_constraint values(set_constraint_seq.nextval, '서울', 3);
insert into set_constraint values(set_constraint_seq.nextval, '강원', 3);
insert into set_constraint values(set_constraint_seq.nextval, '충청', 3);
insert into set_constraint values(set_constraint_seq.nextval, '경기', 3);
insert into set_constraint values(set_constraint_seq.nextval, '전라', 3);
insert into set_constraint values(set_constraint_seq.nextval, '경상', 3);
insert into set_constraint values(set_constraint_seq.nextval, '제주', 3);


