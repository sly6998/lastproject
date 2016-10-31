/* Drop Tables */

DROP TABLE ADVICE CASCADE CONSTRAINTS;
DROP TABLE BASKET CASCADE CONSTRAINTS;
DROP TABLE ITEM CASCADE CONSTRAINTS;
DROP TABLE ITEM_REPLY CASCADE CONSTRAINTS;
DROP TABLE MEMBER_INFO CASCADE CONSTRAINTS;
DROP TABLE NOTI CASCADE CONSTRAINTS;
DROP TABLE NOTI_REPLY CASCADE CONSTRAINTS;
DROP TABLE ORDER_LIST CASCADE CONSTRAINTS;
DROP TABLE QNA_BOARD CASCADE CONSTRAINTS;
DROP TABLE QNA_REPLY CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE REVIEW_REPLY CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE ADVICE
(
 ADVICE_NUM number(10),
 ADVICE_NAME varchar2(20),
 ADVICE_TEL varchar2(20),
 ADVICE_CONTENT varchar2(2000),
 ADVICE_DATE date
);


CREATE TABLE BASKET
(
 
 BASKET_MEMBER_ID varchar2(20),
 BASKET_MEMBER_NAME varchar2(20),
 BASKET_ITEM_NAME varchar2(50),
 BASKET_ITEM_PRICE number(10),
 BASKET_ITEM_IMAGE varchar2(50),
 BASKET_ITEM_TYPE varchar2(50),
 BASKET_ITEM_BRAND varchar2(50),
 BASKET_DATE date,
 BASKET_AMOUNT number(5),
 BASKET_RESULT number(10),
 BASKET_ITEM_MODEL varchar2(200)
);


CREATE TABLE ITEM
(
 ITEM_MODEL varchar2(50),
 ITEM_NAME varchar2(50),
 ITEM_PRICE number(10),
 ITEM_IMAGE varchar2(50),
 ITEM_TYPE varchar2(20),
 ITEM_BRAND varchar2(50),
 ITEM_CONTENT varchar2(2000)
);


CREATE TABLE ITEM_REPLY
(
 ITEM_REPLY_MEMBER_NAME varchar2(20),
 ITEM_REPLY_MEMBER_ID varchar2(20),
 ITEM_REPLY_CONTENT varchar2(500),
 ITEM_REPLY_DATE date,
 ITEM_REPLY_NUM number,
 ITEM_REPLY_REF number,
 ITEM_REPLY_SEQ number,
 ITEM_REPLY_LEV number
);


CREATE TABLE MEMBER_INFO
(
 MEMBER_NAME varchar2(20),
 MEMBER_ID varchar2(20),
 MEMBER_PWD varchar2(50),
 MEMBER_ADDR_1 varchar2(100),
 MEMBER_ADDR_2 varchar2(100),
 MEMBER_ADDR_ZIP varchar2(10),
 MEMBER_TEL varchar2(20),
 MEMBER_EMAIL varchar2(40),
 MEMBER_GENDER varchar2(6),
 MEMBER_YEAR number(4),
 MEMBER_MONTH number(2),
 MEMBER_DAY number(2),
 MEMBER_DATE date,
 MEMBER_NUM number(10)
);


CREATE TABLE NOTI
(
 NOTI_MEMBER_ID varchar2(20),
 NOTI_MEMBER_NAME varchar2(20),
 NOTI_SUBJECT varchar2(100),
 NOTI_CONTENT varchar2(2000),
 NOTI_READCOUNT number(5),
 NOTI_DATE date,
 NOTI_NUM number(10)
);


CREATE TABLE NOTI_REPLY
(
 NOTI_REPLY_MEMBER_NAME varchar2(20),
 NOTI_REPLY_MEMBER_ID varchar2(20),
 NOTI_REPLY_CONTENT varchar2(500),
 NOTI_REPLY_DATE date,
 NOTI_REPLY_NUM number,
 NOTI_REPLY_REF number,
 NOTI_REPLY_SEQ number,
 NOTI_REPLY_LEV number
);


