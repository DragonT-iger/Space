create user space identified by "space1";
grant connect, resource, dba to space;
grant create table, create view, create sequence to space;
commit;


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
    account number(20) /* 계좌정보 */
);
alter table mem_info add addpoint number(20);
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


/* 회원등급 */
CREATE TABLE MEM_RANK (
    mrank number(10) primary key, /* 회원등급(pk) */
	rankpoint number(10) NOT NULL /* 등급별포인트 */
);



/* 예약신청 */
CREATE TABLE RESERVATION (
    rtnum number(10) primary key,  /* 예약번호(pk) */
    snum number(10) references SPACE_INFO(snum), /* 공간번호(fk) */
    userid VARCHAR2(20) references MEM_INFO(userid), /* 회원아이디(fk) */
	rtstartdate varchar2(20),  /* 예약시작날짜 */
    rtstart varchar2(20), /* 예약시작시간 */
    rtend varchar2(20), /* 예약종료시간 */
    rtenddate varchar2(20),  /* 예약종료날짜 */
	rtnumber number(10), /* 예약인원 */
    rtstatus number(10) /* 예약상태(완료,대기,취소) */
);




/* 결제 */
CREATE TABLE PAYMENT (
    paynum number(10) primary key,  /* 결제번호(pk) */
    rtnum number(10) references RESERVATION(rtnum),  /* 예약번호(fk) */
	userid VARCHAR2(20) references MEM_INFO(userid), /* 회원아이디(fk) */
    snum number(10) references SPACE_INFO(snum), /* 공간번호(fk) */
    paykind varchar2(100), /* 결제수단 */
	paydate date default sysdate, /* 결제요청시간 */
    paystatus number(5) /* 결제상태 */
);


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

/* 카테고리 해시태그 */
CREATE TABLE HASHTAG (
    h_code number(8) primary key, /* 카테고리키(pk) */
	h_name VARCHAR2(30) NOT NULL /* 해시태그명 */
);



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
    scontents VARCHAR2(1000) /* 공간설명 */
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


/* 찜하기 */
CREATE TABLE HEART_LIKE (
    snum number(10) references SPACE_INFO(snum), /* 공간번호(fk) */
    userid VARCHAR2(20) references MEM_INFO(userid), /* 회원아이디(fk) */
    hdate date default sysdate,
    constraint PK_HEART_LIKE primary key(snum,userid)
);

commit;
