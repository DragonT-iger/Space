create user space identified by "space";
grant connect, resource, dba to space;
grant create table, create view, create sequence to space;
commit;

/* 회원등급 */
CREATE TABLE MEM_RANK (
    mrank number(10) primary key, /* 회원등급(pk) */
	rankpoint number(10) NOT NULL /* 등급별포인트 */
);
--MEM_RANK 시퀀스 생성
CREATE SEQUENCE MEM_RANK_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;

/* 회원정보 */
CREATE TABLE MEM_INFO (
	mname VARCHAR2(20) NOT NULL, /* 이름 */
	nickname VARCHAR2(30) not null, /* 닉네임 */
	userid VARCHAR(20) NOT NULL, /* 회원아이디(pk) */
	mpwd VARCHAR2(20) NOT NULL, /* 비밀번호 */
	hp VARCHAR2(10) NOT NULL, /* 연락처 */
	birth number(20), /* 생년월일 */
	mdate Date default sysdate, /* 가입일자 */
	status number(5), /* 회원상태 */
	point number(10), /* 포인트 */
    mrank number(10) references MEM_RANK(mrank), /* 회원등급 */
    account number(20), /* 계좌정보 */
    pointAdd number(20)  /* 누적포인트 */
);
commit;

CREATE UNIQUE INDEX PK_MEM_INFO
	ON MEM_INFO (
		userid ASC
	);

ALTER TABLE MEM_INFO
	ADD
		CONSTRAINT PK_MEM_INFO
		PRIMARY KEY (
			userid
		);


/* 카테고리 해시태그 */
CREATE TABLE HASHTAG (
    h_code number(8) primary key, /* 카테고리키(pk) */
	h_name VARCHAR2(30) NOT NULL /* 해시태그명 */
);
--HASHTAG 시퀀스 생성
CREATE SEQUENCE HASHTAG_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;

/* 공간정보 */
CREATE TABLE SPACE_INFO (
    snum number(10) NOT NULL, /* 공간번호(pk) */
	sname VARCHAR2(50) NOT NULL, /* 공간명칭 */
    userid VARCHAR2(20) references MEM_INFO(userid), /* 회원아이디(fk) */
	minn number(5), /* 최소인원 */
	maxn number(10), /* 최대인원 */
	bcost number(10), /* 기본비용 */
	ecost number(10), /* 인원추가금 */
    spost VARCHAR2(10), /*우편번호*/
    saddr1 VARCHAR2(100), /* 주소1 */
	saddr2 VARCHAR2(100), /* 주소2 */
    slong varchar2(20), /* 지도경도값 */
    slat varchar2(20), /* 지도위도값 */
    sdate date default sysdate,  /* 등록일 */
    h_code number(8) references HASHTAG(h_code),  /* 카테고리키(fk) */
    simage1 VARCHAR2(50), /* 이미지1 */
	simage2 VARCHAR2(50), /* 이미지2 */
	simage3 VARCHAR2(50), /* 이미지3 */
    simage4 VARCHAR2(50), /* 이미지4 */
    scontents VARCHAR2(1000), /* 공간설명 */
    srule varchar2(1000)  /* 공간이용규칙 */
);

CREATE UNIQUE INDEX PK_SPACE_INFO
	ON SPACE_INFO (
		snum ASC
	);

ALTER TABLE SPACE_INFO
	ADD
		CONSTRAINT PK_SPACE_INFO
		PRIMARY KEY (
			snum
		);
--SPACE_INFO 시퀀스 생성
CREATE SEQUENCE SPACE_INFO_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;     




/* 예약 */
CREATE TABLE RESERVATION (
    rtnum number(10) primary key,  /* 예약번호(pk) */
    snum number(10) references SPACE_INFO(snum), /* 공간번호(fk) */
    userid VARCHAR2(20) references MEM_INFO(userid), /* 회원아이디(fk) */
	rtstartdate varchar2(20),  /* 예약시작날짜 */
    rtstart varchar2(20), /* 예약시작시간 */
    rtend varchar2(20), /* 예약종료시간 */
	rtnumber number(10), /* 예약인원 */
    rtstatus number(10) /* 예약상태(완료,대기,취소) */
);
--reservation 시퀀스 생성
CREATE SEQUENCE RESERVATION_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;


