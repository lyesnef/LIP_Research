--테이블 삭제
drop table multipoll_poll_example;
drop table add_constraint;
drop table mail_send_list;
drop table survey_point;
drop table survey_participate;
drop table question_example;
drop table multipoll;
drop table question;
drop table survey;
drop table limit_participate;
drop table poll_participate;
drop table poll_example;
drop table example;
drop table poll_point;
drop table poll_comment;
drop table poll;
drop table category;
drop table press;
drop table qna;
drop table point_outcome;
drop table point_income;
drop table member_log;
drop table pay;
drop table notice_comment;
drop table notice;
drop table delivery;
drop table banner_log;
drop table banner;
drop table lip_member;
drop table postcode;
drop table set_constraint;
drop table survey_constraint;
drop table region;
drop table gender;
drop table age;
drop table faq;
drop table product;



--지역
drop sequence region_seq;

create table Region(
Region_number number primary key,
Region_name varchar2(15) not null
);
create sequence region_seq;

--성별
drop sequence gender_seq;

create table gender(
	gender_number number primary key,
	gender_name varchar2(3) not null
);
create sequence gender_seq;

--나이
drop sequence age_seq;

create table Age(
Age_number number primary key,
Age_name varchar2(9) not null
);
create sequence age_seq;

--FAQ
drop sequence faq_seq;

create table faq(
FAQ_number number primary key,
FAQ_title varchar2(300) not null,
FAQ_answer varchar2(600) not null
);
create sequence faq_seq;

--상품
drop sequence product_seq;

create table Product(
Product_number number primary key,
Product_name varchar2(150) not null,
Product_image varchar2(300) not null,
Product_point number(20) not null,
Product_detail varchar2(300)
);
create sequence product_seq;

--권역
drop sequence survey_constraint_seq;

create table Survey_constraint(
Constraint_number number primary key,
Constraint_name varchar2(150) not null
);
create sequence survey_constraint_seq;

--권역설정
drop sequence set_constraint_seq;

create table Set_constraint(
Set_constraint_number number primary key,
Set_constraint_name varchar2(150) not null,
Constraint_number number references survey_constraint(constraint_number) not null
);
create sequence set_constraint_seq;

--우편번호
drop sequence postcode_seq;

create table Postcode(
Postcode_number number primary key,
Postcode_1st varchar2(9) not null,
Postcode_2nd varchar2(9) not null,
Postcode_address varchar2(300) not null
);
create sequence postcode_seq;

--회원
drop sequence lip_member_seq;

create table LIP_member(
Member_number number primary key,
Member_detail_address varchar2(300) not null,
Member_point number,
Member_cellphone_co varchar2(20) not null,
Member_cellphone_number varchar2(39) not null,
Member_image varchar2(300),
Member_email varchar2(300) not null,
Member_email_recieve char(1) not null,
Member_birth date not null,
Member_pw varchar2(38) not null,
Member_id varchar2(38) not null,
Gender_number number not null,
Postcode_number number references postcode(postcode_number) not null,
Region_number number references region(region_number) not null,
Age_number number references age(age_number) not null,
Member_agree char(1) not null
);
create sequence lip_member_seq;

--배너
drop sequence banner_seq;

create table banner(
banner_number number primary key,
banner_link varchar2(300) not null,
banner_name varchar2(100) not null
);
create sequence banner_seq;

--배너로그
drop sequence banner_log_seq;

create table banner_log(
banner_log_number number primary key,
banner_log_date date default sysdate not null,
banner_log_ip varchar2(50) not null,
member_number number references lip_member(member_number) not null,
banner_number number references banner(banner_number) not null
);
create sequence banner_log_seq;

--배송
drop sequence delivery_seq;

create table delivery(
delivery_number number primary key,
delivery_co_number number not null,
member_number number references lip_member(member_number) not null
);
create sequence delivery_seq;

--공지사항
drop sequence notice_seq;

create table notice(
notice_number number primary key,
notice_title varchar2(300) not null,
notice_contant varchar2(4000) not null,
notice_date date default sysdate not null,
notice_file varchar2(300),
notice_hits number,
member_number number references lip_member(member_number) not null
);
create sequence notice_seq;

--공지사항 댓글
drop sequence notice_comment_seq;

create table notice_comment(
notice_comment_number number primary key,
notice_comment_date date default sysdate not null,
notice_comment_contant varchar2(300) not null,
notice_comment_level number not null,
member_number number references lip_member(member_number) not null,
notice_number number references notice(notice_number) not null
);
create sequence notice_comment_seq;

--결제
drop sequence pay_seq;

create table pay(
pay_number number primary key,
pay_list varchar2(300) not null,
pay_date date default sysdate not null,
pay_money number not null,
member_number number references lip_member(member_number) not null
);
create sequence pay_seq;

--로그
drop sequence member_log_seq;

create table member_log(
member_log_number number primary key,
member_log_contant varchar2(300) not null,
member_log_date date default sysdate not null,
member_log_ip varchar2(50) not null,
member_log_from number,
member_number number references lip_member(member_number) not null
);
create sequence member_log_seq;

--포인트입고
drop sequence point_income_seq;

create table point_income(
point_income_number number primary key,
point_income_date date default sysdate not null,
point_income_point number not null,
point_income_detail varchar2(300) not null,
point_income_list varchar2(300) not null,
member_number number references lip_member(member_number) not null
);
create sequence point_income_seq;

--포인트출고
drop sequence point_outcome_seq;

create table point_outcome(
point_outcome_number number primary key,
point_outcome_date date default sysdate not null,
point_outcome_point number not null,
point_outcome_detail varchar2(300) not null,
point_outcome_list varchar2(300) not null,
member_number number references lip_member(member_number) not null
);
create sequence point_outcome_seq;

