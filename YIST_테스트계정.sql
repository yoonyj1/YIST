-- 테스트 테이블 생성
drop table member;
create table member(
    id varchar2(30) primary key,
    name varchar2(50) not null,
    pwd varchar2(15) not null,
    birth varchar2(10) null,
    phone varchar2(30) null,
    image varchar2(500) not null,
    email varchar2(50) not null,
    post number null,
    address varchar2(500) null,
    detail_address varchar2(500) null,
    subject varchar2(100) null,
    enroll_date date default sysdate,
    start_date date null,
    end_date date null,
    status varchar2(1) default 'Y' not null,
    sort number check(sort in (1,2,3)),
    employ_date date default sysdate null
);


-- 알림 테이블 생성
drop table alarm;
drop sequence seq_alarm_no;
create sequence seq_alarm_no nocache;
create table alarm(
    alarm_no number primary key,
    id varchar2(30) not null,
    alarm_content varchar2(300) not null,
    alarm_type varchar2(10) check(alarm_type in ('공지', '시험', '일반')),
    status varchar2(1) default 'N' not null,
    create_date date default sysdate not null
);
alter table alarm
    add foreign key(id) references member;


-- 과정 테이블 생성
drop table class;
drop sequence seq_class_no;
create sequence seq_class_no nocache;
create table class(
    class_no number primary key,
    class_name varchar2(20) not null
);

--  과목 테이블 생성
drop table subject;
drop sequence seq_subject_no;
create sequence seq_subject_no nocache;
create table subject(
    subject_no number primary key,
    class_no number not null,
    subejct_name varchar(300) not null,
    start_date date null,
    end_date date null,
    status varchar2(1) default 'N' not null,
    day varchar2(50) not null,
    maximum_seats number null,
    current_seats number null,
    fee number not null
);
alter table subject
    add foreign key(class_no) references class;


-- 과제 테이블 생성
drop table task;
drop sequence seq_task_no;
create sequence seq_task_no nocache;
create table task(
    task_no number primary key,
    subject_no number not null,
    id varchar2(30) not null,
    task_title varchar2(100) not null,
    task_content varchar2(500) not null,
    start_date date default sysdate,
    end_date date null
);
alter table task
    add foreign key(subject_no) references subject;


-- 과제첨부파일 테이블 생성
drop table task_file;
drop sequence seq_file_no;
create sequence seq_file_no nocache;
create table task_file(
    file_no number primary key,
    task_no number not null,
    origin_name varchar2(500) not null,
    change_name varchar2(500) not null,
    file_level number not null,
    status varchar2(10) default 'Y' not null
);

alter table task_file
    add foreign key(task_no) references task;
    
-- 데이터 삽입
-- 테스트 관리자
insert
    into member
    values
        (
          'admin'
        , '관리자'
        , 'admin'
        , ''
        , ''
        , 'none'
        , 'admin'
        , ''
        , ''
        , ''
        , ''
        , default
        , ''
        , ''
        , 'Y'
        , 1
        , ''
        );

-- 테스트 강사1           
insert
    into member
    values
        (
          'teacher01'
        , '강사1'
        , 'teacher01'
        , ''
        , ''
        , 'none'
        , 'teacher01@gmail.com'
        , ''
        , ''
        , ''
        , ''
        , default
        , ''
        , ''
        , 'Y'
        , 2
        , sysdate
        );        

-- 테스트 유저1
insert
    into member
    values
        (
          'user01'
        , '학생1'
        , 'pass01'
        , ''
        , ''
        , 'none'
        , 'user01@gmail.com'
        , ''
        , ''
        , ''
        , ''
        , default
        , ''
        , ''
        , 'Y'
        , 3
        , sysdate
        );

-- 테스트 유저2
insert
    into member
    values
        (
          'user02'
        , '학생2'
        , 'pass02'
        , ''
        , ''
        , 'none'
        , 'user02@gmail.com'
        , ''
        , ''
        , ''
        , ''
        , default
        , ''
        , ''
        , 'Y'
        , 3
        , sysdate
        );

-- 테스트 알람 삽입
--insert into alarm values(seq_alarm_no.nextval, 'user01', '하이', '일반', 'N', sysdate);

-- 로그인
select
        id
      , name
      , pwd
      , birth
      , phone
      , image
      , email
      , post
      , address
      , detail_address
      , subject
      , enroll_date
      , start_date
      , end_date
      , status
      , sort
      , employ_date
from member
where id = 'user01' and pwd = 'pass01' and status = 'Y';
      

-- 알람 조회(안읽은거 status = 'n')
select
      alarm_no
    , id
    , alarm_content
    , alarm_type
    , status
    , create_date
from alarm
where id = 'user01' and status = 'N';

commit;