/* 포인트 결제 */
CREATE TABLE POINT (
    paynum number(10) primary key,  /* 결제번호(pk) */
	userid VARCHAR2(20) references MEM_INFO(userid), /* 회원아이디(fk) */
    pluspoint number(20),  /* 충전할 포인트 */
    paykind varchar2(100), /* 충전 경로 */
	paydate date default sysdate, /* 결제요청시간 */
    paystatus number(5) /* 결제상태 */
);
--point 시퀀스 생성
CREATE SEQUENCE POINT_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



/* 문의게시판 */
CREATE TABLE QNA_BOARD (
	qnum number(8) primary key, /* 문의글번호(pk) */
	userid VARCHAR2(20) references MEM_INFO(userid), /* 회원아이디(fk) */
    snum number(10) references SPACE_INFO(snum), /* 공간번호(fk) */
	qpwd varchar2(20) not null, /* 글비밀번호 */
	qtitle VARCHAR2(200) not null, /* 글제목 */
	qcontent VARCHAR2(2000), /* 글내용 */
	qdate date default sysdate, /* 작성일 */
	qgroup number(8), /* 글그룹 */
	qlevel number(8), /* 답변레벨 */
	qgorder number(8) /* 그룹순서 */
);

--Qna_board 시퀀스 생성
CREATE SEQUENCE QNA_BOARD_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



/* 리뷰게시판 */
CREATE TABLE REVIEW (
	review_num number(8) primary key, /* 리뷰글번호(pk) */
	userid VARCHAR2(20) references MEM_INFO(userid), /* 회원아이디(fk) */
    snum number(10) references SPACE_INFO(snum), /* 공간번호(fk) */
	rpwd varchar2(20) not null, /* 글비밀번호 */
	rtitle VARCHAR2(200) not null, /* 글제목 */
	rcontent VARCHAR2(2000), /* 글내용 */
	review_date date default sysdate, /* 리뷰작성일 */
    readnum number(8) default 0,  /* 조회수 */
    rscore number(5),  /* 별점 */
    rimage1 VARCHAR2(50), /* 이미지1 */
	rimage2 VARCHAR2(50), /* 이미지2 */
	rgroup number(8), /* 글그룹 */
	rlevel number(8), /* 답변레벨 */
	rgorder number(8) /* 그룹순서 */
);
--review 시퀀스 생성
CREATE SEQUENCE REVIEW_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;


/* 찜하기 */
CREATE TABLE HEART_LIKE (
    hnum number(10) primary key,
    snum number(10) references SPACE_INFO(snum), /* 공간번호(fk) */
    userid VARCHAR2(20) references MEM_INFO(userid), /* 회원아이디(fk) */
    hdate date default sysdate
);
--heart_like 시퀀스
CREATE SEQUENCE heart_like_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;


--찜 + 공간 뷰
create or replace view space_like
as
select s.snum,s.sname,s.saddr1,s.simage1,h.hnum,h.userid,h.hdate
from space_info s, heart_like h
where s.snum=h.snum;


--공간 + 유저 + 예약 뷰
create or replace view mem_space_res_view
as 
select r.*, m.mname, m.hp, s.sname, s.spost, s.saddr1, s.saddr2, s.simage1
from mem_info m right join reservation r on m.userid=r.userid
left join space_info s on r.snum=s.snum;



drop table payment;
CREATE TABLE payment(
    paynum NUMBER(20) PRIMARY KEY, -- 결제번호  --??
    imp_uid VARCHAR2(50) NOT NULL, -- 고유 아이디
    merchant_uid VARCHAR2(50) NOT NULL, -- 상품 고유 아이디
    paydate DATE DEFAULT SYSDATE, -- 결제일자
    amount NUMBER(20) NOT NULL,  -- 결제금액
    status VARCHAR2(10) NOT NULL, -- 0:결제완료, 1:환불완료
    refund_reason VARCHAR2(200), -- 환불사유
    userid VARCHAR2(50) REFERENCES mem_info(userid),
    account VARCHAR2(50)  REFERENCES mem_info(account),
    bank_code VARCHAR2(50) REFERENCES bank_info(bank_code),
);



