create user space identified by "space";
grant connect, resource, dba to space;
grant create table, create view, create sequence to space;
commit;

/* ȸ����� */
CREATE TABLE MEM_RANK (
    mrank number(10) primary key, /* ȸ�����(pk) */
	rankpoint number(10) NOT NULL /* ��޺�����Ʈ */
);
--MEM_RANK ������ ����
CREATE SEQUENCE MEM_RANK_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;

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
    account number(20), /* �������� */
    pointAdd number(20)  /* ��������Ʈ */
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


/* ī�װ� �ؽ��±� */
CREATE TABLE HASHTAG (
    h_code number(8) primary key, /* ī�װ�Ű(pk) */
	h_name VARCHAR2(30) NOT NULL /* �ؽ��±׸� */
);
--HASHTAG ������ ����
CREATE SEQUENCE HASHTAG_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;

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
    scontents VARCHAR2(1000), /* �������� */
    srule varchar2(1000)  /* �����̿��Ģ */
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
--SPACE_INFO ������ ����
CREATE SEQUENCE SPACE_INFO_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;     




/* ���� */
CREATE TABLE RESERVATION (
    rtnum number(10) primary key,  /* �����ȣ(pk) */
    snum number(10) references SPACE_INFO(snum), /* ������ȣ(fk) */
    userid VARCHAR2(20) references MEM_INFO(userid), /* ȸ�����̵�(fk) */
	rtstartdate varchar2(20),  /* ������۳�¥ */
    rtstart varchar2(20), /* ������۽ð� */
    rtend varchar2(20), /* ��������ð� */
	rtnumber number(10), /* �����ο� */
    rtstatus number(10) /* �������(�Ϸ�,���,���) */
);
--reservation ������ ����
CREATE SEQUENCE RESERVATION_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;


/* ����Ʈ ���� */
CREATE TABLE POINT (
    paynum number(10) primary key,  /* ������ȣ(pk) */
	userid VARCHAR2(20) references MEM_INFO(userid), /* ȸ�����̵�(fk) */
    pluspoint number(20),  /* ������ ����Ʈ */
    paykind varchar2(100), /* ���� ��� */
	paydate date default sysdate, /* ������û�ð� */
    paystatus number(5) /* �������� */
);
--point ������ ����
CREATE SEQUENCE POINT_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



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

--Qna_board ������ ����
CREATE SEQUENCE QNA_BOARD_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



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
--review ������ ����
CREATE SEQUENCE REVIEW_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;


/* ���ϱ� */
CREATE TABLE HEART_LIKE (
    hnum number(10) primary key,
    snum number(10) references SPACE_INFO(snum), /* ������ȣ(fk) */
    userid VARCHAR2(20) references MEM_INFO(userid), /* ȸ�����̵�(fk) */
    hdate date default sysdate
);
--heart_like ������
CREATE SEQUENCE heart_like_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;


--�� + ���� ��
create or replace view space_like
as
select s.snum,s.sname,s.saddr1,s.simage1,h.hnum,h.userid,h.hdate
from space_info s, heart_like h
where s.snum=h.snum;


--���� + ���� + ���� ��
create or replace view mem_space_res_view
as 
select r.*, m.mname, m.hp, s.sname, s.spost, s.saddr1, s.saddr2, s.simage1
from mem_info m right join reservation r on m.userid=r.userid
left join space_info s on r.snum=s.snum;



drop table payment;
CREATE TABLE payment(
    paynum NUMBER(20) PRIMARY KEY, -- ������ȣ  --??
    imp_uid VARCHAR2(50) NOT NULL, -- ���� ���̵�
    merchant_uid VARCHAR2(50) NOT NULL, -- ��ǰ ���� ���̵�
    paydate DATE DEFAULT SYSDATE, -- ��������
    amount NUMBER(20) NOT NULL,  -- �����ݾ�
    status VARCHAR2(10) NOT NULL, -- 0:�����Ϸ�, 1:ȯ�ҿϷ�
    refund_reason VARCHAR2(200), -- ȯ�һ���
    userid VARCHAR2(50) REFERENCES mem_info(userid),
    account VARCHAR2(50)  REFERENCES mem_info(account),
    bank_code VARCHAR2(50) REFERENCES bank_info(bank_code),
);



