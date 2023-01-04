create user space identified by "space1";
grant connect, resource, dba to space;
grant create table, create view, create sequence to space;
commit;


/* ȸ������ */
CREATE TABLE MEM_INFO (
	mname VARCHAR2(20) NOT NULL, /* �̸� */
	nickname VARCHAR2(30) not null, /* �г��� */
	userid VARCHAR(20) NOT NULL, /* ȸ�����̵�(pk) */
	mpwd VARCHAR2(20) NOT NULL, /* ��й�ȣ */
	hp VARCHAR2(10) NOT NULL, /* ����ó */
	birth number(20), /* ������� */
	mdate Date default sysdate, /* �������� */
	status number(5), /* ȸ������ */
	point number(10), /* ����Ʈ */
    mrank number(10) references MEM_RANK(mrank), /* ȸ����� */
    account number(20) /* �������� */
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


/* ȸ����� */
CREATE TABLE MEM_RANK (
    mrank number(10) primary key, /* ȸ�����(pk) */
	rankpoint number(10) NOT NULL /* ��޺�����Ʈ */
);



/* �����û */
CREATE TABLE RESERVATION (
    rtnum number(10) primary key,  /* �����ȣ(pk) */
    snum number(10) references SPACE_INFO(snum), /* ������ȣ(fk) */
    userid VARCHAR2(20) references MEM_INFO(userid), /* ȸ�����̵�(fk) */
	rtstartdate varchar2(20),  /* ������۳�¥ */
    rtstart varchar2(20), /* ������۽ð� */
    rtend varchar2(20), /* ��������ð� */
    rtenddate varchar2(20),  /* �������ᳯ¥ */
	rtnumber number(10), /* �����ο� */
    rtstatus number(10) /* �������(�Ϸ�,���,���) */
);




/* ���� */
CREATE TABLE PAYMENT (
    paynum number(10) primary key,  /* ������ȣ(pk) */
    rtnum number(10) references RESERVATION(rtnum),  /* �����ȣ(fk) */
	userid VARCHAR2(20) references MEM_INFO(userid), /* ȸ�����̵�(fk) */
    snum number(10) references SPACE_INFO(snum), /* ������ȣ(fk) */
    paykind varchar2(100), /* �������� */
	paydate date default sysdate, /* ������û�ð� */
    paystatus number(5) /* �������� */
);


/* ���ǰԽ��� */
CREATE TABLE QNA_BOARD (
	qnum number(8) primary key, /* ���Ǳ۹�ȣ(pk) */
	userid VARCHAR2(20) references MEM_INFO(userid), /* ȸ�����̵�(fk) */
    snum number(10) references SPACE_INFO(snum), /* ������ȣ(fk) */
	qpwd varchar2(20) not null, /* �ۺ�й�ȣ */
	qtitle VARCHAR2(200) not null, /* ������ */
	qcontent VARCHAR2(2000), /* �۳��� */
	qdate date default sysdate, /* �ۼ��� */
	qgroup number(8), /* �۱׷� */
	qlevel number(8), /* �亯���� */
	qgorder number(8) /* �׷���� */
);

/* ī�װ� �ؽ��±� */
CREATE TABLE HASHTAG (
    h_code number(8) primary key, /* ī�װ�Ű(pk) */
	h_name VARCHAR2(30) NOT NULL /* �ؽ��±׸� */
);



/* �������� */
CREATE TABLE SPACE_INFO (
    snum number(10) NOT NULL, /* ������ȣ(pk) */
	sname VARCHAR2(50) NOT NULL, /* ������Ī */
    userid VARCHAR2(20) references MEM_INFO(userid), /* ȸ�����̵�(fk) */
	minn number(5), /* �ּ��ο� */
	maxn number(10), /* �ִ��ο� */
	bcost number(10), /* �⺻��� */
	ecost number(10), /* �ο��߰��� */
    spost VARCHAR2(10), /*�����ȣ*/
    saddr1 VARCHAR2(100), /* �ּ�1 */
	saddr2 VARCHAR2(100), /* �ּ�2 */
    slong varchar2(20), /* �����浵�� */
    slat varchar2(20), /* ���������� */
    sdate date default sysdate,  /* ����� */
    h_code number(8) references HASHTAG(h_code),  /* ī�װ�Ű(fk) */
    simage1 VARCHAR2(50), /* �̹���1 */
	simage2 VARCHAR2(50), /* �̹���2 */
	simage3 VARCHAR2(50), /* �̹���3 */
    simage4 VARCHAR2(50), /* �̹���4 */
    scontents VARCHAR2(1000) /* �������� */
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
        

/* ����Խ��� */
CREATE TABLE REVIEW (
	review_num number(8) primary key, /* ����۹�ȣ(pk) */
	userid VARCHAR2(20) references MEM_INFO(userid), /* ȸ�����̵�(fk) */
    snum number(10) references SPACE_INFO(snum), /* ������ȣ(fk) */
	rpwd varchar2(20) not null, /* �ۺ�й�ȣ */
	rtitle VARCHAR2(200) not null, /* ������ */
	rcontent VARCHAR2(2000), /* �۳��� */
	review_date date default sysdate, /* �����ۼ��� */
    readnum number(8) default 0,  /* ��ȸ�� */
    rscore number(5),  /* ���� */
    rimage1 VARCHAR2(50), /* �̹���1 */
	rimage2 VARCHAR2(50), /* �̹���2 */
	rgroup number(8), /* �۱׷� */
	rlevel number(8), /* �亯���� */
	rgorder number(8) /* �׷���� */
);


/* ���ϱ� */
CREATE TABLE HEART_LIKE (
    snum number(10) references SPACE_INFO(snum), /* ������ȣ(fk) */
    userid VARCHAR2(20) references MEM_INFO(userid), /* ȸ�����̵�(fk) */
    hdate date default sysdate,
    constraint PK_HEART_LIKE primary key(snum,userid)
);

commit;