drop table bank_code;
CREATE TABLE bank_code(
    bank_code varchar2(10) primary key,
    bank_name varchar2(50) not null 
);

-- 별도로 발급사(은행)가 없는 신용카드 (BC,삼성,현대)의 경우, 발급사 코드가 '00' 으로 표기됩니다.
insert into bank_code values('2','한국산업은행');
insert into bank_code values('3','기업은행');
insert into bank_code values('4','국민은행');
insert into bank_code values('5','하나은행 (구 외환)');
insert into bank_code values('6','국민은행 (구 주택)');
insert into bank_code values('7','수협중앙회');
insert into bank_code values('11','농협중앙회');
insert into bank_code values('12','단위농협');
insert into bank_code values('16','축협중앙회');
insert into bank_code values('20','우리은행');
insert into bank_code values('21','구)조흥은행');
insert into bank_code values('22','상업은행');
insert into bank_code values('23','SC제일은행');
insert into bank_code values('24','한일은행');
insert into bank_code values('25','서울은행');
insert into bank_code values('26','구)신한은행');
insert into bank_code values('27','한국씨티은행 (구 한미)');
insert into bank_code values('31','대구은행');
insert into bank_code values('32','부산은행');
insert into bank_code values('34','광주은행');
insert into bank_code values('35','제주은행');
insert into bank_code values('37','전북은행');
insert into bank_code values('38','강원은행');
insert into bank_code values('39','경남은행');
insert into bank_code values('41','비씨카드');
insert into bank_code values('45','새마을금고');
insert into bank_code values('48','신용협동조합중앙회');
insert into bank_code values('50','상호저축은행');
insert into bank_code values('53','한국씨티은행');
insert into bank_code values('54','홍콩상하이은행');
insert into bank_code values('55','도이치은행');
insert into bank_code values('56','ABN암로');
insert into bank_code values('57','JP모건');
insert into bank_code values('59','미쓰비시도쿄은행');
insert into bank_code values('60','BOA(Bank of America)');
insert into bank_code values('64','산림조합');
insert into bank_code values('70','신안상호저축은행');
insert into bank_code values('71','우체국');
insert into bank_code values('81','하나은행');
insert into bank_code values('83','평화은행');
insert into bank_code values('87','신세계');
insert into bank_code values('88','신한(통합)은행');
insert into bank_code values('89','케이뱅크');
insert into bank_code values('90','카카오뱅크');
insert into bank_code values('91','네이버포인트');
insert into bank_code values('92','토스뱅크');
insert into bank_code values('93','토스머니');
insert into bank_code values('94','SSG머니');
insert into bank_code values('95','엘포인트');
insert into bank_code values('97','카카오머니');
insert into bank_code values('98','페이코포인트');
insert into bank_code values('D1','유안타증권');
insert into bank_code values('D2','현대증권');
insert into bank_code values('D3','미래에셋증권');
insert into bank_code values('D4','한국투자증권');
insert into bank_code values('D5','우리투자증권');
insert into bank_code values('D6','하이투자증권');
insert into bank_code values('D7','HMC투자증권');
insert into bank_code values('D8','SK증권');
insert into bank_code values('D9','대신증권');
insert into bank_code values('DA','하나대투증권');
insert into bank_code values('DB','굿모닝신한증권');
insert into bank_code values('DC','동부증권');
insert into bank_code values('DD','유진투자증권');
insert into bank_code values('DE','메리츠증권');
insert into bank_code values('DF','신영증권');
insert into bank_code values('DG','대우증권');
insert into bank_code values('DH','삼성증권');
insert into bank_code values('DI','교보증권');
insert into bank_code values('DJ','키움증권');
insert into bank_code values('DK','이트레이드');
insert into bank_code values('DL','솔로몬증권');
insert into bank_code values('DM','한화증권');
insert into bank_code values('DN','NH증권');
insert into bank_code values('DO','부국증권');
insert into bank_code values('DP','LIG증권');
insert into bank_code values('BW','뱅크월렛');


commit;