--QNA
drop sequence qna_seq;

create table qna(
qna_number number primary key,
qna_title varchar2(300) not null,
qna_category varchar2(50) not null,
qna_contant varchar2(4000) not null,
qna_date date default sysdate not null,
qna_answer varchar2(4000),
member_number number references lip_member(member_number) not null
);
create sequence qna_seq;

--기사
drop sequence press_seq;

create table press(
press_number number primary key,
press_title varchar2(300) not null,
press_contant varchar2(4000) not null,
press_date date default sysdate not null,
press_image varchar2(300),
member_number number references lip_member(member_number) not null
);
create sequence press_seq;

--카테고리
drop sequence category_seq;

create table category(
category_number number primary key,
category_name varchar2(100) not null
);
create sequence category_seq;

--폴
drop sequence poll_seq;

create table poll(
poll_number number primary key,
poll_question varchar2(300) not null,
poll_link varchar2(300),
poll_date date default sysdate not null,
poll_explain varchar2(300),
poll_start_date date not null,
poll_end_date date not null,
poll_balance_point number default 0,
poll_question_type number default 1,
poll_view_type number default 1,
poll_condition number default 1,
member_number number references lip_member(member_number) not null,
category_number number references category(category_number) not null
);
create sequence poll_seq;

--폴댓글
drop sequence poll_comment_seq;

create table poll_comment(
poll_comment_number number primary key,
poll_comment_date date default sysdate not null,
poll_comment_contant varchar2(300) not null,
poll_comment_level number not null,
member_number number references lip_member(member_number) not null,
poll_number number references poll(poll_number) not null
);
create sequence poll_comment_seq;

--폴포인트
drop sequence poll_point_seq;

create table poll_point(
poll_point_number number primary key,
poll_point_date date default sysdate not null,
poll_point_point number not null,
member_number number references lip_member(member_number) not null,
poll_number number references poll(poll_number) not null
);
create sequence poll_point_seq;

--보기
drop sequence example_seq;

create table example(
example_number number primary key,
example_order number not null,
example_link varchar2(300),
example_contant varchar2(50) not null,
example_type number not null
);
create sequence example_seq;

--폴보기
drop sequence poll_example_seq;

create table poll_example(
poll_example_number number primary key,
example_number number references example(example_number) not null,
poll_number number references poll(poll_number) not null
);
create sequence poll_example_seq;

--폴참여
drop sequence poll_participate_seq;

create table poll_participate(
poll_participate_number number primary key,
poll_participate_date date default sysdate,
member_number number references lip_member(member_number) not null,
poll_number number references poll(poll_number) not null,
poll_example_number number references poll_example(poll_example_number) not null
);
create sequence poll_participate_seq;

--참가제한
drop sequence limit_participate_seq;

create table limit_participate(
limit_participate_number number primary key,
limit_participate_limit number not null,
limit_participate_count number not null
);
create sequence limit_participate_seq;

--서베이
drop sequence survey_seq;

create table survey(
survey_number number primary key,
survey_point number not null,
survey_date date default sysdate not null,
survey_title varchar2(300) not null,
survey_start_date date not null,
survey_end_date date not null,
survey_condition number not null,
member_number number references lip_member(member_number) not null,
category_number number references category(category_number) not null
);
create sequence survey_seq;

--문제
drop sequence question_seq;

create table question(
question_number number primary key,
question_order number not null,
question_contant varchar2(300) not null,
question_image varchar2(300),
question_type number not null,
question_view_type number not null,
survey_number number references survey(survey_number) not null
);
create sequence question_seq;

--복합폴
drop sequence multipoll_seq;

create table multipoll(
multipoll_number number primary key,
survey_number number references survey(survey_number) not null,
poll_number number references poll(poll_number) not null,
poll_example_number references poll_example(poll_example_number) not null
);
create sequence multipoll_seq;

--문제보기
drop sequence question_example_seq;

create table question_example(
question_example_number number primary key,
question_number number references question(question_number) not null,
example_number number references example(example_number) not null
);
create sequence question_example_seq;

--서베이참여
drop sequence survey_participate_seq;

create table survey_participate(
survey_participate_number number primary key,
survey_participate_date date default sysdate not null,
survey_number number references survey(survey_number) not null,
member_number number references lip_member(member_number) not null,
question_number number references question(question_number) not null,
example_number number references example(example_number) not null,
limit_participate_number number references limit_participate(limit_participate_number) not null
);
create sequence survey_participate_seq;

--서베이포인트
drop sequence survey_point_seq;

create table survey_point(
survey_point_number number primary key,
survey_point_date date default sysdate not null,
survey_point_point number not null,
survey_number number references survey(survey_number) not null,
member_number number references lip_member(member_number) not null
);
create sequence survey_point_seq;

--메일발송리스트
drop sequence mail_send_list_seq;

create table mail_send_list(
mail_send_list_number number primary key,
member_number number references lip_member(member_number) not null,
survey_number number references survey(survey_number) not null
);
create sequence mail_send_list_seq;

--서베이권역추가
drop sequence add_constraint_seq;

create table add_constraint(
add_constraint_number number primary key,
set_constraint_number number references set_constraint(set_constraint_number),
survey_number number references survey(survey_number) not null,
limit_participate_number number references limit_participate(limit_participate_number) not null
);
create sequence add_constraint_seq;

--복합폴 선택 번호
drop sequence multipoll_poll_example_seq;

create table multipoll_poll_example(
multipoll_poll_example_number number primary key,
poll_example_number number references poll_example(poll_example_number),
multipoll_number number references multipoll(multipoll_number)
);

create sequence multipoll_poll_example_seq;