CREATE TABLE ORDER_LIST
(
 ORDER_MEMBER_ID varchar2(20),
 ORDER_ITEM_MODEL varchar2(200),
 ORDER_ITEM_NAME varchar2(50),
 ORDER_ITEM_AMOUNT number(5),
 ORDER_ITEM_PRICE_SUM number(10),
 ORDER_ITEM_BRAND varchar2(50),
 ORDER_MEMBER_NAME varchar2(20),
 ORDER_MEMBER_TEL varchar2(20),
 ORDER_MEMBER_ZIP varchar2(10),
 ORDER_MEMBER_ADDR_1 varchar2(50),
 ORDER_MEMBER_ADDR_2 varchar2(50),
 ORDER_NAME varchar2(20),
 ORDER_TEL varchar2(20),
 ORDER_ZIP varchar2(10),
 ORDER_ADDR_1 varchar2(50),
 ORDER_ADDR_2 varchar2(50),
 ORDER_MEMO varchar2(500),
 ORDER_TRADE_TYPE varchar2(20),
 ORDER_TRADE_PAYER varchar2(20),
 ORDER_DATE date,
 ORDER_STATUS varchar2(10),
 ORDER_TRADE_NUM varchar2(50)
);


CREATE TABLE QNA_BOARD
(
 QNA_MEMBER_ID varchar2(20),
 QNA_MEMBER_NAME varchar2(20),
 QNA_NUM number(10),
 QNA_SUBJECT varchar2(50),
 QNA_CONTENT varchar2(2000),
 QNA_DATE date,
 QNA_SEQ number(5),
 QNA_REF number(5),
 QNA_LEV number(5),
 QNA_READCOUNT number(10)
);


CREATE TABLE QNA_REPLY
(
 QNA_REPLY_MEMBER_NAME varchar2(20),
 QNA_REPLY_MEMBER_ID varchar2(20),
 QNA_REPLY_CONTENT varchar2(500),
 QNA_REPLY_DATE date,
 QNA_REPLY_NUM number,
 QNA_REPLY_REF number,
 QNA_REPLY_SEQ number,
 QNA_REPLY_LEV number
);


CREATE TABLE REVIEW
(
 REVIEW_MEMBER_ID varchar2(20),
 REVIEW_MEMBER_NAME varchar2(20),
 REVIEW_SUBJECT varchar2(100),
 REVIEW_CONTENT varchar2(2000),
 REVIEW_READCOUNT number(10),
 REVIEW_DATE date,
 REVIEW_NUM number(10)
);


CREATE TABLE REVIEW_REPLY
(
 REVIEW_REPLY_MEMBER_NAME varchar2(20),
 REVIEW_REPLY_MEMBER_ID varchar2(20),
 REVIEW_REPLY_CONTENT varchar2(500),
 REVIEW_REPLY_DATE date,
 REVIEW_REPLY_NUM number,
 REVIEW_REPLY_REF number,
 REVIEW_REPLY_SEQ number,
 REVIEW_REPLY_LEV number
);

/* Select Tables */

Select * from advice;
Select * from basket;
Select * from item;
Select * from member_info;
Select * from noti;
Select * from order_list;
Select * from qna_board;
Select * from qna_reply 
Select * from review;
select * from NOTI_REPLY;


/* Create Sequence(시퀀스 생성) */

create sequence member_info_seq start with 1 increment by 1;
create sequence noti_seq start with 1 increment by 1;
create sequence review_seq start with 1 increment by 1;
create sequence qna_board_seq start with 1 increment by 1;
create sequence advice_seq start with 1 increment by 1;

/* drop sequence(시퀀스 삭제)*/

drop sequence member_info_seq;
drop sequence noti_seq;
drop sequence review_seq;
drop sequence qna_board_seq;
drop sequence advice_seq;

/* 테스트 */
insert into basket (BASKET_MEMBER_ID, BASKET_ITEM_IMAGE, BASKET_MEMBER_NAME, BASKET_ITEM_MODEL, BASKET_ITEM_BRAND, BASKET_ITEM_TYPE, BASKET_AMOUNT, BASKET_ITEM_PRICE, BASKET_DATE) 
values ('test123', '없듬', '탁자A', '탁자01', '한샘', 'nomal', 1, 100, sysdate);


/* 데이터베이스 암호화 복호화 (삭제 하지 마세요)*/
select member_id, member_name, PACK_ENCRYPTION_DECRYPTION.FUNC_DECRYPT(member_pwd) from member_info; /*복호화*/
select PACK_ENCRYPTION_DECRYPTION.FUNC_DECRYPT(member_pwd) from member_info where member_ID='admin' and member_name='관리자' and member_tel='010-4455-4444' and member_year=1995 and member_month=12 and member_day=19;