drop table bank_code;
CREATE TABLE bank_code(
    bank_code varchar2(10) primary key,
    bank_name varchar2(50) not null 
);

-- ������ �߱޻�(����)�� ���� �ſ�ī�� (BC,�Ｚ,����)�� ���, �߱޻� �ڵ尡 '00' ���� ǥ��˴ϴ�.
insert into bank_code values('2','�ѱ��������');
insert into bank_code values('3','�������');
insert into bank_code values('4','��������');
insert into bank_code values('5','�ϳ����� (�� ��ȯ)');
insert into bank_code values('6','�������� (�� ����)');
insert into bank_code values('7','�����߾�ȸ');
insert into bank_code values('11','�����߾�ȸ');
insert into bank_code values('12','��������');
insert into bank_code values('16','�����߾�ȸ');
insert into bank_code values('20','�츮����');
insert into bank_code values('21','��)��������');
insert into bank_code values('22','�������');
insert into bank_code values('23','SC��������');
insert into bank_code values('24','��������');
insert into bank_code values('25','��������');
insert into bank_code values('26','��)��������');
insert into bank_code values('27','�ѱ���Ƽ���� (�� �ѹ�)');
insert into bank_code values('31','�뱸����');
insert into bank_code values('32','�λ�����');
insert into bank_code values('34','��������');
insert into bank_code values('35','��������');
insert into bank_code values('37','��������');
insert into bank_code values('38','��������');
insert into bank_code values('39','�泲����');
insert into bank_code values('41','��ī��');
insert into bank_code values('45','�������ݰ�');
insert into bank_code values('48','�ſ����������߾�ȸ');
insert into bank_code values('50','��ȣ��������');
insert into bank_code values('53','�ѱ���Ƽ����');
insert into bank_code values('54','ȫ�����������');
insert into bank_code values('55','����ġ����');
insert into bank_code values('56','ABN�Ϸ�');
insert into bank_code values('57','JP���');
insert into bank_code values('59','�̾���õ�������');
insert into bank_code values('60','BOA(Bank of America)');
insert into bank_code values('64','�긲����');
insert into bank_code values('70','�žȻ�ȣ��������');
insert into bank_code values('71','��ü��');
insert into bank_code values('81','�ϳ�����');
insert into bank_code values('83','��ȭ����');
insert into bank_code values('87','�ż���');
insert into bank_code values('88','����(����)����');
insert into bank_code values('89','���̹�ũ');
insert into bank_code values('90','īī����ũ');
insert into bank_code values('91','���̹�����Ʈ');
insert into bank_code values('92','�佺��ũ');
insert into bank_code values('93','�佺�Ӵ�');
insert into bank_code values('94','SSG�Ӵ�');
insert into bank_code values('95','������Ʈ');
insert into bank_code values('97','īī���Ӵ�');
insert into bank_code values('98','����������Ʈ');
insert into bank_code values('D1','����Ÿ����');
insert into bank_code values('D2','��������');
insert into bank_code values('D3','�̷���������');
insert into bank_code values('D4','�ѱ���������');
insert into bank_code values('D5','�츮��������');
insert into bank_code values('D6','������������');
insert into bank_code values('D7','HMC��������');
insert into bank_code values('D8','SK����');
insert into bank_code values('D9','�������');
insert into bank_code values('DA','�ϳ���������');
insert into bank_code values('DB','�¸�׽�������');
insert into bank_code values('DC','��������');
insert into bank_code values('DD','������������');
insert into bank_code values('DE','�޸�������');
insert into bank_code values('DF','�ſ�����');
insert into bank_code values('DG','�������');
insert into bank_code values('DH','�Ｚ����');
insert into bank_code values('DI','��������');
insert into bank_code values('DJ','Ű������');
insert into bank_code values('DK','��Ʈ���̵�');
insert into bank_code values('DL','�ַθ�����');
insert into bank_code values('DM','��ȭ����');
insert into bank_code values('DN','NH����');
insert into bank_code values('DO','�α�����');
insert into bank_code values('DP','LIG����');
insert into bank_code values('BW','��ũ����');


commit;
